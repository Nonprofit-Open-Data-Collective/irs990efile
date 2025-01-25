#' @title 
#'   Build table SM-P01-T01-NONCASH-CONTRIBUTIONS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SM_P01_T01_NONCASH_CONTRIBUTIONS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SM-P01-T01-NONCASH-CONTRIBUTIONS' ]]
v.map <- get_var_map( 'SM-P01-T01-NONCASH-CONTRIBUTIONS' )
df <- get_table_v2( doc, table.name='SM-P01-T01-NONCASH-CONTRIBUTIONS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

