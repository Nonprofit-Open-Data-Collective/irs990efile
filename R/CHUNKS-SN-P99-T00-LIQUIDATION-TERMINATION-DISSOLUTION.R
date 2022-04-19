#' @title 
#'   Build table SN-P99-T00-LIQUIDATION-TERMINATION-DISSOLUTION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SN_P99_T00_LIQUIDATION_TERMINATION_DISSOLUTION <- function( doc, url )
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


## VARIABLE NAME:  SN_99_ORG_DETERMIN_LETTER_X
## DESCRIPTION:  Did the organization request or receive a determination letter from EO Determinations that the organization's exempt status was terminated? (see SN-FORM-VERSION-2009-PART-01)
## LOCATION:  SCHED-N-PART-99-LINE-04A
## TABLE:  SN-P99-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/DeterminationLetter'
V2 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/DeterminationLetter'
V_ORG_DETERMIN_LETTER_X <- paste( V1, V2 , sep='|' )
SN_99_ORG_DETERMIN_LETTER_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DETERMIN_LETTER_X ) )
if( length( SN_99_ORG_DETERMIN_LETTER_X ) > 1 )
{ 
  create_record( varname=SN_99_ORG_DETERMIN_LETTER_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_99_ORG_DETERMIN_LETTER_X <-  paste0( '{', SN_99_ORG_DETERMIN_LETTER_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_99_ORG_DATE_LETTER
## DESCRIPTION:  Date of letter (see SN-FORM-VERSION-2009-PART-01)
## LOCATION:  SCHED-N-PART-99-LINE-04B
## TABLE:  SN-P99-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/DateOfLetter'
V2 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/DateOfLetter'
V_ORG_DATE_LETTER <- paste( V1, V2 , sep='|' )
SN_99_ORG_DATE_LETTER <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DATE_LETTER ) )
if( length( SN_99_ORG_DATE_LETTER ) > 1 )
{ 
  create_record( varname=SN_99_ORG_DATE_LETTER, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_99_ORG_DATE_LETTER <-  paste0( '{', SN_99_ORG_DATE_LETTER, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SN_99_ORG_DETERMIN_LETTER_X,SN_99_ORG_DATE_LETTER)
df <- as.data.frame( var.list )


return( df )


}


