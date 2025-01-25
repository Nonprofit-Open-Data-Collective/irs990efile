#' @title 
#'   Build table SI-P03-T01-GRANTS-US-INDIV
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SI_P03_T01_GRANTS_US_INDIV <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SI-P03-T01-GRANTS-US-INDIV' ]]
v.map <- get_var_map( 'SI-P03-T01-GRANTS-US-INDIV' )
df <- get_table_v2( doc, table.name='SI-P03-T01-GRANTS-US-INDIV', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

