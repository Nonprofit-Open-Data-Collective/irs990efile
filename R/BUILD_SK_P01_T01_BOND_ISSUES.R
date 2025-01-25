#' @title 
#'   Build table SK-P01-T01-BOND-ISSUES
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SK_P01_T01_BOND_ISSUES <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SK-P01-T01-BOND-ISSUES' ]]
v.map <- get_var_map( 'SK-P01-T01-BOND-ISSUES' )
df <- get_table_v2( doc, table.name='SK-P01-T01-BOND-ISSUES', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

