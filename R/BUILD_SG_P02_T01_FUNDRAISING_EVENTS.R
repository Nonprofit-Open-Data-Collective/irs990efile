#' @title 
#'   Build table SG-P02-T01-FUNDRAISING-EVENTS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SG_P02_T01_FUNDRAISING_EVENTS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SG-P02-T01-FUNDRAISING-EVENTS' ]]
v.map <- get_var_map( 'SG-P02-T01-FUNDRAISING-EVENTS' )
df <- get_table_v2( doc, table.name='SG-P02-T01-FUNDRAISING-EVENTS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

