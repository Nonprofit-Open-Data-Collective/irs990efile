#' @title 
#'   Build table SR-P02-T01-ID-RLTD-TAX-EXEMPED-ORGS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SR_P02_T01_ID_RLTD_TAX_EXEMPED_ORGS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SR-P02-T01-ID-RLTD-TAX-EXEMPED-ORGS' ]]
v.map <- get_var_map( 'SR-P02-T01-ID-RLTD-TAX-EXEMPED-ORGS' )
df <- get_table_v2( doc, table.name='SR-P02-T01-ID-RLTD-TAX-EXEMPED-ORGS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

