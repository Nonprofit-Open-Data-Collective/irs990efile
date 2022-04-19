#' @title 
#'   Build table SF-P01-T00-FRGN-ACTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P01_T00_FRGN_ACTS <- function( doc, url )
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


## VARIABLE NAME:  SF_01_GRANT_RECORD_MAINT_X
## DESCRIPTION:  For grantmakers, does the organizationmaintain records on their grants and processes?
## LOCATION:  SCHED-F-PART-01-LINE-01
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartI/NoRecipientOver5K'
V2 <- '//Return/ReturnData/IRS990ScheduleF/GrantRecordsMaintained'
V3 <- '//Return/ReturnData/IRS990ScheduleF/GrantRecordsMaintainedInd'
V_GRANT_RECORD_MAINT_X <- paste( V1, V2, V3 , sep='|' )
SF_01_GRANT_RECORD_MAINT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_RECORD_MAINT_X ) )
if( length( SF_01_GRANT_RECORD_MAINT_X ) > 1 )
{ 
  create_record( varname=SF_01_GRANT_RECORD_MAINT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_GRANT_RECORD_MAINT_X <-  paste0( '{', SF_01_GRANT_RECORD_MAINT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_OFFICE_SUBTOT
## DESCRIPTION:  Subtotal number of offices handling activities outside the US
## LOCATION:  SCHED-F-PART-01-LINE-03A-COL-B
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/SubtotalNumberOfOffices'
V2 <- '//Return/ReturnData/IRS990ScheduleF/SubtotalOfficesCnt'
V_FRGN_REG_NUM_OFFICE_SUBTOT <- paste( V1, V2 , sep='|' )
SF_01_FRGN_REG_NUM_OFFICE_SUBTOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_OFFICE_SUBTOT ) )
if( length( SF_01_FRGN_REG_NUM_OFFICE_SUBTOT ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_OFFICE_SUBTOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_OFFICE_SUBTOT <-  paste0( '{', SF_01_FRGN_REG_NUM_OFFICE_SUBTOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_EMPL_SUBTOT
## DESCRIPTION:  Subtotal number of employees working on region activities outside the US
## LOCATION:  SCHED-F-PART-01-LINE-03A-COL-C
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/SubtotalEmployeesCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleF/SubtotalNumberOfEmployees'
V_FRGN_REG_NUM_EMPL_SUBTOT <- paste( V1, V2 , sep='|' )
SF_01_FRGN_REG_NUM_EMPL_SUBTOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_EMPL_SUBTOT ) )
if( length( SF_01_FRGN_REG_NUM_EMPL_SUBTOT ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_EMPL_SUBTOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_EMPL_SUBTOT <-  paste0( '{', SF_01_FRGN_REG_NUM_EMPL_SUBTOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_TOT_EXP_SUBTOT
## DESCRIPTION:  Subtotal expenditures on activities outside the US
## LOCATION:  SCHED-F-PART-01-LINE-03A-COL-F
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/SubtotalAmountSpent'
V2 <- '//Return/ReturnData/IRS990ScheduleF/SubtotalSpentAmt'
V_FRGN_REG_TOT_EXP_SUBTOT <- paste( V1, V2 , sep='|' )
SF_01_FRGN_REG_TOT_EXP_SUBTOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_TOT_EXP_SUBTOT ) )
if( length( SF_01_FRGN_REG_TOT_EXP_SUBTOT ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_TOT_EXP_SUBTOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_TOT_EXP_SUBTOT <-  paste0( '{', SF_01_FRGN_REG_TOT_EXP_SUBTOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_OFFICE_CONTIN
## DESCRIPTION:  Total offices from continuation sheetson region activities outside the US (Part I)
## LOCATION:  SCHED-F-PART-01-LINE-03B-COL-B
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ContinutationTotalOfficeCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ContNumberOfOffices'
V_FRGN_REG_NUM_OFFICE_CONTIN <- paste( V1, V2 , sep='|' )
SF_01_FRGN_REG_NUM_OFFICE_CONTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_OFFICE_CONTIN ) )
if( length( SF_01_FRGN_REG_NUM_OFFICE_CONTIN ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_OFFICE_CONTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_OFFICE_CONTIN <-  paste0( '{', SF_01_FRGN_REG_NUM_OFFICE_CONTIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_EMPL_CONTIN
## DESCRIPTION:  Total number of employees from continuation sheets working on region activities outside the US (Part I)
## LOCATION:  SCHED-F-PART-01-LINE-03B-COL-C
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ContinutationTotalEmployeeCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ContNumberOfEmployees'
V_FRGN_REG_NUM_EMPL_CONTIN <- paste( V1, V2 , sep='|' )
SF_01_FRGN_REG_NUM_EMPL_CONTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_EMPL_CONTIN ) )
if( length( SF_01_FRGN_REG_NUM_EMPL_CONTIN ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_EMPL_CONTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_EMPL_CONTIN <-  paste0( '{', SF_01_FRGN_REG_NUM_EMPL_CONTIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_TOT_EXP_CONTIN
## DESCRIPTION:  Total expenditures from continuation sheets on region activities outside the US (Part I)
## LOCATION:  SCHED-F-PART-01-LINE-03B-COL-F
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ContAmountSpent'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ContinuationSpentAmt'
V_FRGN_REG_TOT_EXP_CONTIN <- paste( V1, V2 , sep='|' )
SF_01_FRGN_REG_TOT_EXP_CONTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_TOT_EXP_CONTIN ) )
if( length( SF_01_FRGN_REG_TOT_EXP_CONTIN ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_TOT_EXP_CONTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_TOT_EXP_CONTIN <-  paste0( '{', SF_01_FRGN_REG_TOT_EXP_CONTIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_OFFICE_TOT
## DESCRIPTION:  Total number of offices outside the US
## LOCATION:  SCHED-F-PART-01-LINE-03C-COL-B
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartI/TotalNumberOfOffices'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TotalNumberOfOffices'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalOfficeCnt'
V_FRGN_REG_NUM_OFFICE_TOT <- paste( V1, V2, V3 , sep='|' )
SF_01_FRGN_REG_NUM_OFFICE_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_OFFICE_TOT ) )
if( length( SF_01_FRGN_REG_NUM_OFFICE_TOT ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_OFFICE_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_OFFICE_TOT <-  paste0( '{', SF_01_FRGN_REG_NUM_OFFICE_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_EMPL_TOT
## DESCRIPTION:  Total employees working on region activities outside the US
## LOCATION:  SCHED-F-PART-01-LINE-03C-COL-C
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartI/TotalNumberOfEmployees'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TotalEmployeeCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalNumberOfEmployees'
V_FRGN_REG_NUM_EMPL_TOT <- paste( V1, V2, V3 , sep='|' )
SF_01_FRGN_REG_NUM_EMPL_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_EMPL_TOT ) )
if( length( SF_01_FRGN_REG_NUM_EMPL_TOT ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_EMPL_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_EMPL_TOT <-  paste0( '{', SF_01_FRGN_REG_NUM_EMPL_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_TOT_EXP_TOT
## DESCRIPTION:  Total expenditures on activities outside the US
## LOCATION:  SCHED-F-PART-01-LINE-03C-COL-F
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartI/TotalAmountSpent'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TotalAmountSpent'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalSpentAmt'
V_FRGN_REG_TOT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SF_01_FRGN_REG_TOT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_TOT_EXP_TOT ) )
if( length( SF_01_FRGN_REG_TOT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_TOT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_TOT_EXP_TOT <-  paste0( '{', SF_01_FRGN_REG_TOT_EXP_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SF_01_GRANT_RECORD_MAINT_X,SF_01_FRGN_REG_NUM_OFFICE_SUBTOT,SF_01_FRGN_REG_NUM_EMPL_SUBTOT,SF_01_FRGN_REG_TOT_EXP_SUBTOT,SF_01_FRGN_REG_NUM_OFFICE_CONTIN,SF_01_FRGN_REG_NUM_EMPL_CONTIN,SF_01_FRGN_REG_TOT_EXP_CONTIN,SF_01_FRGN_REG_NUM_OFFICE_TOT,SF_01_FRGN_REG_NUM_EMPL_TOT,SF_01_FRGN_REG_TOT_EXP_TOT)
df <- as.data.frame( var.list )


return( df )


}


