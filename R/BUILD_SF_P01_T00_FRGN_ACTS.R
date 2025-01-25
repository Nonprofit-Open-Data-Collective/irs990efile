#' @title 
#'   Build table SF-P01-T00-FRGN-ACTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P01_T00_FRGN_ACTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SF_01_FRGN_REG_NUM_EMPL_CONTIN
## DESCRIPTION:  Total number of employees from continuation sheets working on region activities outside the US (Part I)
## LOCATION:  SCHED-F-PART-01-LINE-03B-COL-C
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleF/ContinuationTotalEmployeeCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ContinutationTotalEmployeeCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleF/ContNumberOfEmployees'
V_FRGN_REG_NUM_EMPL_CONTIN <- paste( V1, V2, V3 , sep='|' )
SF_01_FRGN_REG_NUM_EMPL_CONTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_EMPL_CONTIN ) )
if( length( SF_01_FRGN_REG_NUM_EMPL_CONTIN ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_EMPL_CONTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_EMPL_CONTIN <-  paste0( '{', SF_01_FRGN_REG_NUM_EMPL_CONTIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_01_FRGN_REG_NUM_OFFICE_CONTIN
## DESCRIPTION:  Total offices from continuation sheetson region activities outside the US (Part I)
## LOCATION:  SCHED-F-PART-01-LINE-03B-COL-B
## TABLE:  SF-P01-T00-FRGN-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleF/ContinuationTotalOfficeCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ContinutationTotalOfficeCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleF/ContNumberOfOffices'
V_FRGN_REG_NUM_OFFICE_CONTIN <- paste( V1, V2, V3 , sep='|' )
SF_01_FRGN_REG_NUM_OFFICE_CONTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_REG_NUM_OFFICE_CONTIN ) )
if( length( SF_01_FRGN_REG_NUM_OFFICE_CONTIN ) > 1 )
{ 
  create_record( varname=SF_01_FRGN_REG_NUM_OFFICE_CONTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_01_FRGN_REG_NUM_OFFICE_CONTIN <-  paste0( '{', SF_01_FRGN_REG_NUM_OFFICE_CONTIN, '}', collapse=';' ) 
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




var.list <- 
namedList(SF_01_FRGN_REG_NUM_EMPL_CONTIN,SF_01_FRGN_REG_NUM_OFFICE_CONTIN,SF_01_FRGN_REG_TOT_EXP_CONTIN,SF_01_GRANT_RECORD_MAINT_X,SF_01_FRGN_REG_TOT_EXP_TOT,SF_01_FRGN_REG_NUM_EMPL_TOT,SF_01_FRGN_REG_NUM_OFFICE_TOT,SF_01_FRGN_REG_TOT_EXP_SUBTOT,SF_01_FRGN_REG_NUM_EMPL_SUBTOT,SF_01_FRGN_REG_NUM_OFFICE_SUBTOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


