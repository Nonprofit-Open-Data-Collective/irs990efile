#' @title 
#'   Build table SD-P09-T01-OTH-ASSETS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SD_P09_T01_OTH_ASSETS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SD-P09-T01-OTH-ASSETS' ]]
v.map <- get_var_map( 'SD-P09-T01-OTH-ASSETS' )
df <- get_table_v2( doc, table.name='SD-P09-T01-OTH-ASSETS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

