#' @title 
#'   Build table SR-P01-T01-ID-DISREGARDED-ENTITIES
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SR_P01_T01_ID_DISREGARDED_ENTITIES <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SR-P01-T01-ID-DISREGARDED-ENTITIES' ]]
v.map <- get_var_map( 'SR-P01-T01-ID-DISREGARDED-ENTITIES' )
df <- get_table_v2( doc, table.name='SR-P01-T01-ID-DISREGARDED-ENTITIES', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

