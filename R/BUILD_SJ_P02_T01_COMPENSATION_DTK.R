#' @title 
#'   Build table SJ-P02-T01-COMPENSATION-DTK
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SJ_P02_T01_COMPENSATION_DTK <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SJ-P02-T01-COMPENSATION-DTK' ]]
v.map <- get_var_map( 'SJ-P02-T01-COMPENSATION-DTK' )
df <- get_table_v2( doc, table.name='SJ-P02-T01-COMPENSATION-DTK', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

