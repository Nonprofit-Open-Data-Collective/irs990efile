#' @title 
#'   Build table SK-P02-T01-BOND-PROCEEDS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SK_P02_T01_BOND_PROCEEDS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SK-P02-T01-BOND-PROCEEDS' ]]
v.map <- get_var_map( 'SK-P02-T01-BOND-PROCEEDS' )
df <- get_table_v2( doc, table.name='SK-P02-T01-BOND-PROCEEDS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

