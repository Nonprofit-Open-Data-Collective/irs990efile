#' @title 
#'   Build table SD-P09-T00-OTH-ASSETS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P09_T00_OTH_ASSETS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_09_OTH_ASSET_BV_TOT
## DESCRIPTION:  Total book value
## LOCATION:  SCHED-D-PART-09-COL-B-TOT
## TABLE:  SD-P09-T00-OTH-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIX/TotalBookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalBookValueOtherAssets'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalBookValueOtherAssetsAmt'
V_OTH_ASSET_BV_TOT <- paste( V1, V2, V3 , sep='|' )
SD_09_OTH_ASSET_BV_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_ASSET_BV_TOT ) )
if( length( SD_09_OTH_ASSET_BV_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SD_09_OTH_ASSET_BV_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_09_OTH_ASSET_BV_TOT <-  paste0( '{', SD_09_OTH_ASSET_BV_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_09_OTH_ASSET_BV_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


