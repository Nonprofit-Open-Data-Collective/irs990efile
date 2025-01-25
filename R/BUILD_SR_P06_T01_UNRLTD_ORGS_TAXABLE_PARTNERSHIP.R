#' @title 
#'   Build table SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SR_P06_T01_UNRLTD_ORGS_TAXABLE_PARTNERSHIP <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP' ]]
v.map <- get_var_map( 'SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP' )
df <- get_table_v2( doc, table.name='SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

