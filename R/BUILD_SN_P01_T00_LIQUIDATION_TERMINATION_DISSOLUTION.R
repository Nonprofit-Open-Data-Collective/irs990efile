#' @title 
#'   Build table SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SN_P01_T00_LIQUIDATION_TERMINATION_DISSOLUTION <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SN_01_ORG_ATTORNEY_NOTIFIED_X
## DESCRIPTION:  If ""Yes;"" did the organization provide such notice?
## LOCATION:  SCHED-N-PART-01-LINE-04B
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/AGNotified'
V2 <- '//Return/ReturnData/IRS990ScheduleN/AttorneyGeneralNotifiedInd'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/AGNotified'
V_ORG_ATTORNEY_NOTIFIED_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_ATTORNEY_NOTIFIED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ATTORNEY_NOTIFIED_X ) )
if( length( SN_01_ORG_ATTORNEY_NOTIFIED_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_ATTORNEY_NOTIFIED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_ATTORNEY_NOTIFIED_X <-  paste0( '{', SN_01_ORG_ATTORNEY_NOTIFIED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_ASSET_DIST_GVRN_X
## DESCRIPTION:  Did the organization distribute its assets in accordance with its governing instruments?
## LOCATION:  SCHED-N-PART-01-LINE-03
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/AssetsDistributed'
V2 <- '//Return/ReturnData/IRS990ScheduleN/AssetsDistributedInd'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/AssetsDistributed'
V_ORG_ASSET_DIST_GVRN_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_ASSET_DIST_GVRN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ASSET_DIST_GVRN_X ) )
if( length( SN_01_ORG_ASSET_DIST_GVRN_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_ASSET_DIST_GVRN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_ASSET_DIST_GVRN_X <-  paste0( '{', SN_01_ORG_ASSET_DIST_GVRN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_BOND_LIAB_DISCHARGED_X
## DESCRIPTION:  Did the organization discharge or defease tax-exempt bond liabilities in accordance with the Internal Revenue Code and state laws?
## LOCATION:  SCHED-N-PART-01-LINE-06B
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/BondLiabilitiesDischarged'
V2 <- '//Return/ReturnData/IRS990ScheduleN/BondLiabilitiesDischargedInd'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/BondLiabilitiesDischarged'
V_ORG_BOND_LIAB_DISCHARGED_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_BOND_LIAB_DISCHARGED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BOND_LIAB_DISCHARGED_X ) )
if( length( SN_01_ORG_BOND_LIAB_DISCHARGED_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_BOND_LIAB_DISCHARGED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_BOND_LIAB_DISCHARGED_X <-  paste0( '{', SN_01_ORG_BOND_LIAB_DISCHARGED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_BOND_OUTSTANDING_X
## DESCRIPTION:  Did the organization have any tax-exempt bonds outstanding during the year?
## LOCATION:  SCHED-N-PART-01-LINE-06A
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/BondsOutstanding'
V2 <- '//Return/ReturnData/IRS990ScheduleN/BondsOutstandingInd'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/BondsOutstanding'
V_ORG_BOND_OUTSTANDING_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_BOND_OUTSTANDING_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BOND_OUTSTANDING_X ) )
if( length( SN_01_ORG_BOND_OUTSTANDING_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_BOND_OUTSTANDING_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_BOND_OUTSTANDING_X <-  paste0( '{', SN_01_ORG_BOND_OUTSTANDING_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_DTK_DIR_SUCCESSOR_X
## DESCRIPTION:  Become a director or trustee of a successor or transferee organization?
## LOCATION:  SCHED-N-PART-01-LINE-02A
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/DirectorOfSuccessor'
V2 <- '//Return/ReturnData/IRS990ScheduleN/DirectorOfSuccessorInd'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/DirectorOfSuccessor'
V_ORG_DTK_DIR_SUCCESSOR_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_DTK_DIR_SUCCESSOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_DIR_SUCCESSOR_X ) )
if( length( SN_01_ORG_DTK_DIR_SUCCESSOR_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_DTK_DIR_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_DTK_DIR_SUCCESSOR_X <-  paste0( '{', SN_01_ORG_DTK_DIR_SUCCESSOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_DTK_EMPL_SUCCESSOR_X
## DESCRIPTION:  Become an employee of; or independent contractor for; a successor or transferee organization?
## LOCATION:  SCHED-N-PART-01-LINE-02B
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/EmployeeOfSuccessor'
V2 <- '//Return/ReturnData/IRS990ScheduleN/EmployeeOfSuccessorInd'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/EmployeeOfSuccessor'
V_ORG_DTK_EMPL_SUCCESSOR_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_DTK_EMPL_SUCCESSOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_EMPL_SUCCESSOR_X ) )
if( length( SN_01_ORG_DTK_EMPL_SUCCESSOR_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_DTK_EMPL_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_DTK_EMPL_SUCCESSOR_X <-  paste0( '{', SN_01_ORG_DTK_EMPL_SUCCESSOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_LIAB_PAID_X
## DESCRIPTION:  Did the organization discharge or pay all liabilities in accordance with state laws?
## LOCATION:  SCHED-N-PART-01-LINE-05
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/LiabilitiesPaid'
V2 <- '//Return/ReturnData/IRS990ScheduleN/LiabilitiesPaid'
V3 <- '//Return/ReturnData/IRS990ScheduleN/LiabilitiesPaidInd'
V_ORG_LIAB_PAID_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_LIAB_PAID_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LIAB_PAID_X ) )
if( length( SN_01_ORG_LIAB_PAID_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_LIAB_PAID_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_LIAB_PAID_X <-  paste0( '{', SN_01_ORG_LIAB_PAID_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_DTK_OWN_SUCCESSOR_X
## DESCRIPTION:  Become a direct or indirect owner of a successor or transferee organization?
## LOCATION:  SCHED-N-PART-01-LINE-02C
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/OwnerOfSuccessor'
V2 <- '//Return/ReturnData/IRS990ScheduleN/OwnerOfSuccessor'
V3 <- '//Return/ReturnData/IRS990ScheduleN/OwnerOfSuccessorInd'
V_ORG_DTK_OWN_SUCCESSOR_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_DTK_OWN_SUCCESSOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_OWN_SUCCESSOR_X ) )
if( length( SN_01_ORG_DTK_OWN_SUCCESSOR_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_DTK_OWN_SUCCESSOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_DTK_OWN_SUCCESSOR_X <-  paste0( '{', SN_01_ORG_DTK_OWN_SUCCESSOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_DTK_REC_COMP_X
## DESCRIPTION:  Receive; or become entitled to; compensation or other similar payments as a result of the organization's liquidation; termination; or dissolution?
## LOCATION:  SCHED-N-PART-01-LINE-02D
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/ReceiveCompensation'
V2 <- '//Return/ReturnData/IRS990ScheduleN/ReceiveCompensation'
V3 <- '//Return/ReturnData/IRS990ScheduleN/ReceiveCompensationInd'
V_ORG_DTK_REC_COMP_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_DTK_REC_COMP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DTK_REC_COMP_X ) )
if( length( SN_01_ORG_DTK_REC_COMP_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_DTK_REC_COMP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_DTK_REC_COMP_X <-  paste0( '{', SN_01_ORG_DTK_REC_COMP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_REQ_NOTIFY_ATTORNEY_X
## DESCRIPTION:  Is the organization required to notify the attorney general or other appropriate state official of its intent to dissolve?
## LOCATION:  SCHED-N-PART-01-LINE-04A
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/RequiredToNotifyAG'
V2 <- '//Return/ReturnData/IRS990ScheduleN/RequiredToNotifyAG'
V3 <- '//Return/ReturnData/IRS990ScheduleN/RequiredToNotifyAGInd'
V_ORG_REQ_NOTIFY_ATTORNEY_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_REQ_NOTIFY_ATTORNEY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_REQ_NOTIFY_ATTORNEY_X ) )
if( length( SN_01_ORG_REQ_NOTIFY_ATTORNEY_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_REQ_NOTIFY_ATTORNEY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_REQ_NOTIFY_ATTORNEY_X <-  paste0( '{', SN_01_ORG_REQ_NOTIFY_ATTORNEY_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SN_01_ORG_ATTORNEY_NOTIFIED_X,SN_01_ORG_ASSET_DIST_GVRN_X,SN_01_ORG_BOND_LIAB_DISCHARGED_X,SN_01_ORG_BOND_OUTSTANDING_X,SN_01_ORG_DTK_DIR_SUCCESSOR_X,SN_01_ORG_DTK_EMPL_SUCCESSOR_X,SN_01_ORG_LIAB_PAID_X,SN_01_ORG_DTK_OWN_SUCCESSOR_X,SN_01_ORG_DTK_REC_COMP_X,SN_01_ORG_REQ_NOTIFY_ATTORNEY_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


