#' @title 
#'   Build table SF-P04-T00-FRGN-INTERESTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P04_T00_FRGN_INTERESTS <- function( doc, url )
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

ORG_EIN <- xml_text( xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



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
ORG_NAME_L1 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



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
ORG_NAME_L2 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml_text( xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml_text( xml_find_all( doc, TEMP_TAX_YEAR ) )



######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SF_04_FRGN_CORP_TRANSFEROR_X
## DESCRIPTION:  Was the organization a U.S. transferor of property to a foreign corporation during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-01
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/TransferToForeignCorp'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TransferToForeignCorpInd'
V_FRGN_CORP_TRANSFEROR_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_CORP_TRANSFEROR_X <- xml_text( xml_find_all( doc, V_FRGN_CORP_TRANSFEROR_X ) )




## VARIABLE NAME:  SF_04_FRGN_TRUST_INT_X
## DESCRIPTION:  Did the organization have an interest in a foreign trust during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-02
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/InterestInForeignTrust'
V2 <- '//Return/ReturnData/IRS990ScheduleF/InterestInForeignTrustInd'
V_FRGN_TRUST_INT_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_TRUST_INT_X <- xml_text( xml_find_all( doc, V_FRGN_TRUST_INT_X ) )




## VARIABLE NAME:  SF_04_FRGN_CORP_OWNERSHIP_INT_X
## DESCRIPTION:  Did the organization have an ownership interest in a foreign corporation during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-03
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ForeignCorpOwnershipInd'
V2 <- '//Return/ReturnData/IRS990ScheduleF/OwnForeignCorp'
V_FRGN_CORP_OWNERSHIP_INT_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_CORP_OWNERSHIP_INT_X <- xml_text( xml_find_all( doc, V_FRGN_CORP_OWNERSHIP_INT_X ) )




## VARIABLE NAME:  SF_04_FRGN_FUND_SHAREHOLDER_X
## DESCRIPTION:  Was the organization a direct or indirect shareholder of a passive foreign investment company or a qualified electing fund during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-04
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/PassiveForeignInvestCo'
V2 <- '//Return/ReturnData/IRS990ScheduleF/PassiveForeignInvestmestCoInd'
V_FRGN_FUND_SHAREHOLDER_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_FUND_SHAREHOLDER_X <- xml_text( xml_find_all( doc, V_FRGN_FUND_SHAREHOLDER_X ) )




## VARIABLE NAME:  SF_04_FRGN_PTR_OWNERSHIP_INT_X
## DESCRIPTION:  Did the organization have an ownership interest in a foreign partnership during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-05
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ForeignPartnership'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ForeignPartnershipInd'
V_FRGN_PTR_OWNERSHIP_INT_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_PTR_OWNERSHIP_INT_X <- xml_text( xml_find_all( doc, V_FRGN_PTR_OWNERSHIP_INT_X ) )




## VARIABLE NAME:  SF_04_BOYCOTTING_CNTR_ACT_X
## DESCRIPTION:  Did the organization have any operations in or related to any boycotting countries during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-06
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/BoycottCountries'
V2 <- '//Return/ReturnData/IRS990ScheduleF/BoycottCountriesInd'
V_BOYCOTTING_CNTR_ACT_X <- paste( V1, V2 , sep='|' )
SF_04_BOYCOTTING_CNTR_ACT_X <- xml_text( xml_find_all( doc, V_BOYCOTTING_CNTR_ACT_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SF_04_FRGN_CORP_TRANSFEROR_X,SF_04_FRGN_TRUST_INT_X,SF_04_FRGN_CORP_OWNERSHIP_INT_X,SF_04_FRGN_FUND_SHAREHOLDER_X,SF_04_FRGN_PTR_OWNERSHIP_INT_X,SF_04_BOYCOTTING_CNTR_ACT_X)
df <- as.data.frame( var.list )


return( df )


}


