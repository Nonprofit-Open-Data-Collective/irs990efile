#' @title 
#'   Build table SR-P05-T01-TRANSACTIONS-RLTD-ORGS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SR_P05_T01_TRANSACTIONS_RLTD_ORGS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SR-P05-T01-TRANSACTIONS-RLTD-ORGS' ]]
v.map <- get_var_map( 'SR-P05-T01-TRANSACTIONS-RLTD-ORGS' )
df <- get_table_v2( doc, table.name='SR-P05-T01-TRANSACTIONS-RLTD-ORGS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

