#' @title 
#'   Build table F9-P04-T00-REQUIRED-SCHEDULES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P04_T00_REQUIRED_SCHEDULES <- function( doc, url )
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


## VARIABLE NAME:  F9_04_DESC_IN_501C3_X
## DESCRIPTION:  Described in 501(c)(3)?
## LOCATION:  F990-PC-PART-04-LINE-01
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DescribedIn501C3'
V2 <- '//Return/ReturnData/IRS990/DescribedInSection501c3Ind'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/DescribedIn501C3'
V_DESC_IN_501C3_X <- paste( V1, V2, V3 , sep='|' )
F9_04_DESC_IN_501C3_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DESC_IN_501C3_X ) )
if( length( F9_04_DESC_IN_501C3_X ) > 1 )
{ 
  create_record( varname=F9_04_DESC_IN_501C3_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_DESC_IN_501C3_X <-  paste0( '{', F9_04_DESC_IN_501C3_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_SCHED_B_REQ_X
## DESCRIPTION:  Indicates Schedule B is not required
## LOCATION:  F990-EZ-PART-00-SECTION-H
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ScheduleBNotRequired'
V2 <- '//Return/ReturnData/IRS990EZ/ScheduleBNotRequiredInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/ScheduleBRequired'
V4 <- '//Return/ReturnData/IRS990/ScheduleBNotRequired'
V5 <- '//Return/ReturnData/IRS990/ScheduleBRequired'
V6 <- '//Return/ReturnData/IRS990/ScheduleBRequiredInd'
V_SCHED_B_REQ_X <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_04_SCHED_B_REQ_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SCHED_B_REQ_X ) )
if( length( F9_04_SCHED_B_REQ_X ) > 1 )
{ 
  create_record( varname=F9_04_SCHED_B_REQ_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_SCHED_B_REQ_X <-  paste0( '{', F9_04_SCHED_B_REQ_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_POLI_ACT_X
## DESCRIPTION:  Political activities?
## LOCATION:  F990-EZ-PART-05-LINE-46
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/PoliticalCampaignActyInd'
V2 <- '//Return/ReturnData/IRS990EZ/EngagePoliticalCmpgnActivities'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/PoliticalActivities'
V4 <- '//Return/ReturnData/IRS990/PoliticalActivities'
V5 <- '//Return/ReturnData/IRS990/PoliticalCampaignActyInd'
V_POLI_ACT_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_POLI_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLI_ACT_X ) )
if( length( F9_04_POLI_ACT_X ) > 1 )
{ 
  create_record( varname=F9_04_POLI_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_POLI_ACT_X <-  paste0( '{', F9_04_POLI_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_LOB_ACT_X
## DESCRIPTION:  Lobbying activities?
## LOCATION:  F990-EZ-PART-06-LINE-47
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LobbyingActivitiesInd'
V2 <- '//Return/ReturnData/IRS990EZ/EngageInLobbyingActivities'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/LobbyingActivities'
V4 <- '//Return/ReturnData/IRS990/LobbyingActivities'
V5 <- '//Return/ReturnData/IRS990/LobbyingActivitiesInd'
V_LOB_ACT_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_LOB_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_X ) )
if( length( F9_04_LOB_ACT_X ) > 1 )
{ 
  create_record( varname=F9_04_LOB_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_LOB_ACT_X <-  paste0( '{', F9_04_LOB_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_PROXY_TAX_X
## DESCRIPTION:  Subject to proxy tax?
## LOCATION:  F990-EZ-PART-05-LINE-35C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SubjectToProxyTax'
V2 <- '//Return/ReturnData/IRS990EZ/SubjectToProxyTaxInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/SubjectToProxyTax'
V4 <- '//Return/ReturnData/IRS990/SubjectToProxyTax'
V5 <- '//Return/ReturnData/IRS990/SubjectToProxyTaxInd'
V_PROXY_TAX_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_PROXY_TAX_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PROXY_TAX_X ) )
if( length( F9_04_PROXY_TAX_X ) > 1 )
{ 
  create_record( varname=F9_04_PROXY_TAX_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_PROXY_TAX_X <-  paste0( '{', F9_04_PROXY_TAX_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_DAF_X
## DESCRIPTION:  
## LOCATION:  F990-EZ-PART-05-LINE-44A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/DonorAdvisedFndsInd'
V2 <- '//Return/ReturnData/IRS990EZ/MaintainAnyDonorAdvisedFunds'
V3 <- '//Return/ReturnData/IRS990/DonorAdvisedFundInd'
V4 <- '//Return/ReturnData/IRS990/DonorAdvisedFunds'
V5 <- '//Return/ReturnData/IRS990/Form990PartIV/DonorAdvisedFunds'
V_DAF_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_DAF_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DAF_X ) )
if( length( F9_04_DAF_X ) > 1 )
{ 
  create_record( varname=F9_04_DAF_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_DAF_X <-  paste0( '{', F9_04_DAF_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_CONSERV_EMT_X
## DESCRIPTION:  Conservation easements?
## LOCATION:  F990-PC-PART-04-LINE-07
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConservationEasements'
V2 <- '//Return/ReturnData/IRS990/ConservationEasementsInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/ConservationEasements'
V_CONSERV_EMT_X <- paste( V1, V2, V3 , sep='|' )
F9_04_CONSERV_EMT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CONSERV_EMT_X ) )
if( length( F9_04_CONSERV_EMT_X ) > 1 )
{ 
  create_record( varname=F9_04_CONSERV_EMT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_CONSERV_EMT_X <-  paste0( '{', F9_04_CONSERV_EMT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_COLLEC_ART_X
## DESCRIPTION:  Collections of art?
## LOCATION:  F990-PC-PART-04-LINE-08
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CollectionsOfArt'
V2 <- '//Return/ReturnData/IRS990/CollectionsOfArtInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/CollectionsOfArt'
V_COLLEC_ART_X <- paste( V1, V2, V3 , sep='|' )
F9_04_COLLEC_ART_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_ART_X ) )
if( length( F9_04_COLLEC_ART_X ) > 1 )
{ 
  create_record( varname=F9_04_COLLEC_ART_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_COLLEC_ART_X <-  paste0( '{', F9_04_COLLEC_ART_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_CREDIT_COUNS_X
## DESCRIPTION:  Credit counseling?
## LOCATION:  F990-PC-PART-04-LINE-09
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CreditCounseling'
V2 <- '//Return/ReturnData/IRS990/CreditCounselingInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/CreditCounseling'
V_CREDIT_COUNS_X <- paste( V1, V2, V3 , sep='|' )
F9_04_CREDIT_COUNS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CREDIT_COUNS_X ) )
if( length( F9_04_CREDIT_COUNS_X ) > 1 )
{ 
  create_record( varname=F9_04_CREDIT_COUNS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_CREDIT_COUNS_X <-  paste0( '{', F9_04_CREDIT_COUNS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_ENDOW_X
## DESCRIPTION:  Term or permanent endowments?
## LOCATION:  F990-PC-PART-04-LINE-10
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/TermOrPermanentEndowments'
V2 <- '//Return/ReturnData/IRS990/TempOrPermanentEndowmentsInd'
V3 <- '//Return/ReturnData/IRS990/TermOrPermanentEndowments'
V_ENDOW_X <- paste( V1, V2, V3 , sep='|' )
F9_04_ENDOW_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_X ) )
if( length( F9_04_ENDOW_X ) > 1 )
{ 
  create_record( varname=F9_04_ENDOW_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_ENDOW_X <-  paste0( '{', F9_04_ENDOW_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_BALANCE_SHEET_AMT_X
## DESCRIPTION:  Balance sheet amounts reported?
## LOCATION:  F990-PC-PART-04-LINE-11
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BalanceSheetAmountsReported'
V2 <- '//Return/ReturnData/IRS990/Form990PartIV/BalanceSheetAmountsReported'
V_REP_BALANCE_SHEET_AMT_X <- paste( V1, V2 , sep='|' )
F9_04_REP_BALANCE_SHEET_AMT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_BALANCE_SHEET_AMT_X ) )
if( length( F9_04_REP_BALANCE_SHEET_AMT_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_BALANCE_SHEET_AMT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_BALANCE_SHEET_AMT_X <-  paste0( '{', F9_04_REP_BALANCE_SHEET_AMT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_LAND_BLDG_EQUIP_X
## DESCRIPTION:  Balance sheet land; buildings; equipment amounts reported?
## LOCATION:  F990-PC-PART-04-LINE-11A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ReportLandBldgEquip'
V2 <- '//Return/ReturnData/IRS990/ReportLandBuildingEquipmentInd'
V_REP_LAND_BLDG_EQUIP_X <- paste( V1, V2 , sep='|' )
F9_04_REP_LAND_BLDG_EQUIP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_LAND_BLDG_EQUIP_X ) )
if( length( F9_04_REP_LAND_BLDG_EQUIP_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_LAND_BLDG_EQUIP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_LAND_BLDG_EQUIP_X <-  paste0( '{', F9_04_REP_LAND_BLDG_EQUIP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_INVEST_OTH_SEC_X
## DESCRIPTION:  Balance sheet investments - other securities amounts reported?
## LOCATION:  F990-PC-PART-04-LINE-11B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ReportInvestmentsOtherSecInd'
V2 <- '//Return/ReturnData/IRS990/ReportInvestOthSecurities'
V_REP_INVEST_OTH_SEC_X <- paste( V1, V2 , sep='|' )
F9_04_REP_INVEST_OTH_SEC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_INVEST_OTH_SEC_X ) )
if( length( F9_04_REP_INVEST_OTH_SEC_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_INVEST_OTH_SEC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_INVEST_OTH_SEC_X <-  paste0( '{', F9_04_REP_INVEST_OTH_SEC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_PROG_RLTD_X
## DESCRIPTION:  Balance sheet investments - program related amounts reported?
## LOCATION:  F990-PC-PART-04-LINE-11C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ReportProgramRelatedInvstInd'
V2 <- '//Return/ReturnData/IRS990/ReportProgRelInvest'
V_REP_PROG_RLTD_X <- paste( V1, V2 , sep='|' )
F9_04_REP_PROG_RLTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_PROG_RLTD_X ) )
if( length( F9_04_REP_PROG_RLTD_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_PROG_RLTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_PROG_RLTD_X <-  paste0( '{', F9_04_REP_PROG_RLTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_OTH_ASSET_X
## DESCRIPTION:  Balance sheet other assets amounts reported?
## LOCATION:  F990-PC-PART-04-LINE-11D
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ReportOtherAssets'
V2 <- '//Return/ReturnData/IRS990/ReportOtherAssetsInd'
V_REP_OTH_ASSET_X <- paste( V1, V2 , sep='|' )
F9_04_REP_OTH_ASSET_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_OTH_ASSET_X ) )
if( length( F9_04_REP_OTH_ASSET_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_OTH_ASSET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_OTH_ASSET_X <-  paste0( '{', F9_04_REP_OTH_ASSET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_OTH_LIAB_X
## DESCRIPTION:  Balance sheet other liabilities amounts reported?
## LOCATION:  F990-PC-PART-04-LINE-11E
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ReportOtherLiabilities'
V2 <- '//Return/ReturnData/IRS990/ReportOtherLiabilitiesInd'
V_REP_OTH_LIAB_X <- paste( V1, V2 , sep='|' )
F9_04_REP_OTH_LIAB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_OTH_LIAB_X ) )
if( length( F9_04_REP_OTH_LIAB_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_OTH_LIAB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_OTH_LIAB_X <-  paste0( '{', F9_04_REP_OTH_LIAB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_REP_FOOTNOTE_FIN48_X
## DESCRIPTION:  Balance sheet footnote for liability under FIN 48?
## LOCATION:  F990-PC-PART-04-LINE-11F
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/IncludeFIN48FootnoteInd'
V2 <- '//Return/ReturnData/IRS990/ReportFin48Footnote'
V_REP_FOOTNOTE_FIN48_X <- paste( V1, V2 , sep='|' )
F9_04_REP_FOOTNOTE_FIN48_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REP_FOOTNOTE_FIN48_X ) )
if( length( F9_04_REP_FOOTNOTE_FIN48_X ) > 1 )
{ 
  create_record( varname=F9_04_REP_FOOTNOTE_FIN48_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_REP_FOOTNOTE_FIN48_X <-  paste0( '{', F9_04_REP_FOOTNOTE_FIN48_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_AFS_IND_X
## DESCRIPTION:  Independent audited financial statements?
## LOCATION:  F990-PC-PART-04-LINE-12A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/IndependentAuditFinancialStmt'
V2 <- '//Return/ReturnData/IRS990/IndependentAuditFinclStmtInd'
V_AFS_IND_X <- paste( V1, V2 , sep='|' )
F9_04_AFS_IND_X <- xml2::xml_text( xml2::xml_find_all( doc, V_AFS_IND_X ) )
if( length( F9_04_AFS_IND_X ) > 1 )
{ 
  create_record( varname=F9_04_AFS_IND_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_AFS_IND_X <-  paste0( '{', F9_04_AFS_IND_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_AFS_CONSOL_X
## DESCRIPTION:  Consolidated audited financial statement?
## LOCATION:  F990-PC-PART-04-LINE-12B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConsolidatedAuditFinancialStmt'
V2 <- '//Return/ReturnData/IRS990/ConsolidatedAuditFinclStmtInd'
V_AFS_CONSOL_X <- paste( V1, V2 , sep='|' )
F9_04_AFS_CONSOL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_AFS_CONSOL_X ) )
if( length( F9_04_AFS_CONSOL_X ) > 1 )
{ 
  create_record( varname=F9_04_AFS_CONSOL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_AFS_CONSOL_X <-  paste0( '{', F9_04_AFS_CONSOL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_SCHOOL_X
## DESCRIPTION:  IRS990 - School?
## LOCATION:  F990-EZ-PART-06-LINE-48
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SchoolOperatingInd'
V2 <- '//Return/ReturnData/IRS990EZ/OperatingSchool'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/School'
V4 <- '//Return/ReturnData/IRS990/School'
V5 <- '//Return/ReturnData/IRS990/SchoolOperatingInd'
V_SCHOOL_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_SCHOOL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SCHOOL_X ) )
if( length( F9_04_SCHOOL_X ) > 1 )
{ 
  create_record( varname=F9_04_SCHOOL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_SCHOOL_X <-  paste0( '{', F9_04_SCHOOL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_FRGN_OFFICE_X
## DESCRIPTION:  At any time during the calender year; did the organization maintain an office outside of the U.S.?
## LOCATION:  F990-EZ-PART-05-LINE-42C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ForeignOffice'
V2 <- '//Return/ReturnData/IRS990EZ/ForeignOfficeInd'
V3 <- '//Return/ReturnData/IRS990/ForeignOffice'
V4 <- '//Return/ReturnData/IRS990/ForeignOfficeInd'
V5 <- '//Return/ReturnData/IRS990/Form990PartIV/ForeignOffice'
V_FRGN_OFFICE_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_FRGN_OFFICE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_OFFICE_X ) )
if( length( F9_04_FRGN_OFFICE_X ) > 1 )
{ 
  create_record( varname=F9_04_FRGN_OFFICE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_FRGN_OFFICE_X <-  paste0( '{', F9_04_FRGN_OFFICE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_FRGN_ACT_X
## DESCRIPTION:  Foreign activities; etc?
## LOCATION:  F990-PC-PART-04-LINE-14B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ForeignActivities'
V2 <- '//Return/ReturnData/IRS990/ForeignActivitiesInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/ForeignActivities'
V_FRGN_ACT_X <- paste( V1, V2, V3 , sep='|' )
F9_04_FRGN_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_ACT_X ) )
if( length( F9_04_FRGN_ACT_X ) > 1 )
{ 
  create_record( varname=F9_04_FRGN_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_FRGN_ACT_X <-  paste0( '{', F9_04_FRGN_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_GRANT_MT_5K_FRGN_ORG_X
## DESCRIPTION:  More than $5000 to organizations Part IX; line 3?
## LOCATION:  F990-PC-PART-04-LINE-15
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/MoreThan5000KToOrganizations'
V2 <- '//Return/ReturnData/IRS990/MoreThan5000KToOrganizations'
V3 <- '//Return/ReturnData/IRS990/MoreThan5000KToOrgInd'
V_GRANT_MT_5K_FRGN_ORG_X <- paste( V1, V2, V3 , sep='|' )
F9_04_GRANT_MT_5K_FRGN_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_MT_5K_FRGN_ORG_X ) )
if( length( F9_04_GRANT_MT_5K_FRGN_ORG_X ) > 1 )
{ 
  create_record( varname=F9_04_GRANT_MT_5K_FRGN_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_GRANT_MT_5K_FRGN_ORG_X <-  paste0( '{', F9_04_GRANT_MT_5K_FRGN_ORG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_GRANT_MT_5K_FRGN_INDIV_X
## DESCRIPTION:  More than $5000 to individuals Part IX; line 3?
## LOCATION:  F990-PC-PART-04-LINE-16
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/MoreThan5000KToIndividuals'
V2 <- '//Return/ReturnData/IRS990/MoreThan5000KToIndividuals'
V3 <- '//Return/ReturnData/IRS990/MoreThan5000KToIndividualsInd'
V_GRANT_MT_5K_FRGN_INDIV_X <- paste( V1, V2, V3 , sep='|' )
F9_04_GRANT_MT_5K_FRGN_INDIV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_MT_5K_FRGN_INDIV_X ) )
if( length( F9_04_GRANT_MT_5K_FRGN_INDIV_X ) > 1 )
{ 
  create_record( varname=F9_04_GRANT_MT_5K_FRGN_INDIV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_GRANT_MT_5K_FRGN_INDIV_X <-  paste0( '{', F9_04_GRANT_MT_5K_FRGN_INDIV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_PROF_FUNDR_X
## DESCRIPTION:  Professional fundraising?
## LOCATION:  F990-PC-PART-04-LINE-17
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/ProfessionalFundraising'
V2 <- '//Return/ReturnData/IRS990/ProfessionalFundraising'
V3 <- '//Return/ReturnData/IRS990/ProfessionalFundraisingInd'
V_PROF_FUNDR_X <- paste( V1, V2, V3 , sep='|' )
F9_04_PROF_FUNDR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PROF_FUNDR_X ) )
if( length( F9_04_PROF_FUNDR_X ) > 1 )
{ 
  create_record( varname=F9_04_PROF_FUNDR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_PROF_FUNDR_X <-  paste0( '{', F9_04_PROF_FUNDR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_FUNDR_ACT_X
## DESCRIPTION:  Fundraising activities?
## LOCATION:  F990-PC-PART-04-LINE-18
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/FundraisingActivities'
V2 <- '//Return/ReturnData/IRS990/FundraisingActivities'
V3 <- '//Return/ReturnData/IRS990/FundraisingActivitiesInd'
V_FUNDR_ACT_X <- paste( V1, V2, V3 , sep='|' )
F9_04_FUNDR_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_X ) )
if( length( F9_04_FUNDR_ACT_X ) > 1 )
{ 
  create_record( varname=F9_04_FUNDR_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_FUNDR_ACT_X <-  paste0( '{', F9_04_FUNDR_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_GAMING_X
## DESCRIPTION:  Special events Indicates revenue from gaming
## LOCATION:  F990-EZ-PART-01-LINE-06
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/IsAnyRevenueFromGaming'
V2 <- '//Return/ReturnData/IRS990/Form990PartIV/Gaming'
V3 <- '//Return/ReturnData/IRS990/Gaming'
V4 <- '//Return/ReturnData/IRS990/GamingActivitiesInd'
V5 <- '//Return/ReturnData/IRS990/IsAnyRevenueFromGaming'
V_GAMING_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_GAMING_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_X ) )
if( length( F9_04_GAMING_X ) > 1 )
{ 
  create_record( varname=F9_04_GAMING_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_GAMING_X <-  paste0( '{', F9_04_GAMING_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_HOSPITAL_X
## DESCRIPTION:  IRS990 - Hospital?
## LOCATION:  F990-EZ-PART-05-LINE-44B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OperateHospitalInd'
V2 <- '//Return/ReturnData/IRS990EZ/DoesOrgHaveHospital'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/Hospital'
V4 <- '//Return/ReturnData/IRS990/Hospital'
V5 <- '//Return/ReturnData/IRS990/OperateHospitalInd'
V_HOSPITAL_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_HOSPITAL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_HOSPITAL_X ) )
if( length( F9_04_HOSPITAL_X ) > 1 )
{ 
  create_record( varname=F9_04_HOSPITAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_HOSPITAL_X <-  paste0( '{', F9_04_HOSPITAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_HOSPITAL_AFS_X
## DESCRIPTION:  Audited financial statements?
## LOCATION:  F990-PC-PART-04-LINE-20B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AuditedFinancialStatements'
V2 <- '//Return/ReturnData/IRS990/AuditedFinancialStmtAttInd'
V3 <- '//Return/ReturnData/IRS990/FinancialStmtAttached'
V4 <- '//Return/ReturnData/IRS990/Form990PartIV/AuditedFinancialStatements'
V_HOSPITAL_AFS_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_04_HOSPITAL_AFS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_HOSPITAL_AFS_X ) )
if( length( F9_04_HOSPITAL_AFS_X ) > 1 )
{ 
  create_record( varname=F9_04_HOSPITAL_AFS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_HOSPITAL_AFS_X <-  paste0( '{', F9_04_HOSPITAL_AFS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_GRANT_MT_5K_US_ORG_X
## DESCRIPTION:  Grants to organizations?
## LOCATION:  F990-PC-PART-04-LINE-21
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/GrantsToOrganizations'
V2 <- '//Return/ReturnData/IRS990/GrantsToOrganizations'
V3 <- '//Return/ReturnData/IRS990/GrantsToOrganizationsInd'
V_GRANT_MT_5K_US_ORG_X <- paste( V1, V2, V3 , sep='|' )
F9_04_GRANT_MT_5K_US_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_MT_5K_US_ORG_X ) )
if( length( F9_04_GRANT_MT_5K_US_ORG_X ) > 1 )
{ 
  create_record( varname=F9_04_GRANT_MT_5K_US_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_GRANT_MT_5K_US_ORG_X <-  paste0( '{', F9_04_GRANT_MT_5K_US_ORG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_GRANT_MT_5K_US_INDIV_X
## DESCRIPTION:  Grants to individuals?
## LOCATION:  F990-PC-PART-04-LINE-22
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/GrantsToIndividualsInd'
V2 <- '//Return/ReturnData/IRS990/Form990PartIV/GrantsToIndividuals'
V3 <- '//Return/ReturnData/IRS990/GrantsToIndividuals'
V_GRANT_MT_5K_US_INDIV_X <- paste( V1, V2, V3 , sep='|' )
F9_04_GRANT_MT_5K_US_INDIV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_MT_5K_US_INDIV_X ) )
if( length( F9_04_GRANT_MT_5K_US_INDIV_X ) > 1 )
{ 
  create_record( varname=F9_04_GRANT_MT_5K_US_INDIV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_GRANT_MT_5K_US_INDIV_X <-  paste0( '{', F9_04_GRANT_MT_5K_US_INDIV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_COMP_DTK_YES_X
## DESCRIPTION:  PartVII; Lines 3; 4; or 5 = "Yes"?
## LOCATION:  F990-PC-PART-04-LINE-23
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/PartVII_3_4_Or_5EqualYes'
V2 <- '//Return/ReturnData/IRS990/ScheduleJRequired'
V3 <- '//Return/ReturnData/IRS990/ScheduleJRequiredInd'
V_COMP_DTK_YES_X <- paste( V1, V2, V3 , sep='|' )
F9_04_COMP_DTK_YES_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_YES_X ) )
if( length( F9_04_COMP_DTK_YES_X ) > 1 )
{ 
  create_record( varname=F9_04_COMP_DTK_YES_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_COMP_DTK_YES_X <-  paste0( '{', F9_04_COMP_DTK_YES_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TAX_EXEMPT_BOND_X
## DESCRIPTION:  Tax exempt bonds?
## LOCATION:  F990-PC-PART-04-LINE-24A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/TaxExemptBonds'
V2 <- '//Return/ReturnData/IRS990/TaxExemptBonds'
V3 <- '//Return/ReturnData/IRS990/TaxExemptBondsInd'
V_TAX_EXEMPT_BOND_X <- paste( V1, V2, V3 , sep='|' )
F9_04_TAX_EXEMPT_BOND_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_EXEMPT_BOND_X ) )
if( length( F9_04_TAX_EXEMPT_BOND_X ) > 1 )
{ 
  create_record( varname=F9_04_TAX_EXEMPT_BOND_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TAX_EXEMPT_BOND_X <-  paste0( '{', F9_04_TAX_EXEMPT_BOND_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TAX_EXEMPT_BOND_INVEST_X
## DESCRIPTION:  Investment income?
## LOCATION:  F990-PC-PART-04-LINE-24B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/InvestmentIncome'
V2 <- '//Return/ReturnData/IRS990/InvestTaxExemptBonds'
V3 <- '//Return/ReturnData/IRS990/InvestTaxExemptBondsInd'
V_TAX_EXEMPT_BOND_INVEST_X <- paste( V1, V2, V3 , sep='|' )
F9_04_TAX_EXEMPT_BOND_INVEST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_EXEMPT_BOND_INVEST_X ) )
if( length( F9_04_TAX_EXEMPT_BOND_INVEST_X ) > 1 )
{ 
  create_record( varname=F9_04_TAX_EXEMPT_BOND_INVEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TAX_EXEMPT_BOND_INVEST_X <-  paste0( '{', F9_04_TAX_EXEMPT_BOND_INVEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TAX_EXEMPT_BOND_ISSUER_X
## DESCRIPTION:  On behalf of issuer?
## LOCATION:  F990-PC-PART-04-LINE-24B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/OnBehalfOfIssuer'
V2 <- '//Return/ReturnData/IRS990/OnBehalfOfIssuer'
V3 <- '//Return/ReturnData/IRS990/OnBehalfOfIssuerInd'
V_TAX_EXEMPT_BOND_ISSUER_X <- paste( V1, V2, V3 , sep='|' )
F9_04_TAX_EXEMPT_BOND_ISSUER_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_EXEMPT_BOND_ISSUER_X ) )
if( length( F9_04_TAX_EXEMPT_BOND_ISSUER_X ) > 1 )
{ 
  create_record( varname=F9_04_TAX_EXEMPT_BOND_ISSUER_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TAX_EXEMPT_BOND_ISSUER_X <-  paste0( '{', F9_04_TAX_EXEMPT_BOND_ISSUER_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TAX_EXEMPT_BOND_ESCROW_X
## DESCRIPTION:  Escrow account?
## LOCATION:  F990-PC-PART-04-LINE-24C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/EscrowAccount'
V2 <- '//Return/ReturnData/IRS990/EscrowAccountInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/EscrowAccount'
V_TAX_EXEMPT_BOND_ESCROW_X <- paste( V1, V2, V3 , sep='|' )
F9_04_TAX_EXEMPT_BOND_ESCROW_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_EXEMPT_BOND_ESCROW_X ) )
if( length( F9_04_TAX_EXEMPT_BOND_ESCROW_X ) > 1 )
{ 
  create_record( varname=F9_04_TAX_EXEMPT_BOND_ESCROW_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TAX_EXEMPT_BOND_ESCROW_X <-  paste0( '{', F9_04_TAX_EXEMPT_BOND_ESCROW_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TRANSAC_ENGAGED_X
## DESCRIPTION:  501(c)(3) and 501(c)(4) orgs: Did the organization engage in any section 4958 excess benefit transaction
## LOCATION:  F990-EZ-PART-05-LINE-40B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/EngagedInExcessBenefitTrans'
V2 <- '//Return/ReturnData/IRS990EZ/EngagedInExcessBenefitTransInd'
V3 <- '//Return/ReturnData/IRS990/EngagedInExcessBenefitTrans'
V4 <- '//Return/ReturnData/IRS990/EngagedInExcessBenefitTransInd'
V5 <- '//Return/ReturnData/IRS990/ExcessBenefitTransaction'
V6 <- '//Return/ReturnData/IRS990/Form990PartIV/ExcessBenefitTransaction'
V_TRANSAC_ENGAGED_X <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_04_TRANSAC_ENGAGED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_ENGAGED_X ) )
if( length( F9_04_TRANSAC_ENGAGED_X ) > 1 )
{ 
  create_record( varname=F9_04_TRANSAC_ENGAGED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TRANSAC_ENGAGED_X <-  paste0( '{', F9_04_TRANSAC_ENGAGED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TRANSAC_PY_X
## DESCRIPTION:  Prior excess benefit transaction?
## LOCATION:  F990-PC-PART-04-LINE-25B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/PriorExcessBenefitTransaction'
V2 <- '//Return/ReturnData/IRS990/PriorExcessBenefitTransaction'
V3 <- '//Return/ReturnData/IRS990/PYExcessBenefitTransInd'
V_TRANSAC_PY_X <- paste( V1, V2, V3 , sep='|' )
F9_04_TRANSAC_PY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSAC_PY_X ) )
if( length( F9_04_TRANSAC_PY_X ) > 1 )
{ 
  create_record( varname=F9_04_TRANSAC_PY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TRANSAC_PY_X <-  paste0( '{', F9_04_TRANSAC_PY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_LOAN_DTK_X
## DESCRIPTION:  
## LOCATION:  F990-EZ-PART-05-LINE-38A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/MadeLoansToFromOfficers'
V2 <- '//Return/ReturnData/IRS990EZ/MadeLoansToFromOfficersInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/LoanToOfficerOrDQP'
V4 <- '//Return/ReturnData/IRS990/LoanOutstandingInd'
V5 <- '//Return/ReturnData/IRS990/LoanToOfficerOrDQP'
V_LOAN_DTK_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_LOAN_DTK_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOAN_DTK_X ) )
if( length( F9_04_LOAN_DTK_X ) > 1 )
{ 
  create_record( varname=F9_04_LOAN_DTK_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_LOAN_DTK_X <-  paste0( '{', F9_04_LOAN_DTK_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_GRANT_RLTD_PERS_X
## DESCRIPTION:  Grant to related person?
## LOCATION:  F990-PC-PART-04-LINE-27
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/GrantToRelatedPerson'
V2 <- '//Return/ReturnData/IRS990/GrantToRelatedPerson'
V3 <- '//Return/ReturnData/IRS990/GrantToRelatedPersonInd'
V_GRANT_RLTD_PERS_X <- paste( V1, V2, V3 , sep='|' )
F9_04_GRANT_RLTD_PERS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_RLTD_PERS_X ) )
if( length( F9_04_GRANT_RLTD_PERS_X ) > 1 )
{ 
  create_record( varname=F9_04_GRANT_RLTD_PERS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_GRANT_RLTD_PERS_X <-  paste0( '{', F9_04_GRANT_RLTD_PERS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_BIZ_TRANSAC_DTK_X
## DESCRIPTION:  Was the organization a party to a business transaction with one of the following parties: A current former officer, director, trustee, or key employee?
## LOCATION:  F990-PC-PART-04-LINE-28A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BsnssRltnshpWithOrganization'
V2 <- '//Return/ReturnData/IRS990/BusinessRlnWithOrgMemInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/BsnssRltnshpWithOrganization'
V_BIZ_TRANSAC_DTK_X <- paste( V1, V2, V3 , sep='|' )
F9_04_BIZ_TRANSAC_DTK_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BIZ_TRANSAC_DTK_X ) )
if( length( F9_04_BIZ_TRANSAC_DTK_X ) > 1 )
{ 
  create_record( varname=F9_04_BIZ_TRANSAC_DTK_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_BIZ_TRANSAC_DTK_X <-  paste0( '{', F9_04_BIZ_TRANSAC_DTK_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_BIZ_TRANSAC_DTK_FAM_X
## DESCRIPTION:  Was the organization a party to a business transaction with one of the following parties: A family member of a current or former officer, director, trustee, or key employee?
## LOCATION:  F990-PC-PART-04-LINE-28B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BsnssRltnshpThruFamilyMember'
V2 <- '//Return/ReturnData/IRS990/BusinessRlnWithFamMemInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/BsnssRltnshpThruFamilyMember'
V_BIZ_TRANSAC_DTK_FAM_X <- paste( V1, V2, V3 , sep='|' )
F9_04_BIZ_TRANSAC_DTK_FAM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BIZ_TRANSAC_DTK_FAM_X ) )
if( length( F9_04_BIZ_TRANSAC_DTK_FAM_X ) > 1 )
{ 
  create_record( varname=F9_04_BIZ_TRANSAC_DTK_FAM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_BIZ_TRANSAC_DTK_FAM_X <-  paste0( '{', F9_04_BIZ_TRANSAC_DTK_FAM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_BIZ_TRANSAC_DTK_ENTITY_X
## DESCRIPTION:  Was the organization a party to a business transaction with one of the following parties: An entity of which a current or former officer, director, trustee, or key employee (or a family member thereof) was an officer, director, trustee, or direct, or indirect owner?
## LOCATION:  F990-PC-PART-04-LINE-28C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BusinessRlnWithOfficerEntInd'
V2 <- '//Return/ReturnData/IRS990/Form990PartIV/OfficerEntityWithBsnssRltnshp'
V3 <- '//Return/ReturnData/IRS990/OfficerEntityWithBsnssRltnshp'
V_BIZ_TRANSAC_DTK_ENTITY_X <- paste( V1, V2, V3 , sep='|' )
F9_04_BIZ_TRANSAC_DTK_ENTITY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BIZ_TRANSAC_DTK_ENTITY_X ) )
if( length( F9_04_BIZ_TRANSAC_DTK_ENTITY_X ) > 1 )
{ 
  create_record( varname=F9_04_BIZ_TRANSAC_DTK_ENTITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_BIZ_TRANSAC_DTK_ENTITY_X <-  paste0( '{', F9_04_BIZ_TRANSAC_DTK_ENTITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_CONTR_NONCSH_MT_25K_X
## DESCRIPTION:  Did the organization receive more than $25,000 in non-cash contributions?
## LOCATION:  F990-PC-PART-04-LINE-29
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DeductibleNonCashContributions'
V2 <- '//Return/ReturnData/IRS990/DeductibleNonCashContriInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/DeductibleNonCashContributions'
V_CONTR_NONCSH_MT_25K_X <- paste( V1, V2, V3 , sep='|' )
F9_04_CONTR_NONCSH_MT_25K_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CONTR_NONCSH_MT_25K_X ) )
if( length( F9_04_CONTR_NONCSH_MT_25K_X ) > 1 )
{ 
  create_record( varname=F9_04_CONTR_NONCSH_MT_25K_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_CONTR_NONCSH_MT_25K_X <-  paste0( '{', F9_04_CONTR_NONCSH_MT_25K_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_CONTR_ART_HIST_X
## DESCRIPTION:  Did the organization receive contributions of art, historical treasures, or other similar assets, or qualified conservation contributions?
## LOCATION:  F990-PC-PART-04-LINE-30
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DeductibleArtContributionInd'
V2 <- '//Return/ReturnData/IRS990/DeductibleContributionsOfArt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/DeductibleContributionsOfArt'
V_CONTR_ART_HIST_X <- paste( V1, V2, V3 , sep='|' )
F9_04_CONTR_ART_HIST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CONTR_ART_HIST_X ) )
if( length( F9_04_CONTR_ART_HIST_X ) > 1 )
{ 
  create_record( varname=F9_04_CONTR_ART_HIST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_CONTR_ART_HIST_X <-  paste0( '{', F9_04_CONTR_ART_HIST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_LTD_X
## DESCRIPTION:  Form990 Part IV - Terminated? (F990-PC-PART-04-LINE-31-32-COMBINED: F990-EZ-PART-05-LINE-36)
## LOCATION:  F990-PC-PART-04-LINE-31
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/Terminated'
V2 <- '//Return/ReturnData/IRS990/Terminated'
V3 <- '//Return/ReturnData/IRS990/TerminateOperationsInd'
V_LTD_X <- paste( V1, V2, V3 , sep='|' )
F9_04_LTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LTD_X ) )
if( length( F9_04_LTD_X ) > 1 )
{ 
  create_record( varname=F9_04_LTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_LTD_X <-  paste0( '{', F9_04_LTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_LTD_DOA_X
## DESCRIPTION:  Discontinued ops or disposed 25pct assets (F990-PC-PART-04-LINE-31-32-COMBINED: F990-EZ-PART-05-LINE-36)
## LOCATION:  F990-EZ-PART-05-LINE-36
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OrganizationDissolvedEtc'
V2 <- '//Return/ReturnData/IRS990EZ/OrganizationDissolvedEtcInd'
V_LTD_DOA_X <- paste( V1, V2 , sep='|' )
F9_04_LTD_DOA_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LTD_DOA_X ) )
if( length( F9_04_LTD_DOA_X ) > 1 )
{ 
  create_record( varname=F9_04_LTD_DOA_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_LTD_DOA_X <-  paste0( '{', F9_04_LTD_DOA_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_DOA_X
## DESCRIPTION:  Partial liquidation? (F990-PC-PART-04-LINE-31-32-COMBINED: F990-EZ-PART-05-LINE-36)
## LOCATION:  F990-PC-PART-04-LINE-32
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/PartialLiquidation'
V2 <- '//Return/ReturnData/IRS990/PartialLiquidation'
V3 <- '//Return/ReturnData/IRS990/PartialLiquidationInd'
V_DOA_X <- paste( V1, V2, V3 , sep='|' )
F9_04_DOA_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DOA_X ) )
if( length( F9_04_DOA_X ) > 1 )
{ 
  create_record( varname=F9_04_DOA_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_DOA_X <-  paste0( '{', F9_04_DOA_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_ENTITY_DISREG_X
## DESCRIPTION:  Did the organization own 100% of an entity disregarded as sperate from the organization under Regulations sections 301.7701.2 and 301.7701-3?
## LOCATION:  F990-PC-PART-04-LINE-33
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DisregardedEntity'
V2 <- '//Return/ReturnData/IRS990/DisregardedEntityInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/DisregardedEntity'
V_ENTITY_DISREG_X <- paste( V1, V2, V3 , sep='|' )
F9_04_ENTITY_DISREG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENTITY_DISREG_X ) )
if( length( F9_04_ENTITY_DISREG_X ) > 1 )
{ 
  create_record( varname=F9_04_ENTITY_DISREG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_ENTITY_DISREG_X <-  paste0( '{', F9_04_ENTITY_DISREG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_ENTITY_RLTD_X
## DESCRIPTION:  Related entity?
## LOCATION:  F990-PC-PART-04-LINE-34
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIV/RelatedEntity'
V2 <- '//Return/ReturnData/IRS990/RelatedEntity'
V3 <- '//Return/ReturnData/IRS990/RelatedEntityInd'
V_ENTITY_RLTD_X <- paste( V1, V2, V3 , sep='|' )
F9_04_ENTITY_RLTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENTITY_RLTD_X ) )
if( length( F9_04_ENTITY_RLTD_X ) > 1 )
{ 
  create_record( varname=F9_04_ENTITY_RLTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_ENTITY_RLTD_X <-  paste0( '{', F9_04_ENTITY_RLTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_ENTITY_CTRL_X
## DESCRIPTION:  Did the organization have a controlled entity within the meaning of section 512(b)(13)?
## LOCATION:  F990-EZ-PART-05-LINE-45A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/RelatedOrganizationCtrlEntInd'
V2 <- '//Return/ReturnData/IRS990EZ/RelatedOrgControlledEntity'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/RelatedOrgControlledEntity'
V4 <- '//Return/ReturnData/IRS990/RelatedOrganizationCtrlEntInd'
V5 <- '//Return/ReturnData/IRS990/RelatedOrgControlledEntity'
V_ENTITY_CTRL_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_ENTITY_CTRL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENTITY_CTRL_X ) )
if( length( F9_04_ENTITY_CTRL_X ) > 1 )
{ 
  create_record( varname=F9_04_ENTITY_CTRL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_ENTITY_CTRL_X <-  paste0( '{', F9_04_ENTITY_CTRL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_ENTITY_CTRL_TRANSAC_X
## DESCRIPTION:  Did the organization have a controlled entity within the meaning of section 512(b)(13)?
## LOCATION:  F990-EZ-PART-05-LINE-45B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TransactionRelatedEntity'
V2 <- '//Return/ReturnData/IRS990EZ/TransactionWithControlEntInd'
V3 <- '//Return/ReturnData/IRS990EZ/TransactionWithControlEntity'
V4 <- '//Return/ReturnData/IRS990/TransactionRelatedEntity'
V5 <- '//Return/ReturnData/IRS990/TransactionWithControlEntInd'
V_ENTITY_CTRL_TRANSAC_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_ENTITY_CTRL_TRANSAC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENTITY_CTRL_TRANSAC_X ) )
if( length( F9_04_ENTITY_CTRL_TRANSAC_X ) > 1 )
{ 
  create_record( varname=F9_04_ENTITY_CTRL_TRANSAC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_ENTITY_CTRL_TRANSAC_X <-  paste0( '{', F9_04_ENTITY_CTRL_TRANSAC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_TRANSFER_EXEMPT_ORG_X
## DESCRIPTION:  Did the organization make any transfers to an exempt non-charitable related organization?
## LOCATION:  F990-EZ-PART-06-LINE-49A
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TrnsfrExmptNonChrtblRltdOrgInd'
V2 <- '//Return/ReturnData/IRS990EZ/TrnsfrsExemptNonCharRelatedOrg'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/TransfersToExemptNonChrtblOrg'
V4 <- '//Return/ReturnData/IRS990/TransfersToExemptNonChrtblOrg'
V5 <- '//Return/ReturnData/IRS990/TrnsfrExmptNonChrtblRltdOrgInd'
V_TRANSFER_EXEMPT_ORG_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_04_TRANSFER_EXEMPT_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TRANSFER_EXEMPT_ORG_X ) )
if( length( F9_04_TRANSFER_EXEMPT_ORG_X ) > 1 )
{ 
  create_record( varname=F9_04_TRANSFER_EXEMPT_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_TRANSFER_EXEMPT_ORG_X <-  paste0( '{', F9_04_TRANSFER_EXEMPT_ORG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_PTR_ACT_X
## DESCRIPTION:  Did the organization conduct more than 5% of its activities through an entity that is not a related organization and thatis treated as a partnership for federal income tax purposes?
## LOCATION:  F990-PC-PART-04-LINE-37
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ActivitiesConductedPartnership'
V2 <- '//Return/ReturnData/IRS990/ActivitiesConductedPrtshpInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartIV/ActivitiesConductedPartnership'
V_PTR_ACT_X <- paste( V1, V2, V3 , sep='|' )
F9_04_PTR_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PTR_ACT_X ) )
if( length( F9_04_PTR_ACT_X ) > 1 )
{ 
  create_record( varname=F9_04_PTR_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_PTR_ACT_X <-  paste0( '{', F9_04_PTR_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_SCHED_O_REQ_X
## DESCRIPTION:  Did the organization complete Schedule O and provide explanatios in Schedule O for Part VI, lines 11b and 19?
## LOCATION:  F990-PC-PART-04-LINE-38
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ScheduleORequired'
V2 <- '//Return/ReturnData/IRS990/ScheduleORequiredInd'
V_SCHED_O_REQ_X <- paste( V1, V2 , sep='|' )
F9_04_SCHED_O_REQ_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SCHED_O_REQ_X ) )
if( length( F9_04_SCHED_O_REQ_X ) > 1 )
{ 
  create_record( varname=F9_04_SCHED_O_REQ_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_SCHED_O_REQ_X <-  paste0( '{', F9_04_SCHED_O_REQ_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_04_DESC_IN_501C3_X,F9_04_SCHED_B_REQ_X,F9_04_POLI_ACT_X,F9_04_LOB_ACT_X,F9_04_PROXY_TAX_X,F9_04_DAF_X,F9_04_CONSERV_EMT_X,F9_04_COLLEC_ART_X,F9_04_CREDIT_COUNS_X,F9_04_ENDOW_X,F9_04_REP_BALANCE_SHEET_AMT_X,F9_04_REP_LAND_BLDG_EQUIP_X,F9_04_REP_INVEST_OTH_SEC_X,F9_04_REP_PROG_RLTD_X,F9_04_REP_OTH_ASSET_X,F9_04_REP_OTH_LIAB_X,F9_04_REP_FOOTNOTE_FIN48_X,F9_04_AFS_IND_X,F9_04_AFS_CONSOL_X,F9_04_SCHOOL_X,F9_04_FRGN_OFFICE_X,F9_04_FRGN_ACT_X,F9_04_GRANT_MT_5K_FRGN_ORG_X,F9_04_GRANT_MT_5K_FRGN_INDIV_X,F9_04_PROF_FUNDR_X,F9_04_FUNDR_ACT_X,F9_04_GAMING_X,F9_04_HOSPITAL_X,F9_04_HOSPITAL_AFS_X,F9_04_GRANT_MT_5K_US_ORG_X,F9_04_GRANT_MT_5K_US_INDIV_X,F9_04_COMP_DTK_YES_X,F9_04_TAX_EXEMPT_BOND_X,F9_04_TAX_EXEMPT_BOND_INVEST_X,F9_04_TAX_EXEMPT_BOND_ISSUER_X,F9_04_TAX_EXEMPT_BOND_ESCROW_X,F9_04_TRANSAC_ENGAGED_X,F9_04_TRANSAC_PY_X,F9_04_LOAN_DTK_X,F9_04_GRANT_RLTD_PERS_X,F9_04_BIZ_TRANSAC_DTK_X,F9_04_BIZ_TRANSAC_DTK_FAM_X,F9_04_BIZ_TRANSAC_DTK_ENTITY_X,F9_04_CONTR_NONCSH_MT_25K_X,F9_04_CONTR_ART_HIST_X,F9_04_LTD_X,F9_04_LTD_DOA_X,F9_04_DOA_X,F9_04_ENTITY_DISREG_X,F9_04_ENTITY_RLTD_X,F9_04_ENTITY_CTRL_X,F9_04_ENTITY_CTRL_TRANSAC_X,F9_04_TRANSFER_EXEMPT_ORG_X,F9_04_PTR_ACT_X,F9_04_SCHED_O_REQ_X)
df <- as.data.frame( var.list )


return( df )


}


