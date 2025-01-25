#' @title 
#'   Build table F9-P01-T00-SUMMARY-EZ
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P01_T00_SUMMARY_EZ <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_01_EXP_FEE_OTH_PAY_KONTR
## DESCRIPTION:  Professional fees and other payments to independent contractors
## LOCATION:  F990-EZ-PART-01-LINE-13
## TABLE:  F9-P01-T00-SUMMARY-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/FeesAndOtherPymtToIndCntrctAmt'
V2 <- '//Return/ReturnData/IRS990EZ/FeesAndOthPymtToIndContracters'
V3 <- '//Return/ReturnData/IRS990EZ/FeesAndOthPymtToIndContractors'
V_EXP_FEE_OTH_PAY_KONTR <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_FEE_OTH_PAY_KONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_OTH_PAY_KONTR ) )
if( length( F9_01_EXP_FEE_OTH_PAY_KONTR ) > 1 )
{ 
  create_record( varname=F9_01_EXP_FEE_OTH_PAY_KONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_01_EXP_FEE_OTH_PAY_KONTR <-  paste0( '{', F9_01_EXP_FEE_OTH_PAY_KONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_01_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part I
## LOCATION:  F990-EZ-PART-01-LINE-00
## TABLE:  F9-P01-T00-SUMMARY-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartI'
V2 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_01_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_01_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_01_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_01_INFO_SCHED_O_X <-  paste0( '{', F9_01_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_01_EXP_FEE_OTH_PAY_KONTR,F9_01_INFO_SCHED_O_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


