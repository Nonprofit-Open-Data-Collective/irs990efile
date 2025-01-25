#' @title 
#'   Build table F9-P08-T01-REVENUE-PROGRAMS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_F9_P08_T01_REVENUE_PROGRAMS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'F9-P08-T01-REVENUE-PROGRAMS' ]]
v.map <- get_var_map( 'F9-P08-T01-REVENUE-PROGRAMS' )
df <- get_table_v2( doc, table.name='F9-P08-T01-REVENUE-PROGRAMS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

