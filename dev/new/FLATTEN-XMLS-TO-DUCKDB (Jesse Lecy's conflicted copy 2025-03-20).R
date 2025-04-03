library( dplyr )        # data wrangling
library( xmltools )     # xml utilities
library( xml2 )         # xml utilities
library( XML )          # xml utilities 
library( knitr )        # formatting 
library( irs990efile )
library( DBI )
library( duckdb )
library( tictoc )



#######
#######   FLATTEN XML FUNCTIONS 
#######


get_table_id <- function( xpaths )
{
  get_n <- function(x)
  {
    start <- regexpr( "\\[", x )
    stop  <- regexpr( "\\]", x )
    n <- substr( x, start+1, stop-1 )
    return(n)
  }

  table.n <- sapply( xpaths, get_n, USE.NAMES=F )
  table.n <- ifelse( table.n=="", 0, table.n )
  table.n <- sprintf( "%05.0f", as.numeric(table.n) )
  table.n <- paste0( "TID-", table.n )
  return( table.n )
}

get_header <- function( xpath, type ){

  px <- strsplit( xpath, "\\/" ) |> unlist()
  px <- px[ px != "" ]

  if( length(px) > 2 )
  { hd <- px[(length(px)-2):length(px)] }

  if( length(px) <= 2 )
  { hd <- px }

  if( type == "parent" )
  { hd <- hd[ - 1 ] }

  if( type == "terminal" )
  { hd <- hd[ - length(hd) ] }

  header <- paste0( "//", paste0( hd, collapse="/" ) )
  return(header)
}


find_parent_nodes <- function(xpath_list) {
  xpath_list <- sort(xpath_list)  # Ensure sorted order
  parent_nodes <- character()  # Store results
  
  seen <- list()  # Use a named list for fast lookup instead of environment
  
  for (xpath in xpath_list) {
    parts <- strsplit(xpath, "/")[[1]]
    for (i in seq_len(length(parts) - 1)) {
      parent <- paste(parts[1:i], collapse = "/")  # Construct parent path
      if (!parent %in% names(seen)) {
        parent_nodes <- c(parent_nodes, parent)
        seen[[parent]] <- TRUE  # Store in lookup
      }
    }
  }
  
  return(unique(parent_nodes))  # Ensure uniqueness
}

find_terminal_nodes <- function(xpath_list) {
  xpath_list <- sort(xpath_list)  # Sort paths to process sequentially
  terminal_nodes <- c()
  
  prev_xpath <- ""  # Keep track of the last seen path
  
  for (i in seq_along(xpath_list)) {
    # Check if this is a terminal node
    if (i == length(xpath_list) || !startsWith(xpath_list[i + 1], paste0(xpath_list[i], "/"))) {
      terminal_nodes <- c(terminal_nodes, xpath_list[i])
    }
  }
  
  return(terminal_nodes)
}


get_type <- function(xpath){
  parent_xpaths <- find_parent_nodes(xpath)
  terminal_xpaths <- find_terminal_nodes(xpath)
  type <- rep( "", length(xpath) )
  type[ xpath %in% parent_xpaths ]   <- "parent"
  type[ xpath %in% terminal_xpaths ] <- "terminal"
  return(type)
}

get_xpath_vname <- function(x){
  last.x <- strsplit( x, "\\/" ) |> unlist() |> last()
  return(last.x)
}

get_vnames <- function(xpath,type){
  vname <- purrr::map_chr( xpath, get_xpath_vname )
  return(vname)
}


get_attr_df <- function( doc, url ){

  # Find all nodes that have attributes
  nodes_with_attrs <- xml_find_all(doc, "//*[@*]") 

  # Extract all attribute names dynamically
  all_attrs <- 
    lapply( nodes_with_attrs, function(node) names(xml_attrs(node))) |>
    unlist() |> 
    unique()

  # Create a structured data frame of attributes
  attr_df <- nodes_with_attrs %>%
    purrr::map_df(~ {
      node <- .
      data.frame(
        node_name = xml_name(node),  # Store node name
        xpath = xml_path(node),  # Store full XPath
        as.list(xml_attrs(node))  # Extract all attributes
      )
    })

  # Add ObjectID as database key
  OBJECTID <- irs990efile::get_object_id( url )
  df <- data.frame( OBJECTID, attr_df )
  return( df )
}



flatten_xml <- function( doc, url, ccf=NULL ){

  if( is.null(ccf) )
  {
    ccf <- get_concordance() |> as.data.frame()
    ccf <- ccf[c("xpath","variable_name","rdb_table")]
    names(ccf) <- toupper(names(cc))
  }

  xx <- 
    doc %>% 
    xml_find_all("//*") %>% 
    xml_path()

  order <- 1:length(xx)
  type  <- get_type(xx)
  xx2   <- gsub( "\\[[0-9]{1,5}\\]", "", xx )

  table.id     <- get_table_id( xx )
  table.header <- purrr::map2_chr( xx2, type, get_header )
  OBJECTID     <- irs990efile::get_object_id( url )
  VERSION      <- xml2::xml_attr( doc, attr='returnVersion' )

  tt <- 
    doc %>% 
    xml_find_all("//*") %>% 
    xml_text()

  tt[1] <- paste0( "VERSION: ", VERSION )
  
  d <- 
    data.frame(
      OBJECTID,
      ORDER=order,  
      XPATH=xx, 
      XPATH2=xx2, 
      TYPE=type, 
      TABLE_ID=table.id, 
      TABLE_HEADER=table.header, 
      VALUE=tt  )

  dd <- merge( d, ccf, by.x="XPATH2", by.y="XPATH", all.x=T )

  vnames <- get_vnames( dd$XPATH2, dd$TYPE )
  dd$VARIABLE_NAME[ is.na(dd$VARIABLE_NAME) ] <- vnames[ is.na(dd$VARIABLE_NAME) ]
  dd$RDB_TABLE[ is.na(dd$RDB_TABLE) ] <- ""
  dd <- dplyr::arrange( dd, ORDER )

  column.order <-
    c("OBJECTID", "ORDER", "XPATH", "XPATH2",
      "TABLE_HEADER", "TABLE_ID", "TYPE",  
      "RDB_TABLE", "VARIABLE_NAME", "VALUE")

  dd <- as.data.frame(dd)
  dd <- dd[column.order]

  return(dd)
}


get_flat_xml <- function( url, ccf=NULL ){

  RES <- list( FAILED_URLS=data.frame(failed_urls=url) )
  doc <- NULL

  # Transform XML data into flat format
  suppressWarnings( try( { doc <- xml2::read_xml( file(url) ) }, silent=TRUE ) )
  # oid <- irs990efile::get_object_id(url)
  # suppressWarnings( try( { doc <- xml2::read_xml( paste0("xml/",oid,".xml") ) }, silent=TRUE ) )

  if( is.null(doc) ){ 
    cat( paste0( "FAIL: ", url, "\n" ) )
    return(RES) 
  }
  xml2::xml_ns_strip( doc )

  KEYS       <- irs990efile::get_keys( doc, url ) |> as.data.frame()
  FLATXML    <- flatten_xml( doc, url, ccf )
  ATTRIBUTES <- get_attr_df( doc, url )

  RES <- list( FLATXML=FLATXML, ATTRIBUTES=ATTRIBUTES, KEYS=KEYS )
  # cat( paste0( "SUCCESS: ", url, "\n" ) )
  return( RES )
}

check_for_columns <- function( new_data, table_name, con ){

  tbls <- dbListTables(con)
  if( ! table_name %in% tbls )
  { return(invisible(NULL)) }

  # Get existing table column names
  table_ref <- dplyr::tbl( con,  table_name )
  existing_cols <- colnames(table_ref)

  # Get new data column names
  new_cols <- colnames(new_data)

  # Find missing columns
  missing_cols <- setdiff(new_cols, existing_cols)

  # Add missing columns to DuckDB table
  # Assuming TEXT type; change if needed

  if (length(missing_cols) > 0) {
    for (col in missing_cols) {
      alter_query <- sprintf('ALTER TABLE %s ADD COLUMN "%s" TEXT', table_name, col) 
      dbExecute( con, alter_query )
    }
  }
}

send_flat_xml_to_db <- function( RESULTS, path, fn="EFILE.duckdb" ){ 

  # Define DuckDB database file (Persistent Storage)
  # path    <- "C:/Users/jdlec/Documents/duckdb"
  # fn      <- "FLATXML.duckdb"
  db_file <- paste0( path, "/", fn )

  # Open a connection to DuckDB
  con <- dbConnect( duckdb::duckdb(), dbdir = db_file )

  # Flush the database WAL buffer 
  # dbExecute( con, "CHECKPOINT" )

  # Write data frames to DuckDB

  try({  FLATXML <- lapply( RESULTS, '[[', "FLATXML" ) |> dplyr::bind_rows()
         FLATXML[] <- lapply( FLATXML, as.character )
         check_for_columns( FLATXML, table_name="FLATXML", con=con )
         dbWriteTable( con, "FLATXML", FLATXML, append = TRUE )  })

  try({  ATTRIBUTES <- lapply( RESULTS, '[[', "ATTRIBUTES" ) |> dplyr::bind_rows()
         ATTRIBUTES[] <- lapply( ATTRIBUTES, as.character )
         check_for_columns( ATTRIBUTES, table_name="ATTRIBUTES", con=con )
         dbWriteTable( con, "ATTRIBUTES", ATTRIBUTES, append = TRUE )  })

  try({  KEYS <- lapply( RESULTS, '[[', "KEYS" ) |> dplyr::bind_rows()
         KEYS[] <- lapply( KEYS, as.character )
         check_for_columns( KEYS, table_name="KEYS", con=con )
         dbWriteTable( con, "KEYS", KEYS, append = TRUE )  })

  try({  FAILED_URLS  <- lapply( RESULTS, '[[', "FAILED_URLS" ) |> dplyr::bind_rows()
         if( nrow(FAILED_URLS) > 0 )
         { dbWriteTable( con, "FAILED_URLS", FAILED_URLS, append = TRUE ) }    })

  cat("Data successfully written to DuckDB!")

}

prep_concordance <- function(){
  ccf <- get_concordance() |> as.data.frame()
  ccf <- ccf[c("xpath","variable_name","rdb_table")]
  names(ccf) <- toupper(names(ccf))
  return(ccf)
}


batch_flatten <- function( urls, path, fn="EFILE.duckdb" ){  

  db_file <- paste0( path, "/", fn )
  con <- dbConnect( duckdb::duckdb(), dbdir = db_file )
  # Flush the database WAL buffer 
  dbExecute( con, "CHECKPOINT" )

  ccf <- prep_concordance()

  # Set parallel strategy at the highest level
  num.cores <- future::availableCores() - 1
  future::plan(future::multisession, workers = num.cores )
  RES.LIST <- furrr::future_map( urls, get_flat_xml, ccf, .progress = FALSE)

  # RES.LIST <- purrr::map( urls, get_flat_xml, ccf )
  send_flat_xml_to_db( RESULTS=RES.LIST, path, fn )
}



#######
#######   TEST FUNCTIONS 
#######


path <- "C:/Users/jdlec/Documents/duckdb"
urls <- tinyindex$URL[1:100]

tic()  # --------------

batch_flatten( urls, path, fn="EFILE2.duckdb" )

toc()  # --------------


ccf <- prep_concordance()
RES.LIST <- list()

for( i in urls )
{
  tic()
  oid <- irs990efile::get_object_id( i )
  RES.LIST[[oid]] <- get_flat_xml( i, ccf )
  toc()
}



index <- prep_index( )
years <- 2009:2023
create_batchfiles( index, years=2022, group.size=100 )

setwd("..")
batchfile  <- get_batchfile(year = 2022)
num.cores  <- future::availableCores() - 2
future::plan(future::multisession, workers = num.cores )
batch.list <- split_into_batches( batchfile, numcores=num.cores )

setwd("2022")
path <- getwd()
fn <- "EFILE2022.duckdb"

for( i in names(batchfile) )
{ 
    cat( paste0( "\nLOOP: ", i , "\n") )
    batch <- batchfile[[i]]
    batch_flatten( batch, path, fn="EFILE2022V5.duckdb" )
    remove_groups( i )
    # flush.console()
}



# purrr::walk( batch.list, batch_flatten, path, fn )
# furrr::future_map( batch.list, batch_flatten, path, fn, .progress = TRUE)

# batch_flatten( urls, path, fn="EFILE2022.duckdb" )



remove_groups( completed.batches )



#######
#######   INSPECT DATA 
#######

path <- "C:/Users/jdlec/Documents/duckdb"
fn      <- "FLATXML.duckdb"
db_file <- paste0( path, "/", fn )
con <- dbConnect( duckdb::duckdb(), dbdir = db_file )


# Verify that tables are created
dbListTables(con)

# Check the first few rows of each table
print(dbGetQuery(con, "SELECT * FROM FLATXML LIMIT 5"))
print(dbGetQuery(con, "SELECT * FROM ATTRIBUTES LIMIT 5"))
print(dbGetQuery(con, "SELECT * FROM KEYS LIMIT 5"))
print(dbGetQuery(con, "SELECT * FROM FAILED_URLS LIMIT 5"))


dbListTables(con)
db <- dplyr::tbl( con,  table_name )
existing_cols <- colnames(db)

flatxml <- 
  con %>%
  tbl( "FLATXML" ) %>% 
  collect() %>% 
  unique()

dim( flatxml )
data.table::fwrite( flatxml, "FLATXML.CSV" )

attributes <- 
  con %>%
  tbl( "ATTRIBUTES" ) %>% 
  collect() %>% 
  unique()

dim( attributes )
data.table::fwrite( attributes, "ATTRIBUTES.CSV" )

keys <- 
  con %>%
  tbl( "KEYS" ) %>% 
  collect() %>% 
  unique()

dim( keys )
data.table::fwrite( keys, "KEYS.CSV" )






# 2516.88 sec elapsed
url <- "https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/201342269349303234_public.xml"


url <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201300879349300235_public.xml"
doc <- xml2::read_xml( file(url) )
xml2::xml_ns_strip( doc )

KEYS <- irs990efile::get_keys( doc, url )
OBJECTID <- irs990efile::get_object_id( url )

xx <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_path()

order <- 1:length(xx)

type <- get_type(xx)

tt <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_text()

xx2 <- gsub( "\\[[0-9]{1,5}\\]", "", xx )

table.id     <- get_table_id( xx )
table.header <- purrr::map2_chr( xx2, type, get_header )


d <- 
  data.frame(
    OBJECTID, 
    ORDER=order,  
    XPATH=xx, 
    XPATH2=xx2, 
    TYPE=type, 
    TABLE_ID=table.id, 
    TABLE_HEADER=table.header, 
    VALUE=tt  )

cc <- get_concordance() |> as.data.frame()
cc <- cc[c("xpath","variable_name","rdb_table")]
names(cc) <- toupper(names(cc))

dd <- merge( d, cc, by.x="XPATH2", by.y="XPATH", all.x=T )

vnames <- get_vnames( dd$XPATH2, dd$TYPE )
dd$VARIABLE_NAME[ is.na(dd$VARIABLE_NAME) ] <- vnames[ is.na(dd$VARIABLE_NAME) ]
dd$RDB_TABLE[ is.na(dd$RDB_TABLE) ] <- ""
dd <- dplyr::arrange( dd, ORDER )

column.order <-
c("OBJECTID", "ORDER", "XPATH", "XPATH2",
"TABLE_HEADER", "TABLE_ID", "TYPE",  "RDB_TABLE", "VARIABLE_NAME", "VALUE")

"TAX_YEAR", "RETURN_TYPE", "VERSION",  
"EIN2",  "ORG_EIN", "ORG_NAME_L1", "ORG_NAME_L2", 
"RETURN_AMENDED_X", "RETURN_GROUP_X", "RETURN_PARTIAL_X", "RETURN_TAXPER_DAYS", 
"RETURN_TIME_STAMP",  "TAX_PERIOD_BEGIN_DATE", "TAX_PERIOD_END_DATE", 
"URL" )

dd <- as.data.frame(dd)
dd <- dd[column.order]

data.table::fwrite( dd, "TESTFLATFILES.CSV" )

ccf





# Transform XML data into flat format
url <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201300879349300235_public.xml"
doc <- xml2::read_xml( file(url) )
xml2::xml_ns_strip( doc )

KEYS       <- irs990efile::get_keys( doc, url ) |> as.data.frame()
FLATXML    <- flatten_xml( doc, url )
ATTRIBUTES <- get_attr_df( doc, url )

# Define DuckDB database file (Persistent Storage)
path    <- "C:/Users/jdlec/Documents/duckdb"
fn      <- "FLATXML.duckdb"
db_file <- paste0( path, "/", fn )

# Open a connection to DuckDB
con <- dbConnect( duckdb::duckdb(), dbdir = db_file )

# Write data frames to DuckDB
dbWriteTable( con, "FLATXML", FLATXML, append = TRUE )
dbWriteTable( con, "ATTRIBUTES", ATTRIBUTES, append = TRUE )
dbWriteTable( con, "KEYS", KEYS, append = TRUE )

# Close the connection
dbDisconnect( con, shutdown = TRUE )

cat("? Data successfully written to DuckDB!")



# Verify that tables are created
dbListTables(con)

# Check the first few rows of each table
print(dbGetQuery(con, "SELECT * FROM FLATXML LIMIT 5"))
print(dbGetQuery(con, "SELECT * FROM ATTRIBUTES LIMIT 5"))
print(dbGetQuery(con, "SELECT * FROM KEYS LIMIT 5"))



library( tictoc )








       
                 
   


ddb <- tbl(con, "FLATXML")
result <- ddb %>%
  filter(column_name > 100) %>%
  select(column_name, another_column) %>%
  arrange(desc(column_name))


URL <- unique( index$URL )


url <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201300879349300235_public.xml"

# Define DuckDB database file (Persistent Storage)
path    <- "C:/Users/jdlec/Documents/duckdb"
fn      <- "FLATXML.duckdb"
db_file <- paste0( path, "/", fn )

# Open a connection to DuckDB
con <- dbConnect( duckdb::duckdb(), dbdir = db_file )


dir.create("xml")

get_file <- function(url){
  oid <- irs990efile::get_object_id(url)
  fn <- paste0( "xml/", oid, ".xml" )
  try(download.file( url, destfile=fn ))
}

purrr::walk( urls, get_file )


# Close the connection
dbDisconnect( con, shutdown = TRUE )


