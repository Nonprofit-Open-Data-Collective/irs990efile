#' @title 
#'   Build table SR-P04-T01-ID-RLTD-ORGS-TAXABLE-CORPORATION
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SR_P04_T01_ID_RLTD_ORGS_TAXABLE_CORPORATION <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SR-P04-T01-ID-RLTD-ORGS-TAXABLE-CORPORATION' ]]
v.map <- get_var_map( 'SR-P04-T01-ID-RLTD-ORGS-TAXABLE-CORPORATION' )
df <- get_table_v2( doc, table.name='SR-P04-T01-ID-RLTD-ORGS-TAXABLE-CORPORATION', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

