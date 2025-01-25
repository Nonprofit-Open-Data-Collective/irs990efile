#' @title 
#'  Get Table Keys 
#' 
#' @description 
#'   Collect table IDs for relational datasets.
#' 
#' @export 
get_keys <- function( doc, url ){ 

####----------------------------------------------------
####     KEYS
####----------------------------------------------------


## OBJECT ID

OBJECTID <- get_object_id( url )


## URL

URL <- url


## RETURN VERSION

VERSION <- xml2::xml_attr( doc, attr='returnVersion' )


## VARIABLE NAME:  F9_00_RETURN_TIME_STAMP
## DESCRIPTION:  The date and time when the return was created
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnTs'
V2 <- '//Return/ReturnHeader/Timestamp'
TEMP_F9_00_RETURN_TIME_STAMP <- paste( V1, V2 , sep='|' )
RETURN_TIME_STAMP <- retrieve_xml( doc, TEMP_F9_00_RETURN_TIME_STAMP )



## VARIABLE NAME:  F9_00_RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_F9_00_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- retrieve_xml( doc, TEMP_F9_00_RETURN_TYPE )



## VARIABLE NAME:  F9_00_RETURN_AMENDED_X
## DESCRIPTION:  Inidcates this form is an amended return
## LOCATION:  F990-PC-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AmendedReturn'
V2 <- '//Return/ReturnData/IRS990/AmendedReturnInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/AmendedReturn'
V4 <- '//Return/ReturnData/IRS990EZ/AmendedReturn'
V5 <- '//Return/ReturnData/IRS990EZ/AmendedReturnInd'
TEMP_F9_00_RETURN_AMENDED_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
RETURN_AMENDED_X <- retrieve_xml( doc, TEMP_F9_00_RETURN_AMENDED_X )
RETURN_AMENDED_X <- standardize_boole(  RETURN_AMENDED_X ) 



## VARIABLE NAME:  F9_00_RETURN_GROUP_X
## DESCRIPTION:  Group return for affiliates?
## LOCATION:  F990-PC-PART-00-SECTION-HA
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/GroupReturnForAffiliates'
V2 <- '//Return/ReturnData/IRS990/GroupReturn'
V3 <- '//Return/ReturnData/IRS990/GroupReturnForAffiliates'
V4 <- '//Return/ReturnData/IRS990/GroupReturnForAffiliatesInd'
TEMP_F9_00_RETURN_GROUP_X <- paste( V1, V2, V3, V4 , sep='|' )
RETURN_GROUP_X <- retrieve_xml( doc, TEMP_F9_00_RETURN_GROUP_X )
RETURN_GROUP_X <- standardize_boole(  RETURN_GROUP_X ) 



## VARIABLE NAME:  F9_00_TAX_PERIOD_BEGIN_DATE
## DESCRIPTION:  Tax period begin date
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxPeriodBeginDate'
V2 <- '//Return/ReturnHeader/TaxPeriodBeginDt'
TEMP_F9_00_TAX_PERIOD_BEGIN_DATE <- paste( V1, V2 , sep='|' )
TAX_PERIOD_BEGIN_DATE <- retrieve_xml( doc, TEMP_F9_00_TAX_PERIOD_BEGIN_DATE )



## VARIABLE NAME:  F9_00_TAX_PERIOD_END_DATE
## DESCRIPTION:  Tax period end date
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxPeriodEndDate'
V2 <- '//Return/ReturnHeader/TaxPeriodEndDt'
TEMP_F9_00_TAX_PERIOD_END_DATE <- paste( V1, V2 , sep='|' )
TAX_PERIOD_END_DATE <- retrieve_xml( doc, TEMP_F9_00_TAX_PERIOD_END_DATE )



## VARIABLE NAME:  F9_00_ORG_NAME_L1
## DESCRIPTION:  Name of Filing Organization (line 1)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt'
V3 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine1'
TEMP_F9_00_ORG_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
ORG_NAME_L1 <- retrieve_xml( doc, TEMP_F9_00_ORG_NAME_L1 )



## VARIABLE NAME:  F9_00_ORG_NAME_L2
## DESCRIPTION:  Name of Filing Organization (line 2)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2Txt'
V3 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine2'
TEMP_F9_00_ORG_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
ORG_NAME_L2 <- retrieve_xml( doc, TEMP_F9_00_ORG_NAME_L2 )



## VARIABLE NAME:  F9_00_TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_F9_00_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- retrieve_xml( doc, TEMP_F9_00_TAX_YEAR )



## VARIABLE NAME:  F9_00_ORG_EIN
## DESCRIPTION:  Orgainization Employer Identification Number (EIN)
## LOCATION:  F990-PC-PART-00-SECTION-D
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

ORG_EIN <- retrieve_xml(  doc, '/Return/ReturnHeader/Filer/EIN' ) 



EIN2 <- format_ein( ORG_EIN )
DAYS <- as.Date(TAX_PERIOD_END_DATE) - as.Date(TAX_PERIOD_BEGIN_DATE)
RETURN_TAXPER_DAYS <- as.numeric(DAYS) + 1
RETURN_PARTIAL_X <- RETURN_TAXPER_DAYS < 360


var.list <- 
namedList(EIN2,OBJECTID,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_AMENDED_X,RETURN_GROUP_X,RETURN_PARTIAL_X,RETURN_TAXPER_DAYS,RETURN_TIME_STAMP,RETURN_TYPE,TAX_PERIOD_BEGIN_DATE,TAX_PERIOD_END_DATE,TAX_YEAR,URL,VERSION)
return( var.list )

}


