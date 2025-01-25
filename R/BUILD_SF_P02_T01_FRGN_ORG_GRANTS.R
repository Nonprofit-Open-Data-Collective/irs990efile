#' @title 
#'   Build table SF-P02-T01-FRGN-ORG-GRANTS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SF_P02_T01_FRGN_ORG_GRANTS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SF-P02-T01-FRGN-ORG-GRANTS' ]]
v.map <- get_var_map( 'SF-P02-T01-FRGN-ORG-GRANTS' )
df <- get_table_v2( doc, table.name='SF-P02-T01-FRGN-ORG-GRANTS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

