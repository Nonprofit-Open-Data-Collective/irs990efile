#' @title 
#'   Build table SC-P01-T01-POLITICAL-ORGS-INFO
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SC_P01_T01_POLITICAL_ORGS_INFO <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SC-P01-T01-POLITICAL-ORGS-INFO' ]]
v.map <- get_var_map( 'SC-P01-T01-POLITICAL-ORGS-INFO' )
df <- get_table_v2( doc, table.name='SC-P01-T01-POLITICAL-ORGS-INFO', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

