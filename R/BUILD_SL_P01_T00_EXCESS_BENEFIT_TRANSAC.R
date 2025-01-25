#' @title 
#'   Build table SL-P01-T00-EXCESS-BENEFIT-TRANSAC
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SL_P01_T00_EXCESS_BENEFIT_TRANSAC <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SL_01_TRANSAC_AMT_TAX_IMPOSED
## DESCRIPTION:  Amount of tax imposed
## LOCATION:  SCHED-L-PART-01-LINE-02
## TABLE:  SL-P01-T00-EXCESS-BENEFIT-TRANSAC
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleL/AmountOfTaxImposed'
V2 <- '//Return/ReturnData/IRS990ScheduleL/Form990ScheduleLPartI/AmountOfTaxImposed'
V3 <- '//Return/ReturnData/IRS990ScheduleL/TaxImposedAmt'
V_TRANSAC_AMT_TAX_IMPOSED <- paste( V1, V2, V3 , sep='|' )
SL_01_TRANSAC_AMT_TAX_IMPOSED <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_AMT_TAX_IMPOSED ) )
if( length( SL_01_TRANSAC_AMT_TAX_IMPOSED ) > 1 )
{ 
  create_record( varname=SL_01_TRANSAC_AMT_TAX_IMPOSED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SL_01_TRANSAC_AMT_TAX_IMPOSED <-  paste0( '{', SL_01_TRANSAC_AMT_TAX_IMPOSED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SL_01_TRANSAC_AMT_TAX_REIMBURSED
## DESCRIPTION:  Amount of tax reimbursed
## LOCATION:  SCHED-L-PART-01-LINE-03
## TABLE:  SL-P01-T00-EXCESS-BENEFIT-TRANSAC
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleL/AmountOfTaxReimbursed'
V2 <- '//Return/ReturnData/IRS990ScheduleL/Form990ScheduleLPartI/AmountOfTaxReimbursed'
V3 <- '//Return/ReturnData/IRS990ScheduleL/TaxReimbursedAmt'
V_TRANSAC_AMT_TAX_REIMBURSED <- paste( V1, V2, V3 , sep='|' )
SL_01_TRANSAC_AMT_TAX_REIMBURSED <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_AMT_TAX_REIMBURSED ) )
if( length( SL_01_TRANSAC_AMT_TAX_REIMBURSED ) > 1 )
{ 
  create_record( varname=SL_01_TRANSAC_AMT_TAX_REIMBURSED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SL_01_TRANSAC_AMT_TAX_REIMBURSED <-  paste0( '{', SL_01_TRANSAC_AMT_TAX_REIMBURSED, '}', collapse=';' ) 
} 




var.list <- 
namedList(SL_01_TRANSAC_AMT_TAX_IMPOSED,SL_01_TRANSAC_AMT_TAX_REIMBURSED)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


