#' @title 
#'   Build table F9-P04-T00-REQUIRED-SCHEDULES-EZ
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P04_T00_REQUIRED_SCHEDULES_EZ <- function( doc, url )
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


## VARIABLE NAME:  F9_04_LOAN_DTK_AMT
## DESCRIPTION:  Did the organization file Form 1120-POL for this year?
## LOCATION:  F990-EZ-PART-05-LINE-38B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LoansToFromOfficers'
V2 <- '//Return/ReturnData/IRS990EZ/LoansToFromOfficersAmt'
V_LOAN_DTK_AMT <- paste( V1, V2 , sep='|' )
F9_04_LOAN_DTK_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOAN_DTK_AMT ) )
if( length( F9_04_LOAN_DTK_AMT ) > 1 )
{ 
  create_record( varname=F9_04_LOAN_DTK_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_LOAN_DTK_AMT <-  paste0( '{', F9_04_LOAN_DTK_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_FRGN_OFFICE_CNTR
## DESCRIPTION:  Name of foreign country
## LOCATION:  F990-EZ-PART-05-LINE-42C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES-EZ
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ForeignOfficeCountry'
V2 <- '//Return/ReturnData/IRS990EZ/ForeignOfficeCountryCd'
V_FRGN_OFFICE_CNTR <- paste( V1, V2 , sep='|' )
F9_04_FRGN_OFFICE_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_OFFICE_CNTR ) )
if( length( F9_04_FRGN_OFFICE_CNTR ) > 1 )
{ 
  create_record( varname=F9_04_FRGN_OFFICE_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_FRGN_OFFICE_CNTR <-  paste0( '{', F9_04_FRGN_OFFICE_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_RLTD_ORG_527_X
## DESCRIPTION:  If "Yes;" was the related organization(s) a section 527 organization?
## LOCATION:  F990-EZ-PART-06-LINE-49B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/RelatedOrgSect527OrgInd'
V2 <- '//Return/ReturnData/IRS990EZ/RelatedOrgSection527Org'
V_RLTD_ORG_527_X <- paste( V1, V2 , sep='|' )
F9_04_RLTD_ORG_527_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RLTD_ORG_527_X ) )
if( length( F9_04_RLTD_ORG_527_X ) > 1 )
{ 
  create_record( varname=F9_04_RLTD_ORG_527_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_RLTD_ORG_527_X <-  paste0( '{', F9_04_RLTD_ORG_527_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_04_LOAN_DTK_AMT,F9_04_FRGN_OFFICE_CNTR,F9_04_RLTD_ORG_527_X)
df <- as.data.frame( var.list )


return( df )


}


