#' @title 
#'   Build table SD-P08-T01-INVESTMENTS-PROG-RLTD
#' 
#' @description 
#'   Generate a 1:M table for the relational database.
#' 
#' @export 
BUILD_SD_P08_T01_INVESTMENTS_PROG_RLTD <- function( doc, url ){ 

keys <- get_keys( doc, url )
dfk <- as.data.frame( keys )

table.headers <- TABLE.HEADERS[[ 'SD-P08-T01-INVESTMENTS-PROG-RLTD' ]]
v.map <- get_var_map( 'SD-P08-T01-INVESTMENTS-PROG-RLTD' )
df <- get_table_v2( doc, table.name='SD-P08-T01-INVESTMENTS-PROG-RLTD', table.headers  )
if( is.null(df) ){ return( NULL ) }
df <- re_name( df, v.map )

rdb.table <- data.frame( dfk, df )
return ( rdb.table )

}

