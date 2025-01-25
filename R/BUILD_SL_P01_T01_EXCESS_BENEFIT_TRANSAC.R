#' @title 
#'   Build table SL-P01-T01-EXCESS-BENEFIT-TRANSAC
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SL_P01_T01_EXCESS_BENEFIT_TRANSAC <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SL-P01-T01-EXCESS-BENEFIT-TRANSAC' ]]
v.map <- get_var_map( 'SL-P01-T01-EXCESS-BENEFIT-TRANSAC' )
df <- get_table_v2( doc, table.name='SL-P01-T01-EXCESS-BENEFIT-TRANSAC', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

