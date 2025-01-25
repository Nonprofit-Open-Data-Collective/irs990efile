#' @title 
#'   Build table SG-P01-T01-FUNDRAISERS-INFO
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SG_P01_T01_FUNDRAISERS_INFO <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SG-P01-T01-FUNDRAISERS-INFO' ]]
v.map <- get_var_map( 'SG-P01-T01-FUNDRAISERS-INFO' )
df <- get_table_v2( doc, table.name='SG-P01-T01-FUNDRAISERS-INFO', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

