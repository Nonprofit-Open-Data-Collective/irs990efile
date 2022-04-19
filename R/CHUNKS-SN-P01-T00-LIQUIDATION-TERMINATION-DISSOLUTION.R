#' @title 
#'   Build table SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SN_P01_T00_LIQUIDATION_TERMINATION_DISSOLUTION <- function( doc, url )
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




## VARIABLE NAME:  SN_01_ORG_ATTORNEY_NOTIFIED_X
## DESCRIPTION:  If "Yes;" did the organization provide such notice?
## LOCATION:  SCHED-N-PART-01-LINE-04B
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/AGNotified'
V2 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/AGNotified'
V3 <- '//Return/ReturnData/IRS990ScheduleN/AttorneyGeneralNotifiedInd'
V_ORG_ATTORNEY_NOTIFIED_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_ATTORNEY_NOTIFIED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ATTORNEY_NOTIFIED_X ) )
if( length( SN_01_ORG_ATTORNEY_NOTIFIED_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_ATTORNEY_NOTIFIED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_ATTORNEY_NOTIFIED_X <-  paste0( '{', SN_01_ORG_ATTORNEY_NOTIFIED_X, '}', collapse=';' ) 
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




## VARIABLE NAME:  SN_01_ORG_BOND_OUTSTANDING_X
## DESCRIPTION:  Did the organization have any tax-exempt bonds outstanding during the year?
## LOCATION:  SCHED-N-PART-01-LINE-06A
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/BondsOutstandingInd'
V2 <- '//Return/ReturnData/IRS990ScheduleN/BondsOutstanding'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/BondsOutstanding'
V_ORG_BOND_OUTSTANDING_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_BOND_OUTSTANDING_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BOND_OUTSTANDING_X ) )
if( length( SN_01_ORG_BOND_OUTSTANDING_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_BOND_OUTSTANDING_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_BOND_OUTSTANDING_X <-  paste0( '{', SN_01_ORG_BOND_OUTSTANDING_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_01_ORG_BOND_LIAB_DISCHARGED_X
## DESCRIPTION:  Did the organization discharge or defease tax-exempt bond liabilities in accordance with the Internal Revenue Code and state laws?
## LOCATION:  SCHED-N-PART-01-LINE-06B
## TABLE:  SN-P01-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/BondLiabilitiesDischargedInd'
V2 <- '//Return/ReturnData/IRS990ScheduleN/BondLiabilitiesDischarged'
V3 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/BondLiabilitiesDischarged'
V_ORG_BOND_LIAB_DISCHARGED_X <- paste( V1, V2, V3 , sep='|' )
SN_01_ORG_BOND_LIAB_DISCHARGED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BOND_LIAB_DISCHARGED_X ) )
if( length( SN_01_ORG_BOND_LIAB_DISCHARGED_X ) > 1 )
{ 
  create_record( varname=SN_01_ORG_BOND_LIAB_DISCHARGED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_01_ORG_BOND_LIAB_DISCHARGED_X <-  paste0( '{', SN_01_ORG_BOND_LIAB_DISCHARGED_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SN_01_ORG_DTK_DIR_SUCCESSOR_X,SN_01_ORG_DTK_EMPL_SUCCESSOR_X,SN_01_ORG_DTK_OWN_SUCCESSOR_X,SN_01_ORG_DTK_REC_COMP_X,SN_01_ORG_ASSET_DIST_GVRN_X,SN_01_ORG_REQ_NOTIFY_ATTORNEY_X,SN_01_ORG_ATTORNEY_NOTIFIED_X,SN_01_ORG_LIAB_PAID_X,SN_01_ORG_BOND_OUTSTANDING_X,SN_01_ORG_BOND_LIAB_DISCHARGED_X)
df <- as.data.frame( var.list )


return( df )


}


