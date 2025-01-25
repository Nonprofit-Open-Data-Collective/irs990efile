#' @title 
#'   Build table SH-P04-T01-COMPANY-JOINT-VENTURES
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SH_P04_T01_COMPANY_JOINT_VENTURES <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SH-P04-T01-COMPANY-JOINT-VENTURES' ]]
v.map <- get_var_map( 'SH-P04-T01-COMPANY-JOINT-VENTURES' )
df <- get_table_v2( doc, table.name='SH-P04-T01-COMPANY-JOINT-VENTURES', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

