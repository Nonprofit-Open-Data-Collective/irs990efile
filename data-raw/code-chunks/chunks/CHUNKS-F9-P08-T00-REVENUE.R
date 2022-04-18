#' @title 
#'   Build table F9-P08-T00-REVENUE
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P08_T00_REVENUE <- function( doc, url )
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

ORG_EIN <- xml_text( xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



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
ORG_NAME_L1 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



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
ORG_NAME_L2 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml_text( xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml_text( xml_find_all( doc, TEMP_TAX_YEAR ) )



######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_08_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part VIII
## LOCATION:  F990-PC-PART-08-LINE-00
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVIII'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVIIIInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_08_INFO_SCHED_O_X <- xml_text( xml_find_all( doc, V_INFO_SCHED_O_X ) )




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
F9_08_REV_CONTR_FED_CAMP <- xml_text( xml_find_all( doc, V_REV_CONTR_FED_CAMP ) )




## VARIABLE NAME:  F9_08_REV_CONTR_MEMBSHIP_DUE
## DESCRIPTION:  Membership Dues
## LOCATION:  F990-EZ-PART-01-LINE-03
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/MembershipDues'
V2 <- '//Return/ReturnData/IRS990EZ/MembershipDuesAmt'
V3 <- '//Return/ReturnData/IRS990/MembershipDues'
V4 <- '//Return/ReturnData/IRS990/MembershipDuesAmt'
V_REV_CONTR_MEMBSHIP_DUE <- paste( V1, V2, V3, V4 , sep='|' )
F9_08_REV_CONTR_MEMBSHIP_DUE <- xml_text( xml_find_all( doc, V_REV_CONTR_MEMBSHIP_DUE ) )




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
F9_08_REV_CONTR_FUNDR_EVNT <- xml_text( xml_find_all( doc, V_REV_CONTR_FUNDR_EVNT ) )




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
F9_08_REV_CONTR_RLTD_ORG <- xml_text( xml_find_all( doc, V_REV_CONTR_RLTD_ORG ) )




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
F9_08_REV_CONTR_GOVT_GRANT <- xml_text( xml_find_all( doc, V_REV_CONTR_GOVT_GRANT ) )




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
F9_08_REV_CONTR_OTH <- xml_text( xml_find_all( doc, V_REV_CONTR_OTH ) )




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
F9_08_REV_CONTR_NONCSH <- xml_text( xml_find_all( doc, V_REV_CONTR_NONCSH ) )




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
F9_08_REV_CONTR_TOT <- xml_text( xml_find_all( doc, V_REV_CONTR_TOT ) )




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
F9_08_REV_PROG_OTH_TOT <- xml_text( xml_find_all( doc, V_REV_PROG_OTH_TOT ) )




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
F9_08_REV_PROG_OTH_RLTD <- xml_text( xml_find_all( doc, V_REV_PROG_OTH_RLTD ) )




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
F9_08_REV_PROG_OTH_UBIZ <- xml_text( xml_find_all( doc, V_REV_PROG_OTH_UBIZ ) )




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
F9_08_REV_PROG_OTH_EXCL <- xml_text( xml_find_all( doc, V_REV_PROG_OTH_EXCL ) )




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
F9_08_REV_PROG_TOT_TOT <- xml_text( xml_find_all( doc, V_REV_PROG_TOT_TOT ) )




## VARIABLE NAME:  F9_08_REV_OTH_INVEST_INCOME_TOT
## DESCRIPTION:  Invest income
## LOCATION:  F990-EZ-PART-01-LINE-04
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InvestmentIncome'
V2 <- '//Return/ReturnData/IRS990EZ/InvestmentIncome/TotalRevenueColumn'
V3 <- '//Return/ReturnData/IRS990EZ/InvestmentIncomeAmt'
V4 <- '//Return/ReturnData/IRS990EZ/InvestmentIncomeGrp/TotalRevenueColumnAmt'
V5 <- '//Return/ReturnData/IRS990/Form990PartVIII/InvestmentIncome/TotalRevenueColumn'
V6 <- '//Return/ReturnData/IRS990/InvestmentIncome/TotalRevenueColumn'
V7 <- '//Return/ReturnData/IRS990/InvestmentIncomeGrp/TotalRevenueColumnAmt'
V_REV_OTH_INVEST_INCOME_TOT <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_08_REV_OTH_INVEST_INCOME_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_INCOME_TOT ) )




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
F9_08_REV_OTH_INVEST_INCOME_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_INCOME_RLTD ) )




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
F9_08_REV_OTH_INVEST_INCOME_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_INCOME_UBIZ ) )




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
F9_08_REV_OTH_INVEST_INCOME_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_INCOME_EXCL ) )




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
F9_08_REV_OTH_INVEST_BOND_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_BOND_TOT ) )




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
F9_08_REV_OTH_INVEST_BOND_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_BOND_RLTD ) )




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
F9_08_REV_OTH_INVEST_BOND_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_BOND_UBIZ ) )




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
F9_08_REV_OTH_INVEST_BOND_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_INVEST_BOND_EXCL ) )




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
F9_08_REV_OTH_ROY_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_ROY_TOT ) )




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
F9_08_REV_OTH_ROY_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_ROY_RLTD ) )




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
F9_08_REV_OTH_ROY_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_ROY_UBIZ ) )




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
F9_08_REV_OTH_ROY_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_ROY_EXCL ) )




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
F9_08_REV_OTH_RENT_GRO_REAL <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_GRO_REAL ) )




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
F9_08_REV_OTH_RENT_GRO_PERS <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_GRO_PERS ) )




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
F9_08_REV_OTH_RENT_LESS_EXP_REAL <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_LESS_EXP_REAL ) )




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
F9_08_REV_OTH_RENT_LESS_EXP_PERS <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_LESS_EXP_PERS ) )




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
F9_08_REV_OTH_RENT_INCOME_REAL <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_INCOME_REAL ) )




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
F9_08_REV_OTH_RENT_INCOME_PERS <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_INCOME_PERS ) )




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
F9_08_REV_OTH_RENT_NET_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_NET_TOT ) )




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
F9_08_REV_OTH_RENT_NET_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_NET_RLTD ) )




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
F9_08_REV_OTH_RENT_NET_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_NET_UBIZ ) )




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
F9_08_REV_OTH_RENT_NET_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_RENT_NET_EXCL ) )




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
F9_08_REV_OTH_SALE_ASSET_SEC <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_ASSET_SEC ) )




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
F9_08_REV_OTH_SALE_ASSET_OTH <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_ASSET_OTH ) )




## VARIABLE NAME:  F9_08_REV_OTH_SALE_ASSET
## DESCRIPTION:  Gross amount from sale of assets other than inventory (F990-PC-PART-08-LINE-07A-COL-i-ii-COMBINED: F990-EZ-PART-01-LINE-05A)
## LOCATION:  F990-EZ-PART-01-LINE-05A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GrossAmountFromSaleOfAssets'
V2 <- '//Return/ReturnData/IRS990EZ/SaleOfAssetsGrossAmt'
V_REV_OTH_SALE_ASSET <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_SALE_ASSET <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_ASSET ) )




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
F9_08_REV_OTH_SALE_LESS_COST_SEC <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_LESS_COST_SEC ) )




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
F9_08_REV_OTH_SALE_LESS_COST_OTH <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_LESS_COST_OTH ) )




## VARIABLE NAME:  F9_08_REV_OTH_SALE_LESS_COST
## DESCRIPTION:  Cost or other basis and sales expenses (F990-PC-PART-08-LINE-07B-COL-i-ii-COMBINED: F990-EZ-PART-01-LINE-05B)
## LOCATION:  F990-EZ-PART-01-LINE-05B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/CostOrOtherBasisExpenseSaleAmt'
V2 <- '//Return/ReturnData/IRS990EZ/CostOtherBasisAndSalesExpenses'
V_REV_OTH_SALE_LESS_COST <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_SALE_LESS_COST <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_LESS_COST ) )




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
F9_08_REV_OTH_SALE_GAIN_SEC <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_GAIN_SEC ) )




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
F9_08_REV_OTH_SALE_GAIN_OTH <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_GAIN_OTH ) )




## VARIABLE NAME:  F9_08_REV_OTH_SALE_GAIN_NET_TOT
## DESCRIPTION:  Gain or (loss) from sale of assets other than inventory
## LOCATION:  F990-EZ-PART-01-LINE-05C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GainOrLossFromSaleOfAssets'
V2 <- '//Return/ReturnData/IRS990EZ/GainOrLossFromSaleOfAssetsAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetGainOrLossInvestments/TotalRevenueColumn'
V4 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestments/TotalRevenueColumn'
V5 <- '//Return/ReturnData/IRS990/NetGainOrLossInvestmentsGrp/TotalRevenueColumnAmt'
V_REV_OTH_SALE_GAIN_NET_TOT <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_SALE_GAIN_NET_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_TOT ) )




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
F9_08_REV_OTH_SALE_GAIN_NET_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_RLTD ) )




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
F9_08_REV_OTH_SALE_GAIN_NET_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_UBIZ ) )




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
F9_08_REV_OTH_SALE_GAIN_NET_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_SALE_GAIN_NET_EXCL ) )




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
F9_08_REV_OTH_FUNDR_EVNT_0 <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_EVNT_0 ) )




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_EVNT_1
## DESCRIPTION:  IRS990 - 8a-1
## LOCATION:  F990-EZ-PART-01-LINE-06B-1
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/FundraisingGrossIncomeAmt'
V2 <- '//Return/ReturnData/IRS990EZ/FundraisingGrossIncome'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossIncomeFundraisingEvents'
V4 <- '//Return/ReturnData/IRS990/FundraisingGrossIncomeAmt'
V5 <- '//Return/ReturnData/IRS990/GrossIncomeFundraisingEvents'
V_REV_OTH_FUNDR_EVNT_1 <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_FUNDR_EVNT_1 <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_EVNT_1 ) )




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
F9_08_REV_OTH_FUNDR_DIRECT_EXP <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_DIRECT_EXP ) )




## VARIABLE NAME:  F9_08_REV_OTH_EVNT_DIRECT_EXP
## DESCRIPTION:  Special events direct expenses (F990-PC-PART-08-LINE-08B-09B-COMBINED: F990-EZ-PART-01-LINE-06C)
## LOCATION:  F990-EZ-PART-01-LINE-06C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SpecialEventsDirectExpenses'
V2 <- '//Return/ReturnData/IRS990EZ/SpecialEventsDirectExpensesAmt'
V_REV_OTH_EVNT_DIRECT_EXP <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_EVNT_DIRECT_EXP <- xml_text( xml_find_all( doc, V_REV_OTH_EVNT_DIRECT_EXP ) )




## VARIABLE NAME:  F9_08_REV_OTH_EVNT_NET_TOT
## DESCRIPTION:  Special events net income (or loss) (F990-PC-PART-08-LINE-08C-09C-COL-A-COMBINED: F990-EZ-PART-01-LINE-06D)
## LOCATION:  F990-EZ-PART-01-LINE-06D
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/SpecialEventsNetIncomeLoss'
V2 <- '//Return/ReturnData/IRS990EZ/SpecialEventsNetIncomeLossAmt'
V_REV_OTH_EVNT_NET_TOT <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_EVNT_NET_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_EVNT_NET_TOT ) )




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
F9_08_REV_OTH_FUNDR_NET_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_NET_TOT ) )




## VARIABLE NAME:  F9_08_REV_OTH_FUNDR_NET_RLTD
## DESCRIPTION:  Related or exempt function revenue
## LOCATION:  F990-PC-PART-08-LINE-08C-COL-B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeFromFundraisingEvents/RelatedOrExemptFunctionIncome'
V2 <- '//Return/ReturnData/IRS990/NetIncomeFromFundraisingEvents/RelatedOrExemptFunctionIncome'
V_REV_OTH_FUNDR_NET_RLTD <- paste( V1, V2 , sep='|' )
F9_08_REV_OTH_FUNDR_NET_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_NET_RLTD ) )




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
F9_08_REV_OTH_FUNDR_NET_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_NET_UBIZ ) )




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
F9_08_REV_OTH_FUNDR_NET_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_FUNDR_NET_EXCL ) )




## VARIABLE NAME:  F9_08_REV_OTH_GAMING
## DESCRIPTION:  Gross income from gaming activities
## LOCATION:  F990-EZ-PART-01-LINE-06A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GamingGrossIncome'
V2 <- '//Return/ReturnData/IRS990EZ/GamingGrossIncomeAmt'
V3 <- '//Return/ReturnData/IRS990EZ/GrossIncomeGaming'
V4 <- '//Return/ReturnData/IRS990EZ/SpecialEventsGrossRevenue'
V5 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossIncomeGaming'
V6 <- '//Return/ReturnData/IRS990/GamingGrossIncomeAmt'
V7 <- '//Return/ReturnData/IRS990/GrossIncomeGaming'
V8 <- '//Return/ReturnData/IRS990/SpecialEventsGrossRevenue'
V_REV_OTH_GAMING <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_08_REV_OTH_GAMING <- xml_text( xml_find_all( doc, V_REV_OTH_GAMING ) )




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
F9_08_REV_OTH_GAMING_DIRECT_EXP <- xml_text( xml_find_all( doc, V_REV_OTH_GAMING_DIRECT_EXP ) )




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
F9_08_REV_OTH_GAMING_NET_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_GAMING_NET_TOT ) )




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
F9_08_REV_OTH_GAMING_NET_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_GAMING_NET_RLTD ) )




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
F9_08_REV_OTH_GAMING_NET_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_GAMING_NET_UBIZ ) )




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
F9_08_REV_OTH_GAMING_NET_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_GAMING_NET_EXCL ) )




## VARIABLE NAME:  F9_08_REV_OTH_INV_GRO_SALE
## DESCRIPTION:  gross sales of inventory
## LOCATION:  F990-EZ-PART-01-LINE-07A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GrossSalesOfInventory'
V2 <- '//Return/ReturnData/IRS990EZ/GrossSalesOfInventoryAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/GrossSalesOfInventory'
V4 <- '//Return/ReturnData/IRS990/GrossSalesOfInventory'
V5 <- '//Return/ReturnData/IRS990/GrossSalesOfInventoryAmt'
V_REV_OTH_INV_GRO_SALE <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_INV_GRO_SALE <- xml_text( xml_find_all( doc, V_REV_OTH_INV_GRO_SALE ) )




## VARIABLE NAME:  F9_08_REV_OTH_INV_COST_GOODS
## DESCRIPTION:  Less: cost of goods sold
## LOCATION:  F990-EZ-PART-01-LINE-07B
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/CostOfGoodsSold'
V2 <- '//Return/ReturnData/IRS990EZ/CostOfGoodsSoldAmt'
V3 <- '//Return/ReturnData/IRS990/CostOfGoodsSold'
V4 <- '//Return/ReturnData/IRS990/CostOfGoodsSoldAmt'
V5 <- '//Return/ReturnData/IRS990/Form990PartVIII/CostOfGoodsSold'
V_REV_OTH_INV_COST_GOODS <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_INV_COST_GOODS <- xml_text( xml_find_all( doc, V_REV_OTH_INV_COST_GOODS ) )




## VARIABLE NAME:  F9_08_REV_OTH_INV_NET_TOT
## DESCRIPTION:  Gross profit (or loss) from sales of inventory
## LOCATION:  F990-EZ-PART-01-LINE-07C
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GroProfitLossSalesOfInventory'
V2 <- '//Return/ReturnData/IRS990EZ/GrossProfitLossSlsOfInvntryAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIII/NetIncomeOrLoss/TotalRevenueColumn'
V4 <- '//Return/ReturnData/IRS990/NetIncomeOrLoss/TotalRevenueColumn'
V5 <- '//Return/ReturnData/IRS990/NetIncomeOrLossGrp/TotalRevenueColumnAmt'
V_REV_OTH_INV_NET_TOT <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_08_REV_OTH_INV_NET_TOT <- xml_text( xml_find_all( doc, V_REV_OTH_INV_NET_TOT ) )




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
F9_08_REV_OTH_INV_NET_RLTD <- xml_text( xml_find_all( doc, V_REV_OTH_INV_NET_RLTD ) )




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
F9_08_REV_OTH_INV_NET_UBIZ <- xml_text( xml_find_all( doc, V_REV_OTH_INV_NET_UBIZ ) )




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
F9_08_REV_OTH_INV_NET_EXCL <- xml_text( xml_find_all( doc, V_REV_OTH_INV_NET_EXCL ) )




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
F9_08_REV_MISC_OTH_TOT <- xml_text( xml_find_all( doc, V_REV_MISC_OTH_TOT ) )




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
F9_08_REV_MISC_OTH_RLTD <- xml_text( xml_find_all( doc, V_REV_MISC_OTH_RLTD ) )




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
F9_08_REV_MISC_OTH_UBIZ <- xml_text( xml_find_all( doc, V_REV_MISC_OTH_UBIZ ) )




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
F9_08_REV_MISC_OTH_EXCL <- xml_text( xml_find_all( doc, V_REV_MISC_OTH_EXCL ) )




## VARIABLE NAME:  F9_08_REV_MISC_TOT_TOT
## DESCRIPTION:  Other miscellaneous revenue total
## LOCATION:  F990-PC-PART-08-LINE-11E-COL-A
## TABLE:  F9-P08-T00-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIII/TotalOtherRevenue'
V2 <- '//Return/ReturnData/IRS990/OtherRevenueTotalAmt'
V3 <- '//Return/ReturnData/IRS990/TotalOtherRevenue'
V4 <- '//Return/ReturnData/IRS990EZ/OtherRevenueCurrentYear'
V5 <- '//Return/ReturnData/IRS990EZ/OtherRevenueTotal'
V6 <- '//Return/ReturnData/IRS990EZ/OtherRevenueTotalAmt'
V7 <- '//Return/ReturnData/IRS990EZ/OtherRevenue/Amount'
V_REV_MISC_TOT_TOT <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_08_REV_MISC_TOT_TOT <- xml_text( xml_find_all( doc, V_REV_MISC_TOT_TOT ) )




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
F9_08_REV_TOT_TOT <- xml_text( xml_find_all( doc, V_REV_TOT_TOT ) )




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
F9_08_REV_TOT_RLTD <- xml_text( xml_find_all( doc, V_REV_TOT_RLTD ) )




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
F9_08_REV_TOT_UBIZ <- xml_text( xml_find_all( doc, V_REV_TOT_UBIZ ) )




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
F9_08_REV_TOT_EXCL <- xml_text( xml_find_all( doc, V_REV_TOT_EXCL ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_08_INFO_SCHED_O_X,F9_08_REV_CONTR_FED_CAMP,F9_08_REV_CONTR_MEMBSHIP_DUE,F9_08_REV_CONTR_FUNDR_EVNT,F9_08_REV_CONTR_RLTD_ORG,F9_08_REV_CONTR_GOVT_GRANT,F9_08_REV_CONTR_OTH,F9_08_REV_CONTR_NONCSH,F9_08_REV_CONTR_TOT,F9_08_REV_PROG_OTH_TOT,F9_08_REV_PROG_OTH_RLTD,F9_08_REV_PROG_OTH_UBIZ,F9_08_REV_PROG_OTH_EXCL,F9_08_REV_PROG_TOT_TOT,F9_08_REV_OTH_INVEST_INCOME_TOT,F9_08_REV_OTH_INVEST_INCOME_RLTD,F9_08_REV_OTH_INVEST_INCOME_UBIZ,F9_08_REV_OTH_INVEST_INCOME_EXCL,F9_08_REV_OTH_INVEST_BOND_TOT,F9_08_REV_OTH_INVEST_BOND_RLTD,F9_08_REV_OTH_INVEST_BOND_UBIZ,F9_08_REV_OTH_INVEST_BOND_EXCL,F9_08_REV_OTH_ROY_TOT,F9_08_REV_OTH_ROY_RLTD,F9_08_REV_OTH_ROY_UBIZ,F9_08_REV_OTH_ROY_EXCL,F9_08_REV_OTH_RENT_GRO_REAL,F9_08_REV_OTH_RENT_GRO_PERS,F9_08_REV_OTH_RENT_LESS_EXP_REAL,F9_08_REV_OTH_RENT_LESS_EXP_PERS,F9_08_REV_OTH_RENT_INCOME_REAL,F9_08_REV_OTH_RENT_INCOME_PERS,F9_08_REV_OTH_RENT_NET_TOT,F9_08_REV_OTH_RENT_NET_RLTD,F9_08_REV_OTH_RENT_NET_UBIZ,F9_08_REV_OTH_RENT_NET_EXCL,F9_08_REV_OTH_SALE_ASSET_SEC,F9_08_REV_OTH_SALE_ASSET_OTH,F9_08_REV_OTH_SALE_ASSET,F9_08_REV_OTH_SALE_LESS_COST_SEC,F9_08_REV_OTH_SALE_LESS_COST_OTH,F9_08_REV_OTH_SALE_LESS_COST,F9_08_REV_OTH_SALE_GAIN_SEC,F9_08_REV_OTH_SALE_GAIN_OTH,F9_08_REV_OTH_SALE_GAIN_NET_TOT,F9_08_REV_OTH_SALE_GAIN_NET_RLTD,F9_08_REV_OTH_SALE_GAIN_NET_UBIZ,F9_08_REV_OTH_SALE_GAIN_NET_EXCL,F9_08_REV_OTH_FUNDR_EVNT_0,F9_08_REV_OTH_FUNDR_EVNT_1,F9_08_REV_OTH_FUNDR_DIRECT_EXP,F9_08_REV_OTH_EVNT_DIRECT_EXP,F9_08_REV_OTH_EVNT_NET_TOT,F9_08_REV_OTH_FUNDR_NET_TOT,F9_08_REV_OTH_FUNDR_NET_RLTD,F9_08_REV_OTH_FUNDR_NET_UBIZ,F9_08_REV_OTH_FUNDR_NET_EXCL,F9_08_REV_OTH_GAMING,F9_08_REV_OTH_GAMING_DIRECT_EXP,F9_08_REV_OTH_GAMING_NET_TOT,F9_08_REV_OTH_GAMING_NET_RLTD,F9_08_REV_OTH_GAMING_NET_UBIZ,F9_08_REV_OTH_GAMING_NET_EXCL,F9_08_REV_OTH_INV_GRO_SALE,F9_08_REV_OTH_INV_COST_GOODS,F9_08_REV_OTH_INV_NET_TOT,F9_08_REV_OTH_INV_NET_RLTD,F9_08_REV_OTH_INV_NET_UBIZ,F9_08_REV_OTH_INV_NET_EXCL,F9_08_REV_MISC_OTH_TOT,F9_08_REV_MISC_OTH_RLTD,F9_08_REV_MISC_OTH_UBIZ,F9_08_REV_MISC_OTH_EXCL,F9_08_REV_MISC_TOT_TOT,F9_08_REV_TOT_TOT,F9_08_REV_TOT_RLTD,F9_08_REV_TOT_UBIZ,F9_08_REV_TOT_EXCL)
df <- as.data.frame( var.list )


return( df )


}


