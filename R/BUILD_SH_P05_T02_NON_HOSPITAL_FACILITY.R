#' @title 
#'   Build table SH-P05-T02-NON-HOSPITAL-FACILITY
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SH_P05_T02_NON_HOSPITAL_FACILITY <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SH-P05-T02-NON-HOSPITAL-FACILITY' ]]
v.map <- get_var_map( 'SH-P05-T02-NON-HOSPITAL-FACILITY' )
df <- get_table_v2( doc, table.name='SH-P05-T02-NON-HOSPITAL-FACILITY', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

