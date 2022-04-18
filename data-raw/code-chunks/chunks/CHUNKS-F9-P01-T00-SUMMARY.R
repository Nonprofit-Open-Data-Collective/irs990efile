#' @title 
#'   Build table F9-P01-T00-SUMMARY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P01_T00_SUMMARY <- function( doc, url )
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


## VARIABLE NAME:  F9_01_ACT_GVRN_ACT_MISSION
## DESCRIPTION:  Organization mission or most signif activities
## LOCATION:  F990-PC-PART-01-LINE-01
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ActivityOrMissionDesc'
V2 <- '//Return/ReturnData/IRS990/ActivityOrMissionDescription'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/ActivityOrMissionDescription'
V_ACT_GVRN_ACT_MISSION <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_ACT_MISSION <- xml_text( xml_find_all( doc, V_ACT_GVRN_ACT_MISSION ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_TERMIN_KONTR_X
## DESCRIPTION:  Termination or contraction
## LOCATION:  F990-PC-PART-01-LINE-02
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ContractTerminationInd'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/TerminationOrContraction'
V3 <- '//Return/ReturnData/IRS990/TerminationOrContraction'
V_ACT_GVRN_TERMIN_KONTR_X <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_TERMIN_KONTR_X <- xml_text( xml_find_all( doc, V_ACT_GVRN_TERMIN_KONTR_X ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_NUM_VOTE_MEMB
## DESCRIPTION:  Number voting members governing body
## LOCATION:  F990-PC-PART-01-LINE-03
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NbrVotingMembersGoverningBody'
V2 <- '//Return/ReturnData/IRS990/NbrVotingMembersGoverningBody'
V3 <- '//Return/ReturnData/IRS990/VotingMembersGoverningBodyCnt'
V_ACT_GVRN_NUM_VOTE_MEMB <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_NUM_VOTE_MEMB <- xml_text( xml_find_all( doc, V_ACT_GVRN_NUM_VOTE_MEMB ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_NUM_VOTE_MEMB_IND
## DESCRIPTION:  Number independent voting members
## LOCATION:  F990-PC-PART-01-LINE-04
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NbrIndependentVotingMembers'
V2 <- '//Return/ReturnData/IRS990/NbrIndependentVotingMembers'
V3 <- '//Return/ReturnData/IRS990/VotingMembersIndependentCnt'
V_ACT_GVRN_NUM_VOTE_MEMB_IND <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_NUM_VOTE_MEMB_IND <- xml_text( xml_find_all( doc, V_ACT_GVRN_NUM_VOTE_MEMB_IND ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_EMPL_TOT
## DESCRIPTION:  total Number employees
## LOCATION:  F990-PC-PART-01-LINE-05
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalNbrEmployees'
V2 <- '//Return/ReturnData/IRS990/TotalEmployeeCnt'
V3 <- '//Return/ReturnData/IRS990/TotalNbrEmployees'
V_ACT_GVRN_EMPL_TOT <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_EMPL_TOT <- xml_text( xml_find_all( doc, V_ACT_GVRN_EMPL_TOT ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_VOL_TOT
## DESCRIPTION:  Total number volunteers
## LOCATION:  F990-PC-PART-01-LINE-06
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalNbrVolunteers'
V2 <- '//Return/ReturnData/IRS990/TotalNbrVolunteers'
V3 <- '//Return/ReturnData/IRS990/TotalVolunteersCnt'
V_ACT_GVRN_VOL_TOT <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_VOL_TOT <- xml_text( xml_find_all( doc, V_ACT_GVRN_VOL_TOT ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_UBIZ_REV_TOT
## DESCRIPTION:  Total gross UBI
## LOCATION:  F990-PC-PART-01-LINE-07A
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalGrossUBI'
V2 <- '//Return/ReturnData/IRS990/TotalGrossUBI'
V3 <- '//Return/ReturnData/IRS990/TotalGrossUBIAmt'
V_ACT_GVRN_UBIZ_REV_TOT <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_UBIZ_REV_TOT <- xml_text( xml_find_all( doc, V_ACT_GVRN_UBIZ_REV_TOT ) )




## VARIABLE NAME:  F9_01_ACT_GVRN_UBIZ_TAXABLE_NET
## DESCRIPTION:  Net unrelated business taxable income
## LOCATION:  F990-PC-PART-01-LINE-07B
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NetUnrelatedBusinessTxblIncome'
V2 <- '//Return/ReturnData/IRS990/NetUnrelatedBusinessTxblIncome'
V3 <- '//Return/ReturnData/IRS990/NetUnrelatedBusTxblIncmAmt'
V_ACT_GVRN_UBIZ_TAXABLE_NET <- paste( V1, V2, V3 , sep='|' )
F9_01_ACT_GVRN_UBIZ_TAXABLE_NET <- xml_text( xml_find_all( doc, V_ACT_GVRN_UBIZ_TAXABLE_NET ) )




## VARIABLE NAME:  F9_01_REV_CONTR_TOT_CY
## DESCRIPTION:  Contributions and grants - current year
## LOCATION:  F990-PC-PART-01-LINE-08-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ContributionsGrantsCurrentYear'
V2 <- '//Return/ReturnData/IRS990/CYContributionsGrantsAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/ContributionsGrantsCurrentYear'
V_REV_CONTR_TOT_CY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_CONTR_TOT_CY <- xml_text( xml_find_all( doc, V_REV_CONTR_TOT_CY ) )




## VARIABLE NAME:  F9_01_REV_CONTR_TOT_CY_2
## DESCRIPTION:  Contributions; gifts; grants; and similar amounts received
## LOCATION:  F990-EZ-PART-01-LINE-01
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ContributionsGiftsGrantsEtc'
V2 <- '//Return/ReturnData/IRS990EZ/ContributionsGiftsGrantsEtcAmt'
V_REV_CONTR_TOT_CY_2 <- paste( V1, V2 , sep='|' )
F9_01_REV_CONTR_TOT_CY_2 <- xml_text( xml_find_all( doc, V_REV_CONTR_TOT_CY_2 ) )




## VARIABLE NAME:  F9_01_REV_CONTR_TOT_PY
## DESCRIPTION:  Contributions and grants - prior year
## LOCATION:  F990-PC-PART-01-LINE-08-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ContributionsGrantsPriorYear'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/ContributionsGrantsPriorYear'
V3 <- '//Return/ReturnData/IRS990/PYContributionsGrantsAmt'
V_REV_CONTR_TOT_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_CONTR_TOT_PY <- xml_text( xml_find_all( doc, V_REV_CONTR_TOT_PY ) )




## VARIABLE NAME:  F9_01_REV_PROG_TOT_CY
## DESCRIPTION:  Program service revenue - current year
## LOCATION:  F990-PC-PART-01-LINE-09-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYProgramServiceRevenueAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/ProgramServiceRevenueCurrYear'
V3 <- '//Return/ReturnData/IRS990/ProgramServiceRevenueCY'
V4 <- '//Return/ReturnData/IRS990EZ/ProgramServiceRevenue'
V5 <- '//Return/ReturnData/IRS990EZ/ProgramServiceRevenueAmt'
V6 <- '//Return/ReturnData/IRS990EZ/ProgramServiceRevenueCY'
V_REV_PROG_TOT_CY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_01_REV_PROG_TOT_CY <- xml_text( xml_find_all( doc, V_REV_PROG_TOT_CY ) )




## VARIABLE NAME:  F9_01_REV_PROG_TOT_PY
## DESCRIPTION:  Program service revenue - prior year
## LOCATION:  F990-PC-PART-01-LINE-09-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/ProgramServiceRevenuePriorYear'
V2 <- '//Return/ReturnData/IRS990/ProgramServiceRevenuePriorYear'
V3 <- '//Return/ReturnData/IRS990/PYProgramServiceRevenueAmt'
V_REV_PROG_TOT_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_PROG_TOT_PY <- xml_text( xml_find_all( doc, V_REV_PROG_TOT_PY ) )




## VARIABLE NAME:  F9_01_REV_INVEST_TOT_CY
## DESCRIPTION:  Investment income - current year
## LOCATION:  F990-PC-PART-01-LINE-10-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYInvestmentIncomeAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/InvestmentIncomeCurrentYear'
V3 <- '//Return/ReturnData/IRS990/InvestmentIncomeCurrentYear'
V4 <- '//Return/ReturnData/IRS990EZ/InvestmentIncomeCurrentYear'
V_REV_INVEST_TOT_CY <- paste( V1, V2, V3, V4 , sep='|' )
F9_01_REV_INVEST_TOT_CY <- xml_text( xml_find_all( doc, V_REV_INVEST_TOT_CY ) )




## VARIABLE NAME:  F9_01_REV_INVEST_TOT_PY
## DESCRIPTION:  Investment income - prior year
## LOCATION:  F990-PC-PART-01-LINE-10-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/InvestmentIncomePriorYear'
V2 <- '//Return/ReturnData/IRS990/InvestmentIncomePriorYear'
V3 <- '//Return/ReturnData/IRS990/PYInvestmentIncomeAmt'
V_REV_INVEST_TOT_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_INVEST_TOT_PY <- xml_text( xml_find_all( doc, V_REV_INVEST_TOT_PY ) )




## VARIABLE NAME:  F9_01_REV_OTH_CY
## DESCRIPTION:  Other revenue - current year
## LOCATION:  F990-PC-PART-01-LINE-11-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYOtherRevenueAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/OtherRevenueCurrentYear'
V3 <- '//Return/ReturnData/IRS990/OtherRevenueCurrentYear'
V_REV_OTH_CY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_OTH_CY <- xml_text( xml_find_all( doc, V_REV_OTH_CY ) )




## VARIABLE NAME:  F9_01_REV_OTH_PY
## DESCRIPTION:  Other revenue - prior year
## LOCATION:  F990-PC-PART-01-LINE-11-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/OtherRevenuePriorYear'
V2 <- '//Return/ReturnData/IRS990/OtherRevenuePriorYear'
V3 <- '//Return/ReturnData/IRS990/PYOtherRevenueAmt'
V_REV_OTH_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_OTH_PY <- xml_text( xml_find_all( doc, V_REV_OTH_PY ) )




## VARIABLE NAME:  F9_01_REV_TOT_CY
## DESCRIPTION:  Total revenue - CY
## LOCATION:  F990-PC-PART-01-LINE-12-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYTotalRevenueAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/TotalRevenueCurrentYear'
V3 <- '//Return/ReturnData/IRS990/TotalRevenueCurrentYear'
V4 <- '//Return/ReturnData/IRS990EZ/TotalRevenue'
V5 <- '//Return/ReturnData/IRS990EZ/TotalRevenueAmt'
V6 <- '//Return/ReturnData/IRS990EZ/TotalRevenueCurrentYear'
V_REV_TOT_CY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_01_REV_TOT_CY <- xml_text( xml_find_all( doc, V_REV_TOT_CY ) )




## VARIABLE NAME:  F9_01_REV_TOT_PY
## DESCRIPTION:  Total revenue - prior year
## LOCATION:  F990-PC-PART-01-LINE-12-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalRevenuePriorYear'
V2 <- '//Return/ReturnData/IRS990/PYTotalRevenueAmt'
V3 <- '//Return/ReturnData/IRS990/TotalRevenuePriorYear'
V_REV_TOT_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_REV_TOT_PY <- xml_text( xml_find_all( doc, V_REV_TOT_PY ) )




## VARIABLE NAME:  F9_01_EXP_GRANT_SIMILAR_CY
## DESCRIPTION:  Grants and similar amounts - CY
## LOCATION:  F990-PC-PART-01-LINE-13-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYGrantsAndSimilarPaidAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/GrantsAndSimilarAmntsCurrYear'
V3 <- '//Return/ReturnData/IRS990/GrantsAndSimilarAmntsCY'
V4 <- '//Return/ReturnData/IRS990EZ/GrantsAndSimilarAmntsCY'
V5 <- '//Return/ReturnData/IRS990EZ/GrantsAndSimilarAmountsPaid'
V6 <- '//Return/ReturnData/IRS990EZ/GrantsAndSimilarAmountsPaidAmt'
V_EXP_GRANT_SIMILAR_CY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_01_EXP_GRANT_SIMILAR_CY <- xml_text( xml_find_all( doc, V_EXP_GRANT_SIMILAR_CY ) )




## VARIABLE NAME:  F9_01_EXP_GRANT_SIMILAR_PY
## DESCRIPTION:  Grants and similar amounts - prior year
## LOCATION:  F990-PC-PART-01-LINE-13-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/GrantsAndSimilarAmntsPriorYear'
V2 <- '//Return/ReturnData/IRS990/GrantsAndSimilarAmntsPriorYear'
V3 <- '//Return/ReturnData/IRS990/PYGrantsAndSimilarPaidAmt'
V_EXP_GRANT_SIMILAR_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_GRANT_SIMILAR_PY <- xml_text( xml_find_all( doc, V_EXP_GRANT_SIMILAR_PY ) )




## VARIABLE NAME:  F9_01_EXP_BEN_PAID_MEMB_CY
## DESCRIPTION:  Benefits paid to members - CY
## LOCATION:  F990-PC-PART-01-LINE-14-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BenefitsPaidToMembersCY'
V2 <- '//Return/ReturnData/IRS990/CYBenefitsPaidToMembersAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/BenefitsPaidToMembersCurrYear'
V4 <- '//Return/ReturnData/IRS990EZ/BenefitsPaidToOrForMembers'
V5 <- '//Return/ReturnData/IRS990EZ/BenefitsPaidToOrForMembersAmt'
V_EXP_BEN_PAID_MEMB_CY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_01_EXP_BEN_PAID_MEMB_CY <- xml_text( xml_find_all( doc, V_EXP_BEN_PAID_MEMB_CY ) )




## VARIABLE NAME:  F9_01_EXP_BEN_PAID_MEMB_PY
## DESCRIPTION:  Benefits paid to members - PY
## LOCATION:  F990-PC-PART-01-LINE-14-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BenefitsPaidToMembersPriorYear'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/BenefitsPaidToMembersPriorYear'
V3 <- '//Return/ReturnData/IRS990/PYBenefitsPaidToMembersAmt'
V_EXP_BEN_PAID_MEMB_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_BEN_PAID_MEMB_PY <- xml_text( xml_find_all( doc, V_EXP_BEN_PAID_MEMB_PY ) )




## VARIABLE NAME:  F9_01_EXP_SAL_ETC_CY
## DESCRIPTION:  Salaries, etc - CY
## LOCATION:  F990-PC-PART-01-LINE-15-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYSalariesCompEmpBnftPaidAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/SalariesEtcCurrentYear'
V3 <- '//Return/ReturnData/IRS990/SalariesEtcCurrentYear'
V4 <- '//Return/ReturnData/IRS990EZ/SalariesEtcCurrentYear'
V5 <- '//Return/ReturnData/IRS990EZ/SalariesOtherCompEmplBenefits'
V6 <- '//Return/ReturnData/IRS990EZ/SalariesOtherCompEmplBnftAmt'
V_EXP_SAL_ETC_CY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_01_EXP_SAL_ETC_CY <- xml_text( xml_find_all( doc, V_EXP_SAL_ETC_CY ) )




## VARIABLE NAME:  F9_01_EXP_SAL_ETC_PY
## DESCRIPTION:  Salaries; etc - prior year
## LOCATION:  F990-PC-PART-01-LINE-15-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/SalariesEtcPriorYear'
V2 <- '//Return/ReturnData/IRS990/PYSalariesCompEmpBnftPaidAmt'
V3 <- '//Return/ReturnData/IRS990/SalariesEtcPriorYear'
V_EXP_SAL_ETC_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_SAL_ETC_PY <- xml_text( xml_find_all( doc, V_EXP_SAL_ETC_PY ) )




## VARIABLE NAME:  F9_01_EXP_PROF_FUNDR_TOT_CY
## DESCRIPTION:  Total professional fundraising expense - CY
## LOCATION:  F990-PC-PART-01-LINE-16A-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYTotalProfFndrsngExpnsAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/TotalProfFundrsngExpCurrYear'
V3 <- '//Return/ReturnData/IRS990/TotalProfFundrsngExpCY'
V_EXP_PROF_FUNDR_TOT_CY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_PROF_FUNDR_TOT_CY <- xml_text( xml_find_all( doc, V_EXP_PROF_FUNDR_TOT_CY ) )




## VARIABLE NAME:  F9_01_EXP_PROF_FUNDR_TOT_PY
## DESCRIPTION:  Total professional fundraising expense - prior year
## LOCATION:  F990-PC-PART-01-LINE-16A-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalProfFundrsngExpPriorYear'
V2 <- '//Return/ReturnData/IRS990/PYTotalProfFndrsngExpnsAmt'
V3 <- '//Return/ReturnData/IRS990/TotalProfFundrsngExpPriorYear'
V_EXP_PROF_FUNDR_TOT_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_PROF_FUNDR_TOT_PY <- xml_text( xml_find_all( doc, V_EXP_PROF_FUNDR_TOT_PY ) )




## VARIABLE NAME:  F9_01_EXP_FUNDR_TOT_CY
## DESCRIPTION:  Total fundraising expense - CY
## LOCATION:  F990-PC-PART-01-LINE-16B
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYTotalFundraisingExpenseAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/TotalFundrsngExpCurrentYear'
V3 <- '//Return/ReturnData/IRS990/TotalFundrsngExpCurrentYear'
V_EXP_FUNDR_TOT_CY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_FUNDR_TOT_CY <- xml_text( xml_find_all( doc, V_EXP_FUNDR_TOT_CY ) )




## VARIABLE NAME:  F9_01_EXP_OTH_CY
## DESCRIPTION:  Other expenses -CY
## LOCATION:  F990-PC-PART-01-LINE-17-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYOtherExpensesAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/OtherExpensesCurrentYear'
V3 <- '//Return/ReturnData/IRS990/OtherExpensesCurrentYear'
V_EXP_OTH_CY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_OTH_CY <- xml_text( xml_find_all( doc, V_EXP_OTH_CY ) )




## VARIABLE NAME:  F9_01_EXP_OTH_CY_V2
## DESCRIPTION:  Other Expenses - Amount
## LOCATION:  F990-EZ-PART-01-LINE-16
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OtherExpenses/Amount'
V2 <- '//Return/ReturnData/IRS990EZ/OtherExpensesCurrentYear'
V3 <- '//Return/ReturnData/IRS990EZ/OtherExpensesTotal'
V4 <- '//Return/ReturnData/IRS990EZ/OtherExpensesTotalAmt'
V_EXP_OTH_CY_V2 <- paste( V1, V2, V3, V4 , sep='|' )
F9_01_EXP_OTH_CY_V2 <- xml_text( xml_find_all( doc, V_EXP_OTH_CY_V2 ) )




## VARIABLE NAME:  F9_01_EXP_OTH_PY
## DESCRIPTION:  Other expenses - prior year
## LOCATION:  F990-PC-PART-01-LINE-17-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/OtherExpensePriorYear'
V2 <- '//Return/ReturnData/IRS990/OtherExpensePriorYear'
V3 <- '//Return/ReturnData/IRS990/PYOtherExpensesAmt'
V_EXP_OTH_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_OTH_PY <- xml_text( xml_find_all( doc, V_EXP_OTH_PY ) )




## VARIABLE NAME:  F9_01_EXP_TOT_CY
## DESCRIPTION:  Total Expenses - CY
## LOCATION:  F990-PC-PART-01-LINE-18-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYTotalExpensesAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/TotalExpensesCurrentYear'
V3 <- '//Return/ReturnData/IRS990/TotalExpensesCurrentYear'
V4 <- '//Return/ReturnData/IRS990EZ/TotalExpenses'
V5 <- '//Return/ReturnData/IRS990EZ/TotalExpensesAmt'
V6 <- '//Return/ReturnData/IRS990EZ/TotalExpensesCurrentYear'
V_EXP_TOT_CY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_01_EXP_TOT_CY <- xml_text( xml_find_all( doc, V_EXP_TOT_CY ) )




## VARIABLE NAME:  F9_01_EXP_TOT_PY
## DESCRIPTION:  Total Expenses - prior year
## LOCATION:  F990-PC-PART-01-LINE-18-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalExpensesPriorYear'
V2 <- '//Return/ReturnData/IRS990/PYTotalExpensesAmt'
V3 <- '//Return/ReturnData/IRS990/TotalExpensesPriorYear'
V_EXP_TOT_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_TOT_PY <- xml_text( xml_find_all( doc, V_EXP_TOT_PY ) )




## VARIABLE NAME:  F9_01_EXP_REV_LESS_EXP_CY
## DESCRIPTION:  Excess or deficit - CY
## LOCATION:  F990-PC-PART-01-LINE-19-CY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CYRevenuesLessExpensesAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/RevenuesLessExpensesCurrYear'
V3 <- '//Return/ReturnData/IRS990/RevenuesLessExpensesCY'
V4 <- '//Return/ReturnData/IRS990EZ/ExcessOrDeficitForYear'
V5 <- '//Return/ReturnData/IRS990EZ/ExcessOrDeficitForYearAmt'
V_EXP_REV_LESS_EXP_CY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_01_EXP_REV_LESS_EXP_CY <- xml_text( xml_find_all( doc, V_EXP_REV_LESS_EXP_CY ) )




## VARIABLE NAME:  F9_01_EXP_REV_LESS_EXP_PY
## DESCRIPTION:  Revenues less expenses - prior year
## LOCATION:  F990-PC-PART-01-LINE-19-PY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/RevenuesLessExpensesPriorYear'
V2 <- '//Return/ReturnData/IRS990/PYRevenuesLessExpensesAmt'
V3 <- '//Return/ReturnData/IRS990/RevenuesLessExpensesPriorYear'
V_EXP_REV_LESS_EXP_PY <- paste( V1, V2, V3 , sep='|' )
F9_01_EXP_REV_LESS_EXP_PY <- xml_text( xml_find_all( doc, V_EXP_REV_LESS_EXP_PY ) )




## VARIABLE NAME:  F9_01_NAFB_ASSET_TOT_BOY
## DESCRIPTION:  Total Assets; BOY
## LOCATION:  F990-PC-PART-01-LINE-20-BOY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalAssetsBOY'
V2 <- '//Return/ReturnData/IRS990/TotalAssetsBOY'
V3 <- '//Return/ReturnData/IRS990/TotalAssetsBOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/TotalAssetsBOY'
V5 <- '//Return/ReturnData/IRS990EZ/TotalAssetsBOYAmt'
V_NAFB_ASSET_TOT_BOY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_01_NAFB_ASSET_TOT_BOY <- xml_text( xml_find_all( doc, V_NAFB_ASSET_TOT_BOY ) )




## VARIABLE NAME:  F9_01_NAFB_ASSET_TOT_EOY
## DESCRIPTION:  Total Assets; EOY
## LOCATION:  F990-PC-PART-01-LINE-20-EOY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalAssetsEOY'
V2 <- '//Return/ReturnData/IRS990/TotalAssetsEOY'
V3 <- '//Return/ReturnData/IRS990/TotalAssetsEOYAmt'
V_NAFB_ASSET_TOT_EOY <- paste( V1, V2, V3 , sep='|' )
F9_01_NAFB_ASSET_TOT_EOY <- xml_text( xml_find_all( doc, V_NAFB_ASSET_TOT_EOY ) )




## VARIABLE NAME:  F9_01_NAFB_LIAB_TOT_BOY
## DESCRIPTION:  Total Liabilities; BOY
## LOCATION:  F990-PC-PART-01-LINE-21-BOY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalLiabilitiesBOY'
V2 <- '//Return/ReturnData/IRS990/TotalLiabilitiesBOY'
V3 <- '//Return/ReturnData/IRS990/TotalLiabilitiesBOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/TotalLiabilitiesBOY'
V5 <- '//Return/ReturnData/IRS990EZ/TotalLiabilitiesBOYAmt'
V_NAFB_LIAB_TOT_BOY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_01_NAFB_LIAB_TOT_BOY <- xml_text( xml_find_all( doc, V_NAFB_LIAB_TOT_BOY ) )




## VARIABLE NAME:  F9_01_NAFB_LIAB_TOT_EOY
## DESCRIPTION:  Total Liabilities; EOY
## LOCATION:  F990-PC-PART-01-LINE-21-EOY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TotalLiabilitiesEOY'
V2 <- '//Return/ReturnData/IRS990/TotalLiabilitiesEOY'
V3 <- '//Return/ReturnData/IRS990/TotalLiabilitiesEOYAmt'
V_NAFB_LIAB_TOT_EOY <- paste( V1, V2, V3 , sep='|' )
F9_01_NAFB_LIAB_TOT_EOY <- xml_text( xml_find_all( doc, V_NAFB_LIAB_TOT_EOY ) )




## VARIABLE NAME:  F9_01_NAFB_TOT_BOY
## DESCRIPTION:  Net Assets or Fund Balances; BOY
## LOCATION:  F990-PC-PART-01-LINE-22-BOY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NetAssetsOrFundBalancesBOY'
V2 <- '//Return/ReturnData/IRS990/NetAssetsOrFundBalancesBOY'
V3 <- '//Return/ReturnData/IRS990/NetAssetsOrFundBalancesBOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalancesBOY'
V5 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalancesBOYAmt'
V_NAFB_TOT_BOY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_01_NAFB_TOT_BOY <- xml_text( xml_find_all( doc, V_NAFB_TOT_BOY ) )




## VARIABLE NAME:  F9_01_NAFB_TOT_EOY
## DESCRIPTION:  Net Assets or Fund Balances; EOY
## LOCATION:  F990-PC-PART-01-LINE-22-EOY
## TABLE:  F9-P01-T00-SUMMARY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NetAssetsOrFundBalancesEOY'
V2 <- '//Return/ReturnData/IRS990/NetAssetsOrFundBalancesEOY'
V3 <- '//Return/ReturnData/IRS990/NetAssetsOrFundBalancesEOYAmt'
V4 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalancesEOY'
V5 <- '//Return/ReturnData/IRS990EZ/NetAssetsOrFundBalancesEOYAmt'
V_NAFB_TOT_EOY <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_01_NAFB_TOT_EOY <- xml_text( xml_find_all( doc, V_NAFB_TOT_EOY ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_01_ACT_GVRN_ACT_MISSION,F9_01_ACT_GVRN_TERMIN_KONTR_X,F9_01_ACT_GVRN_NUM_VOTE_MEMB,F9_01_ACT_GVRN_NUM_VOTE_MEMB_IND,F9_01_ACT_GVRN_EMPL_TOT,F9_01_ACT_GVRN_VOL_TOT,F9_01_ACT_GVRN_UBIZ_REV_TOT,F9_01_ACT_GVRN_UBIZ_TAXABLE_NET,F9_01_REV_CONTR_TOT_CY,F9_01_REV_CONTR_TOT_CY_2,F9_01_REV_CONTR_TOT_PY,F9_01_REV_PROG_TOT_CY,F9_01_REV_PROG_TOT_PY,F9_01_REV_INVEST_TOT_CY,F9_01_REV_INVEST_TOT_PY,F9_01_REV_OTH_CY,F9_01_REV_OTH_PY,F9_01_REV_TOT_CY,F9_01_REV_TOT_PY,F9_01_EXP_GRANT_SIMILAR_CY,F9_01_EXP_GRANT_SIMILAR_PY,F9_01_EXP_BEN_PAID_MEMB_CY,F9_01_EXP_BEN_PAID_MEMB_PY,F9_01_EXP_SAL_ETC_CY,F9_01_EXP_SAL_ETC_PY,F9_01_EXP_PROF_FUNDR_TOT_CY,F9_01_EXP_PROF_FUNDR_TOT_PY,F9_01_EXP_FUNDR_TOT_CY,F9_01_EXP_OTH_CY,F9_01_EXP_OTH_CY_V2,F9_01_EXP_OTH_PY,F9_01_EXP_TOT_CY,F9_01_EXP_TOT_PY,F9_01_EXP_REV_LESS_EXP_CY,F9_01_EXP_REV_LESS_EXP_PY,F9_01_NAFB_ASSET_TOT_BOY,F9_01_NAFB_ASSET_TOT_EOY,F9_01_NAFB_LIAB_TOT_BOY,F9_01_NAFB_LIAB_TOT_EOY,F9_01_NAFB_TOT_BOY,F9_01_NAFB_TOT_EOY)
df <- as.data.frame( var.list )


return( df )


}


