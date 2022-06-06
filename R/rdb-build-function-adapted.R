#GENERAL TABLE BUILDING FOR NON SIMPLISTIC TABLE STRUCTURE

#5/31/2022
#looking for last common xpaths and then divergence for subnodes

#6/2/2022 finalized work

#6/6/2022 added documentation and removed extraneous comments/code

###---------------------------------------------------
###   RELATIONAL DATABASE FUNCTIONS (first new/improved, then old)
###---------------------------------------------------

# "group" here means the root xpath that defines
# a collection of variables on a one-to-many table


###---------------------------------------------------

#' @title find_group_names_2 (improved from rdb-functions-v2)
#'
#' @description identifies all possible roots/xpaths from a table name
#'
#' @export
find_group_names_2 <- function( table.name )
{
  data(concordance)
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  xpaths <- TABLE$xpath %>% as.character()
  xpaths <- gsub( "IRS990EZ", "IRS990", xpaths )
  nodes <- strsplit( xpaths, "/" )
  d1 <- suppressWarnings( data.frame( do.call( cbind, nodes ), stringsAsFactors=F ) )
  not.equal <- apply( d1, MARGIN=1, FUN=function(x){ length( unique( x )) > 1 } ) 
  this.one <- which( not.equal == T )[ 1 ]
  group.names <- d1[ this.one,  ] %>% as.character() %>% unique()
  group.names <- paste0( group.names, "/")
  # if(table.name == "F9-P03-T01-PROGRAMS"){
  #   group.names <- head(group.names,-5)
  # }
  updated.group.names <- collapse_nodes(group.names)
  # print(updated.group.names)
  return( updated.group.names )
}


###---------------------------------------------------

#' @title collapse_nodes (new)
#'
#' @description helper function:
#' takes in a list of possible roots and finds sub-roots if existing
#' i.e. collapses possible subparenting/subgrouping structure in xml files
#' 
#'
#' @export
collapse_nodes <- function( lc.xpaths )
{
  data(concordance)
  comb.names <- c()
  for(i in 1:length(lc.xpaths)){
    lc.xpath <- lc.xpaths[i]
    TABLE <- dplyr::filter( concordance, grepl(lc.xpath, xpath) )
    # print(TABLE)
    xpaths <- TABLE$xpath %>% as.character()
    xpaths <- gsub( "IRS990EZ", "IRS990", xpaths )
    nodes <- strsplit( xpaths, "/" )
    d1 <- suppressWarnings( data.frame( do.call( cbind, nodes ), stringsAsFactors=F ) )
    # print(d1)
    not.equal <- apply( d1, MARGIN=1, FUN=function(x){ length( unique( x )) > 1 } ) 
    # print(not.equal)
    this.one <- which( not.equal == T )[ 1 ]
    group.names <- d1[ this.one,  ] %>% as.character() %>% unique()
    group.names <- paste0( "//", lc.xpath, group.names )
    # if(table.name == "F9-P03-T01-PROGRAMS"){
    #   group.names <- head(group.names,-5)
    # }
    comb.names <- append(comb.names,group.names)
  }
  return( comb.names )
}


###---------------------------------------------------

#' @title get_table_2 (improved from rdb-functions-v2)
#'
#' @description collects the information out of the relevant xpath roots
#' including the subgrouped roots and data as well
#'
#' @export
get_table_2 <- function( doc, group.names, table.name )
{
  library( dplyr, warn.conflicts=F, quietly=T )
  data( concordance )
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  original.xpaths <- TABLE$xpath %>% as.character()
  all.groups <- paste0( group.names, collapse="|" )
  # print(all.groups)
  nd <- xml2::xml_find_all( doc, all.groups)
  # nd <- xml2::xml_find_all(doc, "//IdDisregardedEntitiesGrp")
  
  if( length( nd ) == 0 ){ return(NULL) }
  
  # ensure group names unique to table
  valid <- validate_group_names( nd, table.name )
  if( ! valid )
  { 
    xp <- nd %>% xml2::xml_path()
    xp <- gsub( "\\[[0-9]{1,}\\]", "", xp ) %>% unique()
    print("TABLE: ")
    print( table.name )
    print("TABLE XPATHS: ")
    print( original.xpaths )
    print("CURRENT XPATHS: ")
    print( xp )
    stop( 'Group names are not unique to the table' )
  }
  
  # ensure we are using root node for table
  table.xpaths <- ( xmltools::xml_get_paths( nd, only_terminal_parent = TRUE ))
  table.xpaths <- table.xpaths %>% unlist() %>% unique()
  #since we have them all, just capture the data from here?
  # print(table.xpaths)
  nodes <- strsplit( table.xpaths, "/" )
  l1 <- length(nodes[[1]])
  tr <- paste0("//",nodes[[1]][l1-1],"/",nodes[[1]][l1])
  nd <- xml2::xml_find_all(doc,tr)
  rdb.table <- xmltools::xml_dig_df( nd, dig = TRUE ) %>% bind_rows()
  rdb.table <- rdb.table %>% dplyr::mutate_if(is.factor, as.character)
  if( length( table.xpaths ) > 1 )
  {
    for(i in 2:length(table.xpaths)){
      l <- length(nodes[[i]])
      table.root <- paste0("//",nodes[[i]][l-1],"/",nodes[[i]][l])
      nd <- xml2::xml_find_all(doc,table.root)
      temp.df <- xmltools::xml_dig_df( nd, dig = TRUE ) %>% bind_rows()
      temp.df <- temp.df %>% dplyr::mutate_if(is.factor, as.character)
      # print(temp.df)
      rdb.table <- cbind(rdb.table,temp.df)
    }
  }
  return( rdb.table )
}


###---------------------------------------------------

#' @title build_rdb_table_adapted (improved from rdb-functions-v2)
#'
#' @description rdb build function equipped to handle tables with sub-grouping
#' it is generalized so it still works on previously working tables
#'
#' @export
build_rdb_table_adapted <- function(url, table.name)
{
  
  doc <- NULL
  try( doc <- xml2::read_xml( url ), silent=T ) 
  if( is.null(doc) )
  { 
    return( NULL )
  }
  
  xml2::xml_ns_strip( doc )
  all.xpaths <- doc %>% xml_get_paths()
  unique.xpaths <- all.xpaths %>% 
    unlist() %>% 
    unique()
  
  ####----------------------------------------------------
  ####     KEYS
  ####----------------------------------------------------
  
  
  ## OBJECT ID
  
  OBJECTID <- get_object_id( url )
  
  
  
  ## URL
  
  URL <- url
  
  
  
  ## EIN
  
  EIN  <- xml2::xml_text( xml2::xml_find_all( doc, "//Return/ReturnHeader/Filer/EIN" ) )
  
  
  
  ## NAME
  
  V_990NAMEpost2014 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt"
  V_990NAME_2013 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1"
  V_990NAMEpre2013  <- "//Return/ReturnHeader/Filer/Name/BusinessNameLine1"
  name.xpath <- paste( V_990NAME_2013, V_990NAMEpre2013, V_990NAMEpost2014, sep="|" )
  NAME <- xml2::xml_text( xml2::xml_find_all( doc, name.xpath ) )
  
  
  ## TYPE OF TAX FORM
  
  V_990TFpost2013 <- "//Return/ReturnHeader/ReturnTypeCd"
  V_990TFpre2013  <- "//Return/ReturnHeader/ReturnType"
  tax.form.xpath <- paste( V_990TFpost2013, V_990TFpre2013, sep="|" )
  FORMTYPE <- xml2::xml_text( xml2::xml_find_all( doc, tax.form.xpath ) )
  
  
  ## TAX YEAR
  
  V_990FYRpost2013 <- "//Return/ReturnHeader/TaxYr"
  V_990FYRpre2013  <- "//Return/ReturnHeader/TaxYear"
  fiscal.year.xpath <- paste( V_990FYRpost2013, V_990FYRpre2013, sep="|" )
  TAXYR <- xml2::xml_text( xml2::xml_find_all( doc, fiscal.year.xpath ) )
  
  
  
  
  ####  BUILD TABLE 
  
  
  group.names <- find_group_names_2( table.name=table.name )
  # print(group.names)
  # print(find_group_names(table.name = table.name))
  df <- get_table_2( doc, group.names, table.name  )
  
  if( is.null(df) ){ return( NULL ) }
  
  v.map <- get_var_map( table.name=table.name )
  df <- re_name( df, v.map )
  
  rdb.table <- data.frame( OBJECT_ID=OBJECTID, EIN=EIN, NAME=NAME, TAXYR=TAXYR, 
                           FORMTYPE=FORMTYPE, URL=URL, df, stringsAsFactors=F )
  
  return ( rdb.table )
  
}


###---------------------------------------------------

#FUNCTIONS REUSED FROM rdb-functions-v2

###---------------------------------------------------

#' @title validate_group_names function (same as rdb-functions-v2)
#'
#' @description Validating group names from a nodeset (nd) and 
#' a specific table (table.name)
#'
#' @details some additional details 
#'
#' @export
validate_group_names <- function( nd, table.name )
{
  data(concordance)
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  table.xpaths <- TABLE$xpath %>% as.character()
  
  # check to see if nodes all in table
  xp <- nd %>% xml2::xml_path()
  
  # remove counts like "/Return/ReturnData/IRS990/ProgramServiceRevenueGrp[1]/Desc" 
  xp <- gsub( "\\[[0-9]{1,}\\]", "", xp ) %>% unique()
  
  r <- lapply( xp, grepl, table.xpaths )
  v <- lapply( r, function(x){ sum(x) > 0 } ) %>% unlist()
  nodes.in.table <- sum(v) == length(xp)
  # print(sum(v)) #debugging
  # print(v)
  # print(length(xp)) #debugging
  # print(xp)
  
  return( nodes.in.table ) 
  
}


###---------------------------------------------------

#' @title get_var_map (same as rdb-functions-v2) 
#'
#' @description creates a crosswalk between IRS 
#   variable names and concordance variable names from a table name
#'
#' @export
get_var_map <- function( table.name )
{
  data(concordance)
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  xpaths <- TABLE$xpath %>% as.character()
  res <- strsplit( xpaths, "/" )
  v.map <- data.frame( VARIABLE=as.character(TABLE$variable_name), 
                       XSD_VARNAME=unlist( lapply( res, dplyr::last ) ), stringsAsFactors=F )
  v.map <- unique( v.map )
  return( v.map )
}


###---------------------------------------------------

#' @title remove_count (same as rdb-functions-v2)
#'
#' @description gets rid of extraneous numbering and details in 
#' potential group names
#'
#' @details uses regex to do this
#'
#' @export
remove_count <- function( x )
{ 
  # "/Return/ReturnData/IRS990/ProgramServiceRevenueGrp[102]/Desc" 
  # "/Return/ReturnData/IRS990/ProgramServiceRevenueGrp/Desc"
  x <- gsub( "\\[[0-9]{1,}\\]", "", x )
  return(x)
}


###---------------------------------------------------

#' @title re_name (same as rdb-functions-v2) 
#'
#' @description converts IRS names to concordance names in a dataframe
#'
#' @export
re_name <- function( df, v.map )
{
  
  for( i in unique( v.map$VARIABLE ) )
  {
    this.one <- names( df ) %in% v.map[ v.map$VARIABLE == i , "XSD_VARNAME" ] 
    names( df )[this.one] <- i
  }
  
  return( df )
  
}

