#' @title 
#'   Build table F9-P11-T00-ASSETS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P11_T00_ASSETS <- function( doc, url )
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


## VARIABLE NAME:  F9_11_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part XI
## LOCATION:  F990-PC-PART-11-LINE-00
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartXI'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartXIInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_11_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_11_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_11_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_INFO_SCHED_O_X <-  paste0( '{', F9_11_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_11_RECO_REV_LESS_EXP
## DESCRIPTION:  Revenue less expenses
## LOCATION:  F990-PC-PART-11-LINE-03
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ReconcilationRevenueExpenses'
V2 <- '//Return/ReturnData/IRS990/ReconcilationRevenueExpnssAmt'
V_RECO_REV_LESS_EXP <- paste( V1, V2 , sep='|' )
F9_11_RECO_REV_LESS_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_LESS_EXP ) )
if( length( F9_11_RECO_REV_LESS_EXP ) > 1 )
{ 
  create_record( varname=F9_11_RECO_REV_LESS_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_RECO_REV_LESS_EXP <-  paste0( '{', F9_11_RECO_REV_LESS_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_11_RECO_GAIN_INVEST_NET
## DESCRIPTION:  Net unrealized gains (losses) on investments
## LOCATION:  F990-PC-PART-11-LINE-05
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/NetUnrlzdGainsLossesInvstAmt'
V2 <- '//Return/ReturnData/IRS990/ReconciliationUnrealizedInvest'
V_RECO_GAIN_INVEST_NET <- paste( V1, V2 , sep='|' )
F9_11_RECO_GAIN_INVEST_NET <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_GAIN_INVEST_NET ) )
if( length( F9_11_RECO_GAIN_INVEST_NET ) > 1 )
{ 
  create_record( varname=F9_11_RECO_GAIN_INVEST_NET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_RECO_GAIN_INVEST_NET <-  paste0( '{', F9_11_RECO_GAIN_INVEST_NET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_11_RECO_SVC_DONATED
## DESCRIPTION:  Donated services and use of facilities
## LOCATION:  F990-PC-PART-11-LINE-06
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DonatedServicesAndUseFcltsAmt'
V2 <- '//Return/ReturnData/IRS990/ReconcilationDonatedServices'
V_RECO_SVC_DONATED <- paste( V1, V2 , sep='|' )
F9_11_RECO_SVC_DONATED <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_SVC_DONATED ) )
if( length( F9_11_RECO_SVC_DONATED ) > 1 )
{ 
  create_record( varname=F9_11_RECO_SVC_DONATED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_RECO_SVC_DONATED <-  paste0( '{', F9_11_RECO_SVC_DONATED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_11_RECO_INVEST_EXP
## DESCRIPTION:  Investment expenses
## LOCATION:  F990-PC-PART-11-LINE-07
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InvestmentExpenseAmt'
V2 <- '//Return/ReturnData/IRS990/ReconcilationInvestExpenses'
V_RECO_INVEST_EXP <- paste( V1, V2 , sep='|' )
F9_11_RECO_INVEST_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_INVEST_EXP ) )
if( length( F9_11_RECO_INVEST_EXP ) > 1 )
{ 
  create_record( varname=F9_11_RECO_INVEST_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_RECO_INVEST_EXP <-  paste0( '{', F9_11_RECO_INVEST_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_11_RECO_ADJ_PRIOR
## DESCRIPTION:  Prior period adjustments
## LOCATION:  F990-PC-PART-11-LINE-08
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/PriorPeriodAdjustmentsAmt'
V2 <- '//Return/ReturnData/IRS990/ReconcilationPriorAdjustment'
V_RECO_ADJ_PRIOR <- paste( V1, V2 , sep='|' )
F9_11_RECO_ADJ_PRIOR <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_ADJ_PRIOR ) )
if( length( F9_11_RECO_ADJ_PRIOR ) > 1 )
{ 
  create_record( varname=F9_11_RECO_ADJ_PRIOR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_RECO_ADJ_PRIOR <-  paste0( '{', F9_11_RECO_ADJ_PRIOR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_11_RECO_OTH_CHANGE_NAFB
## DESCRIPTION:  Other changes in net assets or fund balances
## LOCATION:  F990-PC-PART-11-LINE-09
## TABLE:  F9-P11-T00-ASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/OtherChangesInNetAssetsAmt'
V2 <- '//Return/ReturnData/IRS990/ReconcilationOtherChanges'
V3 <- '//Return/ReturnData/IRS990EZ/OtherChangesInNetAssets'
V4 <- '//Return/ReturnData/IRS990EZ/OtherChangesInNetAssetsAmt'
V_RECO_OTH_CHANGE_NAFB <- paste( V1, V2, V3, V4 , sep='|' )
F9_11_RECO_OTH_CHANGE_NAFB <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_OTH_CHANGE_NAFB ) )
if( length( F9_11_RECO_OTH_CHANGE_NAFB ) > 1 )
{ 
  create_record( varname=F9_11_RECO_OTH_CHANGE_NAFB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_11_RECO_OTH_CHANGE_NAFB <-  paste0( '{', F9_11_RECO_OTH_CHANGE_NAFB, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_11_INFO_SCHED_O_X,F9_11_RECO_REV_LESS_EXP,F9_11_RECO_GAIN_INVEST_NET,F9_11_RECO_SVC_DONATED,F9_11_RECO_INVEST_EXP,F9_11_RECO_ADJ_PRIOR,F9_11_RECO_OTH_CHANGE_NAFB)
df <- as.data.frame( var.list )


return( df )


}


