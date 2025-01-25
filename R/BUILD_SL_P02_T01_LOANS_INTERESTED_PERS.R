#' @title 
#'   Build table SL-P02-T01-LOANS-INTERESTED-PERS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SL_P02_T01_LOANS_INTERESTED_PERS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SL-P02-T01-LOANS-INTERESTED-PERS' ]]
v.map <- get_var_map( 'SL-P02-T01-LOANS-INTERESTED-PERS' )
df <- get_table_v2( doc, table.name='SL-P02-T01-LOANS-INTERESTED-PERS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

