#' @title 
#'   Build table SK-P03-T01-BOND-PRIVATE-BIZ-USE
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SK_P03_T01_BOND_PRIVATE_BIZ_USE <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SK-P03-T01-BOND-PRIVATE-BIZ-USE' ]]
v.map <- get_var_map( 'SK-P03-T01-BOND-PRIVATE-BIZ-USE' )
df <- get_table_v2( doc, table.name='SK-P03-T01-BOND-PRIVATE-BIZ-USE', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

