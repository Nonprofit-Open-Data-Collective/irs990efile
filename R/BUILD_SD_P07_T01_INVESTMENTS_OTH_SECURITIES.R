#' @title 
#'   Build table SD-P07-T01-INVESTMENTS-OTH-SECURITIES
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SD_P07_T01_INVESTMENTS_OTH_SECURITIES <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SD-P07-T01-INVESTMENTS-OTH-SECURITIES' ]]
v.map <- get_var_map( 'SD-P07-T01-INVESTMENTS-OTH-SECURITIES' )
df <- get_table_v2( doc, table.name='SD-P07-T01-INVESTMENTS-OTH-SECURITIES', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

