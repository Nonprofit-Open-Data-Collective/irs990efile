#' @title 
#'   Build table SK-P04-T01-BOND-ARBITRAGE
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SK_P04_T01_BOND_ARBITRAGE <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SK-P04-T01-BOND-ARBITRAGE' ]]
v.map <- get_var_map( 'SK-P04-T01-BOND-ARBITRAGE' )
df <- get_table_v2( doc, table.name='SK-P04-T01-BOND-ARBITRAGE', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

