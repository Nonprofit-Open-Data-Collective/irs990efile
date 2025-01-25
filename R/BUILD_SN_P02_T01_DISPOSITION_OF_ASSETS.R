#' @title 
#'   Build table SN-P02-T01-DISPOSITION-OF-ASSETS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SN_P02_T01_DISPOSITION_OF_ASSETS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SN-P02-T01-DISPOSITION-OF-ASSETS' ]]
v.map <- get_var_map( 'SN-P02-T01-DISPOSITION-OF-ASSETS' )
df <- get_table_v2( doc, table.name='SN-P02-T01-DISPOSITION-OF-ASSETS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

