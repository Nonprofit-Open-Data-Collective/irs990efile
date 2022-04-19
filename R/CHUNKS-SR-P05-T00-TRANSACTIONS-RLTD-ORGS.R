#' @title 
#'   Build table SR-P05-T00-TRANSACTIONS-RLTD-ORGS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SR_P05_T00_TRANSACTIONS_RLTD_ORGS <- function( doc, url )
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


## VARIABLE NAME:  SR_05_TRANSAC_RCPT_INT_X
## DESCRIPTION:  Receipt of interest; annuities; rents; royalties?
## LOCATION:  SCHED-R-PART-05-LINE-01A
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/ReceiptOfIntAnnRentsRoyalties'
V2 <- '//Return/ReturnData/IRS990ScheduleR/ReceiptOfIntAnnRentsRoyalties'
V3 <- '//Return/ReturnData/IRS990ScheduleR/ReceiptOfIntAnntsRntsRyltsInd'
V_TRANSAC_RCPT_INT_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_RCPT_INT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_RCPT_INT_X ) )
if( length( SR_05_TRANSAC_RCPT_INT_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_RCPT_INT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_RCPT_INT_X <-  paste0( '{', SR_05_TRANSAC_RCPT_INT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_GIFT_GRANT_TO_X
## DESCRIPTION:  Gift; grant; or capital contribution to other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01B
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/GiftGrantOrCapContrToOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/GiftGrantOrCapContrToOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/GiftGrntOrCapContriToOthOrgInd'
V_TRANSAC_GIFT_GRANT_TO_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_GIFT_GRANT_TO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_GIFT_GRANT_TO_X ) )
if( length( SR_05_TRANSAC_GIFT_GRANT_TO_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_GIFT_GRANT_TO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_GIFT_GRANT_TO_X <-  paste0( '{', SR_05_TRANSAC_GIFT_GRANT_TO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_GIFT_GRANT_FROM_X
## DESCRIPTION:  Gift; grant; or capital contribution from other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01C
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/GiftGrantOrCapContrFrOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/GiftGrantOrCapContrFrOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/GiftGrntCapContriFromOthOrgInd'
V_TRANSAC_GIFT_GRANT_FROM_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_GIFT_GRANT_FROM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_GIFT_GRANT_FROM_X ) )
if( length( SR_05_TRANSAC_GIFT_GRANT_FROM_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_GIFT_GRANT_FROM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_GIFT_GRANT_FROM_X <-  paste0( '{', SR_05_TRANSAC_GIFT_GRANT_FROM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_LOAN_TO_X
## DESCRIPTION:  Loans or loan guarantees to or for other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01D
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/LoansOrGuaranteesToOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/LoansOrGuaranteesToOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/LoansOrGuaranteesToOtherOrgInd'
V_TRANSAC_LOAN_TO_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_LOAN_TO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_LOAN_TO_X ) )
if( length( SR_05_TRANSAC_LOAN_TO_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_LOAN_TO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_LOAN_TO_X <-  paste0( '{', SR_05_TRANSAC_LOAN_TO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_LOAN_BY_X
## DESCRIPTION:  Loans or loan guarantees by other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01E
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/LoansOrGuaranteesFromOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/LoansOrGuaranteesFromOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/LoansOrGuaranteesFromOthOrgInd'
V_TRANSAC_LOAN_BY_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_LOAN_BY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_LOAN_BY_X ) )
if( length( SR_05_TRANSAC_LOAN_BY_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_LOAN_BY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_LOAN_BY_X <-  paste0( '{', SR_05_TRANSAC_LOAN_BY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_DIVIDEND_X
## DESCRIPTION:  Dividends from related organization(s)? (Y-N)
## LOCATION:  SCHED-R-PART-05-LINE-01F
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/DivRelatedOrganizationInd'
V2 <- '//Return/ReturnData/IRS990ScheduleR/DividendsRelatedOrganization'
V_TRANSAC_DIVIDEND_X <- paste( V1, V2 , sep='|' )
SR_05_TRANSAC_DIVIDEND_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_DIVIDEND_X ) )
if( length( SR_05_TRANSAC_DIVIDEND_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_DIVIDEND_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_DIVIDEND_X <-  paste0( '{', SR_05_TRANSAC_DIVIDEND_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_SALE_ASSET_X
## DESCRIPTION:  Sale of assets to other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01G
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/AssetSaleToOtherOrgInd'
V2 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/SaleOfAssetsToOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/SaleOfAssetsToOtherOrg'
V_TRANSAC_SALE_ASSET_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_SALE_ASSET_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_SALE_ASSET_X ) )
if( length( SR_05_TRANSAC_SALE_ASSET_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_SALE_ASSET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_SALE_ASSET_X <-  paste0( '{', SR_05_TRANSAC_SALE_ASSET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_PURCHASE_ASSET_X
## DESCRIPTION:  Purchase of assets from other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01H
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/AssetPurchaseFromOtherOrgInd'
V2 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/PurchaseOfAssetsFromOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/PurchaseOfAssetsFromOtherOrg'
V_TRANSAC_PURCHASE_ASSET_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_PURCHASE_ASSET_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_PURCHASE_ASSET_X ) )
if( length( SR_05_TRANSAC_PURCHASE_ASSET_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_PURCHASE_ASSET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_PURCHASE_ASSET_X <-  paste0( '{', SR_05_TRANSAC_PURCHASE_ASSET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_EXCHANGE_ASSET_X
## DESCRIPTION:  Exchange of assets?
## LOCATION:  SCHED-R-PART-05-LINE-01I
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/AssetExchangeInd'
V2 <- '//Return/ReturnData/IRS990ScheduleR/ExchangeOfAssets'
V3 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/ExchangeOfAssets'
V_TRANSAC_EXCHANGE_ASSET_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_EXCHANGE_ASSET_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_EXCHANGE_ASSET_X ) )
if( length( SR_05_TRANSAC_EXCHANGE_ASSET_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_EXCHANGE_ASSET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_EXCHANGE_ASSET_X <-  paste0( '{', SR_05_TRANSAC_EXCHANGE_ASSET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_LEASE_TO_X
## DESCRIPTION:  Lease of facilities; equipment; or other assets to other organizations?
## LOCATION:  SCHED-R-PART-05-LINE-01J
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/RentalOfFacilitiesToOtherOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleR/RentalOfFacilitiesToOtherOrgs'
V3 <- '//Return/ReturnData/IRS990ScheduleR/RentalOfFacilitiesToOthOrgInd'
V_TRANSAC_LEASE_TO_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_LEASE_TO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_LEASE_TO_X ) )
if( length( SR_05_TRANSAC_LEASE_TO_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_LEASE_TO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_LEASE_TO_X <-  paste0( '{', SR_05_TRANSAC_LEASE_TO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_LEASE_FROM_X
## DESCRIPTION:  Lease of facilities; equipment; or other assets from other organizations?
## LOCATION:  SCHED-R-PART-05-LINE-01K
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/RentalOfFacilitiesFrOtherOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleR/RentalOfFacilitiesFrOtherOrgs'
V3 <- '//Return/ReturnData/IRS990ScheduleR/RentalOfFcltsFromOthOrgInd'
V_TRANSAC_LEASE_FROM_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_LEASE_FROM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_LEASE_FROM_X ) )
if( length( SR_05_TRANSAC_LEASE_FROM_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_LEASE_FROM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_LEASE_FROM_X <-  paste0( '{', SR_05_TRANSAC_LEASE_FROM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_PERFORM_SVC_FOR_X
## DESCRIPTION:  Performance of services or membership or fundraising solicitations for other organizations?
## LOCATION:  SCHED-R-PART-05-LINE-01L
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/PerformOfServicesForOtherOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleR/PerformOfServicesForOtherOrgs'
V3 <- '//Return/ReturnData/IRS990ScheduleR/PerformOfServicesForOthOrgInd'
V_TRANSAC_PERFORM_SVC_FOR_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_PERFORM_SVC_FOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_PERFORM_SVC_FOR_X ) )
if( length( SR_05_TRANSAC_PERFORM_SVC_FOR_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_PERFORM_SVC_FOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_PERFORM_SVC_FOR_X <-  paste0( '{', SR_05_TRANSAC_PERFORM_SVC_FOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_PERFORM_SVC_BY_X
## DESCRIPTION:  Performance of services or membership or fundraising solicitations by other organizations?
## LOCATION:  SCHED-R-PART-05-LINE-01M
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/PerformOfServicesByOtherOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleR/PerformOfServicesByOtherOrgInd'
V3 <- '//Return/ReturnData/IRS990ScheduleR/PerformOfServicesByOtherOrgs'
V_TRANSAC_PERFORM_SVC_BY_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_PERFORM_SVC_BY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_PERFORM_SVC_BY_X ) )
if( length( SR_05_TRANSAC_PERFORM_SVC_BY_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_PERFORM_SVC_BY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_PERFORM_SVC_BY_X <-  paste0( '{', SR_05_TRANSAC_PERFORM_SVC_BY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_SHARE_FACILITIES_X
## DESCRIPTION:  Sharing of facilities; equipment; mailing lists; other assets; or employees?
## LOCATION:  SCHED-R-PART-05-LINE-01N
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/SharingOfFacilities'
V2 <- '//Return/ReturnData/IRS990ScheduleR/SharingOfFacilities'
V3 <- '//Return/ReturnData/IRS990ScheduleR/SharingOfFacilitiesInd'
V_TRANSAC_SHARE_FACILITIES_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_SHARE_FACILITIES_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_SHARE_FACILITIES_X ) )
if( length( SR_05_TRANSAC_SHARE_FACILITIES_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_SHARE_FACILITIES_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_SHARE_FACILITIES_X <-  paste0( '{', SR_05_TRANSAC_SHARE_FACILITIES_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_SHARE_PAID_EMPL_X
## DESCRIPTION:  Sharing of paid employees?
## LOCATION:  SCHED-R-PART-05-LINE-01O
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/SharingOfPaidEmployees'
V2 <- '//Return/ReturnData/IRS990ScheduleR/PaidEmployeesSharingInd'
V3 <- '//Return/ReturnData/IRS990ScheduleR/SharingOfPaidEmployees'
V_TRANSAC_SHARE_PAID_EMPL_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_SHARE_PAID_EMPL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_SHARE_PAID_EMPL_X ) )
if( length( SR_05_TRANSAC_SHARE_PAID_EMPL_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_SHARE_PAID_EMPL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_SHARE_PAID_EMPL_X <-  paste0( '{', SR_05_TRANSAC_SHARE_PAID_EMPL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_REIMBURSEMENT_TO_X
## DESCRIPTION:  Reimbursement paid to other organization for expenses?
## LOCATION:  SCHED-R-PART-05-LINE-01P
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/ReimbursementPaidToOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/ReimbursementPaidToOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/ReimbursementPaidToOtherOrgInd'
V_TRANSAC_REIMBURSEMENT_TO_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_REIMBURSEMENT_TO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_REIMBURSEMENT_TO_X ) )
if( length( SR_05_TRANSAC_REIMBURSEMENT_TO_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_REIMBURSEMENT_TO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_REIMBURSEMENT_TO_X <-  paste0( '{', SR_05_TRANSAC_REIMBURSEMENT_TO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_REIMBURSEMENT_BY_X
## DESCRIPTION:  Reimbursement paid by other organization for expenses?
## LOCATION:  SCHED-R-PART-05-LINE-01Q
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/ReimbursementPaidByOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/ReimbursementPaidByOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/ReimbursementPaidByOtherOrgInd'
V_TRANSAC_REIMBURSEMENT_BY_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_REIMBURSEMENT_BY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_REIMBURSEMENT_BY_X ) )
if( length( SR_05_TRANSAC_REIMBURSEMENT_BY_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_REIMBURSEMENT_BY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_REIMBURSEMENT_BY_X <-  paste0( '{', SR_05_TRANSAC_REIMBURSEMENT_BY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_OTH_CASH_TO_X
## DESCRIPTION:  Other transfer of cash or property to other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01R
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/OtherTransferToOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/OtherTransferToOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/TransferToOtherOrgInd'
V_TRANSAC_OTH_CASH_TO_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_OTH_CASH_TO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_OTH_CASH_TO_X ) )
if( length( SR_05_TRANSAC_OTH_CASH_TO_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_OTH_CASH_TO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_OTH_CASH_TO_X <-  paste0( '{', SR_05_TRANSAC_OTH_CASH_TO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SR_05_TRANSAC_OTH_CASH_FROM_X
## DESCRIPTION:  Other transfer of cash or property from other organization?
## LOCATION:  SCHED-R-PART-05-LINE-01S
## TABLE:  SR-P05-T00-TRANSACTIONS-RLTD-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleR/Form990ScheduleRPartV/OtherTransferFromOtherOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleR/OtherTransferFromOtherOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleR/TransferFromOtherOrgInd'
V_TRANSAC_OTH_CASH_FROM_X <- paste( V1, V2, V3 , sep='|' )
SR_05_TRANSAC_OTH_CASH_FROM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_OTH_CASH_FROM_X ) )
if( length( SR_05_TRANSAC_OTH_CASH_FROM_X ) > 1 )
{ 
  create_record( varname=SR_05_TRANSAC_OTH_CASH_FROM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SR_05_TRANSAC_OTH_CASH_FROM_X <-  paste0( '{', SR_05_TRANSAC_OTH_CASH_FROM_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SR_05_TRANSAC_RCPT_INT_X,SR_05_TRANSAC_GIFT_GRANT_TO_X,SR_05_TRANSAC_GIFT_GRANT_FROM_X,SR_05_TRANSAC_LOAN_TO_X,SR_05_TRANSAC_LOAN_BY_X,SR_05_TRANSAC_DIVIDEND_X,SR_05_TRANSAC_SALE_ASSET_X,SR_05_TRANSAC_PURCHASE_ASSET_X,SR_05_TRANSAC_EXCHANGE_ASSET_X,SR_05_TRANSAC_LEASE_TO_X,SR_05_TRANSAC_LEASE_FROM_X,SR_05_TRANSAC_PERFORM_SVC_FOR_X,SR_05_TRANSAC_PERFORM_SVC_BY_X,SR_05_TRANSAC_SHARE_FACILITIES_X,SR_05_TRANSAC_SHARE_PAID_EMPL_X,SR_05_TRANSAC_REIMBURSEMENT_TO_X,SR_05_TRANSAC_REIMBURSEMENT_BY_X,SR_05_TRANSAC_OTH_CASH_TO_X,SR_05_TRANSAC_OTH_CASH_FROM_X)
df <- as.data.frame( var.list )


return( df )


}


