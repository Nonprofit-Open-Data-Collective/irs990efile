#' @title 
#'   Build table SN-P02-T00-DISPOSITION-OF-ASSETS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SN_P02_T00_DISPOSITION_OF_ASSETS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


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
  log_collapsed_record( varname=SN_02_ORG_DTK_DIR_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=SN_02_ORG_DTK_EMPL_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=SN_02_ORG_DTK_OWN_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=SN_02_ORG_DTK_REC_COMP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_02_ORG_DTK_REC_COMP_X <-  paste0( '{', SN_02_ORG_DTK_REC_COMP_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SN_02_ORG_DTK_DIR_SUCCESSOR_X,SN_02_ORG_DTK_EMPL_SUCCESSOR_X,SN_02_ORG_DTK_OWN_SUCCESSOR_X,SN_02_ORG_DTK_REC_COMP_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


