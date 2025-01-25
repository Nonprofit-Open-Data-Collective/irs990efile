#' @title 
#'   Build table SB-P01-T01-CONTRIBUTORS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SB_P01_T01_CONTRIBUTORS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SB-P01-T01-CONTRIBUTORS' ]]
v.map <- get_var_map( 'SB-P01-T01-CONTRIBUTORS' )
df <- get_table_v2( doc, table.name='SB-P01-T01-CONTRIBUTORS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

