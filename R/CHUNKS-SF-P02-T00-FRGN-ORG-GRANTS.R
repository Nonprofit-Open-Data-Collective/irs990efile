#' @title 
#'   Build table SF-P02-T00-FRGN-ORG-GRANTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P02_T00_FRGN_ORG_GRANTS <- function( doc, url )
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


## VARIABLE NAME:  SF_02_FRGN_ORG_GRANT_501C3_TOT
## DESCRIPTION:  Total number of organizations with some 501(c)(3) equivalency outside of the US given grants (recognized as charities by the foreign country, recognized as tax-exempt by the IRS, or an equivalency letter has been been provided)
## LOCATION:  SCHED-F-PART-02-LINE-02
## TABLE:  SF-P02-T00-FRGN-ORG-GRANTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartII/TotalNumberOf501c3Orgs'
V2 <- '//Return/ReturnData/IRS990ScheduleF/Total501c3OrgCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalNumberOf501c3Orgs'
V_FRGN_ORG_GRANT_501C3_TOT <- paste( V1, V2, V3 , sep='|' )
SF_02_FRGN_ORG_GRANT_501C3_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_ORG_GRANT_501C3_TOT ) )
if( length( SF_02_FRGN_ORG_GRANT_501C3_TOT ) > 1 )
{ 
  create_record( varname=SF_02_FRGN_ORG_GRANT_501C3_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_02_FRGN_ORG_GRANT_501C3_TOT <-  paste0( '{', SF_02_FRGN_ORG_GRANT_501C3_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT
## DESCRIPTION:  Total number of organizations or entities granted to outside of the US that lack some 501(c)(3) equivalency (not recognized as charities by the foreign country, not recognized as tax-exempt by the IRS, and have not provided an equivalency letter)
## LOCATION:  SCHED-F-PART-02-LINE-03
## TABLE:  SF-P02-T00-FRGN-ORG-GRANTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartII/TotalNumberOfOtherOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TotalNumberOfOtherOrgs'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalOtherOrgCnt'
V_FRGN_ORG_GRANT_OTH_ORG_TOT <- paste( V1, V2, V3 , sep='|' )
SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_ORG_GRANT_OTH_ORG_TOT ) )
if( length( SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT ) > 1 )
{ 
  create_record( varname=SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT <-  paste0( '{', SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SF_02_FRGN_ORG_GRANT_501C3_TOT,SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT)
df <- as.data.frame( var.list )


return( df )


}


