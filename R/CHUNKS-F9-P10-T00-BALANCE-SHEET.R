#' @title 
#'   Build table F9-P10-T00-BALANCE-SHEET
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P10_T00_BALANCE_SHEET <- function( doc, url )
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


## VARIABLE NAME:  F9_10_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part II
## LOCATION:  F990-EZ-PART-02-LINE-00
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartII'
V2 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIIInd'
V3 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartXInd'
V4 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartX'
V5 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartXInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_10_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_10_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_10_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_INFO_SCHED_O_X <-  paste0( '{', F9_10_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_CASH_SAVING_BOY
## DESCRIPTION:  Cash, savings, and investments, beginning of year (F990-PC-PART-10-LINE-01-02-11-12-13-BOY-COMBINED: F990-EZ-PART-02-LINE-22-BOY)
## LOCATION:  F990-EZ-PART-02-LINE-22-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/CashSavingsAndInvestments/BOY'
V2 <- '//Return/ReturnData/IRS990EZ/CashSavingsAndInvestmentsGrp/BOYAmt'
V_ASSET_CASH_SAVING_BOY <- paste( V1, V2 , sep='|' )
F9_10_ASSET_CASH_SAVING_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_CASH_SAVING_BOY ) )
if( length( F9_10_ASSET_CASH_SAVING_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_CASH_SAVING_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_CASH_SAVING_BOY <-  paste0( '{', F9_10_ASSET_CASH_SAVING_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_CASH_SAVING_EOY
## DESCRIPTION:  Cash, savings, and investments, end of year (F990-PC-PART-10-LINE-01-02-11-12-13-EOY-COMBINED: F990-EZ-PART-02-LINE-22-EOY)
## LOCATION:  F990-EZ-PART-02-LINE-22-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/CashSavingsAndInvestments/EOY'
V2 <- '//Return/ReturnData/IRS990EZ/CashSavingsAndInvestmentsGrp/EOYAmt'
V_ASSET_CASH_SAVING_EOY <- paste( V1, V2 , sep='|' )
F9_10_ASSET_CASH_SAVING_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_CASH_SAVING_EOY ) )
if( length( F9_10_ASSET_CASH_SAVING_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_CASH_SAVING_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_CASH_SAVING_EOY <-  paste0( '{', F9_10_ASSET_CASH_SAVING_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_CASH_BOY
## DESCRIPTION:  Cash, non-interest-bearing, beginning of year
## LOCATION:  F990-PC-PART-10-LINE-01-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CashNonInterestBearing/BOY'
V2 <- '//Return/ReturnData/IRS990/CashNonInterestBearingGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/CashNonInterestBearing/BOY'
V_ASSET_CASH_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_CASH_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_CASH_BOY ) )
if( length( F9_10_ASSET_CASH_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_CASH_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_CASH_BOY <-  paste0( '{', F9_10_ASSET_CASH_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_CASH_EOY
## DESCRIPTION:  Cash, non-interest-bearing, end of year
## LOCATION:  F990-PC-PART-10-LINE-01-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CashNonInterestBearing/EOY'
V2 <- '//Return/ReturnData/IRS990/CashNonInterestBearingGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/CashNonInterestBearing/EOY'
V_ASSET_CASH_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_CASH_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_CASH_EOY ) )
if( length( F9_10_ASSET_CASH_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_CASH_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_CASH_EOY <-  paste0( '{', F9_10_ASSET_CASH_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_SAVING_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-02-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/SavingsAndTempCashInvestments/BOY'
V2 <- '//Return/ReturnData/IRS990/SavingsAndTempCashInvestments/BOY'
V3 <- '//Return/ReturnData/IRS990/SavingsAndTempCashInvstGrp/BOYAmt'
V_ASSET_SAVING_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_SAVING_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_SAVING_BOY ) )
if( length( F9_10_ASSET_SAVING_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_SAVING_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_SAVING_BOY <-  paste0( '{', F9_10_ASSET_SAVING_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_SAVING_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-02-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/SavingsAndTempCashInvestments/EOY'
V2 <- '//Return/ReturnData/IRS990/SavingsAndTempCashInvestments/EOY'
V3 <- '//Return/ReturnData/IRS990/SavingsAndTempCashInvstGrp/EOYAmt'
V_ASSET_SAVING_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_SAVING_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_SAVING_EOY ) )
if( length( F9_10_ASSET_SAVING_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_SAVING_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_SAVING_EOY <-  paste0( '{', F9_10_ASSET_SAVING_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_PLEDGE_NET_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-03-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PledgesAndGrantsReceivable/BOY'
V2 <- '//Return/ReturnData/IRS990/PledgesAndGrantsReceivable/BOY'
V3 <- '//Return/ReturnData/IRS990/PledgesAndGrantsReceivableGrp/BOYAmt'
V_ASSET_PLEDGE_NET_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_PLEDGE_NET_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_PLEDGE_NET_BOY ) )
if( length( F9_10_ASSET_PLEDGE_NET_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_PLEDGE_NET_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_PLEDGE_NET_BOY <-  paste0( '{', F9_10_ASSET_PLEDGE_NET_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_PLEDGE_NET_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-03-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PledgesAndGrantsReceivable/EOY'
V2 <- '//Return/ReturnData/IRS990/PledgesAndGrantsReceivable/EOY'
V3 <- '//Return/ReturnData/IRS990/PledgesAndGrantsReceivableGrp/EOYAmt'
V_ASSET_PLEDGE_NET_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_PLEDGE_NET_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_PLEDGE_NET_EOY ) )
if( length( F9_10_ASSET_PLEDGE_NET_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_PLEDGE_NET_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_PLEDGE_NET_EOY <-  paste0( '{', F9_10_ASSET_PLEDGE_NET_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_ACC_NET_BOY
## DESCRIPTION:  Net accounts receivable, beginning of year
## LOCATION:  F990-PC-PART-10-LINE-04-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountsReceivable/BOY'
V2 <- '//Return/ReturnData/IRS990/AccountsReceivableGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/AccountsReceivable/BOY'
V_ASSET_ACC_NET_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_ACC_NET_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_ACC_NET_BOY ) )
if( length( F9_10_ASSET_ACC_NET_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_ACC_NET_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_ACC_NET_BOY <-  paste0( '{', F9_10_ASSET_ACC_NET_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_ACC_NET_EOY
## DESCRIPTION:  Net accounts receivable, end of year
## LOCATION:  F990-PC-PART-10-LINE-04-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountsReceivable/EOY'
V2 <- '//Return/ReturnData/IRS990/AccountsReceivableGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/AccountsReceivable/EOY'
V_ASSET_ACC_NET_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_ACC_NET_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_ACC_NET_EOY ) )
if( length( F9_10_ASSET_ACC_NET_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_ACC_NET_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_ACC_NET_EOY <-  paste0( '{', F9_10_ASSET_ACC_NET_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LOAN_OFF_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-05-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/ReceivablesFromOfficersEtc/BOY'
V2 <- '//Return/ReturnData/IRS990/ReceivablesFromOfficersEtc/BOY'
V3 <- '//Return/ReturnData/IRS990/ReceivablesFromOfficersEtcGrp/BOYAmt'
V_ASSET_LOAN_OFF_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_LOAN_OFF_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LOAN_OFF_BOY ) )
if( length( F9_10_ASSET_LOAN_OFF_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LOAN_OFF_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LOAN_OFF_BOY <-  paste0( '{', F9_10_ASSET_LOAN_OFF_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LOAN_OFF_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-05-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/ReceivablesFromOfficersEtc/EOY'
V2 <- '//Return/ReturnData/IRS990/ReceivablesFromOfficersEtc/EOY'
V3 <- '//Return/ReturnData/IRS990/ReceivablesFromOfficersEtcGrp/EOYAmt'
V_ASSET_LOAN_OFF_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_LOAN_OFF_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LOAN_OFF_EOY ) )
if( length( F9_10_ASSET_LOAN_OFF_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LOAN_OFF_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LOAN_OFF_EOY <-  paste0( '{', F9_10_ASSET_LOAN_OFF_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LOAN_DSQ_PERS_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-06-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/ReceivablesFromDisqualPersons/BOY'
V2 <- '//Return/ReturnData/IRS990/RcvblFromDisqualifiedPrsnGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/ReceivablesFromDisqualPersons/BOY'
V_ASSET_LOAN_DSQ_PERS_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_LOAN_DSQ_PERS_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LOAN_DSQ_PERS_BOY ) )
if( length( F9_10_ASSET_LOAN_DSQ_PERS_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LOAN_DSQ_PERS_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LOAN_DSQ_PERS_BOY <-  paste0( '{', F9_10_ASSET_LOAN_DSQ_PERS_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LOAN_DSQ_PERS_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-06-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/ReceivablesFromDisqualPersons/EOY'
V2 <- '//Return/ReturnData/IRS990/RcvblFromDisqualifiedPrsnGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/ReceivablesFromDisqualPersons/EOY'
V_ASSET_LOAN_DSQ_PERS_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_LOAN_DSQ_PERS_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LOAN_DSQ_PERS_EOY ) )
if( length( F9_10_ASSET_LOAN_DSQ_PERS_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LOAN_DSQ_PERS_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LOAN_DSQ_PERS_EOY <-  paste0( '{', F9_10_ASSET_LOAN_DSQ_PERS_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_NOTE_LOAN_NET_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-07-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/OtherNotesLoansReceivableNet/BOY'
V2 <- '//Return/ReturnData/IRS990/OtherNotesLoansReceivableNet/BOY'
V3 <- '//Return/ReturnData/IRS990/OthNotesLoansReceivableNetGrp/BOYAmt'
V_ASSET_NOTE_LOAN_NET_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_NOTE_LOAN_NET_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_NOTE_LOAN_NET_BOY ) )
if( length( F9_10_ASSET_NOTE_LOAN_NET_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_NOTE_LOAN_NET_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_NOTE_LOAN_NET_BOY <-  paste0( '{', F9_10_ASSET_NOTE_LOAN_NET_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_NOTE_LOAN_NET_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-07-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/OtherNotesLoansReceivableNet/EOY'
V2 <- '//Return/ReturnData/IRS990/OtherNotesLoansReceivableNet/EOY'
V3 <- '//Return/ReturnData/IRS990/OthNotesLoansReceivableNetGrp/EOYAmt'
V_ASSET_NOTE_LOAN_NET_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_NOTE_LOAN_NET_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_NOTE_LOAN_NET_EOY ) )
if( length( F9_10_ASSET_NOTE_LOAN_NET_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_NOTE_LOAN_NET_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_NOTE_LOAN_NET_EOY <-  paste0( '{', F9_10_ASSET_NOTE_LOAN_NET_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INV_SALE_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-08-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InventoriesForSaleOrUse/BOY'
V2 <- '//Return/ReturnData/IRS990/InventoriesForSaleOrUse/BOY'
V3 <- '//Return/ReturnData/IRS990/InventoriesForSaleOrUseGrp/BOYAmt'
V_ASSET_INV_SALE_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INV_SALE_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INV_SALE_BOY ) )
if( length( F9_10_ASSET_INV_SALE_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INV_SALE_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INV_SALE_BOY <-  paste0( '{', F9_10_ASSET_INV_SALE_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INV_SALE_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-08-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InventoriesForSaleOrUse/EOY'
V2 <- '//Return/ReturnData/IRS990/InventoriesForSaleOrUse/EOY'
V3 <- '//Return/ReturnData/IRS990/InventoriesForSaleOrUseGrp/EOYAmt'
V_ASSET_INV_SALE_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INV_SALE_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INV_SALE_EOY ) )
if( length( F9_10_ASSET_INV_SALE_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INV_SALE_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INV_SALE_EOY <-  paste0( '{', F9_10_ASSET_INV_SALE_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_EXP_PREPAID_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-09-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PrepaidExpensesDeferredCharges/BOY'
V2 <- '//Return/ReturnData/IRS990/PrepaidExpensesDeferredCharges/BOY'
V3 <- '//Return/ReturnData/IRS990/PrepaidExpensesDefrdChargesGrp/BOYAmt'
V_ASSET_EXP_PREPAID_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_EXP_PREPAID_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_EXP_PREPAID_BOY ) )
if( length( F9_10_ASSET_EXP_PREPAID_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_EXP_PREPAID_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_EXP_PREPAID_BOY <-  paste0( '{', F9_10_ASSET_EXP_PREPAID_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_EXP_PREPAID_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-09-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PrepaidExpensesDeferredCharges/EOY'
V2 <- '//Return/ReturnData/IRS990/PrepaidExpensesDeferredCharges/EOY'
V3 <- '//Return/ReturnData/IRS990/PrepaidExpensesDefrdChargesGrp/EOYAmt'
V_ASSET_EXP_PREPAID_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_EXP_PREPAID_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_EXP_PREPAID_EOY ) )
if( length( F9_10_ASSET_EXP_PREPAID_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_EXP_PREPAID_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_EXP_PREPAID_EOY <-  paste0( '{', F9_10_ASSET_EXP_PREPAID_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LAND_BLDG
## DESCRIPTION:  Land; buildings; and equipment basis
## LOCATION:  F990-PC-PART-10-LINE-10A
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/LandBuildingsEquipmentBasis'
V2 <- '//Return/ReturnData/IRS990/LandBldgEquipCostOrOtherBssAmt'
V3 <- '//Return/ReturnData/IRS990/LandBuildingsEquipmentBasis'
V_ASSET_LAND_BLDG <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_LAND_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LAND_BLDG ) )
if( length( F9_10_ASSET_LAND_BLDG ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LAND_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LAND_BLDG <-  paste0( '{', F9_10_ASSET_LAND_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LAND_BLDG_BOY
## DESCRIPTION:  Net value including lands, buildings, and equipment, beginning of year
## LOCATION:  F990-EZ-PART-02-LINE-23-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LandAndBuildings/BOY'
V2 <- '//Return/ReturnData/IRS990EZ/LandAndBuildingsGrp/BOYAmt'
V_ASSET_LAND_BLDG_BOY <- paste( V1, V2 , sep='|' )
F9_10_ASSET_LAND_BLDG_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LAND_BLDG_BOY ) )
if( length( F9_10_ASSET_LAND_BLDG_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LAND_BLDG_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LAND_BLDG_BOY <-  paste0( '{', F9_10_ASSET_LAND_BLDG_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LAND_BLDG_EOY
## DESCRIPTION:  Net value including lands, buildings, and equipment, end of year
## LOCATION:  F990-EZ-PART-02-LINE-23-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LandAndBuildings/EOY'
V2 <- '//Return/ReturnData/IRS990EZ/LandAndBuildingsGrp/EOYAmt'
V_ASSET_LAND_BLDG_EOY <- paste( V1, V2 , sep='|' )
F9_10_ASSET_LAND_BLDG_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LAND_BLDG_EOY ) )
if( length( F9_10_ASSET_LAND_BLDG_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LAND_BLDG_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LAND_BLDG_EOY <-  paste0( '{', F9_10_ASSET_LAND_BLDG_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LAND_BLDG_DEPREC
## DESCRIPTION:  Less: accumulated depreciation
## LOCATION:  F990-PC-PART-10-LINE-10B
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/LandBldgEquipmentAccumDeprec'
V2 <- '//Return/ReturnData/IRS990/LandBldgEquipAccumDeprecAmt'
V3 <- '//Return/ReturnData/IRS990/LandBldgEquipmentAccumDeprec'
V_ASSET_LAND_BLDG_DEPREC <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_LAND_BLDG_DEPREC <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LAND_BLDG_DEPREC ) )
if( length( F9_10_ASSET_LAND_BLDG_DEPREC ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LAND_BLDG_DEPREC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LAND_BLDG_DEPREC <-  paste0( '{', F9_10_ASSET_LAND_BLDG_DEPREC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LAND_BLDG_NET_BOY
## DESCRIPTION:  Net value including lands; buildings; and equipment; beginning of year
## LOCATION:  F990-EZ-PART-02-LINE-23-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LandBldgEquipBasisNetGrp/BOYAmt'
V2 <- '//Return/ReturnData/IRS990EZ/LandBuildingsEquipmentBasisNet/BOY'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/LandBuildingsEquipmentBasisNet/BOY'
V4 <- '//Return/ReturnData/IRS990/LandBldgEquipBasisNetGrp/BOYAmt'
V5 <- '//Return/ReturnData/IRS990/LandBuildingsEquipmentBasisNet/BOY'
V_ASSET_LAND_BLDG_NET_BOY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_10_ASSET_LAND_BLDG_NET_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LAND_BLDG_NET_BOY ) )
if( length( F9_10_ASSET_LAND_BLDG_NET_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LAND_BLDG_NET_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LAND_BLDG_NET_BOY <-  paste0( '{', F9_10_ASSET_LAND_BLDG_NET_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_LAND_BLDG_NET_EOY
## DESCRIPTION:  Net value including lands; buildings; and equipment; end of year
## LOCATION:  F990-EZ-PART-02-LINE-23-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LandBldgEquipBasisNetGrp/EOYAmt'
V2 <- '//Return/ReturnData/IRS990EZ/LandBuildingsEquipmentBasisNet/EOY'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/LandBuildingsEquipmentBasisNet/EOY'
V4 <- '//Return/ReturnData/IRS990/LandBldgEquipBasisNetGrp/EOYAmt'
V5 <- '//Return/ReturnData/IRS990/LandBuildingsEquipmentBasisNet/EOY'
V_ASSET_LAND_BLDG_NET_EOY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_10_ASSET_LAND_BLDG_NET_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_LAND_BLDG_NET_EOY ) )
if( length( F9_10_ASSET_LAND_BLDG_NET_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_LAND_BLDG_NET_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_LAND_BLDG_NET_EOY <-  paste0( '{', F9_10_ASSET_LAND_BLDG_NET_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INVEST_SEC_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-11-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InvestmentsPubTradedSecurities/BOY'
V2 <- '//Return/ReturnData/IRS990/InvestmentsPubTradedSecGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/InvestmentsPubTradedSecurities/BOY'
V_ASSET_INVEST_SEC_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INVEST_SEC_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INVEST_SEC_BOY ) )
if( length( F9_10_ASSET_INVEST_SEC_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INVEST_SEC_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INVEST_SEC_BOY <-  paste0( '{', F9_10_ASSET_INVEST_SEC_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INVEST_SEC_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-11-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InvestmentsPubTradedSecurities/EOY'
V2 <- '//Return/ReturnData/IRS990/InvestmentsPubTradedSecGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/InvestmentsPubTradedSecurities/EOY'
V_ASSET_INVEST_SEC_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INVEST_SEC_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INVEST_SEC_EOY ) )
if( length( F9_10_ASSET_INVEST_SEC_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INVEST_SEC_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INVEST_SEC_EOY <-  paste0( '{', F9_10_ASSET_INVEST_SEC_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INVEST_SEC_OTH_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-12-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InvestmentsOtherSecurities/BOY'
V2 <- '//Return/ReturnData/IRS990/InvestmentsOtherSecurities/BOY'
V3 <- '//Return/ReturnData/IRS990/InvestmentsOtherSecuritiesGrp/BOYAmt'
V_ASSET_INVEST_SEC_OTH_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INVEST_SEC_OTH_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INVEST_SEC_OTH_BOY ) )
if( length( F9_10_ASSET_INVEST_SEC_OTH_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INVEST_SEC_OTH_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INVEST_SEC_OTH_BOY <-  paste0( '{', F9_10_ASSET_INVEST_SEC_OTH_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INVEST_SEC_OTH_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-12-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InvestmentsOtherSecurities/EOY'
V2 <- '//Return/ReturnData/IRS990/InvestmentsOtherSecurities/EOY'
V3 <- '//Return/ReturnData/IRS990/InvestmentsOtherSecuritiesGrp/EOYAmt'
V_ASSET_INVEST_SEC_OTH_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INVEST_SEC_OTH_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INVEST_SEC_OTH_EOY ) )
if( length( F9_10_ASSET_INVEST_SEC_OTH_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INVEST_SEC_OTH_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INVEST_SEC_OTH_EOY <-  paste0( '{', F9_10_ASSET_INVEST_SEC_OTH_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INVEST_PROG_RLTD_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-13-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InvestmentsProgramRelated/BOY'
V2 <- '//Return/ReturnData/IRS990/InvestmentsProgramRelated/BOY'
V3 <- '//Return/ReturnData/IRS990/InvestmentsProgramRelatedGrp/BOYAmt'
V_ASSET_INVEST_PROG_RLTD_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INVEST_PROG_RLTD_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INVEST_PROG_RLTD_BOY ) )
if( length( F9_10_ASSET_INVEST_PROG_RLTD_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INVEST_PROG_RLTD_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INVEST_PROG_RLTD_BOY <-  paste0( '{', F9_10_ASSET_INVEST_PROG_RLTD_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INVEST_PROG_RLTD_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-13-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/InvestmentsProgramRelated/EOY'
V2 <- '//Return/ReturnData/IRS990/InvestmentsProgramRelated/EOY'
V3 <- '//Return/ReturnData/IRS990/InvestmentsProgramRelatedGrp/EOYAmt'
V_ASSET_INVEST_PROG_RLTD_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INVEST_PROG_RLTD_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INVEST_PROG_RLTD_EOY ) )
if( length( F9_10_ASSET_INVEST_PROG_RLTD_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INVEST_PROG_RLTD_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INVEST_PROG_RLTD_EOY <-  paste0( '{', F9_10_ASSET_INVEST_PROG_RLTD_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INTANGIBLE_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-14-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/IntangibleAssets/BOY'
V2 <- '//Return/ReturnData/IRS990/IntangibleAssets/BOY'
V3 <- '//Return/ReturnData/IRS990/IntangibleAssetsGrp/BOYAmt'
V_ASSET_INTANGIBLE_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INTANGIBLE_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INTANGIBLE_BOY ) )
if( length( F9_10_ASSET_INTANGIBLE_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INTANGIBLE_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INTANGIBLE_BOY <-  paste0( '{', F9_10_ASSET_INTANGIBLE_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_INTANGIBLE_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-14-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/IntangibleAssets/EOY'
V2 <- '//Return/ReturnData/IRS990/IntangibleAssets/EOY'
V3 <- '//Return/ReturnData/IRS990/IntangibleAssetsGrp/EOYAmt'
V_ASSET_INTANGIBLE_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_INTANGIBLE_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_INTANGIBLE_EOY ) )
if( length( F9_10_ASSET_INTANGIBLE_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_INTANGIBLE_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_INTANGIBLE_EOY <-  paste0( '{', F9_10_ASSET_INTANGIBLE_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_OTH_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-15-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/OtherAssetsTotal/BOY'
V2 <- '//Return/ReturnData/IRS990/OtherAssetsTotal/BOY'
V3 <- '//Return/ReturnData/IRS990/OtherAssetsTotalGrp/BOYAmt'
V_ASSET_OTH_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_OTH_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_OTH_BOY ) )
if( length( F9_10_ASSET_OTH_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_OTH_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_OTH_BOY <-  paste0( '{', F9_10_ASSET_OTH_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_OTH_BOY_V2
## DESCRIPTION:  Other assets, beginning of year
## LOCATION:  F990-EZ-PART-02-LINE-24-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OtherAssetsTotal/BOY'
V2 <- '//Return/ReturnData/IRS990EZ/OtherAssetsTotalDetail/BOYAmt'
V3 <- '//Return/ReturnData/IRS990EZ/OtherAssetsTotalGrp/BOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/OtherAssets/BOY'
V_ASSET_OTH_BOY_V2 <- paste( V1, V2, V3, V4 , sep='|' )
F9_10_ASSET_OTH_BOY_V2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_OTH_BOY_V2 ) )
if( length( F9_10_ASSET_OTH_BOY_V2 ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_OTH_BOY_V2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_OTH_BOY_V2 <-  paste0( '{', F9_10_ASSET_OTH_BOY_V2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_OTH_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-15-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/OtherAssetsTotal/EOY'
V2 <- '//Return/ReturnData/IRS990/OtherAssetsTotal/EOY'
V3 <- '//Return/ReturnData/IRS990/OtherAssetsTotalGrp/EOYAmt'
V_ASSET_OTH_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_ASSET_OTH_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_OTH_EOY ) )
if( length( F9_10_ASSET_OTH_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_OTH_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_OTH_EOY <-  paste0( '{', F9_10_ASSET_OTH_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_OTH_EOY_V2
## DESCRIPTION:  Other assets, end of year
## LOCATION:  F990-EZ-PART-02-LINE-24-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OtherAssetsTotal/EOY'
V2 <- '//Return/ReturnData/IRS990EZ/OtherAssetsTotalDetail/EOYAmt'
V3 <- '//Return/ReturnData/IRS990EZ/OtherAssetsTotalGrp/EOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/OtherAssets/EOY'
V_ASSET_OTH_EOY_V2 <- paste( V1, V2, V3, V4 , sep='|' )
F9_10_ASSET_OTH_EOY_V2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_OTH_EOY_V2 ) )
if( length( F9_10_ASSET_OTH_EOY_V2 ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_OTH_EOY_V2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_OTH_EOY_V2 <-  paste0( '{', F9_10_ASSET_OTH_EOY_V2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_TOT_BOY
## DESCRIPTION:  Total assets, beginning of year
## LOCATION:  F990-EZ-PART-02-LINE-25-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/Form990TotalAssetsGrp/BOYAmt'
V2 <- '//Return/ReturnData/IRS990EZ/TotalAssets/BOY'
V3 <- '//Return/ReturnData/IRS990EZ/TotalAssetsGrp/BOYAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartX/TotalAssets/BOY'
V5 <- '//Return/ReturnData/IRS990/TotalAssets/BOY'
V6 <- '//Return/ReturnData/IRS990/TotalAssetsGrp/BOYAmt'
V_ASSET_TOT_BOY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_10_ASSET_TOT_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_TOT_BOY ) )
if( length( F9_10_ASSET_TOT_BOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_TOT_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_TOT_BOY <-  paste0( '{', F9_10_ASSET_TOT_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_ASSET_TOT_EOY
## DESCRIPTION:  Total assets, end of year
## LOCATION:  F990-EZ-PART-02-LINE-25-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/Form990TotalAssetsGrp/EOYAmt'
V2 <- '//Return/ReturnData/IRS990EZ/TotalAssets/EOY'
V3 <- '//Return/ReturnData/IRS990EZ/TotalAssetsGrp/EOYAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartX/TotalAssets/EOY'
V5 <- '//Return/ReturnData/IRS990/TotalAssets/EOY'
V6 <- '//Return/ReturnData/IRS990/TotalAssetsGrp/EOYAmt'
V_ASSET_TOT_EOY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_10_ASSET_TOT_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_TOT_EOY ) )
if( length( F9_10_ASSET_TOT_EOY ) > 1 )
{ 
  create_record( varname=F9_10_ASSET_TOT_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_ASSET_TOT_EOY <-  paste0( '{', F9_10_ASSET_TOT_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_ACC_PAYABLE_BOY
## DESCRIPTION:  Accounts payable and accrued expenses, beginning of year
## LOCATION:  F990-PC-PART-10-LINE-17-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountsPayableAccrExpnssGrp/BOYAmt'
V2 <- '//Return/ReturnData/IRS990/AccountsPayableAccruedExpenses/BOY'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/AccountsPayableAccruedExpenses/BOY'
V_LIAB_ACC_PAYABLE_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_ACC_PAYABLE_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_ACC_PAYABLE_BOY ) )
if( length( F9_10_LIAB_ACC_PAYABLE_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_ACC_PAYABLE_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_ACC_PAYABLE_BOY <-  paste0( '{', F9_10_LIAB_ACC_PAYABLE_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_ACC_PAYABLE_EOY
## DESCRIPTION:  Accounts payable and accrued expenses, end of year
## LOCATION:  F990-PC-PART-10-LINE-17-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountsPayableAccrExpnssGrp/EOYAmt'
V2 <- '//Return/ReturnData/IRS990/AccountsPayableAccruedExpenses/EOY'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/AccountsPayableAccruedExpenses/EOY'
V_LIAB_ACC_PAYABLE_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_ACC_PAYABLE_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_ACC_PAYABLE_EOY ) )
if( length( F9_10_LIAB_ACC_PAYABLE_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_ACC_PAYABLE_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_ACC_PAYABLE_EOY <-  paste0( '{', F9_10_LIAB_ACC_PAYABLE_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_GRANT_PAYABLE_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-18-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/GrantsPayable/BOY'
V2 <- '//Return/ReturnData/IRS990/GrantsPayable/BOY'
V3 <- '//Return/ReturnData/IRS990/GrantsPayableGrp/BOYAmt'
V_LIAB_GRANT_PAYABLE_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_GRANT_PAYABLE_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_GRANT_PAYABLE_BOY ) )
if( length( F9_10_LIAB_GRANT_PAYABLE_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_GRANT_PAYABLE_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_GRANT_PAYABLE_BOY <-  paste0( '{', F9_10_LIAB_GRANT_PAYABLE_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_GRANT_PAYABLE_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-18-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/GrantsPayable/EOY'
V2 <- '//Return/ReturnData/IRS990/GrantsPayable/EOY'
V3 <- '//Return/ReturnData/IRS990/GrantsPayableGrp/EOYAmt'
V_LIAB_GRANT_PAYABLE_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_GRANT_PAYABLE_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_GRANT_PAYABLE_EOY ) )
if( length( F9_10_LIAB_GRANT_PAYABLE_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_GRANT_PAYABLE_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_GRANT_PAYABLE_EOY <-  paste0( '{', F9_10_LIAB_GRANT_PAYABLE_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_REV_DEFERRED_BOY
## DESCRIPTION:  Deferred revenue, beginning of year
## LOCATION:  F990-PC-PART-10-LINE-19-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DeferredRevenue/BOY'
V2 <- '//Return/ReturnData/IRS990/DeferredRevenueGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/DeferredRevenue/BOY'
V_LIAB_REV_DEFERRED_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_REV_DEFERRED_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_REV_DEFERRED_BOY ) )
if( length( F9_10_LIAB_REV_DEFERRED_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_REV_DEFERRED_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_REV_DEFERRED_BOY <-  paste0( '{', F9_10_LIAB_REV_DEFERRED_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_REV_DEFERRED_EOY
## DESCRIPTION:  Deferred revenue, end of year
## LOCATION:  F990-PC-PART-10-LINE-19-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DeferredRevenue/EOY'
V2 <- '//Return/ReturnData/IRS990/DeferredRevenueGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/DeferredRevenue/EOY'
V_LIAB_REV_DEFERRED_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_REV_DEFERRED_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_REV_DEFERRED_EOY ) )
if( length( F9_10_LIAB_REV_DEFERRED_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_REV_DEFERRED_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_REV_DEFERRED_EOY <-  paste0( '{', F9_10_LIAB_REV_DEFERRED_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_TAX_EXEMPT_BOND_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-20-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/TaxExemptBondLiabilities/BOY'
V2 <- '//Return/ReturnData/IRS990/TaxExemptBondLiabilities/BOY'
V3 <- '//Return/ReturnData/IRS990/TaxExemptBondLiabilitiesGrp/BOYAmt'
V_LIAB_TAX_EXEMPT_BOND_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_TAX_EXEMPT_BOND_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_TAX_EXEMPT_BOND_BOY ) )
if( length( F9_10_LIAB_TAX_EXEMPT_BOND_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_TAX_EXEMPT_BOND_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_TAX_EXEMPT_BOND_BOY <-  paste0( '{', F9_10_LIAB_TAX_EXEMPT_BOND_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_TAX_EXEMPT_BOND_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-20-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/TaxExemptBondLiabilities/EOY'
V2 <- '//Return/ReturnData/IRS990/TaxExemptBondLiabilities/EOY'
V3 <- '//Return/ReturnData/IRS990/TaxExemptBondLiabilitiesGrp/EOYAmt'
V_LIAB_TAX_EXEMPT_BOND_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_TAX_EXEMPT_BOND_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_TAX_EXEMPT_BOND_EOY ) )
if( length( F9_10_LIAB_TAX_EXEMPT_BOND_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_TAX_EXEMPT_BOND_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_TAX_EXEMPT_BOND_EOY <-  paste0( '{', F9_10_LIAB_TAX_EXEMPT_BOND_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_ESCROW_ACC_BOY
## DESCRIPTION:  Escrow or custodial account liability, beginning of year
## LOCATION:  F990-PC-PART-10-LINE-21-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/EscrowAccountLiability/BOY'
V2 <- '//Return/ReturnData/IRS990/EscrowAccountLiabilityGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/EscrowAccountLiability/BOY'
V_LIAB_ESCROW_ACC_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_ESCROW_ACC_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_ESCROW_ACC_BOY ) )
if( length( F9_10_LIAB_ESCROW_ACC_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_ESCROW_ACC_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_ESCROW_ACC_BOY <-  paste0( '{', F9_10_LIAB_ESCROW_ACC_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_ESCROW_ACC_EOY
## DESCRIPTION:  Escrow or custodial account liability, end of year
## LOCATION:  F990-PC-PART-10-LINE-21-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/EscrowAccountLiability/EOY'
V2 <- '//Return/ReturnData/IRS990/EscrowAccountLiabilityGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/EscrowAccountLiability/EOY'
V_LIAB_ESCROW_ACC_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_ESCROW_ACC_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_ESCROW_ACC_EOY ) )
if( length( F9_10_LIAB_ESCROW_ACC_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_ESCROW_ACC_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_ESCROW_ACC_EOY <-  paste0( '{', F9_10_LIAB_ESCROW_ACC_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_LOAN_OFF_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-22-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/LoansFromOfficersDirectors/BOY'
V2 <- '//Return/ReturnData/IRS990/LoansFromOfficersDirectors/BOY'
V3 <- '//Return/ReturnData/IRS990/LoansFromOfficersDirectorsGrp/BOYAmt'
V_LIAB_LOAN_OFF_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_LOAN_OFF_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_LOAN_OFF_BOY ) )
if( length( F9_10_LIAB_LOAN_OFF_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_LOAN_OFF_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_LOAN_OFF_BOY <-  paste0( '{', F9_10_LIAB_LOAN_OFF_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_LOAN_OFF_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-22-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/LoansFromOfficersDirectors/EOY'
V2 <- '//Return/ReturnData/IRS990/LoansFromOfficersDirectors/EOY'
V3 <- '//Return/ReturnData/IRS990/LoansFromOfficersDirectorsGrp/EOYAmt'
V_LIAB_LOAN_OFF_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_LOAN_OFF_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_LOAN_OFF_EOY ) )
if( length( F9_10_LIAB_LOAN_OFF_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_LOAN_OFF_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_LOAN_OFF_EOY <-  paste0( '{', F9_10_LIAB_LOAN_OFF_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_MTG_NOTE_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-23-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/MortNotesPyblSecuredInvestProp/BOY'
V2 <- '//Return/ReturnData/IRS990/MortgNotesPyblScrdInvstPropGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/MortNotesPyblSecuredInvestProp/BOY'
V_LIAB_MTG_NOTE_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_MTG_NOTE_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_MTG_NOTE_BOY ) )
if( length( F9_10_LIAB_MTG_NOTE_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_MTG_NOTE_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_MTG_NOTE_BOY <-  paste0( '{', F9_10_LIAB_MTG_NOTE_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_MTG_NOTE_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-23-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/MortNotesPyblSecuredInvestProp/EOY'
V2 <- '//Return/ReturnData/IRS990/MortgNotesPyblScrdInvstPropGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/MortNotesPyblSecuredInvestProp/EOY'
V_LIAB_MTG_NOTE_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_MTG_NOTE_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_MTG_NOTE_EOY ) )
if( length( F9_10_LIAB_MTG_NOTE_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_MTG_NOTE_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_MTG_NOTE_EOY <-  paste0( '{', F9_10_LIAB_MTG_NOTE_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_NOTE_UNSEC_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-24-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/UnsecuredNotesLoansPayable/BOY'
V2 <- '//Return/ReturnData/IRS990/UnsecuredNotesLoansPayable/BOY'
V3 <- '//Return/ReturnData/IRS990/UnsecuredNotesLoansPayableGrp/BOYAmt'
V_LIAB_NOTE_UNSEC_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_NOTE_UNSEC_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_NOTE_UNSEC_BOY ) )
if( length( F9_10_LIAB_NOTE_UNSEC_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_NOTE_UNSEC_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_NOTE_UNSEC_BOY <-  paste0( '{', F9_10_LIAB_NOTE_UNSEC_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_NOTE_UNSEC_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-24-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/UnsecuredNotesLoansPayable/EOY'
V2 <- '//Return/ReturnData/IRS990/UnsecuredNotesLoansPayable/EOY'
V3 <- '//Return/ReturnData/IRS990/UnsecuredNotesLoansPayableGrp/EOYAmt'
V_LIAB_NOTE_UNSEC_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_NOTE_UNSEC_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_NOTE_UNSEC_EOY ) )
if( length( F9_10_LIAB_NOTE_UNSEC_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_NOTE_UNSEC_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_NOTE_UNSEC_EOY <-  paste0( '{', F9_10_LIAB_NOTE_UNSEC_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_OTH_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-25-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/OtherLiabilities/BOY'
V2 <- '//Return/ReturnData/IRS990/OtherLiabilities/BOY'
V3 <- '//Return/ReturnData/IRS990/OtherLiabilitiesGrp/BOYAmt'
V_LIAB_OTH_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_OTH_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_OTH_BOY ) )
if( length( F9_10_LIAB_OTH_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_OTH_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_OTH_BOY <-  paste0( '{', F9_10_LIAB_OTH_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_OTH_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-25-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/OtherLiabilities/EOY'
V2 <- '//Return/ReturnData/IRS990/OtherLiabilities/EOY'
V3 <- '//Return/ReturnData/IRS990/OtherLiabilitiesGrp/EOYAmt'
V_LIAB_OTH_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_LIAB_OTH_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_OTH_EOY ) )
if( length( F9_10_LIAB_OTH_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_OTH_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_OTH_EOY <-  paste0( '{', F9_10_LIAB_OTH_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_TOT_BOY
## DESCRIPTION:  Total liabilities, beginning of year
## LOCATION:  F990-EZ-PART-02-LINE-26-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SumOfTotalLiabilities/BOY'
V2 <- '//Return/ReturnData/IRS990EZ/SumOfTotalLiabilitiesGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990EZ/TotalLiabilities/BOY'
V4 <- '//Return/ReturnData/IRS990EZ/TotalLiabilitiesGrp/BOYAmt'
V5 <- '//Return/ReturnData/IRS990/Form990PartX/TotalLiabilities/BOY'
V6 <- '//Return/ReturnData/IRS990/TotalLiabilities/BOY'
V7 <- '//Return/ReturnData/IRS990/TotalLiabilitiesGrp/BOYAmt'
V_LIAB_TOT_BOY <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_10_LIAB_TOT_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_TOT_BOY ) )
if( length( F9_10_LIAB_TOT_BOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_TOT_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_TOT_BOY <-  paste0( '{', F9_10_LIAB_TOT_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_FOLLOW_SFAS117_X
## DESCRIPTION:  Organization does follow SFAS 117
## LOCATION:  F990-PC-PART-10-LINE-26-BTWN-27
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FollowSFAS117'
V2 <- '//Return/ReturnData/IRS990/Form990PartX/FollowSFAS117'
V3 <- '//Return/ReturnData/IRS990/OrganizationFollowsSFAS117Ind'
V_NAFB_FOLLOW_SFAS117_X <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_FOLLOW_SFAS117_X <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_FOLLOW_SFAS117_X ) )
if( length( F9_10_NAFB_FOLLOW_SFAS117_X ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_FOLLOW_SFAS117_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_FOLLOW_SFAS117_X <-  paste0( '{', F9_10_NAFB_FOLLOW_SFAS117_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_LIAB_TOT_EOY
## DESCRIPTION:  Total liabilities, end of year
## LOCATION:  F990-EZ-PART-02-LINE-26-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SumOfTotalLiabilities/EOY'
V2 <- '//Return/ReturnData/IRS990EZ/SumOfTotalLiabilitiesGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990EZ/TotalLiabilities/EOY'
V4 <- '//Return/ReturnData/IRS990EZ/TotalLiabilitiesGrp/EOYAmt'
V5 <- '//Return/ReturnData/IRS990/Form990PartX/TotalLiabilities/EOY'
V6 <- '//Return/ReturnData/IRS990/TotalLiabilities/EOY'
V7 <- '//Return/ReturnData/IRS990/TotalLiabilitiesGrp/EOYAmt'
V_LIAB_TOT_EOY <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_10_LIAB_TOT_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_TOT_EOY ) )
if( length( F9_10_LIAB_TOT_EOY ) > 1 )
{ 
  create_record( varname=F9_10_LIAB_TOT_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_LIAB_TOT_EOY <-  paste0( '{', F9_10_LIAB_TOT_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_UNRESTRICT_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-27-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/UnrestrictedNetAssets/BOY'
V2 <- '//Return/ReturnData/IRS990/UnrestrictedNetAssets/BOY'
V3 <- '//Return/ReturnData/IRS990/UnrestrictedNetAssetsGrp/BOYAmt'
V_NAFB_UNRESTRICT_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_UNRESTRICT_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_UNRESTRICT_BOY ) )
if( length( F9_10_NAFB_UNRESTRICT_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_UNRESTRICT_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_UNRESTRICT_BOY <-  paste0( '{', F9_10_NAFB_UNRESTRICT_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_UNRESTRICT_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-27-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/UnrestrictedNetAssets/EOY'
V2 <- '//Return/ReturnData/IRS990/UnrestrictedNetAssets/EOY'
V3 <- '//Return/ReturnData/IRS990/UnrestrictedNetAssetsGrp/EOYAmt'
V_NAFB_UNRESTRICT_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_UNRESTRICT_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_UNRESTRICT_EOY ) )
if( length( F9_10_NAFB_UNRESTRICT_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_UNRESTRICT_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_UNRESTRICT_EOY <-  paste0( '{', F9_10_NAFB_UNRESTRICT_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_RESTRICT_TEMP_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-28-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/TemporarilyRestrictedNetAssets/BOY'
V2 <- '//Return/ReturnData/IRS990/TemporarilyRestrictedNetAssets/BOY'
V3 <- '//Return/ReturnData/IRS990/TemporarilyRstrNetAssetsGrp/BOYAmt'
V_NAFB_RESTRICT_TEMP_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_RESTRICT_TEMP_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_RESTRICT_TEMP_BOY ) )
if( length( F9_10_NAFB_RESTRICT_TEMP_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_RESTRICT_TEMP_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_RESTRICT_TEMP_BOY <-  paste0( '{', F9_10_NAFB_RESTRICT_TEMP_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_RESTRICT_TEMP_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-28-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/TemporarilyRestrictedNetAssets/EOY'
V2 <- '//Return/ReturnData/IRS990/TemporarilyRestrictedNetAssets/EOY'
V3 <- '//Return/ReturnData/IRS990/TemporarilyRstrNetAssetsGrp/EOYAmt'
V_NAFB_RESTRICT_TEMP_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_RESTRICT_TEMP_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_RESTRICT_TEMP_EOY ) )
if( length( F9_10_NAFB_RESTRICT_TEMP_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_RESTRICT_TEMP_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_RESTRICT_TEMP_EOY <-  paste0( '{', F9_10_NAFB_RESTRICT_TEMP_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_RESTRICT_PERM_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-29-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PermanentlyRestrictedNetAssets/BOY'
V2 <- '//Return/ReturnData/IRS990/PermanentlyRestrictedNetAssets/BOY'
V3 <- '//Return/ReturnData/IRS990/PermanentlyRstrNetAssetsGrp/BOYAmt'
V_NAFB_RESTRICT_PERM_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_RESTRICT_PERM_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_RESTRICT_PERM_BOY ) )
if( length( F9_10_NAFB_RESTRICT_PERM_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_RESTRICT_PERM_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_RESTRICT_PERM_BOY <-  paste0( '{', F9_10_NAFB_RESTRICT_PERM_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_NO_FOLLOW_SFAS117_X
## DESCRIPTION:  Organization does not follow SFAS 117
## LOCATION:  F990-PC-PART-10-LINE-29-BTWN-30
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DoNotFollowSFAS117'
V2 <- '//Return/ReturnData/IRS990/Form990PartX/DoNotFollowSFAS117'
V3 <- '//Return/ReturnData/IRS990/OrgDoesNotFollowSFAS117Ind'
V4 <- '//Return/ReturnData/IRS990/OrgDoesNotFollowSFAS117'
V_NAFB_NO_FOLLOW_SFAS117_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_10_NAFB_NO_FOLLOW_SFAS117_X <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_NO_FOLLOW_SFAS117_X ) )
if( length( F9_10_NAFB_NO_FOLLOW_SFAS117_X ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_NO_FOLLOW_SFAS117_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_NO_FOLLOW_SFAS117_X <-  paste0( '{', F9_10_NAFB_NO_FOLLOW_SFAS117_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_RESTRICT_PERM_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-29-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PermanentlyRestrictedNetAssets/EOY'
V2 <- '//Return/ReturnData/IRS990/PermanentlyRestrictedNetAssets/EOY'
V3 <- '//Return/ReturnData/IRS990/PermanentlyRstrNetAssetsGrp/EOYAmt'
V_NAFB_RESTRICT_PERM_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_RESTRICT_PERM_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_RESTRICT_PERM_EOY ) )
if( length( F9_10_NAFB_RESTRICT_PERM_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_RESTRICT_PERM_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_RESTRICT_PERM_EOY <-  paste0( '{', F9_10_NAFB_RESTRICT_PERM_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_CAP_STCK_BOY
## DESCRIPTION:  Capital stock or trust principal, or current funds, beginning of year
## LOCATION:  F990-PC-PART-10-LINE-30-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CapStckTrstPrinCurrentFunds/BOY'
V2 <- '//Return/ReturnData/IRS990/CapStkTrPrinCurrentFundsGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/CapStckTrstPrinCurrentFunds/BOY'
V_NAFB_CAP_STCK_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_CAP_STCK_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_CAP_STCK_BOY ) )
if( length( F9_10_NAFB_CAP_STCK_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_CAP_STCK_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_CAP_STCK_BOY <-  paste0( '{', F9_10_NAFB_CAP_STCK_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_CAP_STCK_EOY
## DESCRIPTION:  Capital stock or trust principal, or current funds, end of year
## LOCATION:  F990-PC-PART-10-LINE-30-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CapStckTrstPrinCurrentFunds/EOY'
V2 <- '//Return/ReturnData/IRS990/CapStkTrPrinCurrentFundsGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartX/CapStckTrstPrinCurrentFunds/EOY'
V_NAFB_CAP_STCK_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_CAP_STCK_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_CAP_STCK_EOY ) )
if( length( F9_10_NAFB_CAP_STCK_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_CAP_STCK_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_CAP_STCK_EOY <-  paste0( '{', F9_10_NAFB_CAP_STCK_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_CAP_SURPLUS_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-31-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PaidInCapSrplsLandBldgEqpFund/BOY'
V2 <- '//Return/ReturnData/IRS990/PaidInCapSrplsLandBldgEqpFund/BOY'
V3 <- '//Return/ReturnData/IRS990/PdInCapSrplsLandBldgEqpFundGrp/BOYAmt'
V_NAFB_CAP_SURPLUS_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_CAP_SURPLUS_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_CAP_SURPLUS_BOY ) )
if( length( F9_10_NAFB_CAP_SURPLUS_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_CAP_SURPLUS_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_CAP_SURPLUS_BOY <-  paste0( '{', F9_10_NAFB_CAP_SURPLUS_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_CAP_SURPLUS_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-31-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/PaidInCapSrplsLandBldgEqpFund/EOY'
V2 <- '//Return/ReturnData/IRS990/PaidInCapSrplsLandBldgEqpFund/EOY'
V3 <- '//Return/ReturnData/IRS990/PdInCapSrplsLandBldgEqpFundGrp/EOYAmt'
V_NAFB_CAP_SURPLUS_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_CAP_SURPLUS_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_CAP_SURPLUS_EOY ) )
if( length( F9_10_NAFB_CAP_SURPLUS_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_CAP_SURPLUS_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_CAP_SURPLUS_EOY <-  paste0( '{', F9_10_NAFB_CAP_SURPLUS_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_EARNING_RETAINED_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-32-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/RetainedEarningsEndowmentEtc/BOY'
V2 <- '//Return/ReturnData/IRS990/RetainedEarningsEndowmentEtc/BOY'
V3 <- '//Return/ReturnData/IRS990/RtnEarnEndowmentIncmOthFndsGrp/BOYAmt'
V_NAFB_EARNING_RETAINED_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_EARNING_RETAINED_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_EARNING_RETAINED_BOY ) )
if( length( F9_10_NAFB_EARNING_RETAINED_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_EARNING_RETAINED_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_EARNING_RETAINED_BOY <-  paste0( '{', F9_10_NAFB_EARNING_RETAINED_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_EARNING_RETAINED_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-32-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/RetainedEarningsEndowmentEtc/EOY'
V2 <- '//Return/ReturnData/IRS990/RetainedEarningsEndowmentEtc/EOY'
V3 <- '//Return/ReturnData/IRS990/RtnEarnEndowmentIncmOthFndsGrp/EOYAmt'
V_NAFB_EARNING_RETAINED_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_EARNING_RETAINED_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_EARNING_RETAINED_EOY ) )
if( length( F9_10_NAFB_EARNING_RETAINED_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_EARNING_RETAINED_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_EARNING_RETAINED_EOY <-  paste0( '{', F9_10_NAFB_EARNING_RETAINED_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_TOT_BOY
## DESCRIPTION:  Net assets or fund balances, beginning of year
## LOCATION:  F990-EZ-PART-02-LINE-27-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalances/BOY'
V2 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalancesGrp/BOYAmt'
V3 <- '//Return/ReturnData/IRS990EZ/TotalNetAssetsFundBalanceGrp/BOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/TotalNetAssetsFundBalances/BOY'
V5 <- '//Return/ReturnData/IRS990/Form990PartX/TotalNetAssetsFundBalances/BOY'
V6 <- '//Return/ReturnData/IRS990/TotalNetAssetsFundBalanceGrp/BOYAmt'
V7 <- '//Return/ReturnData/IRS990/TotalNetAssetsFundBalances/BOY'
V_NAFB_TOT_BOY <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_10_NAFB_TOT_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_TOT_BOY ) )
if( length( F9_10_NAFB_TOT_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_TOT_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_TOT_BOY <-  paste0( '{', F9_10_NAFB_TOT_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_TOT_EOY
## DESCRIPTION:  Net assets or fund balances, end of year
## LOCATION:  F990-EZ-PART-02-LINE-27-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalances/EOY'
V2 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalancesGrp/EOYAmt'
V3 <- '//Return/ReturnData/IRS990EZ/TotalNetAssetsFundBalanceGrp/EOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/TotalNetAssetsFundBalances/EOY'
V5 <- '//Return/ReturnData/IRS990/Form990PartX/TotalNetAssetsFundBalances/EOY'
V6 <- '//Return/ReturnData/IRS990/TotalNetAssetsFundBalanceGrp/EOYAmt'
V7 <- '//Return/ReturnData/IRS990/TotalNetAssetsFundBalances/EOY'
V_NAFB_TOT_EOY <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_10_NAFB_TOT_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_TOT_EOY ) )
if( length( F9_10_NAFB_TOT_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_TOT_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_TOT_EOY <-  paste0( '{', F9_10_NAFB_TOT_EOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_TOT_LIAB_NAFB_BOY
## DESCRIPTION:  Beginnning of year
## LOCATION:  F990-PC-PART-10-LINE-34-BOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/TotalLiabNetAssetsFundBalances/BOY'
V2 <- '//Return/ReturnData/IRS990/TotalLiabNetAssetsFundBalances/BOY'
V3 <- '//Return/ReturnData/IRS990/TotLiabNetAssetsFundBalanceGrp/BOYAmt'
V_NAFB_TOT_LIAB_NAFB_BOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_TOT_LIAB_NAFB_BOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_TOT_LIAB_NAFB_BOY ) )
if( length( F9_10_NAFB_TOT_LIAB_NAFB_BOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_TOT_LIAB_NAFB_BOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_TOT_LIAB_NAFB_BOY <-  paste0( '{', F9_10_NAFB_TOT_LIAB_NAFB_BOY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_10_NAFB_TOT_LIAB_NAFB_EOY
## DESCRIPTION:  Ending of year
## LOCATION:  F990-PC-PART-10-LINE-34-EOY
## TABLE:  F9-P10-T00-BALANCE-SHEET
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartX/TotalLiabNetAssetsFundBalances/EOY'
V2 <- '//Return/ReturnData/IRS990/TotalLiabNetAssetsFundBalances/EOY'
V3 <- '//Return/ReturnData/IRS990/TotLiabNetAssetsFundBalanceGrp/EOYAmt'
V_NAFB_TOT_LIAB_NAFB_EOY <- paste( V1, V2, V3 , sep='|' )
F9_10_NAFB_TOT_LIAB_NAFB_EOY <- xml2::xml_text( xml2::xml_find_all( doc, V_NAFB_TOT_LIAB_NAFB_EOY ) )
if( length( F9_10_NAFB_TOT_LIAB_NAFB_EOY ) > 1 )
{ 
  create_record( varname=F9_10_NAFB_TOT_LIAB_NAFB_EOY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_10_NAFB_TOT_LIAB_NAFB_EOY <-  paste0( '{', F9_10_NAFB_TOT_LIAB_NAFB_EOY, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_10_INFO_SCHED_O_X,F9_10_ASSET_CASH_SAVING_BOY,F9_10_ASSET_CASH_SAVING_EOY,F9_10_ASSET_CASH_BOY,F9_10_ASSET_CASH_EOY,F9_10_ASSET_SAVING_BOY,F9_10_ASSET_SAVING_EOY,F9_10_ASSET_PLEDGE_NET_BOY,F9_10_ASSET_PLEDGE_NET_EOY,F9_10_ASSET_ACC_NET_BOY,F9_10_ASSET_ACC_NET_EOY,F9_10_ASSET_LOAN_OFF_BOY,F9_10_ASSET_LOAN_OFF_EOY,F9_10_ASSET_LOAN_DSQ_PERS_BOY,F9_10_ASSET_LOAN_DSQ_PERS_EOY,F9_10_ASSET_NOTE_LOAN_NET_BOY,F9_10_ASSET_NOTE_LOAN_NET_EOY,F9_10_ASSET_INV_SALE_BOY,F9_10_ASSET_INV_SALE_EOY,F9_10_ASSET_EXP_PREPAID_BOY,F9_10_ASSET_EXP_PREPAID_EOY,F9_10_ASSET_LAND_BLDG,F9_10_ASSET_LAND_BLDG_BOY,F9_10_ASSET_LAND_BLDG_EOY,F9_10_ASSET_LAND_BLDG_DEPREC,F9_10_ASSET_LAND_BLDG_NET_BOY,F9_10_ASSET_LAND_BLDG_NET_EOY,F9_10_ASSET_INVEST_SEC_BOY,F9_10_ASSET_INVEST_SEC_EOY,F9_10_ASSET_INVEST_SEC_OTH_BOY,F9_10_ASSET_INVEST_SEC_OTH_EOY,F9_10_ASSET_INVEST_PROG_RLTD_BOY,F9_10_ASSET_INVEST_PROG_RLTD_EOY,F9_10_ASSET_INTANGIBLE_BOY,F9_10_ASSET_INTANGIBLE_EOY,F9_10_ASSET_OTH_BOY,F9_10_ASSET_OTH_BOY_V2,F9_10_ASSET_OTH_EOY,F9_10_ASSET_OTH_EOY_V2,F9_10_ASSET_TOT_BOY,F9_10_ASSET_TOT_EOY,F9_10_LIAB_ACC_PAYABLE_BOY,F9_10_LIAB_ACC_PAYABLE_EOY,F9_10_LIAB_GRANT_PAYABLE_BOY,F9_10_LIAB_GRANT_PAYABLE_EOY,F9_10_LIAB_REV_DEFERRED_BOY,F9_10_LIAB_REV_DEFERRED_EOY,F9_10_LIAB_TAX_EXEMPT_BOND_BOY,F9_10_LIAB_TAX_EXEMPT_BOND_EOY,F9_10_LIAB_ESCROW_ACC_BOY,F9_10_LIAB_ESCROW_ACC_EOY,F9_10_LIAB_LOAN_OFF_BOY,F9_10_LIAB_LOAN_OFF_EOY,F9_10_LIAB_MTG_NOTE_BOY,F9_10_LIAB_MTG_NOTE_EOY,F9_10_LIAB_NOTE_UNSEC_BOY,F9_10_LIAB_NOTE_UNSEC_EOY,F9_10_LIAB_OTH_BOY,F9_10_LIAB_OTH_EOY,F9_10_LIAB_TOT_BOY,F9_10_NAFB_FOLLOW_SFAS117_X,F9_10_LIAB_TOT_EOY,F9_10_NAFB_UNRESTRICT_BOY,F9_10_NAFB_UNRESTRICT_EOY,F9_10_NAFB_RESTRICT_TEMP_BOY,F9_10_NAFB_RESTRICT_TEMP_EOY,F9_10_NAFB_RESTRICT_PERM_BOY,F9_10_NAFB_NO_FOLLOW_SFAS117_X,F9_10_NAFB_RESTRICT_PERM_EOY,F9_10_NAFB_CAP_STCK_BOY,F9_10_NAFB_CAP_STCK_EOY,F9_10_NAFB_CAP_SURPLUS_BOY,F9_10_NAFB_CAP_SURPLUS_EOY,F9_10_NAFB_EARNING_RETAINED_BOY,F9_10_NAFB_EARNING_RETAINED_EOY,F9_10_NAFB_TOT_BOY,F9_10_NAFB_TOT_EOY,F9_10_NAFB_TOT_LIAB_NAFB_BOY,F9_10_NAFB_TOT_LIAB_NAFB_EOY)
df <- as.data.frame( var.list )


return( df )


}


