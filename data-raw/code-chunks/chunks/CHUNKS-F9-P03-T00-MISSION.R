#' @title 
#'   Build table F9-P03-T00-MISSION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P03_T00_MISSION <- function( doc, url )
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


## VARIABLE NAME:  F9_03_ORG_MISSION_PURPOSE
## DESCRIPTION:  Organization mission
## LOCATION:  F990-EZ-PART-03-LINE-00
## TABLE:  F9-P03-T00-MISSION
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/PrimaryExemptPurpose'
V2 <- '//Return/ReturnData/IRS990EZ/PrimaryExemptPurposeTxt'
V3 <- '//Return/ReturnData/IRS990EZ/MissionDesc'
V4 <- '//Return/ReturnData/IRS990EZ/MissionDescription'
V5 <- '//Return/ReturnData/IRS990/MissionDescription'
V6 <- '//Return/ReturnData/IRS990/MissionDesc'
V7 <- '//Return/ReturnData/IRS990/Form990PartIII/MissionDescription'
V8 <- '//Return/ReturnData/IRS990/PrimaryExemptPurpose'
V_ORG_MISSION_PURPOSE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_03_ORG_MISSION_PURPOSE <- xml_text( xml_find_all( doc, V_ORG_MISSION_PURPOSE ) )




## VARIABLE NAME:  F9_03_PROG_NEW_X
## DESCRIPTION:  
## LOCATION:  F990-EZ-PART-05-LINE-33
## TABLE:  F9-P03-T00-MISSION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ActivitiesNotPreviouslyRptInd'
V2 <- '//Return/ReturnData/IRS990/SignificantNewProgramServices'
V3 <- '//Return/ReturnData/IRS990/SignificantNewProgramSrvcInd'
V4 <- '//Return/ReturnData/IRS990/Form990PartIII/SignificantNewProgramServices'
V_PROG_NEW_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_03_PROG_NEW_X <- xml_text( xml_find_all( doc, V_PROG_NEW_X ) )




## VARIABLE NAME:  F9_03_PROG_CHANGE_X
## DESCRIPTION:  Significant changed programs?
## LOCATION:  F990-PC-PART-03-LINE-03
## TABLE:  F9-P03-T00-MISSION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/SignificantChange'
V2 <- '//Return/ReturnData/IRS990/SignificantChangeInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIII/SignificantChange'
V_PROG_CHANGE_X <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_CHANGE_X <- xml_text( xml_find_all( doc, V_PROG_CHANGE_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_03_ORG_MISSION_PURPOSE,F9_03_PROG_NEW_X,F9_03_PROG_CHANGE_X)
df <- as.data.frame( var.list )


return( df )


}


