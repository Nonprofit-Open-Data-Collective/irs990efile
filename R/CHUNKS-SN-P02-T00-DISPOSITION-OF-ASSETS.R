#' @title 
#'   Build table SN-P02-T00-DISPOSITION-OF-ASSETS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SN_P02_T00_DISPOSITION_OF_ASSETS <- function( doc, url )
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


## VARIABLE NAME:  SN_02_ORG_DTK_DIR_SUCCESSOR_X
## DESCRIPTION:  Become a director or trustee of a successor or transferee organization?
## LOCATION:  SCHED-N-PART-02-LINE-02A
## TABLE:  SN-P02-T00-DISPOSITION-OF-ASSETS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/DirectorOfSuccessor2'
V2 <- '//Return/ReturnData/IRS990ScheduleN/DirectorOfSuccessor2Ind'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartII/DirectorOfSuccessor'
V_ORG_DTK_DIR_SUCCESSOR_X <- paste( V1, V2, V3 , sep='|' )
SN_02_ORG_DTK_DIR_SUCCESSOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_DIR_SUCCESSOR_X ) )
if( length( SN_02_ORG_DTK_DIR_SUCCESSOR_X ) > 1 )
{ 
  create_record( varname=SN_02_ORG_DTK_DIR_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_02_ORG_DTK_DIR_SUCCESSOR_X <-  paste0( '{', SN_02_ORG_DTK_DIR_SUCCESSOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_02_ORG_DTK_EMPL_SUCCESSOR_X
## DESCRIPTION:  Become an employee of; or independent contractor for; a successor or transferee organization?
## LOCATION:  SCHED-N-PART-02-LINE-02B
## TABLE:  SN-P02-T00-DISPOSITION-OF-ASSETS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/EmployeeOfSuccessor2'
V2 <- '//Return/ReturnData/IRS990ScheduleN/EmployeeOfSuccessor2Ind'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartII/EmployeeOfSuccessor'
V_ORG_DTK_EMPL_SUCCESSOR_X <- paste( V1, V2, V3 , sep='|' )
SN_02_ORG_DTK_EMPL_SUCCESSOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_EMPL_SUCCESSOR_X ) )
if( length( SN_02_ORG_DTK_EMPL_SUCCESSOR_X ) > 1 )
{ 
  create_record( varname=SN_02_ORG_DTK_EMPL_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_02_ORG_DTK_EMPL_SUCCESSOR_X <-  paste0( '{', SN_02_ORG_DTK_EMPL_SUCCESSOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_02_ORG_DTK_OWN_SUCCESSOR_X
## DESCRIPTION:  Become a direct or indirect owner of a successor or transferee organization?
## LOCATION:  SCHED-N-PART-02-LINE-02C
## TABLE:  SN-P02-T00-DISPOSITION-OF-ASSETS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartII/OwnerOfSuccessor'
V2 <- '//Return/ReturnData/IRS990ScheduleN/OwnerOfSuccessor2'
V3 <- '//Return/ReturnData/IRS990ScheduleN/OwnerOfSuccessor2Ind'
V_ORG_DTK_OWN_SUCCESSOR_X <- paste( V1, V2, V3 , sep='|' )
SN_02_ORG_DTK_OWN_SUCCESSOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_OWN_SUCCESSOR_X ) )
if( length( SN_02_ORG_DTK_OWN_SUCCESSOR_X ) > 1 )
{ 
  create_record( varname=SN_02_ORG_DTK_OWN_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_02_ORG_DTK_OWN_SUCCESSOR_X <-  paste0( '{', SN_02_ORG_DTK_OWN_SUCCESSOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_02_ORG_DTK_REC_COMP_X
## DESCRIPTION:  Receive; or become entitled to; compensation or other similar payments as a result of the organization's significant DISPOSITION-OF-ASSETS?
## LOCATION:  SCHED-N-PART-02-LINE-02D
## TABLE:  SN-P02-T00-DISPOSITION-OF-ASSETS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartII/ReceiveCompensation'
V2 <- '//Return/ReturnData/IRS990ScheduleN/ReceiveCompensation2'
V3 <- '//Return/ReturnData/IRS990ScheduleN/ReceiveCompensation2Ind'
V_ORG_DTK_REC_COMP_X <- paste( V1, V2, V3 , sep='|' )
SN_02_ORG_DTK_REC_COMP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_REC_COMP_X ) )
if( length( SN_02_ORG_DTK_REC_COMP_X ) > 1 )
{ 
  create_record( varname=SN_02_ORG_DTK_REC_COMP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_02_ORG_DTK_REC_COMP_X <-  paste0( '{', SN_02_ORG_DTK_REC_COMP_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SN_02_ORG_DTK_DIR_SUCCESSOR_X,SN_02_ORG_DTK_EMPL_SUCCESSOR_X,SN_02_ORG_DTK_OWN_SUCCESSOR_X,SN_02_ORG_DTK_REC_COMP_X)
df <- as.data.frame( var.list )


return( df )


}


