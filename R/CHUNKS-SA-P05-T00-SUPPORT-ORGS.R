#' @title 
#'   Build table SA-P05-T00-SUPPORT-ORGS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P05_T00_SUPPORT_ORGS <- function( doc, url )
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


## VARIABLE NAME:  SA_05_TRUST_INTEGRAL_PART_TEST_X
## DESCRIPTION:  Organization satisfied Integral Part Test as qualifying trust
## LOCATION:  SCHED-A-PART-05-LINE-01
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_05_TRUST_INTEGRAL_PART_TEST_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/TrustIntegralPartTestInd' ) )
if( length( SA_05_TRUST_INTEGRAL_PART_TEST_X ) > 1 )
{ 
  create_record( varname=SA_05_TRUST_INTEGRAL_PART_TEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_TRUST_INTEGRAL_PART_TEST_X <-  paste0( '{', SA_05_TRUST_INTEGRAL_PART_TEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_CAP_GAIN_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-01-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_CAP_GAIN_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/NetSTCapitalGainAdjNetIncmGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_CAP_GAIN_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_CAP_GAIN_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_CAP_GAIN_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_CAP_GAIN_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_CAP_GAIN_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-01-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_CAP_GAIN_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/NetSTCapitalGainAdjNetIncmGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_CAP_GAIN_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_CAP_GAIN_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_CAP_GAIN_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_CAP_GAIN_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_RECOVERY_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-02-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_RECOVERY_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/RecoveriesPYDistributionsGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_RECOVERY_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_RECOVERY_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_RECOVERY_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_RECOVERY_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_RECOVERY_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-02-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_RECOVERY_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/RecoveriesPYDistributionsGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_RECOVERY_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_RECOVERY_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_RECOVERY_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_RECOVERY_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_OTH_GRO_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-03-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_OTH_GRO_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/OtherGrossIncomeGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_OTH_GRO_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_OTH_GRO_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_OTH_GRO_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_OTH_GRO_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_OTH_GRO_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-03-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_OTH_GRO_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/OtherGrossIncomeGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_OTH_GRO_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_OTH_GRO_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_OTH_GRO_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_OTH_GRO_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_ADD_L123_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-04-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_ADD_L123_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/AdjustedGrossIncomeGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_ADD_L123_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_ADD_L123_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_ADD_L123_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_ADD_L123_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_ADD_L123_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-04-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_ADD_L123_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/AdjustedGrossIncomeGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_ADD_L123_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_ADD_L123_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_ADD_L123_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_ADD_L123_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_DEPREC_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-05-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_DEPREC_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/DepreciationDepletionGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_DEPREC_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_DEPREC_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_DEPREC_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_DEPREC_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_DEPREC_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-05-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_DEPREC_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/DepreciationDepletionGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_DEPREC_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_DEPREC_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_DEPREC_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_DEPREC_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_PRODUCT_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-06-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_PRODUCT_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/ProductionIncomeGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_PRODUCT_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_PRODUCT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_PRODUCT_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_PRODUCT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_PRODUCT_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-06-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_PRODUCT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/ProductionIncomeGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_PRODUCT_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_PRODUCT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_PRODUCT_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_PRODUCT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_EXP_OTH_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-07-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_EXP_OTH_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/OtherExpensesGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_EXP_OTH_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_EXP_OTH_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_EXP_OTH_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_EXP_OTH_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_EXP_OTH_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-07-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_EXP_OTH_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/OtherExpensesGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_EXP_OTH_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_EXP_OTH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_EXP_OTH_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_EXP_OTH_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_TOT_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-08-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_TOT_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/TotalAdjustedNetIncomeGrp/PriorYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_TOT_PY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_TOT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_TOT_PY <-  paste0( '{', SA_05_NETINCOME_ADJ_TOT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_NETINCOME_ADJ_TOT_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-A-LINE-08-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_NETINCOME_ADJ_TOT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/AdjustedNetIncomeGrp/TotalAdjustedNetIncomeGrp/CurrentYearAmt' ) )
if( length( SA_05_NETINCOME_ADJ_TOT_CY ) > 1 )
{ 
  create_record( varname=SA_05_NETINCOME_ADJ_TOT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_NETINCOME_ADJ_TOT_CY <-  paste0( '{', SA_05_NETINCOME_ADJ_TOT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_SEC_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01A-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_SEC_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AverageMonthlyFMVOfSecGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_SEC_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_SEC_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_SEC_PY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_SEC_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_SEC_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01A-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_SEC_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AverageMonthlyFMVOfSecGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_SEC_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_SEC_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_SEC_CY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_SEC_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_CASH_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01B-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_CASH_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AverageMonthlyCashBalancesGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_CASH_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_CASH_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_CASH_PY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_CASH_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_CASH_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01B-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_CASH_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AverageMonthlyCashBalancesGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_CASH_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_CASH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_CASH_CY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_CASH_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_OTH_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01C-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_OTH_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/FMVOtherNonExemptUseAssetGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_OTH_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_OTH_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_OTH_PY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_OTH_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_OTH_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01C-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_OTH_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/FMVOtherNonExemptUseAssetGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_OTH_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_OTH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_OTH_CY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_OTH_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_TOT_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01D-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_TOT_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/TotalFMVOfNonExemptUseAssetGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_TOT_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_TOT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_TOT_PY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_TOT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_TOT_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01D-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_TOT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/TotalFMVOfNonExemptUseAssetGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_TOT_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_TOT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_TOT_CY <-  paste0( '{', SA_05_ASSET_MINIM_FMV_TOT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_FMV_DISCOUNT
## DESCRIPTION:  Discount claimed for blockage or other factors
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-01E
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_FMV_DISCOUNT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/DiscountClaimedAmt' ) )
if( length( SA_05_ASSET_MINIM_FMV_DISCOUNT ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_FMV_DISCOUNT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_FMV_DISCOUNT <-  paste0( '{', SA_05_ASSET_MINIM_FMV_DISCOUNT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_INDEPTED_CY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-02-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AcquisitionIndebtednessGrp/PriorYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AcquisitionIndebtednessGrp/CurrentYearAmt'
V_ASSET_MINIM_INDEPTED_CY <- paste( V1, V2 , sep='|' )
SA_05_ASSET_MINIM_INDEPTED_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ASSET_MINIM_INDEPTED_CY ) )
if( length( SA_05_ASSET_MINIM_INDEPTED_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_INDEPTED_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_INDEPTED_CY <-  paste0( '{', SA_05_ASSET_MINIM_INDEPTED_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_L2_L1D_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-03-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_L2_L1D_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AdjustedFMVLessIndebtednessGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_L2_L1D_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_L2_L1D_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_L2_L1D_PY <-  paste0( '{', SA_05_ASSET_MINIM_L2_L1D_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_L2_L1D_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-03-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_L2_L1D_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/AdjustedFMVLessIndebtednessGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_L2_L1D_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_L2_L1D_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_L2_L1D_CY <-  paste0( '{', SA_05_ASSET_MINIM_L2_L1D_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_CASH_EXEMPT_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-04-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_CASH_EXEMPT_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/CashDeemedCharitableGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_CASH_EXEMPT_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_CASH_EXEMPT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_CASH_EXEMPT_PY <-  paste0( '{', SA_05_ASSET_MINIM_CASH_EXEMPT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_CASH_EXEMPT_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-04-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_CASH_EXEMPT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/CashDeemedCharitableGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_CASH_EXEMPT_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_CASH_EXEMPT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_CASH_EXEMPT_CY <-  paste0( '{', SA_05_ASSET_MINIM_CASH_EXEMPT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_NON_EXEMPT_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-05-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_NON_EXEMPT_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/NetVlNonExemptUseAssetsGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_NON_EXEMPT_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_NON_EXEMPT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_NON_EXEMPT_PY <-  paste0( '{', SA_05_ASSET_MINIM_NON_EXEMPT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_NON_EXEMPT_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-05-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_NON_EXEMPT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/NetVlNonExemptUseAssetsGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_NON_EXEMPT_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_NON_EXEMPT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_NON_EXEMPT_CY <-  paste0( '{', SA_05_ASSET_MINIM_NON_EXEMPT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_MULTIPLY_L5_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-06-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_MULTIPLY_L5_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/PctOfNetVlNonExemptUseAstGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_MULTIPLY_L5_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_MULTIPLY_L5_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_MULTIPLY_L5_PY <-  paste0( '{', SA_05_ASSET_MINIM_MULTIPLY_L5_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_MULTIPLY_L5_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-06-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_MULTIPLY_L5_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/PctOfNetVlNonExemptUseAstGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_MULTIPLY_L5_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_MULTIPLY_L5_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_MULTIPLY_L5_CY <-  paste0( '{', SA_05_ASSET_MINIM_MULTIPLY_L5_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_RECOVERIES_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-07-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_RECOVERIES_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/RecoveriesPYDistriMinAssetGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_RECOVERIES_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_RECOVERIES_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_RECOVERIES_PY <-  paste0( '{', SA_05_ASSET_MINIM_RECOVERIES_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_RECOVERIES_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-07-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_RECOVERIES_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/RecoveriesPYDistriMinAssetGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_RECOVERIES_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_RECOVERIES_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_RECOVERIES_CY <-  paste0( '{', SA_05_ASSET_MINIM_RECOVERIES_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_TOT_PY
## DESCRIPTION:  Prior year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-08-COL-A
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_TOT_PY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/TotalMinimumAssetGrp/PriorYearAmt' ) )
if( length( SA_05_ASSET_MINIM_TOT_PY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_TOT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_TOT_PY <-  paste0( '{', SA_05_ASSET_MINIM_TOT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_ASSET_MINIM_TOT_CY
## DESCRIPTION:  Current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-B-LINE-08-COL-B
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_ASSET_MINIM_TOT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MinimumAssetAmountGrp/TotalMinimumAssetGrp/CurrentYearAmt' ) )
if( length( SA_05_ASSET_MINIM_TOT_CY ) > 1 )
{ 
  create_record( varname=SA_05_ASSET_MINIM_TOT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_ASSET_MINIM_TOT_CY <-  paste0( '{', SA_05_ASSET_MINIM_TOT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_NETINCOME_ADJ_CY
## DESCRIPTION:  Adjusted net income amount for prior year - distributable amount (from Section A; line 8; Column A)
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-01-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CYAdjNetIncomeDistributableAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/CYAdjNetIncomeDistributableAmt'
V_DIST_AMT_NETINCOME_ADJ_CY <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_NETINCOME_ADJ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_NETINCOME_ADJ_CY ) )
if( length( SA_05_DIST_AMT_NETINCOME_ADJ_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_NETINCOME_ADJ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_NETINCOME_ADJ_CY <-  paste0( '{', SA_05_DIST_AMT_NETINCOME_ADJ_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_85PCT_L1_CY
## DESCRIPTION:  85% Percent of adjusted net income amount - distributable amount
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-02-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CYPct85AdjustedNetIncomeAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/CYPct85AdjustedNetIncomeAmt'
V_DIST_AMT_85PCT_L1_CY <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_85PCT_L1_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_85PCT_L1_CY ) )
if( length( SA_05_DIST_AMT_85PCT_L1_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_85PCT_L1_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_85PCT_L1_CY <-  paste0( '{', SA_05_DIST_AMT_85PCT_L1_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_ASSET_MINIM_CY
## DESCRIPTION:  Minimum asset amount for prior year - distributable amount (from Section B; line 8; Column A)
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-03-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CYTotalMinAstDistributableAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/CYTotalMinAstDistributableAmt'
V_DIST_AMT_ASSET_MINIM_CY <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_ASSET_MINIM_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_ASSET_MINIM_CY ) )
if( length( SA_05_DIST_AMT_ASSET_MINIM_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_ASSET_MINIM_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_ASSET_MINIM_CY <-  paste0( '{', SA_05_DIST_AMT_ASSET_MINIM_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_GREATER_L23_CY
## DESCRIPTION:  Greater of 85% adjusted net income amount and minimum assets amount
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-04-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CYGreaterAdjustedMinimumAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/CYGreaterAdjustedMinimumAmt'
V_DIST_AMT_GREATER_L23_CY <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_GREATER_L23_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_GREATER_L23_CY ) )
if( length( SA_05_DIST_AMT_GREATER_L23_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_GREATER_L23_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_GREATER_L23_CY <-  paste0( '{', SA_05_DIST_AMT_GREATER_L23_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_IMCOME_TAX_CY
## DESCRIPTION:  Income tax imposed in prior year
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-05-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CYIncomeTaxImposedPYAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/CYIncomeTaxImposedPYAmt'
V_DIST_AMT_IMCOME_TAX_CY <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_IMCOME_TAX_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_IMCOME_TAX_CY ) )
if( length( SA_05_DIST_AMT_IMCOME_TAX_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_IMCOME_TAX_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_IMCOME_TAX_CY <-  paste0( '{', SA_05_DIST_AMT_IMCOME_TAX_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_ADJ_CY
## DESCRIPTION:  Distributable amount as adjusted unless subject to emergency temporary reduction
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-06-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CYDistributableAsAdjustedAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/CYDistributableAsAdjustedAmt'
V_DIST_AMT_ADJ_CY <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_ADJ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_ADJ_CY ) )
if( length( SA_05_DIST_AMT_ADJ_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_ADJ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_ADJ_CY <-  paste0( '{', SA_05_DIST_AMT_ADJ_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_AMT_FIRST_Y_T3_X
## DESCRIPTION:  First year as a non-functionally-integrated Type III supporting organization
## LOCATION:  SCHED-A-PART-05-SECTION-C-LINE-07-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/DistributableAmountGrp/FirstYearType3NonFuncInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/FirstYearType3NonFuncInd'
V_DIST_AMT_FIRST_Y_T3_X <- paste( V1, V2 , sep='|' )
SA_05_DIST_AMT_FIRST_Y_T3_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DIST_AMT_FIRST_Y_T3_X ) )
if( length( SA_05_DIST_AMT_FIRST_Y_T3_X ) > 1 )
{ 
  create_record( varname=SA_05_DIST_AMT_FIRST_Y_T3_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_AMT_FIRST_Y_T3_X <-  paste0( '{', SA_05_DIST_AMT_FIRST_Y_T3_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_ORG_EXEMPT_CY
## DESCRIPTION:  Amounts paid to supported organizations to accomplish exempt purpose - Current Year
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-01-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_ORG_EXEMPT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYPaidAccomplishExemptPrpsAmt' ) )
if( length( SA_05_DIST_PAID_ORG_EXEMPT_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_ORG_EXEMPT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_ORG_EXEMPT_CY <-  paste0( '{', SA_05_DIST_PAID_ORG_EXEMPT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_EXCESS_INCOME_CY
## DESCRIPTION:  Amounts paid to perform activity that directly furthers exempt purpose - in excess of income from activity
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-02-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_EXCESS_INCOME_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYPdInExcessIncomeActivityAmt' ) )
if( length( SA_05_DIST_PAID_EXCESS_INCOME_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_EXCESS_INCOME_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_EXCESS_INCOME_CY <-  paste0( '{', SA_05_DIST_PAID_EXCESS_INCOME_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_EXP_ADMIN_CY
## DESCRIPTION:  Administrative expenses paid to accomplish exempt purposes
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-03-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_EXP_ADMIN_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYAdministrativeExpensePaidAmt' ) )
if( length( SA_05_DIST_PAID_EXP_ADMIN_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_EXP_ADMIN_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_EXP_ADMIN_CY <-  paste0( '{', SA_05_DIST_PAID_EXP_ADMIN_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_EXEMPT_ASSET_CY
## DESCRIPTION:  Amounts paid to acquire exempt-use assets
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-04-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_EXEMPT_ASSET_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/ExemptUseAssetsAcquisPaidAmt' ) )
if( length( SA_05_DIST_PAID_EXEMPT_ASSET_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_EXEMPT_ASSET_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_EXEMPT_ASSET_CY <-  paste0( '{', SA_05_DIST_PAID_EXEMPT_ASSET_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_SET_ASIDE_CY
## DESCRIPTION:  Qualified set-aside amounts
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-05-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_SET_ASIDE_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/QualifiedSetAsideAmt' ) )
if( length( SA_05_DIST_PAID_SET_ASIDE_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_SET_ASIDE_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_SET_ASIDE_CY <-  paste0( '{', SA_05_DIST_PAID_SET_ASIDE_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_OTH_CY
## DESCRIPTION:  Other distributions - Current Year
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-06-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_OTH_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYOtherDistributionsAmt' ) )
if( length( SA_05_DIST_PAID_OTH_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_OTH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_OTH_CY <-  paste0( '{', SA_05_DIST_PAID_OTH_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_TOT_CY
## DESCRIPTION:  Total annual distributions - Current Year
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-07-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_TOT_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYTotalAnnualDistributionsAmt' ) )
if( length( SA_05_DIST_PAID_TOT_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_TOT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_TOT_CY <-  paste0( '{', SA_05_DIST_PAID_TOT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_ATTENTIVE_CY
## DESCRIPTION:  Distributions to attentive supported organizations to which the org is responsive
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-08-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_ATTENTIVE_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYDistriAttentiveSuprtOrgAmt' ) )
if( length( SA_05_DIST_PAID_ATTENTIVE_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_ATTENTIVE_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_ATTENTIVE_CY <-  paste0( '{', SA_05_DIST_PAID_ATTENTIVE_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_ADJ_CY
## DESCRIPTION:  Distributable amount for current year (from Section C; line 6)
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-09-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_ADJ_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYDistributableAsAdjustedAmt' ) )
if( length( SA_05_DIST_PAID_ADJ_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_ADJ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_ADJ_CY <-  paste0( '{', SA_05_DIST_PAID_ADJ_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_PAID_DIVIDE_L89_CY
## DESCRIPTION:  Distributions to attentive supported org divided by Distributable amount
## LOCATION:  SCHED-A-PART-05-SECTION-D-LINE-10-CY
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_PAID_DIVIDE_L89_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionsGrp/CYDistributionYrRt' ) )
if( length( SA_05_DIST_PAID_DIVIDE_L89_CY ) > 1 )
{ 
  create_record( varname=SA_05_DIST_PAID_DIVIDE_L89_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_PAID_DIVIDE_L89_CY <-  paste0( '{', SA_05_DIST_PAID_DIVIDE_L89_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_ADJ_DA
## DESCRIPTION:  Distributable amount for current year (from Section C; line 6)
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-01-COL-iii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_ADJ_DA <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/CYDistributableAsAdjustedAmt' ) )
if( length( SA_05_DIST_ALLOC_ADJ_DA ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_ADJ_DA, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_ADJ_DA <-  paste0( '{', SA_05_DIST_ALLOC_ADJ_DA, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_UNDERDIST_UD
## DESCRIPTION:  Underdistributions for years prior to current year
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-02-COL-ii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_UNDERDIST_UD <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/UnderdistributionsAmt' ) )
if( length( SA_05_DIST_ALLOC_UNDERDIST_UD ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_UNDERDIST_UD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_UNDERDIST_UD <-  paste0( '{', SA_05_DIST_ALLOC_UNDERDIST_UD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_CY_M2
## DESCRIPTION:  Excess distributions carryover - year 2
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-03D
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessDistributionCyovYr2Amt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_CY_M2 <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_CY_M1
## DESCRIPTION:  Excess distributions carryover - year 1
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-03E
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessDistributionCyovYr1Amt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_CY_M1 <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_TOT_ED
## DESCRIPTION:  Excess distributions carryover amount
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-03F-COL-i
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_TOT_ED <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/TotalExcessDistributionCyovAmt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_TOT_ED ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_TOT_ED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_TOT_ED <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_TOT_ED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_APPLY_UD
## DESCRIPTION:  Carryover applied to underdistributions of prior years
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-03G-COL-ii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_APPLY_UD <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/CyovAppliedUnderdistriPYAmt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_APPLY_UD ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_APPLY_UD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_APPLY_UD <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_APPLY_UD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_APPLY_DA
## DESCRIPTION:  Carryover applied to current year  distributable amount
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-03H-COL-iii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_APPLY_DA <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/CyovAppliedUnderdistrCPYAmt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_APPLY_DA ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_APPLY_DA, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_APPLY_DA <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_APPLY_DA, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_REMAIN
## DESCRIPTION:  Excess distributions carryover amount
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-03J-COL-i
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_REMAIN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessDistributionCyovAmt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_REMAIN ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_REMAIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_REMAIN <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_REMAIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_DIST_TOT
## DESCRIPTION:  Total annual distributions from current year (from Section D; line 7)
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-04
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_DIST_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/CYTotalAnnualDistributionsAmt' ) )
if( length( SA_05_DIST_ALLOC_DIST_TOT ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_DIST_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_DIST_TOT <-  paste0( '{', SA_05_DIST_ALLOC_DIST_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_DIST_APPLY_UD
## DESCRIPTION:  Current year distributions applied to underdistributions of prior years
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-04A-COL-ii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_DIST_APPLY_UD <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/CYDistribAppUnderdistriPYAmt' ) )
if( length( SA_05_DIST_ALLOC_DIST_APPLY_UD ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_DIST_APPLY_UD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_DIST_APPLY_UD <-  paste0( '{', SA_05_DIST_ALLOC_DIST_APPLY_UD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_DIST_APPLY_DA
## DESCRIPTION:  Current year distributions applied to distributable amount
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-04B-COL-iii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_DIST_APPLY_DA <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/CYDistriAppDistributableAmt' ) )
if( length( SA_05_DIST_ALLOC_DIST_APPLY_DA ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_DIST_APPLY_DA, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_DIST_APPLY_DA <-  paste0( '{', SA_05_DIST_ALLOC_DIST_APPLY_DA, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_DIST_REMAIN
## DESCRIPTION:  Excess distributions current year amount
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-04C-COL-i
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_DIST_REMAIN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessDistributionAmt' ) )
if( length( SA_05_DIST_ALLOC_DIST_REMAIN ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_DIST_REMAIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_DIST_REMAIN <-  paste0( '{', SA_05_DIST_ALLOC_DIST_REMAIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_REMAINING_UD
## DESCRIPTION:  Remaining underdistributions - prior years
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-05-COL-ii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_REMAINING_UD <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/RemainingUnderdistriPYAmt' ) )
if( length( SA_05_DIST_ALLOC_REMAINING_UD ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_REMAINING_UD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_REMAINING_UD <-  paste0( '{', SA_05_DIST_ALLOC_REMAINING_UD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_REMAINING_DA
## DESCRIPTION:  Remaining underdistributions - current years
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-06-COL-iii
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_REMAINING_DA <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/RemainingUnderdistriCYAmt' ) )
if( length( SA_05_DIST_ALLOC_REMAINING_DA ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_REMAINING_DA, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_REMAINING_DA <-  paste0( '{', SA_05_DIST_ALLOC_REMAINING_DA, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_NY_TOT
## DESCRIPTION:  Excess distribution carryover to next year
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-07-COL-i
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_NY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessDistriCyovToNextYrAmt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_NY_TOT ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_NY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_NY_TOT <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_NY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_NY_M3
## DESCRIPTION:  Excess from year 3
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-08C
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_NY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessFromYear3Amt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_NY_M3 ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_NY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_NY_M3 <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_NY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_NY_M2
## DESCRIPTION:  Excess from year 2
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-08D
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_NY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessFromYear2Amt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_NY_M2 ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_NY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_NY_M2 <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_NY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_05_DIST_ALLOC_EXCESS_NY_M1
## DESCRIPTION:  Excess from year 1
## LOCATION:  SCHED-A-PART-05-SECTION-E-LINE-08E
## TABLE:  SA-P05-T00-SUPPORT-ORGS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_05_DIST_ALLOC_EXCESS_NY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/DistributionAllocationsGrp/ExcessFromYear1Amt' ) )
if( length( SA_05_DIST_ALLOC_EXCESS_NY_M1 ) > 1 )
{ 
  create_record( varname=SA_05_DIST_ALLOC_EXCESS_NY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_05_DIST_ALLOC_EXCESS_NY_M1 <-  paste0( '{', SA_05_DIST_ALLOC_EXCESS_NY_M1, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SA_05_TRUST_INTEGRAL_PART_TEST_X,SA_05_NETINCOME_ADJ_CAP_GAIN_PY,SA_05_NETINCOME_ADJ_CAP_GAIN_CY,SA_05_NETINCOME_ADJ_RECOVERY_PY,SA_05_NETINCOME_ADJ_RECOVERY_CY,SA_05_NETINCOME_ADJ_OTH_GRO_PY,SA_05_NETINCOME_ADJ_OTH_GRO_CY,SA_05_NETINCOME_ADJ_ADD_L123_PY,SA_05_NETINCOME_ADJ_ADD_L123_CY,SA_05_NETINCOME_ADJ_DEPREC_PY,SA_05_NETINCOME_ADJ_DEPREC_CY,SA_05_NETINCOME_ADJ_PRODUCT_PY,SA_05_NETINCOME_ADJ_PRODUCT_CY,SA_05_NETINCOME_ADJ_EXP_OTH_PY,SA_05_NETINCOME_ADJ_EXP_OTH_CY,SA_05_NETINCOME_ADJ_TOT_PY,SA_05_NETINCOME_ADJ_TOT_CY,SA_05_ASSET_MINIM_FMV_SEC_PY,SA_05_ASSET_MINIM_FMV_SEC_CY,SA_05_ASSET_MINIM_FMV_CASH_PY,SA_05_ASSET_MINIM_FMV_CASH_CY,SA_05_ASSET_MINIM_FMV_OTH_PY,SA_05_ASSET_MINIM_FMV_OTH_CY,SA_05_ASSET_MINIM_FMV_TOT_PY,SA_05_ASSET_MINIM_FMV_TOT_CY,SA_05_ASSET_MINIM_FMV_DISCOUNT,SA_05_ASSET_MINIM_INDEPTED_CY,SA_05_ASSET_MINIM_L2_L1D_PY,SA_05_ASSET_MINIM_L2_L1D_CY,SA_05_ASSET_MINIM_CASH_EXEMPT_PY,SA_05_ASSET_MINIM_CASH_EXEMPT_CY,SA_05_ASSET_MINIM_NON_EXEMPT_PY,SA_05_ASSET_MINIM_NON_EXEMPT_CY,SA_05_ASSET_MINIM_MULTIPLY_L5_PY,SA_05_ASSET_MINIM_MULTIPLY_L5_CY,SA_05_ASSET_MINIM_RECOVERIES_PY,SA_05_ASSET_MINIM_RECOVERIES_CY,SA_05_ASSET_MINIM_TOT_PY,SA_05_ASSET_MINIM_TOT_CY,SA_05_DIST_AMT_NETINCOME_ADJ_CY,SA_05_DIST_AMT_85PCT_L1_CY,SA_05_DIST_AMT_ASSET_MINIM_CY,SA_05_DIST_AMT_GREATER_L23_CY,SA_05_DIST_AMT_IMCOME_TAX_CY,SA_05_DIST_AMT_ADJ_CY,SA_05_DIST_AMT_FIRST_Y_T3_X,SA_05_DIST_PAID_ORG_EXEMPT_CY,SA_05_DIST_PAID_EXCESS_INCOME_CY,SA_05_DIST_PAID_EXP_ADMIN_CY,SA_05_DIST_PAID_EXEMPT_ASSET_CY,SA_05_DIST_PAID_SET_ASIDE_CY,SA_05_DIST_PAID_OTH_CY,SA_05_DIST_PAID_TOT_CY,SA_05_DIST_PAID_ATTENTIVE_CY,SA_05_DIST_PAID_ADJ_CY,SA_05_DIST_PAID_DIVIDE_L89_CY,SA_05_DIST_ALLOC_ADJ_DA,SA_05_DIST_ALLOC_UNDERDIST_UD,SA_05_DIST_ALLOC_EXCESS_CY_M2,SA_05_DIST_ALLOC_EXCESS_CY_M1,SA_05_DIST_ALLOC_EXCESS_TOT_ED,SA_05_DIST_ALLOC_EXCESS_APPLY_UD,SA_05_DIST_ALLOC_EXCESS_APPLY_DA,SA_05_DIST_ALLOC_EXCESS_REMAIN,SA_05_DIST_ALLOC_DIST_TOT,SA_05_DIST_ALLOC_DIST_APPLY_UD,SA_05_DIST_ALLOC_DIST_APPLY_DA,SA_05_DIST_ALLOC_DIST_REMAIN,SA_05_DIST_ALLOC_REMAINING_UD,SA_05_DIST_ALLOC_REMAINING_DA,SA_05_DIST_ALLOC_EXCESS_NY_TOT,SA_05_DIST_ALLOC_EXCESS_NY_M3,SA_05_DIST_ALLOC_EXCESS_NY_M2,SA_05_DIST_ALLOC_EXCESS_NY_M1)
df <- as.data.frame( var.list )


return( df )


}


