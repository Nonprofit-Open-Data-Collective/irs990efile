#' @title 
#'   Build table SN-P01-T01-LIQUIDATION-TERMINATION-DISSOLUTION
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SN_P01_T01_LIQUIDATION_TERMINATION_DISSOLUTION <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SN-P01-T01-LIQUIDATION-TERMINATION-DISSOLUTION' ]]
v.map <- get_var_map( 'SN-P01-T01-LIQUIDATION-TERMINATION-DISSOLUTION' )
df <- get_table_v2( doc, table.name='SN-P01-T01-LIQUIDATION-TERMINATION-DISSOLUTION', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

