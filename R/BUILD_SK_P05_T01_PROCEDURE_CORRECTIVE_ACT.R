#' @title 
#'   Build table SK-P05-T01-PROCEDURE-CORRECTIVE-ACT
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SK_P05_T01_PROCEDURE_CORRECTIVE_ACT <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SK-P05-T01-PROCEDURE-CORRECTIVE-ACT' ]]
v.map <- get_var_map( 'SK-P05-T01-PROCEDURE-CORRECTIVE-ACT' )
df <- get_table_v2( doc, table.name='SK-P05-T01-PROCEDURE-CORRECTIVE-ACT', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

