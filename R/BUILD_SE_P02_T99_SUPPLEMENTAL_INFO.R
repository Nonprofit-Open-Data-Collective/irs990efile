#' @title 
#'   Build table SE-P02-T99-SUPPLEMENTAL-INFO
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SE_P02_T99_SUPPLEMENTAL_INFO <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SE-P02-T99-SUPPLEMENTAL-INFO' ]]
v.map <- get_var_map( 'SE-P02-T99-SUPPLEMENTAL-INFO' )
df <- get_table_v2( doc, table.name='SE-P02-T99-SUPPLEMENTAL-INFO', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

