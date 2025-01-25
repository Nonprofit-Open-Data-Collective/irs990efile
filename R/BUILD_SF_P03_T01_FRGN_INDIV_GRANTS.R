#' @title 
#'   Build table SF-P03-T01-FRGN-INDIV-GRANTS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SF_P03_T01_FRGN_INDIV_GRANTS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SF-P03-T01-FRGN-INDIV-GRANTS' ]]
v.map <- get_var_map( 'SF-P03-T01-FRGN-INDIV-GRANTS' )
df <- get_table_v2( doc, table.name='SF-P03-T01-FRGN-INDIV-GRANTS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

