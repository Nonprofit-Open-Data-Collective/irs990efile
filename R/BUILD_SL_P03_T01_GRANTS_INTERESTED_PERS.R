#' @title 
#'   Build table SL-P03-T01-GRANTS-INTERESTED-PERS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SL_P03_T01_GRANTS_INTERESTED_PERS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SL-P03-T01-GRANTS-INTERESTED-PERS' ]]
v.map <- get_var_map( 'SL-P03-T01-GRANTS-INTERESTED-PERS' )
df <- get_table_v2( doc, table.name='SL-P03-T01-GRANTS-INTERESTED-PERS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

