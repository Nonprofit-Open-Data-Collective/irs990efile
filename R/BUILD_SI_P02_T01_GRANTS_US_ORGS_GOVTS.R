#' @title 
#'   Build table SI-P02-T01-GRANTS-US-ORGS-GOVTS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SI_P02_T01_GRANTS_US_ORGS_GOVTS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SI-P02-T01-GRANTS-US-ORGS-GOVTS' ]]
v.map <- get_var_map( 'SI-P02-T01-GRANTS-US-ORGS-GOVTS' )
df <- get_table_v2( doc, table.name='SI-P02-T01-GRANTS-US-ORGS-GOVTS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

