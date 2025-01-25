#' @title 
#'   Build table SA-P01-T01-PUBLIC-CHARITY-STATUS
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SA_P01_T01_PUBLIC_CHARITY_STATUS <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SA-P01-T01-PUBLIC-CHARITY-STATUS' ]]
v.map <- get_var_map( 'SA-P01-T01-PUBLIC-CHARITY-STATUS' )
df <- get_table_v2( doc, table.name='SA-P01-T01-PUBLIC-CHARITY-STATUS', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

