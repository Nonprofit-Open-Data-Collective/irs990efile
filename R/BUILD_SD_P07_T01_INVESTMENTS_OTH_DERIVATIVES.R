#' @title 
#'   Build table SD-P07-T01-INVESTMENTS-OTH-DERIVATIVES
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SD_P07_T01_INVESTMENTS_OTH_DERIVATIVES <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SD-P07-T01-INVESTMENTS-OTH-DERIVATIVES' ]]
v.map <- get_var_map( 'SD-P07-T01-INVESTMENTS-OTH-DERIVATIVES' )
df <- get_table_v2( doc, table.name='SD-P07-T01-INVESTMENTS-OTH-DERIVATIVES', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

