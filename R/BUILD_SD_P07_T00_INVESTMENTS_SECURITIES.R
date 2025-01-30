#' @title 
#'   Build table SD-P07-T00-INVESTMENTS-SECURITIES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P07_T00_INVESTMENTS_SECURITIES <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_07_INVEST_SEC_TOT_BV
## DESCRIPTION:  Total of book value
## LOCATION:  SCHED-D-PART-07-LINE-99-COL-B
## TABLE:  SD-P07-T00-INVESTMENTS-SECURITIES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVII/TotalOfBookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalBookValueSecuritiesAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalOfBookValueSecurities'
V_INVEST_SEC_TOT_BV <- paste( V1, V2, V3 , sep='|' )
SD_07_INVEST_SEC_TOT_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_INVEST_SEC_TOT_BV ) )
if( length( SD_07_INVEST_SEC_TOT_BV ) > 1 )
{ 
  log_collapsed_record( varname=SD_07_INVEST_SEC_TOT_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_07_INVEST_SEC_TOT_BV <-  paste0( '{', SD_07_INVEST_SEC_TOT_BV, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_07_INVEST_SEC_TOT_BV)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


