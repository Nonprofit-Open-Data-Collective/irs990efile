#' Find Table Headers
#'
#' Identifies and consolidates table headers for a specified database table.
#'
#' @param table.name A character string representing the name of the table for which headers are to be found.
#'
#' @return A character vector of consolidated and updated group names for the table headers.
#' @details This function retrieves and processes XPaths from a concordance table to identify group names associated with a table's headers.
#' @examples
#' headers <- find_table_headers("F9-P03-T01-PROGRAMS")
#' print(headers)
#' @export
find_table_headers <- function( table.name )
{
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  xpaths <- TABLE$xpath %>% as.character()
  xpaths <- gsub( "IRS990EZ", "IRS990", xpaths )
  nodes <- strsplit( xpaths, "/" )
  d1 <- suppressWarnings( data.frame( do.call( cbind, nodes ), stringsAsFactors=F ) )
  not.equal <- apply( d1, MARGIN=1, FUN=function(x){ length( unique( x )) > 1 } ) 
  this.one <- which( not.equal == T )[ 1 ]
  group.names <- d1[ this.one,  ] %>% as.character() %>% unique()
  group.names <- paste0( group.names, "/")
  updated.group.names <- collapse_nodes(group.names)
  return( updated.group.names )
}

#' Get Variable Map
#'
#' Generates a mapping of variable names to XSD variable names for a specified table.
#'
#' @param table.name A character string representing the name of the table.
#'
#' @return A data frame with two columns: `VARIABLE` (human-readable names) and `XSD_VARNAME` (corresponding XSD variable names).
#' @details This function uses the concordance data to extract and map variable names for the specified table.
#' @examples
#' var_map <- get_var_map("F9-P03-T01-PROGRAMS")
#' head(var_map)
#' @export
get_var_map <- function( table.name ) 
{
    if( ! exists("concordance") ) { concordance <- get_concordance() }
    TABLE <- dplyr::filter( concordance, rdb_table == table.name )
    xpaths <- TABLE[[ "xpath" ]]
    path.list <- strsplit( xpaths, "/" )
    V1 <- sapply( path.list, tail, 1 )
    V2 <- sapply( path.list, function(x){ paste0( tail(x,2), collapse=".") } )
    V3 <- sapply( path.list, function(x){ paste0( tail(x,3), collapse=".") } )
    VN <- TABLE[[ "variable_name" ]]
    v.map <- data.frame( VARIABLE=c(VN,VN,VN), XSD_VARNAME=c(V1,V2,V3) ) 
    v.map <- unique(v.map)
    v.map <- dplyr::arrange( v.map, XSD_VARNAME )
    # drop non-unique mappings
    v.map <- v.map %>% dplyr::group_by( XSD_VARNAME ) %>% dplyr::filter( n() < 2 )
    return(v.map)
}

#' Rename Data Frame Columns
#'
#' Renames the columns of a data frame based on a variable map.
#'
#' @param df A data frame with columns to be renamed.
#' @param v.map A data frame containing the variable map with `XSD_VARNAME` (old names) and `VARIABLE` (new names).
#'
#' @return The input data frame with renamed columns.
#' @examples
#' renamed_df <- re_name(my_data, var_map)
#' @export
re_name <- function( df, v.map ) {
  df <- df %>% as.list() %>% data.frame()
  nm.old <- v.map[["XSD_VARNAME"]]
  nm.new <- v.map[["VARIABLE"]]
  df <- data.table::setnames( df, old=nm.old, new=nm.new, skip_absent=TRUE )
  return( df )
}

#' Collapse Nodes
#'
#' Consolidates and generates group names for given XPaths.
#'
#' @param lc.xpaths A character vector of XPath prefixes.
#'
#' @return A character vector of consolidated XPath group names.
#' @details This function uses the concordance table to identify and collapse nodes for the provided XPaths.
#' @examples
#' collapsed_nodes <- collapse_nodes(c("IRS990", "IRS990EZ"))
#' @export
collapse_nodes <- function( lc.xpaths )
{
  data(concordance)
  comb.names <- c()
  for( i in 1:length( lc.xpaths )){
    lc.xpath <- lc.xpaths[i]
    TABLE <- dplyr::filter( concordance, grepl( lc.xpath, xpath ) )
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


#' Drop empty XML nodesets
#' @param nodeset An xml2 xml_nodeset.
#'
#' @return Subset of non-empty nodes as xml2 xml_nodeset.
#' @examples
#' x <- 
#' "<doc> 
#'    <RevenueGrp> <BusinessCd> 611430 </BusinessCd> </RevenueGrp> 
#'    <RevenueGrp> <BusinessCd> 611431 </BusinessCd> </RevenueGrp>  
#'    <RevenueGrp/>               # void nodeset
#'    <RevenueGrp></RevenueGrp>   # empty nodeset 
#'  </doc>"
#' doc <- xml2::read_xml(x)
#' nodes <- xml2::xml_find_all( doc, ".//RevenueGrp" )
#' nodes %>% xml2::xml_text()  # empty nodes ""
#' drop_empty_nodes( nodes )
#' @export
drop_empty_nodes <- function( nodeset ){
  len <- nodeset |> xml2::xml_text() |> sapply( nchar, USE.NAMES=F ) 
  nodeset <- nodeset[ len > 0 ]
  return( nodeset )
}

#' Extract Table Data from XML
#'
#' Extracts table data from an XML document based on specified headers.
#'
#' @param doc An XML document object.
#' @param table.name A character string representing the table name.
#' @param table.headers A character vector of table header XPaths.
#'
#' @return A data frame containing the extracted table data or NULL if no data is found.
#' @examples
#' table_data <- get_table_v2(doc, "F9-P03-T01-PROGRAMS", headers)
#' @export
get_table_v2 <- function( doc, table.name, table.headers ){

  all.table.headers <- paste0( unlist(table.headers), collapse="|" )
  nd <- xml2::xml_find_all( doc, all.table.headers )
  nd <- drop_empty_nodes(nd)
  if( length( nd ) == 0 ){ return(NULL) }

  rdb.table <- suppressMessages( xmltools::xml_dig_df(nd, dig = TRUE) ) 
  
  tbl_test <- function(x){ if(!is.tbl(x)){unlist(x)}else{x} }
  
  rdb.table <- 
    rdb.table %>%
    lapply( tbl_test ) %>% 
    dplyr::bind_rows()
  
  rdb.table <- 
    rdb.table %>% 
    dplyr::mutate_if(is.factor, as.character)

  return( rdb.table )

}

