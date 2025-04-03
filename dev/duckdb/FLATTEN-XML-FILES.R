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

get_object_id2 <- function (url) {
    base_01 <- "https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/"
    base_02 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/"
    base_03 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml2/2022_TEOS_XML_01A/"
    base_04 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml2/2022_TEOS_XML_02A/"
    object.id <- gsub(paste0(base_01,"|",base_02,"|",base_03,"|",base_04), "", url)
    object.id <- gsub("_public.xml", "", object.id)
    object.id <- paste0("OID-", object.id)
    return(object.id)
}

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
        xpath = xml_path(node),      # Store full XPath
        as.list(xml_attrs(node))     # Extract all attributes
      )
    })

  # Add ObjectID as database key
  OBJECTID <- get_object_id2( url )
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
  OBJECTID     <- get_object_id2( url )
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

  cat("Data successfully written to DuckDB!\n")

}

prep_concordance <- function(){
  ccf <- get_concordance() |> as.data.frame()
  ccf <- ccf[c("xpath","variable_name","rdb_table")]
  names(ccf) <- toupper(names(ccf))
  return(ccf)
}


batch_flatten <- function( urls, path, fn="EFILE.duckdb", ccf ){  

  db_file <- paste0( path, "/", fn )
  con <- dbConnect( duckdb::duckdb(), dbdir = db_file )
  # Flush the database WAL buffer 
  dbExecute( con, "CHECKPOINT" )

  # ccf <- prep_concordance()

  # Set parallel strategy at the highest level
  num.cores <- future::availableCores() - 1
  future::plan(future::multisession, workers = num.cores )
  RES.LIST <- furrr::future_map( urls, get_flat_xml, ccf, .progress = FALSE)

  # RES.LIST <- purrr::map( urls, get_flat_xml, ccf )
  send_flat_xml_to_db( RESULTS=RES.LIST, path, fn )
}


#######
#######   SPECIFIC FUNCTIONS FOR NCCS SERVER
#######


get_object_id2 <- 
function (url) 
{
    base_01 <- "https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/"
    base_02 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/"
    base_03 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml2/2022_TEOS_XML_01A/"
    base_04 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml2/2022_TEOS_XML_02A/"
    base_05 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml2/2023/"
    object.id <- gsub(paste0(base_01,"|",base_02,"|",base_03,"|",base_04,"|",base_05), "", url)
    object.id <- gsub("_public.xml", "", object.id)
    object.id <- paste0("OID-", object.id)
    return(object.id)
}


create_batchfiles <- 
function (index, years, group.size) 
{
    years <- as.character(years)
    purrr::walk(years, split_index, index = index, group.size = group.size)
}

split_index <-
function (year, index, group.size = 25) 
{
    index <- prep_index(years = year, index)
    urls <- index[["URL"]]
    batchfile <- split_into_groups(urls, G = group.size)
    dir.create(as.character(year), showWarnings = F)
    saveRDS(batchfile, paste0(year, "/BATCHFILE.RDS"))
    return(invisible(batchfile))
}

split_into_groups <-
function (x, G = 25) 
{
    groups <- split(x, ceiling(seq_along(x)/G))
    n_groups <- length(groups)
    max_width <- max(nchar(n_groups))
    num_groups <- stringr::str_pad(1:n_groups, width = max_width, 
        side = "left", pad = "0")
    len_groups <- sapply(groups, length)
    names(groups) <- 
      paste0( "G", num_groups, "{", len_groups, "}" )
    return(groups)
}


cf.url <- "https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file/raw/refs/heads/master/concordance.csv"
cf.url <- "https://raw.githubusercontent.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file/refs/heads/master/concordance.csv"
ccf <- data.table::fread( "concordance.csv", showProgress = FALSE )

ccf <- get_concordance()

ccf <- as.data.frame( ccf )
ccf <- ccf[c("xpath","variable_name","rdb_table")]
names(ccf) <- toupper(names(ccf))

#######
#######   TEST FUNCTIONS 
#######


setwd( "C:/Users/jdlec/Documents/duckdb/2023B" )

index <- data.table::fread( "MISSING-XML-FILES-ON-DATA-COMMONS.CSV" )
index$TAX_YEAR <- substr( index$TAX_PERIOD, 1, 4 )
table( index$TAX_YEAR, index$RETURN_TYPE )

index$XML_BATCH_ID[ index$XML_BATCH_ID == "" ] <- "2023_TEOS"

table( index$TAX_YEAR, index$XML_BATCH_ID )

index2 <- 
  index %>%
  filter( RETURN_TYPE %in% c("990","990EZ") )
  
YEAR <- "20XX"
urls <- index2[["URL"]]
batchfile <- split_into_groups( urls, G = 100 )
# dir.create( as.character(YEAR), showWarnings = F )
saveRDS( batchfile, "BATCHFILE.RDS" )

saveRDS( ccf, "CONCORDANCE.RDS" )



##########


setwd( "C:/Users/jdlec/Documents/duckdb/2023B" )
batchfile <- readRDS( "BATCHFILE.RDS" )
ccf <- readRDS( "CONCORDANCE.RDS" )

print( names(batchfile) )

# setwd(YEAR)
PATH <- getwd()
FN <- paste0("EFILE2023MISS", ".duckdb" )

for( i in names(batchfile) )
{ 
    tic()
    cat( paste0( "\nLOOP: ", i , "\n") )
    batch <- batchfile[[i]]
    batch_flatten( urls=batch, path=PATH, fn=FN, ccf=ccf )
    remove_groups( i )
    # flush.console()
    toc()
}








##################################
##################################   SCRATCH 
##################################


library( dplyr )        # data wrangling
library( xmltools )     # xml utilities
library( xml2 )         # xml utilities
library( XML )          # xml utilities 
library( knitr )        # formatting 
library( irs990efile )
library( DBI )
library( duckdb )
library( tictoc )
library( tidyr )

con <- dbConnect( duckdb::duckdb(), "EFILE2023MISS.duckdb" )
DBI::dbExecute(con, "PRAGMA wal_replay")

# dbDisconnect(con)

dbListTables(con)

print(dbGetQuery(con, "SELECT * FROM ATTRIBUTES LIMIT 5"))
print(dbGetQuery(con, "SELECT * FROM FLATXML LIMIT 5"))

dbListFields( con, "FLATXML" )
dbListFields( con, "FAILED_URLS" )

failed <- tbl(con, "FAILED_URLS")

failed <- as.data.frame( failed )
data.table::fwrite( failed, "FAILED-URLS.CSV" )


flatxml <- tbl(con, "FLATXML")

flatxml %>% 
  filter( VARIABLE_NAME == "F9_00_TAX_YEAR" ) %>%
  count( VALUE ) %>% 
  collect()

temp <- 
  flatxml %>% 
  filter( VARIABLE_NAME == "F9_00_TAX_YEAR" ) %>%
  select( OBJECTID, VARIABLE_NAME, VALUE ) %>% 
  collect()


df <- flatxml %>% collect()

flatxml <- tbl(con, "EFILE2009.FLATXML")

summary <- 
  flatxml %>% 
  filter( TYPE == "terminal" ) %>%
  mutate( IN_CCF = (RDB_TABLE != "") ) %>%
  group_by(XPATH2) %>% 
  summarise( N=sum(IN_CCF), MISSING=sum(!IN_CCF) ) %>% 
  arrange( XPATH2 ) 

# see query
summary %>% show_query()
as.data.frame(summary) |> knitr::kable()


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



