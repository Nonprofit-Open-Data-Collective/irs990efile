#' @title 
#'   Build table SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P01_T00_ORGS_DONOR_ADVISED_FUNDS_OTH <- function( doc, url )
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


## VARIABLE NAME:  SD_01_TOT_NUM_EOY_DAF
## DESCRIPTION:  Enter the total number of donor advised funds maintained at the end of the tax year
## LOCATION:  SCHED-D-PART-01-LINE-01-COL-A
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DonorAdvisedFundsHeldCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/NumberDAFsHeld'
V3 <- '//Return/ReturnData/IRS990ScheduleD/NumberDAFsHeld'
V_TOT_NUM_EOY_DAF <- paste( V1, V2, V3 , sep='|' )
SD_01_TOT_NUM_EOY_DAF <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_NUM_EOY_DAF ) )
if( length( SD_01_TOT_NUM_EOY_DAF ) > 1 )
{ 
  create_record( varname=SD_01_TOT_NUM_EOY_DAF, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_TOT_NUM_EOY_DAF <-  paste0( '{', SD_01_TOT_NUM_EOY_DAF, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_TOT_NUM_EOY_OTH
## DESCRIPTION:  Enter the total number of separate accounts for participating donors where donors have the right to provide advice on the use or distribution of funds owned at the end of the tax year
## LOCATION:  SCHED-D-PART-01-LINE-01-COL-B
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/NumberFundsHeld'
V2 <- '//Return/ReturnData/IRS990ScheduleD/FundsAndOtherAccountsHeldCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/NumberFundsHeld'
V_TOT_NUM_EOY_OTH <- paste( V1, V2, V3 , sep='|' )
SD_01_TOT_NUM_EOY_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_NUM_EOY_OTH ) )
if( length( SD_01_TOT_NUM_EOY_OTH ) > 1 )
{ 
  create_record( varname=SD_01_TOT_NUM_EOY_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_TOT_NUM_EOY_OTH <-  paste0( '{', SD_01_TOT_NUM_EOY_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_AGGREGATE_CONTR_DAF
## DESCRIPTION:  Contributions; gifts; grants; and similar amounts received: donor advised funds
## LOCATION:  SCHED-D-PART-01-LINE-02-COL-A
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DonorAdvisedContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DonorAdvisedFundsContriAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/DonorAdvisedContributions'
V_AGGREGATE_CONTR_DAF <- paste( V1, V2, V3 , sep='|' )
SD_01_AGGREGATE_CONTR_DAF <- xml2::xml_text( xml2::xml_find_all( doc, V_AGGREGATE_CONTR_DAF ) )
if( length( SD_01_AGGREGATE_CONTR_DAF ) > 1 )
{ 
  create_record( varname=SD_01_AGGREGATE_CONTR_DAF, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_AGGREGATE_CONTR_DAF <-  paste0( '{', SD_01_AGGREGATE_CONTR_DAF, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_AGGREGATE_CONTR_OTH
## DESCRIPTION:  Contributions; gifts; grants; and similar amounts received: funds and other accounts
## LOCATION:  SCHED-D-PART-01-LINE-02-COL-B
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ContribToFundsAndOtherAccounts'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/ContribToFundsAndOtherAccounts'
V3 <- '//Return/ReturnData/IRS990ScheduleD/FundsAndOtherAccountsContriAmt'
V_AGGREGATE_CONTR_OTH <- paste( V1, V2, V3 , sep='|' )
SD_01_AGGREGATE_CONTR_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_AGGREGATE_CONTR_OTH ) )
if( length( SD_01_AGGREGATE_CONTR_OTH ) > 1 )
{ 
  create_record( varname=SD_01_AGGREGATE_CONTR_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_AGGREGATE_CONTR_OTH <-  paste0( '{', SD_01_AGGREGATE_CONTR_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_AGGREGATE_GRANT_DAF
## DESCRIPTION:  Grants and allocations from donor advised funds
## LOCATION:  SCHED-D-PART-01-LINE-03-COL-A
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DonorAdvisedFundsGrantsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/GrantsPaidFromDonorFunds'
V3 <- '//Return/ReturnData/IRS990ScheduleD/GrantsPaidFromDonorFunds'
V_AGGREGATE_GRANT_DAF <- paste( V1, V2, V3 , sep='|' )
SD_01_AGGREGATE_GRANT_DAF <- xml2::xml_text( xml2::xml_find_all( doc, V_AGGREGATE_GRANT_DAF ) )
if( length( SD_01_AGGREGATE_GRANT_DAF ) > 1 )
{ 
  create_record( varname=SD_01_AGGREGATE_GRANT_DAF, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_AGGREGATE_GRANT_DAF <-  paste0( '{', SD_01_AGGREGATE_GRANT_DAF, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_AGGREGATE_GRANT_OTH
## DESCRIPTION:  Grants from funds and other accounts
## LOCATION:  SCHED-D-PART-01-LINE-03-COL-B
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/GrantsFundsAndOtherAccounts'
V2 <- '//Return/ReturnData/IRS990ScheduleD/FundsAndOtherAccountsGrantsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/GrantsFundsAndOtherAccounts'
V_AGGREGATE_GRANT_OTH <- paste( V1, V2, V3 , sep='|' )
SD_01_AGGREGATE_GRANT_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_AGGREGATE_GRANT_OTH ) )
if( length( SD_01_AGGREGATE_GRANT_OTH ) > 1 )
{ 
  create_record( varname=SD_01_AGGREGATE_GRANT_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_AGGREGATE_GRANT_OTH <-  paste0( '{', SD_01_AGGREGATE_GRANT_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_AGGREGATE_VALUE_EOY_DAF
## DESCRIPTION:  Enter the aggregate value of assets held in all donor advised funds at the end of the tax year
## LOCATION:  SCHED-D-PART-01-LINE-04-COL-A
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/AggregateDAFValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DonorAdvisedFundsVlEOYAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/AggregateDAFValue'
V_AGGREGATE_VALUE_EOY_DAF <- paste( V1, V2, V3 , sep='|' )
SD_01_AGGREGATE_VALUE_EOY_DAF <- xml2::xml_text( xml2::xml_find_all( doc, V_AGGREGATE_VALUE_EOY_DAF ) )
if( length( SD_01_AGGREGATE_VALUE_EOY_DAF ) > 1 )
{ 
  create_record( varname=SD_01_AGGREGATE_VALUE_EOY_DAF, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_AGGREGATE_VALUE_EOY_DAF <-  paste0( '{', SD_01_AGGREGATE_VALUE_EOY_DAF, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_AGGREGATE_VALUE_EOY_OTH
## DESCRIPTION:  Enter the aggregate value of assets held in all funds and other accounts at the end of the tax year
## LOCATION:  SCHED-D-PART-01-LINE-04-COL-B
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/AggregateFundValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/AggregateFundValue'
V3 <- '//Return/ReturnData/IRS990ScheduleD/FundsAndOtherAccountsVlEOYAmt'
V_AGGREGATE_VALUE_EOY_OTH <- paste( V1, V2, V3 , sep='|' )
SD_01_AGGREGATE_VALUE_EOY_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_AGGREGATE_VALUE_EOY_OTH ) )
if( length( SD_01_AGGREGATE_VALUE_EOY_OTH ) > 1 )
{ 
  create_record( varname=SD_01_AGGREGATE_VALUE_EOY_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_AGGREGATE_VALUE_EOY_OTH <-  paste0( '{', SD_01_AGGREGATE_VALUE_EOY_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_DISCLOSE_LEGAL_CTRL_DAF_X
## DESCRIPTION:  Did the organization inform all donors and donor advisors in writing that the assets held in DAFs are the organization's property; subject to the organization's exclusive legal control?
## LOCATION:  SCHED-D-PART-01-LINE-05
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DisclosedOrgLegCtrlInd'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DisclosedOrgsLegalControl'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/DisclosedOrgsLegalControl'
V_DISCLOSE_LEGAL_CTRL_DAF_X <- paste( V1, V2, V3 , sep='|' )
SD_01_DISCLOSE_LEGAL_CTRL_DAF_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSE_LEGAL_CTRL_DAF_X ) )
if( length( SD_01_DISCLOSE_LEGAL_CTRL_DAF_X ) > 1 )
{ 
  create_record( varname=SD_01_DISCLOSE_LEGAL_CTRL_DAF_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_DISCLOSE_LEGAL_CTRL_DAF_X <-  paste0( '{', SD_01_DISCLOSE_LEGAL_CTRL_DAF_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_01_DISCLOSE_CHARIT_PURPOSE_X
## DESCRIPTION:  Did the organization inform all grantees; donors; and donor advisors in writing that grant funds may be used only for charitable purposes and not for the benefit of the donor or donor advisor?
## LOCATION:  SCHED-D-PART-01-LINE-06
## TABLE:  SD-P01-T00-ORGS-DONOR-ADVISED-FUNDS-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DisclosedForCharitablePrpsInd'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DisclosedForCharitablePurposes'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartI/DisclosedForCharitablePurposes'
V_DISCLOSE_CHARIT_PURPOSE_X <- paste( V1, V2, V3 , sep='|' )
SD_01_DISCLOSE_CHARIT_PURPOSE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSE_CHARIT_PURPOSE_X ) )
if( length( SD_01_DISCLOSE_CHARIT_PURPOSE_X ) > 1 )
{ 
  create_record( varname=SD_01_DISCLOSE_CHARIT_PURPOSE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_01_DISCLOSE_CHARIT_PURPOSE_X <-  paste0( '{', SD_01_DISCLOSE_CHARIT_PURPOSE_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_01_TOT_NUM_EOY_DAF,SD_01_TOT_NUM_EOY_OTH,SD_01_AGGREGATE_CONTR_DAF,SD_01_AGGREGATE_CONTR_OTH,SD_01_AGGREGATE_GRANT_DAF,SD_01_AGGREGATE_GRANT_OTH,SD_01_AGGREGATE_VALUE_EOY_DAF,SD_01_AGGREGATE_VALUE_EOY_OTH,SD_01_DISCLOSE_LEGAL_CTRL_DAF_X,SD_01_DISCLOSE_CHARIT_PURPOSE_X)
df <- as.data.frame( var.list )


return( df )


}


