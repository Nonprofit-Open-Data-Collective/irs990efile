#' @title 
#'   Build table SD-P10-T01-OTH-LIABILITIES
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SD_P10_T01_OTH_LIABILITIES <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SD-P10-T01-OTH-LIABILITIES' ]]
v.map <- get_var_map( 'SD-P10-T01-OTH-LIABILITIES' )
df <- get_table_v2( doc, table.name='SD-P10-T01-OTH-LIABILITIES', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

