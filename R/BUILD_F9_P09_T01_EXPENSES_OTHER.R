#' @title 
#'   Build table F9-P09-T01-EXPENSES-OTHER
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_F9_P09_T01_EXPENSES_OTHER <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'F9-P09-T01-EXPENSES-OTHER' ]]
v.map <- get_var_map( 'F9-P09-T01-EXPENSES-OTHER' )
df <- get_table_v2( doc, table.name='F9-P09-T01-EXPENSES-OTHER', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

