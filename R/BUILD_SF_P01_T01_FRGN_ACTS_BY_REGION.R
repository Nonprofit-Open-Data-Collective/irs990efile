#' @title 
#'   Build table SF-P01-T01-FRGN-ACTS-BY-REGION
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SF_P01_T01_FRGN_ACTS_BY_REGION <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SF-P01-T01-FRGN-ACTS-BY-REGION' ]]
v.map <- get_var_map( 'SF-P01-T01-FRGN-ACTS-BY-REGION' )
df <- get_table_v2( doc, table.name='SF-P01-T01-FRGN-ACTS-BY-REGION', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

