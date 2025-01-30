#' @title 
#'   Build table F9-P08-T00-REVENUE
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P08_T00_REVENUE <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_08_REV_CONTR_OTH
## DESCRIPTION:  All other contributions, gifts, grants, and similar amounts not included in above
## LOCATION:  F990-PC-PART-08-LINE-01F
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AllOtherContributions'
V2 <- '//Return/ReturnData/IRS990/AllOtherContributionsAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/AllOtherContributions'
V_REV_CONTR_OTH <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_OTH ) )
if( length( F9_08_REV_CONTR_OTH ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_OTH <-  paste0( '{', F9_08_REV_CONTR_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_EVNT_0
## DESCRIPTION:  8a-0
## LOCATION:  F990-PC-PART-08-LINE-08A-0
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CntrbtnsRprtdFundraisingEvents'
V2 <- '//Return/ReturnData/IRS990/ContriRptFundraisingEventAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/CntrbtnsRprtdFundraisingEvents'
V_REV_OTH_FUNDR_EVNT_0 <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_FUNDR_EVNT_0 <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_EVNT_0 ) )
if( length( F9_08_REV_OTH_FUNDR_EVNT_0 ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_EVNT_0, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_EVNT_0 <-  paste0( '{', F9_08_REV_OTH_FUNDR_EVNT_0, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INV_COST_GOODS
## DESCRIPTION:  inventory less:cost of goods sold
## LOCATION:  F990-PC-PART-08-LINE-10B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CostOfGoodsSold'
V2 <- '//Return/ReturnData/IRS990/CostOfGoodsSoldAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/CostOfGoodsSold'
V4 <- '//Return/ReturnData/IRS990EZ/CostOfGoodsSold'
V5 <- '//Return/ReturnData/IRS990EZ/CostOfGoodsSoldAmt'
V_REV_OTH_INV_COST_GOODS <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_INV_COST_GOODS <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INV_COST_GOODS ) )
if( length( F9_08_REV_OTH_INV_COST_GOODS ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INV_COST_GOODS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INV_COST_GOODS <-  paste0( '{', F9_08_REV_OTH_INV_COST_GOODS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_FED_CAMP
## DESCRIPTION:  Federated campaigns
## LOCATION:  F990-PC-PART-08-LINE-01A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FederatedCampaigns'
V2 <- '//Return/ReturnData/IRS990/FederatedCampaignsAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/FederatedCampaigns'
V_REV_CONTR_FED_CAMP <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_FED_CAMP <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_FED_CAMP ) )
if( length( F9_08_REV_CONTR_FED_CAMP ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_FED_CAMP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_FED_CAMP <-  paste0( '{', F9_08_REV_CONTR_FED_CAMP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_DIRECT_EXP
## DESCRIPTION:  Direct expenses
## LOCATION:  F990-PC-PART-08-LINE-08B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/FundraisingDirectExpenses'
V2 <- '//Return/ReturnData/IRS990/FundraisingDirectExpenses'
V3 <- '//Return/ReturnData/IRS990/FundraisingDirectExpensesAmt'
V_REV_OTH_FUNDR_DIRECT_EXP <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_FUNDR_DIRECT_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_DIRECT_EXP ) )
if( length( F9_08_REV_OTH_FUNDR_DIRECT_EXP ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_DIRECT_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_DIRECT_EXP <-  paste0( '{', F9_08_REV_OTH_FUNDR_DIRECT_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_FUNDR_EVNT
## DESCRIPTION:  Fundraising events
## LOCATION:  F990-PC-PART-08-LINE-01C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/FundraisingEvents'
V2 <- '//Return/ReturnData/IRS990/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/FundraisingEvents'
V_REV_CONTR_FUNDR_EVNT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_FUNDR_EVNT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_FUNDR_EVNT ) )
if( length( F9_08_REV_CONTR_FUNDR_EVNT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_FUNDR_EVNT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_FUNDR_EVNT <-  paste0( '{', F9_08_REV_CONTR_FUNDR_EVNT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_OTH
## DESCRIPTION:  Gain Or Loss - Other amount
## LOCATION:  F990-PC-PART-08-LINE-07C-COL-ii
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GainOrLoss/Other'
V2 <- '//Return/ReturnData/IRS990/GainOrLoss/Other'
V3 <- '//Return/ReturnData/IRS990/GainOrLossGrp/OtherAmt'
V_REV_OTH_SALE_GAIN_OTH <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_GAIN_OTH ) )
if( length( F9_08_REV_OTH_SALE_GAIN_OTH ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_GAIN_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_GAIN_OTH <-  paste0( '{', F9_08_REV_OTH_SALE_GAIN_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_SEC
## DESCRIPTION:  Securities amount
## LOCATION:  F990-PC-PART-08-LINE-07C-COL-i
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GainOrLoss/Securities'
V2 <- '//Return/ReturnData/IRS990/GainOrLoss/Securities'
V3 <- '//Return/ReturnData/IRS990/GainOrLossGrp/SecuritiesAmt'
V_REV_OTH_SALE_GAIN_SEC <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_SEC <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_GAIN_SEC ) )
if( length( F9_08_REV_OTH_SALE_GAIN_SEC ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_GAIN_SEC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_GAIN_SEC <-  paste0( '{', F9_08_REV_OTH_SALE_GAIN_SEC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_GAMING_DIRECT_EXP
## DESCRIPTION:  Direct expenses
## LOCATION:  F990-PC-PART-08-LINE-09B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GamingDirectExpenses'
V2 <- '//Return/ReturnData/IRS990/GamingDirectExpenses'
V3 <- '//Return/ReturnData/IRS990/GamingDirectExpensesAmt'
V_REV_OTH_GAMING_DIRECT_EXP <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_GAMING_DIRECT_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_GAMING_DIRECT_EXP ) )
if( length( F9_08_REV_OTH_GAMING_DIRECT_EXP ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_GAMING_DIRECT_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_GAMING_DIRECT_EXP <-  paste0( '{', F9_08_REV_OTH_GAMING_DIRECT_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_GOVT_GRANT
## DESCRIPTION:  Government grants (contributions)
## LOCATION:  F990-PC-PART-08-LINE-01E
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GovernmentGrants'
V2 <- '//Return/ReturnData/IRS990/GovernmentGrants'
V3 <- '//Return/ReturnData/IRS990/GovernmentGrantsAmt'
V_REV_CONTR_GOVT_GRANT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_GOVT_GRANT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_GOVT_GRANT ) )
if( length( F9_08_REV_CONTR_GOVT_GRANT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_GOVT_GRANT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_GOVT_GRANT <-  paste0( '{', F9_08_REV_CONTR_GOVT_GRANT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_ASSET_OTH
## DESCRIPTION:  Gross Amount Sales Assets - Other amount
## LOCATION:  F990-PC-PART-08-LINE-07A-COL-ii
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossAmountSalesAssets/Other'
V2 <- '//Return/ReturnData/IRS990/GrossAmountSalesAssets/Other'
V3 <- '//Return/ReturnData/IRS990/GrossAmountSalesAssetsGrp/OtherAmt'
V_REV_OTH_SALE_ASSET_OTH <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_ASSET_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_ASSET_OTH ) )
if( length( F9_08_REV_OTH_SALE_ASSET_OTH ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_ASSET_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_ASSET_OTH <-  paste0( '{', F9_08_REV_OTH_SALE_ASSET_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_ASSET_SEC
## DESCRIPTION:  Securities amount
## LOCATION:  F990-PC-PART-08-LINE-07A-COL-i
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossAmountSalesAssets/Securities'
V2 <- '//Return/ReturnData/IRS990/GrossAmountSalesAssets/Securities'
V3 <- '//Return/ReturnData/IRS990/GrossAmountSalesAssetsGrp/SecuritiesAmt'
V_REV_OTH_SALE_ASSET_SEC <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_ASSET_SEC <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_ASSET_SEC ) )
if( length( F9_08_REV_OTH_SALE_ASSET_SEC ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_ASSET_SEC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_ASSET_SEC <-  paste0( '{', F9_08_REV_OTH_SALE_ASSET_SEC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_EVNT_1
## DESCRIPTION:  Gross income from fundraising events
## LOCATION:  F990-PC-PART-08-LINE-08A-1
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossIncomeFundraisingEvents'
V2 <- '//Return/ReturnData/IRS990/FundraisingGrossIncomeAmt'
V3 <- '//Return/ReturnData/IRS990/GrossIncomeFundraisingEvents'
V4 <- '//Return/ReturnData/IRS990EZ/FundraisingGrossIncome'
V5 <- '//Return/ReturnData/IRS990EZ/FundraisingGrossIncomeAmt'
V_REV_OTH_FUNDR_EVNT_1 <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_FUNDR_EVNT_1 <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_EVNT_1 ) )
if( length( F9_08_REV_OTH_FUNDR_EVNT_1 ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_EVNT_1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_EVNT_1 <-  paste0( '{', F9_08_REV_OTH_FUNDR_EVNT_1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_GAMING
## DESCRIPTION:  Gross income from gaming
## LOCATION:  F990-PC-PART-08-LINE-09A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossIncomeGaming'
V2 <- '//Return/ReturnData/IRS990/GamingGrossIncomeAmt'
V3 <- '//Return/ReturnData/IRS990/GrossIncomeGaming'
V4 <- '//Return/ReturnData/IRS990/SpecialEventsGrossRevenue'
V5 <- '//Return/ReturnData/IRS990EZ/GamingGrossIncome'
V6 <- '//Return/ReturnData/IRS990EZ/GamingGrossIncomeAmt'
V7 <- '//Return/ReturnData/IRS990EZ/GrossIncomeGaming'
V8 <- '//Return/ReturnData/IRS990EZ/SpecialEventsGrossRevenue'
V_REV_OTH_GAMING <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_08_REV_OTH_GAMING <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_GAMING ) )
if( length( F9_08_REV_OTH_GAMING ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_GAMING, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_GAMING <-  paste0( '{', F9_08_REV_OTH_GAMING, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_GRO_PERS
## DESCRIPTION:  Gross Rents - Amount
## LOCATION:  F990-PC-PART-08-LINE-06A-COL-ii
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossRents/Personal'
V2 <- '//Return/ReturnData/IRS990/GrossRents/Personal'
V3 <- '//Return/ReturnData/IRS990/GrossRentsGrp/PersonalAmt'
V_REV_OTH_RENT_GRO_PERS <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_GRO_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_GRO_PERS ) )
if( length( F9_08_REV_OTH_RENT_GRO_PERS ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_GRO_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_GRO_PERS <-  paste0( '{', F9_08_REV_OTH_RENT_GRO_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_GRO_REAL
## DESCRIPTION:  Gross Rents - Real amount
## LOCATION:  F990-PC-PART-08-LINE-06A-COL-i
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossRents/Real'
V2 <- '//Return/ReturnData/IRS990/GrossRents/Real'
V3 <- '//Return/ReturnData/IRS990/GrossRentsGrp/RealAmt'
V_REV_OTH_RENT_GRO_REAL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_GRO_REAL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_GRO_REAL ) )
if( length( F9_08_REV_OTH_RENT_GRO_REAL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_GRO_REAL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_GRO_REAL <-  paste0( '{', F9_08_REV_OTH_RENT_GRO_REAL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INV_GRO_SALE
## DESCRIPTION:  Gross sales of inventory; less returns and allowances
## LOCATION:  F990-PC-PART-08-LINE-10A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossSalesOfInventory'
V2 <- '//Return/ReturnData/IRS990/GrossSalesOfInventory'
V3 <- '//Return/ReturnData/IRS990/GrossSalesOfInventoryAmt'
V4 <- '//Return/ReturnData/IRS990EZ/GrossSalesOfInventory'
V5 <- '//Return/ReturnData/IRS990EZ/GrossSalesOfInventoryAmt'
V_REV_OTH_INV_GRO_SALE <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_INV_GRO_SALE <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INV_GRO_SALE ) )
if( length( F9_08_REV_OTH_INV_GRO_SALE ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INV_GRO_SALE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INV_GRO_SALE <-  paste0( '{', F9_08_REV_OTH_INV_GRO_SALE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_BOND_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-04-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/IncomeFromInvestBondProceeds/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/IncmFromInvestBondProceedsGrp/ExclusionAmt'
V3 <- '//Return/ReturnData/IRS990/IncomeFromInvestBondProceeds/ExclusionAmount'
V_REV_OTH_INVEST_BOND_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_BOND_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_BOND_EXCL ) )
if( length( F9_08_REV_OTH_INVEST_BOND_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_BOND_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_BOND_EXCL <-  paste0( '{', F9_08_REV_OTH_INVEST_BOND_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_BOND_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-04-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/IncomeFromInvestBondProceeds/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/IncmFromInvestBondProceedsGrp/RelatedOrExemptFuncIncomeAmt'
V3 <- '//Return/ReturnData/IRS990/IncomeFromInvestBondProceeds/RelatedOrExemptFunctionIncome'
V_REV_OTH_INVEST_BOND_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_BOND_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_BOND_RLTD ) )
if( length( F9_08_REV_OTH_INVEST_BOND_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_BOND_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_BOND_RLTD <-  paste0( '{', F9_08_REV_OTH_INVEST_BOND_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_BOND_TOT
## DESCRIPTION:  Income From Invest Bond Proceeds - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-04-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/IncomeFromInvestBondProceeds/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/IncmFromInvestBondProceedsGrp/TotalRevenueColumnAmt'
V3 <- '//Return/ReturnData/IRS990/IncomeFromInvestBondProceeds/TotalRevenueColumn'
V_REV_OTH_INVEST_BOND_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_BOND_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_BOND_TOT ) )
if( length( F9_08_REV_OTH_INVEST_BOND_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_BOND_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_BOND_TOT <-  paste0( '{', F9_08_REV_OTH_INVEST_BOND_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_BOND_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-04-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/IncomeFromInvestBondProceeds/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/IncmFromInvestBondProceedsGrp/UnrelatedBusinessRevenueAmt'
V3 <- '//Return/ReturnData/IRS990/IncomeFromInvestBondProceeds/UnrelatedBusinessRevenue'
V_REV_OTH_INVEST_BOND_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_BOND_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_BOND_UBIZ ) )
if( length( F9_08_REV_OTH_INVEST_BOND_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_BOND_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_BOND_UBIZ <-  paste0( '{', F9_08_REV_OTH_INVEST_BOND_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_INCOME_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-03-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/InvestmentIncome/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/InvestmentIncome/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/InvestmentIncomeGrp/ExclusionAmt'
V_REV_OTH_INVEST_INCOME_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_INCOME_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_INCOME_EXCL ) )
if( length( F9_08_REV_OTH_INVEST_INCOME_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_INCOME_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_INCOME_EXCL <-  paste0( '{', F9_08_REV_OTH_INVEST_INCOME_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_INCOME_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-03-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/InvestmentIncome/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/InvestmentIncome/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/InvestmentIncomeGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_OTH_INVEST_INCOME_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_INCOME_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_INCOME_RLTD ) )
if( length( F9_08_REV_OTH_INVEST_INCOME_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_INCOME_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_INCOME_RLTD <-  paste0( '{', F9_08_REV_OTH_INVEST_INCOME_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_INCOME_TOT
## DESCRIPTION:  Investment Income - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-03-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/InvestmentIncome/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/InvestmentIncome/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/InvestmentIncomeGrp/TotalRevenueColumnAmt'
V4 <- '//Return/ReturnData/IRS990EZ/InvestmentIncome'
V5 <- '//Return/ReturnData/IRS990EZ/InvestmentIncome/TotalRevenueColumn'
V6 <- '//Return/ReturnData/IRS990EZ/InvestmentIncomeAmt'
V7 <- '//Return/ReturnData/IRS990EZ/InvestmentIncomeGrp/TotalRevenueColumnAmt'
V_REV_OTH_INVEST_INCOME_TOT <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_08_REV_OTH_INVEST_INCOME_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_INCOME_TOT ) )
if( length( F9_08_REV_OTH_INVEST_INCOME_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_INCOME_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_INCOME_TOT <-  paste0( '{', F9_08_REV_OTH_INVEST_INCOME_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_INCOME_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-03-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/InvestmentIncome/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/InvestmentIncome/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/InvestmentIncomeGrp/UnrelatedBusinessRevenueAmt'
V_REV_OTH_INVEST_INCOME_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INVEST_INCOME_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INVEST_INCOME_UBIZ ) )
if( length( F9_08_REV_OTH_INVEST_INCOME_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INVEST_INCOME_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INVEST_INCOME_UBIZ <-  paste0( '{', F9_08_REV_OTH_INVEST_INCOME_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_LESS_COST_OTH
## DESCRIPTION:  Less Cost Oth Basis Sales Expenses - Other amount
## LOCATION:  F990-PC-PART-08-LINE-07B-COL-ii
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/LessCostOthBasisSalesExpenses/Other'
V2 <- '//Return/ReturnData/IRS990/LessCostOthBasisSalesExpenses/Other'
V3 <- '//Return/ReturnData/IRS990/LessCostOthBasisSalesExpnssGrp/OtherAmt'
V_REV_OTH_SALE_LESS_COST_OTH <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_LESS_COST_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_LESS_COST_OTH ) )
if( length( F9_08_REV_OTH_SALE_LESS_COST_OTH ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_LESS_COST_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_LESS_COST_OTH <-  paste0( '{', F9_08_REV_OTH_SALE_LESS_COST_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_LESS_COST_SEC
## DESCRIPTION:  Securities amount
## LOCATION:  F990-PC-PART-08-LINE-07B-COL-i
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/LessCostOthBasisSalesExpenses/Securities'
V2 <- '//Return/ReturnData/IRS990/LessCostOthBasisSalesExpenses/Securities'
V3 <- '//Return/ReturnData/IRS990/LessCostOthBasisSalesExpnssGrp/SecuritiesAmt'
V_REV_OTH_SALE_LESS_COST_SEC <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_LESS_COST_SEC <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_LESS_COST_SEC ) )
if( length( F9_08_REV_OTH_SALE_LESS_COST_SEC ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_LESS_COST_SEC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_LESS_COST_SEC <-  paste0( '{', F9_08_REV_OTH_SALE_LESS_COST_SEC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_LESS_EXP_PERS
## DESCRIPTION:  Less Rental Expenses - Amount
## LOCATION:  F990-PC-PART-08-LINE-06B-COL-ii
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/LessRentalExpenses/Personal'
V2 <- '//Return/ReturnData/IRS990/LessRentalExpenses/Personal'
V3 <- '//Return/ReturnData/IRS990/LessRentalExpensesGrp/PersonalAmt'
V_REV_OTH_RENT_LESS_EXP_PERS <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_LESS_EXP_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_LESS_EXP_PERS ) )
if( length( F9_08_REV_OTH_RENT_LESS_EXP_PERS ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_LESS_EXP_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_LESS_EXP_PERS <-  paste0( '{', F9_08_REV_OTH_RENT_LESS_EXP_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_LESS_EXP_REAL
## DESCRIPTION:  Less Rental Expenses - Real amount
## LOCATION:  F990-PC-PART-08-LINE-06B-COL-i
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/LessRentalExpenses/Real'
V2 <- '//Return/ReturnData/IRS990/LessRentalExpenses/Real'
V3 <- '//Return/ReturnData/IRS990/LessRentalExpensesGrp/RealAmt'
V_REV_OTH_RENT_LESS_EXP_REAL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_LESS_EXP_REAL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_LESS_EXP_REAL ) )
if( length( F9_08_REV_OTH_RENT_LESS_EXP_REAL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_LESS_EXP_REAL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_LESS_EXP_REAL <-  paste0( '{', F9_08_REV_OTH_RENT_LESS_EXP_REAL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_MISC_OTH_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-11D-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/MiscellaneousRevenue/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/MiscellaneousRevenue/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/MiscellaneousRevenueGrp/ExclusionAmt'
V_REV_MISC_OTH_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_MISC_OTH_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_MISC_OTH_EXCL ) )
if( length( F9_08_REV_MISC_OTH_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_MISC_OTH_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_MISC_OTH_EXCL <-  paste0( '{', F9_08_REV_MISC_OTH_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_MISC_OTH_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-11D-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/MiscellaneousRevenue/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/MiscellaneousRevenue/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/MiscellaneousRevenueGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_MISC_OTH_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_MISC_OTH_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_MISC_OTH_RLTD ) )
if( length( F9_08_REV_MISC_OTH_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_MISC_OTH_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_MISC_OTH_RLTD <-  paste0( '{', F9_08_REV_MISC_OTH_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_MISC_OTH_TOT
## DESCRIPTION:  Miscellaneous Revenue - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-11D-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/MiscellaneousRevenue/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/MiscellaneousRevenue/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/MiscellaneousRevenueGrp/TotalRevenueColumnAmt'
V_REV_MISC_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_MISC_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_MISC_OTH_TOT ) )
if( length( F9_08_REV_MISC_OTH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_MISC_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_MISC_OTH_TOT <-  paste0( '{', F9_08_REV_MISC_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_MISC_OTH_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-11D-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/MiscellaneousRevenue/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/MiscellaneousRevenue/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/MiscellaneousRevenueGrp/UnrelatedBusinessRevenueAmt'
V_REV_MISC_OTH_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_MISC_OTH_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_MISC_OTH_UBIZ ) )
if( length( F9_08_REV_MISC_OTH_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_MISC_OTH_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_MISC_OTH_UBIZ <-  paste0( '{', F9_08_REV_MISC_OTH_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_NET_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-07D-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetGainOrLossInvestments/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestments/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestmentsGrp/ExclusionAmt'
V_REV_OTH_SALE_GAIN_NET_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_NET_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_EXCL ) )
if( length( F9_08_REV_OTH_SALE_GAIN_NET_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_GAIN_NET_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_GAIN_NET_EXCL <-  paste0( '{', F9_08_REV_OTH_SALE_GAIN_NET_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_NET_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-07D-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetGainOrLossInvestments/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestments/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestmentsGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_OTH_SALE_GAIN_NET_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_NET_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_RLTD ) )
if( length( F9_08_REV_OTH_SALE_GAIN_NET_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_GAIN_NET_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_GAIN_NET_RLTD <-  paste0( '{', F9_08_REV_OTH_SALE_GAIN_NET_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_NET_TOT
## DESCRIPTION:  Net Gain Or Loss Investments - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-07D-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetGainOrLossInvestments/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestments/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestmentsGrp/TotalRevenueColumnAmt'
V4 <- '//Return/ReturnData/IRS990EZ/GainOrLossFromSaleOfAssets'
V5 <- '//Return/ReturnData/IRS990EZ/GainOrLossFromSaleOfAssetsAmt'
V_REV_OTH_SALE_GAIN_NET_TOT <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_NET_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_TOT ) )
if( length( F9_08_REV_OTH_SALE_GAIN_NET_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_GAIN_NET_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_GAIN_NET_TOT <-  paste0( '{', F9_08_REV_OTH_SALE_GAIN_NET_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_NET_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-07D-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetGainOrLossInvestments/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestments/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestmentsGrp/UnrelatedBusinessRevenueAmt'
V_REV_OTH_SALE_GAIN_NET_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_NET_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_UBIZ ) )
if( length( F9_08_REV_OTH_SALE_GAIN_NET_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_GAIN_NET_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_GAIN_NET_UBIZ <-  paste0( '{', F9_08_REV_OTH_SALE_GAIN_NET_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_NET_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-08C-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromFundraisingEvents/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/NetIncmFromFundraisingEvtGrp/ExclusionAmt'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromFundraisingEvents/ExclusionAmount'
V_REV_OTH_FUNDR_NET_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_FUNDR_NET_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_NET_EXCL ) )
if( length( F9_08_REV_OTH_FUNDR_NET_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_NET_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_NET_EXCL <-  paste0( '{', F9_08_REV_OTH_FUNDR_NET_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_NET_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-08C-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromFundraisingEvents/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/NetIncomeFromFundraisingEvents/RelatedOrExemptFunctionIncome'
V_REV_OTH_FUNDR_NET_RLTD <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_FUNDR_NET_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_NET_RLTD ) )
if( length( F9_08_REV_OTH_FUNDR_NET_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_NET_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_NET_RLTD <-  paste0( '{', F9_08_REV_OTH_FUNDR_NET_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_NET_TOT
## DESCRIPTION:  Net Income From Fundraising Events - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-08C-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromFundraisingEvents/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/NetIncmFromFundraisingEvtGrp/TotalRevenueColumnAmt'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromFundraisingEvents/TotalRevenueColumn'
V_REV_OTH_FUNDR_NET_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_FUNDR_NET_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_NET_TOT ) )
if( length( F9_08_REV_OTH_FUNDR_NET_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_NET_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_NET_TOT <-  paste0( '{', F9_08_REV_OTH_FUNDR_NET_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_NET_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-08C-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromFundraisingEvents/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/NetIncmFromFundraisingEvtGrp/UnrelatedBusinessRevenueAmt'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromFundraisingEvents/UnrelatedBusinessRevenue'
V_REV_OTH_FUNDR_NET_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_FUNDR_NET_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_FUNDR_NET_UBIZ ) )
if( length( F9_08_REV_OTH_FUNDR_NET_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_FUNDR_NET_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_FUNDR_NET_UBIZ <-  paste0( '{', F9_08_REV_OTH_FUNDR_NET_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_GAMING_NET_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-09C-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromGaming/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/NetIncomeFromGaming/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromGamingGrp/ExclusionAmt'
V_REV_OTH_GAMING_NET_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_GAMING_NET_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_GAMING_NET_EXCL ) )
if( length( F9_08_REV_OTH_GAMING_NET_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_GAMING_NET_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_GAMING_NET_EXCL <-  paste0( '{', F9_08_REV_OTH_GAMING_NET_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_GAMING_NET_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-09C-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromGaming/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/NetIncomeFromGaming/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromGamingGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_OTH_GAMING_NET_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_GAMING_NET_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_GAMING_NET_RLTD ) )
if( length( F9_08_REV_OTH_GAMING_NET_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_GAMING_NET_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_GAMING_NET_RLTD <-  paste0( '{', F9_08_REV_OTH_GAMING_NET_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_GAMING_NET_TOT
## DESCRIPTION:  Net Income From Gaming - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-09C-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromGaming/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/NetIncomeFromGaming/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromGamingGrp/TotalRevenueColumnAmt'
V_REV_OTH_GAMING_NET_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_GAMING_NET_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_GAMING_NET_TOT ) )
if( length( F9_08_REV_OTH_GAMING_NET_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_GAMING_NET_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_GAMING_NET_TOT <-  paste0( '{', F9_08_REV_OTH_GAMING_NET_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_GAMING_NET_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-09C-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromGaming/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/NetIncomeFromGaming/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/NetIncomeFromGamingGrp/UnrelatedBusinessRevenueAmt'
V_REV_OTH_GAMING_NET_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_GAMING_NET_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_GAMING_NET_UBIZ ) )
if( length( F9_08_REV_OTH_GAMING_NET_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_GAMING_NET_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_GAMING_NET_UBIZ <-  paste0( '{', F9_08_REV_OTH_GAMING_NET_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INV_NET_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-10C-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeOrLoss/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/NetIncomeOrLoss/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/NetIncomeOrLossGrp/ExclusionAmt'
V_REV_OTH_INV_NET_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INV_NET_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INV_NET_EXCL ) )
if( length( F9_08_REV_OTH_INV_NET_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INV_NET_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INV_NET_EXCL <-  paste0( '{', F9_08_REV_OTH_INV_NET_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INV_NET_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-10C-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeOrLoss/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/NetIncomeOrLoss/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/NetIncomeOrLossGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_OTH_INV_NET_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INV_NET_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INV_NET_RLTD ) )
if( length( F9_08_REV_OTH_INV_NET_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INV_NET_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INV_NET_RLTD <-  paste0( '{', F9_08_REV_OTH_INV_NET_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INV_NET_TOT
## DESCRIPTION:  Net Income Or Loss - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-10C-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeOrLoss/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/NetIncomeOrLoss/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/NetIncomeOrLossGrp/TotalRevenueColumnAmt'
V4 <- '//Return/ReturnData/IRS990EZ/GroProfitLossSalesOfInventory'
V5 <- '//Return/ReturnData/IRS990EZ/GrossProfitLossSlsOfInvntryAmt'
V_REV_OTH_INV_NET_TOT <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_INV_NET_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INV_NET_TOT ) )
if( length( F9_08_REV_OTH_INV_NET_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INV_NET_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INV_NET_TOT <-  paste0( '{', F9_08_REV_OTH_INV_NET_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_INV_NET_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-10C-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeOrLoss/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/NetIncomeOrLoss/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/NetIncomeOrLossGrp/UnrelatedBusinessRevenueAmt'
V_REV_OTH_INV_NET_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_INV_NET_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_INV_NET_UBIZ ) )
if( length( F9_08_REV_OTH_INV_NET_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_INV_NET_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_INV_NET_UBIZ <-  paste0( '{', F9_08_REV_OTH_INV_NET_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_NET_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-06D-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetRentalIncomeOrLoss/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLoss/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLossGrp/ExclusionAmt'
V_REV_OTH_RENT_NET_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_NET_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_NET_EXCL ) )
if( length( F9_08_REV_OTH_RENT_NET_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_NET_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_NET_EXCL <-  paste0( '{', F9_08_REV_OTH_RENT_NET_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_NET_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-06D-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetRentalIncomeOrLoss/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLoss/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLossGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_OTH_RENT_NET_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_NET_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_NET_RLTD ) )
if( length( F9_08_REV_OTH_RENT_NET_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_NET_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_NET_RLTD <-  paste0( '{', F9_08_REV_OTH_RENT_NET_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_NET_TOT
## DESCRIPTION:  Net Rental Income Or Loss - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-06D-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetRentalIncomeOrLoss/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLoss/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLossGrp/TotalRevenueColumnAmt'
V_REV_OTH_RENT_NET_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_NET_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_NET_TOT ) )
if( length( F9_08_REV_OTH_RENT_NET_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_NET_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_NET_TOT <-  paste0( '{', F9_08_REV_OTH_RENT_NET_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_NET_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-06D-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetRentalIncomeOrLoss/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLoss/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/NetRentalIncomeOrLossGrp/UnrelatedBusinessRevenueAmt'
V_REV_OTH_RENT_NET_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_NET_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_NET_UBIZ ) )
if( length( F9_08_REV_OTH_RENT_NET_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_NET_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_NET_UBIZ <-  paste0( '{', F9_08_REV_OTH_RENT_NET_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_NONCSH
## DESCRIPTION:  Noncash contributions; attach Schedule M
## LOCATION:  F990-PC-PART-08-LINE-01G
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NoncashContributions'
V2 <- '//Return/ReturnData/IRS990/NoncashContributions'
V3 <- '//Return/ReturnData/IRS990/NoncashContributionsAmt'
V_REV_CONTR_NONCSH <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_NONCSH <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_NONCSH ) )
if( length( F9_08_REV_CONTR_NONCSH ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_NONCSH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_NONCSH <-  paste0( '{', F9_08_REV_CONTR_NONCSH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_RLTD_ORG
## DESCRIPTION:  Related organizations
## LOCATION:  F990-PC-PART-08-LINE-01D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RelatedOrganizations'
V2 <- '//Return/ReturnData/IRS990/RelatedOrganizations'
V3 <- '//Return/ReturnData/IRS990/RelatedOrganizationsAmt'
V_REV_CONTR_RLTD_ORG <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_RLTD_ORG <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_RLTD_ORG ) )
if( length( F9_08_REV_CONTR_RLTD_ORG ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_RLTD_ORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_RLTD_ORG <-  paste0( '{', F9_08_REV_CONTR_RLTD_ORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_INCOME_PERS
## DESCRIPTION:  Rental Income Or Loss - Amount
## LOCATION:  F990-PC-PART-08-LINE-06C-COL-ii
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RentalIncomeOrLoss/Personal'
V2 <- '//Return/ReturnData/IRS990/RentalIncomeOrLoss/Personal'
V3 <- '//Return/ReturnData/IRS990/RentalIncomeOrLossGrp/PersonalAmt'
V_REV_OTH_RENT_INCOME_PERS <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_INCOME_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_INCOME_PERS ) )
if( length( F9_08_REV_OTH_RENT_INCOME_PERS ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_INCOME_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_INCOME_PERS <-  paste0( '{', F9_08_REV_OTH_RENT_INCOME_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_RENT_INCOME_REAL
## DESCRIPTION:  Rental Income Or Loss - Real amount
## LOCATION:  F990-PC-PART-08-LINE-06C-COL-i
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RentalIncomeOrLoss/Real'
V2 <- '//Return/ReturnData/IRS990/RentalIncomeOrLoss/Real'
V3 <- '//Return/ReturnData/IRS990/RentalIncomeOrLossGrp/RealAmt'
V_REV_OTH_RENT_INCOME_REAL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_RENT_INCOME_REAL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_RENT_INCOME_REAL ) )
if( length( F9_08_REV_OTH_RENT_INCOME_REAL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_RENT_INCOME_REAL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_RENT_INCOME_REAL <-  paste0( '{', F9_08_REV_OTH_RENT_INCOME_REAL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_ROY_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-05-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RoyaltiesRevenue/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/RoyaltiesRevenue/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesRevenueGrp/ExclusionAmt'
V_REV_OTH_ROY_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_ROY_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_ROY_EXCL ) )
if( length( F9_08_REV_OTH_ROY_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_ROY_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_ROY_EXCL <-  paste0( '{', F9_08_REV_OTH_ROY_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_ROY_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-05-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RoyaltiesRevenue/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/RoyaltiesRevenue/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesRevenueGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_OTH_ROY_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_ROY_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_ROY_RLTD ) )
if( length( F9_08_REV_OTH_ROY_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_ROY_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_ROY_RLTD <-  paste0( '{', F9_08_REV_OTH_ROY_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_ROY_TOT
## DESCRIPTION:  Royalties Revenue - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-05-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RoyaltiesRevenue/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/RoyaltiesRevenue/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesRevenueGrp/TotalRevenueColumnAmt'
V_REV_OTH_ROY_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_ROY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_ROY_TOT ) )
if( length( F9_08_REV_OTH_ROY_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_ROY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_ROY_TOT <-  paste0( '{', F9_08_REV_OTH_ROY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_ROY_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-05-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/RoyaltiesRevenue/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/RoyaltiesRevenue/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesRevenueGrp/UnrelatedBusinessRevenueAmt'
V_REV_OTH_ROY_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_OTH_ROY_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_ROY_UBIZ ) )
if( length( F9_08_REV_OTH_ROY_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_ROY_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_ROY_UBIZ <-  paste0( '{', F9_08_REV_OTH_ROY_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_TOT
## DESCRIPTION:  Total contributions
## LOCATION:  F990-PC-PART-08-LINE-01H-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalContributions'
V2 <- '//Return/ReturnData/IRS990/TotalContributions'
V3 <- '//Return/ReturnData/IRS990/TotalContributionsAmt'
V_REV_CONTR_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_CONTR_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_TOT ) )
if( length( F9_08_REV_CONTR_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_TOT <-  paste0( '{', F9_08_REV_CONTR_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_MISC_TOT_TOT
## DESCRIPTION:  Other miscellaneous revenue total
## LOCATION:  F990-PC-PART-08-LINE-11E-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalOtherRevenue'
V2 <- '//Return/ReturnData/IRS990/OtherRevenueTotalAmt'
V3 <- '//Return/ReturnData/IRS990/TotalOtherRevenue'
V4 <- '//Return/ReturnData/IRS990EZ/OtherRevenue/Amount'
V5 <- '//Return/ReturnData/IRS990EZ/OtherRevenueCurrentYear'
V6 <- '//Return/ReturnData/IRS990EZ/OtherRevenueTotal'
V7 <- '//Return/ReturnData/IRS990EZ/OtherRevenueTotalAmt'
V_REV_MISC_TOT_TOT <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_08_REV_MISC_TOT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_MISC_TOT_TOT ) )
if( length( F9_08_REV_MISC_TOT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_MISC_TOT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_MISC_TOT_TOT <-  paste0( '{', F9_08_REV_MISC_TOT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_PROG_OTH_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-02F-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalOthProgramServiceRevenue/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevenue/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevGrp/ExclusionAmt'
V_REV_PROG_OTH_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_PROG_OTH_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_PROG_OTH_EXCL ) )
if( length( F9_08_REV_PROG_OTH_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_PROG_OTH_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_PROG_OTH_EXCL <-  paste0( '{', F9_08_REV_PROG_OTH_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_PROG_OTH_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-02F-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalOthProgramServiceRevenue/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevenue/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_PROG_OTH_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_PROG_OTH_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_PROG_OTH_RLTD ) )
if( length( F9_08_REV_PROG_OTH_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_PROG_OTH_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_PROG_OTH_RLTD <-  paste0( '{', F9_08_REV_PROG_OTH_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_PROG_OTH_TOT
## DESCRIPTION:  Total Oth Program Service Revenue - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-02F-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalOthProgramServiceRevenue/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevenue/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevGrp/TotalRevenueColumnAmt'
V_REV_PROG_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_PROG_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_PROG_OTH_TOT ) )
if( length( F9_08_REV_PROG_OTH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_PROG_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_PROG_OTH_TOT <-  paste0( '{', F9_08_REV_PROG_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_PROG_OTH_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-02F-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalOthProgramServiceRevenue/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevenue/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/TotalOthProgramServiceRevGrp/UnrelatedBusinessRevenueAmt'
V_REV_PROG_OTH_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_PROG_OTH_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_PROG_OTH_UBIZ ) )
if( length( F9_08_REV_PROG_OTH_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_PROG_OTH_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_PROG_OTH_UBIZ <-  paste0( '{', F9_08_REV_PROG_OTH_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_PROG_TOT_TOT
## DESCRIPTION:  Program service revenue total
## LOCATION:  F990-PC-PART-08-LINE-02G-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalProgramServiceRevenue'
V2 <- '//Return/ReturnData/IRS990/TotalProgramServiceRevenue'
V3 <- '//Return/ReturnData/IRS990/TotalProgramServiceRevenueAmt'
V_REV_PROG_TOT_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_PROG_TOT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_PROG_TOT_TOT ) )
if( length( F9_08_REV_PROG_TOT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_PROG_TOT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_PROG_TOT_TOT <-  paste0( '{', F9_08_REV_PROG_TOT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_TOT_EXCL
## DESCRIPTION:  Excluded by section 512; 513; or 514: amount
## LOCATION:  F990-PC-PART-08-LINE-12-COL-D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalRevenue/ExclusionAmount'
V2 <- '//Return/ReturnData/IRS990/TotalRevenue/ExclusionAmount'
V3 <- '//Return/ReturnData/IRS990/TotalRevenueGrp/ExclusionAmt'
V_REV_TOT_EXCL <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_TOT_EXCL <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_TOT_EXCL ) )
if( length( F9_08_REV_TOT_EXCL ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_TOT_EXCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_TOT_EXCL <-  paste0( '{', F9_08_REV_TOT_EXCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_TOT_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-12-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalRevenue/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/TotalRevenue/RelatedOrExemptFunctionIncome'
V3 <- '//Return/ReturnData/IRS990/TotalRevenueGrp/RelatedOrExemptFuncIncomeAmt'
V_REV_TOT_RLTD <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_TOT_RLTD <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_TOT_RLTD ) )
if( length( F9_08_REV_TOT_RLTD ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_TOT_RLTD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_TOT_RLTD <-  paste0( '{', F9_08_REV_TOT_RLTD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_TOT_TOT
## DESCRIPTION:  Total Revenue - Total revenue
## LOCATION:  F990-PC-PART-08-LINE-12-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalRevenue/TotalRevenueColumn'
V2 <- '//Return/ReturnData/IRS990/TotalRevenue/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990/TotalRevenueGrp/TotalRevenueColumnAmt'
V_REV_TOT_TOT <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_TOT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_TOT_TOT ) )
if( length( F9_08_REV_TOT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_TOT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_TOT_TOT <-  paste0( '{', F9_08_REV_TOT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_TOT_UBIZ
## DESCRIPTION:  Unrelated business revenue
## LOCATION:  F990-PC-PART-08-LINE-12-COL-C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalRevenue/UnrelatedBusinessRevenue'
V2 <- '//Return/ReturnData/IRS990/TotalRevenue/UnrelatedBusinessRevenue'
V3 <- '//Return/ReturnData/IRS990/TotalRevenueGrp/UnrelatedBusinessRevenueAmt'
V_REV_TOT_UBIZ <- paste( V1, V2, V3 , sep='|' )
F9_08_REV_TOT_UBIZ <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_TOT_UBIZ ) )
if( length( F9_08_REV_TOT_UBIZ ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_TOT_UBIZ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_TOT_UBIZ <-  paste0( '{', F9_08_REV_TOT_UBIZ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part VIII
## LOCATION:  F990-PC-PART-08-LINE-00
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVIII'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVIIIInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_08_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_08_INFO_SCHED_O_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_INFO_SCHED_O_X <-  paste0( '{', F9_08_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_CONTR_MEMBSHIP_DUE
## DESCRIPTION:  Membership Dues
## LOCATION:  F990-PC-PART-08-LINE-01B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/MembershipDues'
V2 <- '//Return/ReturnData/IRS990/MembershipDuesAmt'
V3 <- '//Return/ReturnData/IRS990EZ/MembershipDues'
V4 <- '//Return/ReturnData/IRS990EZ/MembershipDuesAmt'
V_REV_CONTR_MEMBSHIP_DUE <- paste( V1, V2, V3, V4 , sep='|' )
F9_08_REV_CONTR_MEMBSHIP_DUE <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_CONTR_MEMBSHIP_DUE ) )
if( length( F9_08_REV_CONTR_MEMBSHIP_DUE ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_CONTR_MEMBSHIP_DUE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_CONTR_MEMBSHIP_DUE <-  paste0( '{', F9_08_REV_CONTR_MEMBSHIP_DUE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_LESS_COST
## DESCRIPTION:  Cost or other basis and sales expenses (F990-PC-PART-08-LINE-07B-COL-i-ii-COMBINED: F990-EZ-PART-01-LINE-05B)
## LOCATION:  F990-EZ-PART-01-LINE-05B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/CostOrOtherBasisExpenseSaleAmt'
V2 <- '//Return/ReturnData/IRS990EZ/CostOtherBasisAndSalesExpenses'
V_REV_OTH_SALE_LESS_COST <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_SALE_LESS_COST <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_LESS_COST ) )
if( length( F9_08_REV_OTH_SALE_LESS_COST ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_LESS_COST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_LESS_COST <-  paste0( '{', F9_08_REV_OTH_SALE_LESS_COST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_SALE_ASSET
## DESCRIPTION:  Gross amount from sale of assets other than inventory (F990-PC-PART-08-LINE-07A-COL-i-ii-COMBINED: F990-EZ-PART-01-LINE-05A)
## LOCATION:  F990-EZ-PART-01-LINE-05A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GrossAmountFromSaleOfAssets'
V2 <- '//Return/ReturnData/IRS990EZ/SaleOfAssetsGrossAmt'
V_REV_OTH_SALE_ASSET <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_SALE_ASSET <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_SALE_ASSET ) )
if( length( F9_08_REV_OTH_SALE_ASSET ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_SALE_ASSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_SALE_ASSET <-  paste0( '{', F9_08_REV_OTH_SALE_ASSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_EVNT_DIRECT_EXP
## DESCRIPTION:  Special events direct expenses (F990-PC-PART-08-LINE-08B-09B-COMBINED: F990-EZ-PART-01-LINE-06C)
## LOCATION:  F990-EZ-PART-01-LINE-06C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SpecialEventsDirectExpenses'
V2 <- '//Return/ReturnData/IRS990EZ/SpecialEventsDirectExpensesAmt'
V_REV_OTH_EVNT_DIRECT_EXP <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_EVNT_DIRECT_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_EVNT_DIRECT_EXP ) )
if( length( F9_08_REV_OTH_EVNT_DIRECT_EXP ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_EVNT_DIRECT_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_EVNT_DIRECT_EXP <-  paste0( '{', F9_08_REV_OTH_EVNT_DIRECT_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_08_REV_OTH_EVNT_NET_TOT
## DESCRIPTION:  Special events net income (or loss) (F990-PC-PART-08-LINE-08C-09C-COL-A-COMBINED: F990-EZ-PART-01-LINE-06D)
## LOCATION:  F990-EZ-PART-01-LINE-06D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SpecialEventsNetIncomeLoss'
V2 <- '//Return/ReturnData/IRS990EZ/SpecialEventsNetIncomeLossAmt'
V_REV_OTH_EVNT_NET_TOT <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_EVNT_NET_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_REV_OTH_EVNT_NET_TOT ) )
if( length( F9_08_REV_OTH_EVNT_NET_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_08_REV_OTH_EVNT_NET_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_08_REV_OTH_EVNT_NET_TOT <-  paste0( '{', F9_08_REV_OTH_EVNT_NET_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_08_REV_CONTR_OTH,F9_08_REV_OTH_FUNDR_EVNT_0,F9_08_REV_OTH_INV_COST_GOODS,F9_08_REV_CONTR_FED_CAMP,F9_08_REV_OTH_FUNDR_DIRECT_EXP,F9_08_REV_CONTR_FUNDR_EVNT,F9_08_REV_OTH_SALE_GAIN_OTH,F9_08_REV_OTH_SALE_GAIN_SEC,F9_08_REV_OTH_GAMING_DIRECT_EXP,F9_08_REV_CONTR_GOVT_GRANT,F9_08_REV_OTH_SALE_ASSET_OTH,F9_08_REV_OTH_SALE_ASSET_SEC,F9_08_REV_OTH_FUNDR_EVNT_1,F9_08_REV_OTH_GAMING,F9_08_REV_OTH_RENT_GRO_PERS,F9_08_REV_OTH_RENT_GRO_REAL,F9_08_REV_OTH_INV_GRO_SALE,F9_08_REV_OTH_INVEST_BOND_EXCL,F9_08_REV_OTH_INVEST_BOND_RLTD,F9_08_REV_OTH_INVEST_BOND_TOT,F9_08_REV_OTH_INVEST_BOND_UBIZ,F9_08_REV_OTH_INVEST_INCOME_EXCL,F9_08_REV_OTH_INVEST_INCOME_RLTD,F9_08_REV_OTH_INVEST_INCOME_TOT,F9_08_REV_OTH_INVEST_INCOME_UBIZ,F9_08_REV_OTH_SALE_LESS_COST_OTH,F9_08_REV_OTH_SALE_LESS_COST_SEC,F9_08_REV_OTH_RENT_LESS_EXP_PERS,F9_08_REV_OTH_RENT_LESS_EXP_REAL,F9_08_REV_MISC_OTH_EXCL,F9_08_REV_MISC_OTH_RLTD,F9_08_REV_MISC_OTH_TOT,F9_08_REV_MISC_OTH_UBIZ,F9_08_REV_OTH_SALE_GAIN_NET_EXCL,F9_08_REV_OTH_SALE_GAIN_NET_RLTD,F9_08_REV_OTH_SALE_GAIN_NET_TOT,F9_08_REV_OTH_SALE_GAIN_NET_UBIZ,F9_08_REV_OTH_FUNDR_NET_EXCL,F9_08_REV_OTH_FUNDR_NET_RLTD,F9_08_REV_OTH_FUNDR_NET_TOT,F9_08_REV_OTH_FUNDR_NET_UBIZ,F9_08_REV_OTH_GAMING_NET_EXCL,F9_08_REV_OTH_GAMING_NET_RLTD,F9_08_REV_OTH_GAMING_NET_TOT,F9_08_REV_OTH_GAMING_NET_UBIZ,F9_08_REV_OTH_INV_NET_EXCL,F9_08_REV_OTH_INV_NET_RLTD,F9_08_REV_OTH_INV_NET_TOT,F9_08_REV_OTH_INV_NET_UBIZ,F9_08_REV_OTH_RENT_NET_EXCL,F9_08_REV_OTH_RENT_NET_RLTD,F9_08_REV_OTH_RENT_NET_TOT,F9_08_REV_OTH_RENT_NET_UBIZ,F9_08_REV_CONTR_NONCSH,F9_08_REV_CONTR_RLTD_ORG,F9_08_REV_OTH_RENT_INCOME_PERS,F9_08_REV_OTH_RENT_INCOME_REAL,F9_08_REV_OTH_ROY_EXCL,F9_08_REV_OTH_ROY_RLTD,F9_08_REV_OTH_ROY_TOT,F9_08_REV_OTH_ROY_UBIZ,F9_08_REV_CONTR_TOT,F9_08_REV_MISC_TOT_TOT,F9_08_REV_PROG_OTH_EXCL,F9_08_REV_PROG_OTH_RLTD,F9_08_REV_PROG_OTH_TOT,F9_08_REV_PROG_OTH_UBIZ,F9_08_REV_PROG_TOT_TOT,F9_08_REV_TOT_EXCL,F9_08_REV_TOT_RLTD,F9_08_REV_TOT_TOT,F9_08_REV_TOT_UBIZ,F9_08_INFO_SCHED_O_X,F9_08_REV_CONTR_MEMBSHIP_DUE,F9_08_REV_OTH_SALE_LESS_COST,F9_08_REV_OTH_SALE_ASSET,F9_08_REV_OTH_EVNT_DIRECT_EXP,F9_08_REV_OTH_EVNT_NET_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


