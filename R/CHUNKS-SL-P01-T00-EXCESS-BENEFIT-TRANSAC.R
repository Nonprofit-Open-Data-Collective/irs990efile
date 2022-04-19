#' @title 
#'   Build table SL-P01-T00-EXCESS-BENEFIT-TRANSAC
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SL_P01_T00_EXCESS_BENEFIT_TRANSAC <- function( doc, url )
{


####----------------------------------------------------
####     KEYS
####----------------------------------------------------


## OBJECT ID

OBJECTID <- get_object_id( url )


## URL

URL <- url


## RETURN VERSION

RETURN_VERSION <- xml2::xml_attr( doc, attr='returnVersion' )


## VARIABLE NAME:  ORG_EIN
## DESCRIPTION:  Orgainization Employer Identification Number (EIN)
## LOCATION:  F990-PC-PART-00-SECTION-D
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

ORG_EIN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



## VARIABLE NAME:  ORG_NAME_L1
## DESCRIPTION:  Name of Filing Organization (line 1)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine1'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1'
V3 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt'
TEMP_ORG_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
ORG_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



## VARIABLE NAME:  ORG_NAME_L2
## DESCRIPTION:  Name of Filing Organization (line 2)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine2'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2'
V3 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2Txt'
TEMP_ORG_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
ORG_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_TAX_YEAR ) )



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
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SL_01_TRANSAC_AMT_TAX_IMPOSED,SL_01_TRANSAC_AMT_TAX_REIMBURSED)
df <- as.data.frame( var.list )


return( df )


}


