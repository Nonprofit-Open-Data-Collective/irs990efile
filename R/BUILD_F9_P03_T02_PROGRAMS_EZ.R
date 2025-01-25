#' @title 
#'   Build table F9-P03-T02-PROGRAMS-EZ
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_F9_P03_T02_PROGRAMS_EZ <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'F9-P03-T02-PROGRAMS-EZ' ]]
v.map <- get_var_map( 'F9-P03-T02-PROGRAMS-EZ' )
df <- get_table_v2( doc, table.name='F9-P03-T02-PROGRAMS-EZ', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

