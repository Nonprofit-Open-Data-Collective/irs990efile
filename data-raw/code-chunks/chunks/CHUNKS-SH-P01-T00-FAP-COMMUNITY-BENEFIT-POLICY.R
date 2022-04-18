#' @title 
#'   Build table SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SH_P01_T00_FAP_COMMUNITY_BENEFIT_POLICY <- function( doc, url )
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


## VARIABLE NAME:  SH_01_FAP_X
## DESCRIPTION:  Charity care policy?
## LOCATION:  SCHED-H-PART-01-LINE-01A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CharityCarePolicy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CharityCarePolicyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCarePolicy'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistancePolicyInd'
V_FAP_X <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FAP_X <- xml_text( xml_find_all( doc, V_FAP_X ) )




## VARIABLE NAME:  SH_01_FAP_WRITTEN_X
## DESCRIPTION:  Written policy?
## LOCATION:  SCHED-H-PART-01-LINE-01B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WrittenPolicyInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/WrittenPolicy'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/WrittenPolicy'
V_FAP_WRITTEN_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FAP_WRITTEN_X <- xml_text( xml_find_all( doc, V_FAP_WRITTEN_X ) )




## VARIABLE NAME:  SH_01_FAP_ALL_HOSPITAL_X
## DESCRIPTION:  Policy applied to all hospitals
## LOCATION:  SCHED-H-PART-01-LINE-02
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/AllHospitalsPolicyInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PolicyAppliedToAllHospitals'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/PolicyAppliedToAllHospitals'
V_FAP_ALL_HOSPITAL_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FAP_ALL_HOSPITAL_X <- xml_text( xml_find_all( doc, V_FAP_ALL_HOSPITAL_X ) )




## VARIABLE NAME:  SH_01_FAP_INDIV_HOSPITAL_X
## DESCRIPTION:  Policy tailored to individual hospitals
## LOCATION:  SCHED-H-PART-01-LINE-02
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/IndivHospitalTailoredPolicyInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PolicyTailoredToIndHospitals'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/PolicyTailoredToIndHospitals'
V_FAP_INDIV_HOSPITAL_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FAP_INDIV_HOSPITAL_X <- xml_text( xml_find_all( doc, V_FAP_INDIV_HOSPITAL_X ) )




## VARIABLE NAME:  SH_01_FAP_MOST_HOSPITAL_X
## DESCRIPTION:  Policy applied to most hospitals
## LOCATION:  SCHED-H-PART-01-LINE-02
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/MostHospitalsPolicyInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PolicyAppliedToMostHospitals'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/PolicyAppliedToMostHospitals'
V_FAP_MOST_HOSPITAL_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FAP_MOST_HOSPITAL_X <- xml_text( xml_find_all( doc, V_FAP_MOST_HOSPITAL_X ) )




## VARIABLE NAME:  SH_01_FPG_FREE_CARE_PCT_100_X
## DESCRIPTION:  Free Care Pcent - 100%
## LOCATION:  SCHED-H-PART-01-LINE-03A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FreeCarePcent/Pcent100'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent100'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent100Ind'
V_FPG_FREE_CARE_PCT_100_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_FREE_CARE_PCT_100_X <- xml_text( xml_find_all( doc, V_FPG_FREE_CARE_PCT_100_X ) )




## VARIABLE NAME:  SH_01_FPG_FREE_CARE_PCT_150_X
## DESCRIPTION:  Free Care Pcent - 150%
## LOCATION:  SCHED-H-PART-01-LINE-03A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FreeCarePcent/Pcent150'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent150'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent150Ind'
V_FPG_FREE_CARE_PCT_150_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_FREE_CARE_PCT_150_X <- xml_text( xml_find_all( doc, V_FPG_FREE_CARE_PCT_150_X ) )




## VARIABLE NAME:  SH_01_FPG_FREE_CARE_PCT_200_X
## DESCRIPTION:  Free Care Pcent - 200%
## LOCATION:  SCHED-H-PART-01-LINE-03A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FreeCarePcent/Pcent200'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent200'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent200Ind'
V_FPG_FREE_CARE_PCT_200_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_FREE_CARE_PCT_200_X <- xml_text( xml_find_all( doc, V_FPG_FREE_CARE_PCT_200_X ) )




## VARIABLE NAME:  SH_01_FPG_FREE_CARE_PCT_OTH
## DESCRIPTION:  Free other percentage
## LOCATION:  SCHED-H-PART-01-LINE-03A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/FreeCareOthPercentageGrp/FreeCareOtherPct'
V2 <- '//Return/ReturnData/IRS990ScheduleH/OtherPercentage/FreeOtherPercentage'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FreeCarePcent/FreeOtherPercentage'
V_FPG_FREE_CARE_PCT_OTH <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_FREE_CARE_PCT_OTH <- xml_text( xml_find_all( doc, V_FPG_FREE_CARE_PCT_OTH ) )




## VARIABLE NAME:  SH_01_FPG_FREE_CARE_PCT_OTH_X
## DESCRIPTION:  Free Care Oth Percentage Grp - Other
## LOCATION:  SCHED-H-PART-01-LINE-03A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/FreeCareOthPercentageGrp/OtherInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FreeCarePcent/Other'
V3 <- '//Return/ReturnData/IRS990ScheduleH/OtherPercentage/Other'
V_FPG_FREE_CARE_PCT_OTH_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_FREE_CARE_PCT_OTH_X <- xml_text( xml_find_all( doc, V_FPG_FREE_CARE_PCT_OTH_X ) )




## VARIABLE NAME:  SH_01_FPG_FREE_CARE_X
## DESCRIPTION:  FPG reference free care?
## LOCATION:  SCHED-H-PART-01-LINE-03A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FPGReferenceFreeCare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/FPGReferenceFreeCareInd'
V3 <- '//Return/ReturnData/IRS990ScheduleH/FPGReferenceFreeCare'
V_FPG_FREE_CARE_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_FREE_CARE_X <- xml_text( xml_find_all( doc, V_FPG_FREE_CARE_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_200_X
## DESCRIPTION:  Discounted Care - 200%
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/Pcent200'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent200D'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent200DInd'
V_FPG_DCNT_CARE_PCT_200_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_200_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_200_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_250_X
## DESCRIPTION:  Discounted Care - 250%
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/Pcent250'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent250'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent250Ind'
V_FPG_DCNT_CARE_PCT_250_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_250_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_250_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_300_X
## DESCRIPTION:  Discounted Care - 300%
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/Pcent300'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent300'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent300Ind'
V_FPG_DCNT_CARE_PCT_300_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_300_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_300_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_350_X
## DESCRIPTION:  Discounted Care - 350%
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/Pcent350'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent350'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent350Ind'
V_FPG_DCNT_CARE_PCT_350_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_350_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_350_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_400_X
## DESCRIPTION:  Discounted Care - 400%
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/Pcent400'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Pcent400'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Percent400Ind'
V_FPG_DCNT_CARE_PCT_400_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_400_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_400_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_OTH
## DESCRIPTION:  Discounted other percentage
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/DiscountedCareOthPercentageGrp/DiscountedCareOtherPct'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/DiscountedOtherPercentage'
V3 <- '//Return/ReturnData/IRS990ScheduleH/DiscountedOther/DiscountedOtherPercentage'
V_FPG_DCNT_CARE_PCT_OTH <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_OTH <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_OTH ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_PCT_OTH_X
## DESCRIPTION:  Discounted Care - Other
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/DiscountedCare/Other'
V2 <- '//Return/ReturnData/IRS990ScheduleH/DiscountedCareOthPercentageGrp/OtherInd'
V3 <- '//Return/ReturnData/IRS990ScheduleH/DiscountedOther/Other'
V_FPG_DCNT_CARE_PCT_OTH_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_PCT_OTH_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_PCT_OTH_X ) )




## VARIABLE NAME:  SH_01_FPG_DCNT_CARE_X
## DESCRIPTION:  FPG reference discounted care?
## LOCATION:  SCHED-H-PART-01-LINE-03B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FPGReferenceDiscountedCare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/FPGReferenceDiscountedCareInd'
V3 <- '//Return/ReturnData/IRS990ScheduleH/FPGReferenceDiscountedCare'
V_FPG_DCNT_CARE_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FPG_DCNT_CARE_X <- xml_text( xml_find_all( doc, V_FPG_DCNT_CARE_X ) )




## VARIABLE NAME:  SH_01_FAP_FREE_DCNT_CARE_X
## DESCRIPTION:  Free or discounted care to medically indigent?
## LOCATION:  SCHED-H-PART-01-LINE-04
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/FreeDiscCareMedicallyIndigent'
V2 <- '//Return/ReturnData/IRS990ScheduleH/FreeDiscCareMedicallyIndigent'
V3 <- '//Return/ReturnData/IRS990ScheduleH/FreeCareMedicallyIndigentInd'
V_FAP_FREE_DCNT_CARE_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FAP_FREE_DCNT_CARE_X <- xml_text( xml_find_all( doc, V_FAP_FREE_DCNT_CARE_X ) )




## VARIABLE NAME:  SH_01_FA_AMT_BUDGETED_CARE_X
## DESCRIPTION:  Amounts budgeted for charity care?
## LOCATION:  SCHED-H-PART-01-LINE-05A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/AmountsBudgetedForCharityCare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/AmountsBudgetedForCharityCare'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareBudgetedInd'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceBudgetInd'
V_FA_AMT_BUDGETED_CARE_X <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_AMT_BUDGETED_CARE_X <- xml_text( xml_find_all( doc, V_FA_AMT_BUDGETED_CARE_X ) )




## VARIABLE NAME:  SH_01_FA_EXP_EXCEED_BUDGET_X
## DESCRIPTION:  Expenses exceeded budget?
## LOCATION:  SCHED-H-PART-01-LINE-05B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/ExpensesExceededBudget'
V2 <- '//Return/ReturnData/IRS990ScheduleH/ExpensesExceededBudget'
V3 <- '//Return/ReturnData/IRS990ScheduleH/ExpensesExceedBudgetInd'
V_FA_EXP_EXCEED_BUDGET_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FA_EXP_EXCEED_BUDGET_X <- xml_text( xml_find_all( doc, V_FA_EXP_EXCEED_BUDGET_X ) )




## VARIABLE NAME:  SH_01_FA_UNAVBL_PROV_CARE_X
## DESCRIPTION:  Unable to provide care?
## LOCATION:  SCHED-H-PART-01-LINE-05c
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnableToProvideCareInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnableToProvideCare'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnableToProvideCare'
V_FA_UNAVBL_PROV_CARE_X <- paste( V1, V2, V3 , sep='|' )
SH_01_FA_UNAVBL_PROV_CARE_X <- xml_text( xml_find_all( doc, V_FA_UNAVBL_PROV_CARE_X ) )




## VARIABLE NAME:  SH_01_REP_ANNUAL_COM_BEN_X
## DESCRIPTION:  Annual community benefit report?
## LOCATION:  SCHED-H-PART-01-LINE-06A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/AnnualCommunityBenefitReport'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/AnnualCommunityBenefitReport'
V3 <- '//Return/ReturnData/IRS990ScheduleH/AnnualCommunityBnftReportInd'
V_REP_ANNUAL_COM_BEN_X <- paste( V1, V2, V3 , sep='|' )
SH_01_REP_ANNUAL_COM_BEN_X <- xml_text( xml_find_all( doc, V_REP_ANNUAL_COM_BEN_X ) )




## VARIABLE NAME:  SH_01_REP_AVBL_PUB_X
## DESCRIPTION:  Report publically available?
## LOCATION:  SCHED-H-PART-01-LINE-06B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/ReportPublicallyAvailableInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/ReportPublicallyAvailable'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/ReportPublicallyAvailable'
V_REP_AVBL_PUB_X <- paste( V1, V2, V3 , sep='|' )
SH_01_REP_AVBL_PUB_X <- xml_text( xml_find_all( doc, V_REP_AVBL_PUB_X ) )




## VARIABLE NAME:  SH_01_FA_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07A-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCostGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCareAtCost/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCost/NumberOfActivitiesOrPrograms'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceAtCostTyp/ActivitiesOrProgramsCnt'
V_FA_NUM_ACT_PROG <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_FA_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_FA_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07A-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCostGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCareAtCost/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCost/PersonsServed'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceAtCostTyp/PersonsServedCnt'
V_FA_PERS_SERVED <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_PERS_SERVED <- xml_text( xml_find_all( doc, V_FA_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_FA_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07A-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCareAtCost/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCost/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCostGrp/TotalCommunityBenefitExpnsAmt'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceAtCostTyp/TotalCommunityBenefitExpnsAmt'
V_FA_EXP_TOT_COM_BEN <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_FA_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_FA_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07A-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCareAtCost/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCost/DirectOffsettingRevenue'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCostGrp/DirectOffsettingRevenueAmt'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceAtCostTyp/DirectOffsettingRevenueAmt'
V_FA_REV_DIRECT_OFFSET <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_FA_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_FA_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07A-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCareAtCost/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCost/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCostGrp/NetCommunityBenefitExpnsAmt'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceAtCostTyp/NetCommunityBenefitExpnsAmt'
V_FA_EXP_NET_COM_BEN <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_FA_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_FA_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07A-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CharityCareAtCost/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCost/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CharityCareAtCostGrp/TotalExpensePct'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistanceAtCostTyp/TotalExpensePct'
V_FA_PCT_EXP_TOT <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_FA_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_FA_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_MEDICAID_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07B-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaid/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedMedicaid/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaidGrp/ActivitiesOrProgramsCnt'
V_MEDICAID_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_MEDICAID_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_MEDICAID_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_MEDICAID_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07B-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaidGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaid/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedMedicaid/PersonsServed'
V_MEDICAID_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_MEDICAID_PERS_SERVED <- xml_text( xml_find_all( doc, V_MEDICAID_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_MEDICAID_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07B-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaidGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaid/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedMedicaid/TotalCommunityBenefitExpense'
V_MEDICAID_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_MEDICAID_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_MEDICAID_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_MEDICAID_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07B-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedMedicaid/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaidGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaid/DirectOffsettingRevenue'
V_MEDICAID_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_MEDICAID_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_MEDICAID_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_MEDICAID_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07B-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaidGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaid/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedMedicaid/NetCommunityBenefitExpense'
V_MEDICAID_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_MEDICAID_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_MEDICAID_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_MEDICAID_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07B-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaid/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedMedicaid/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedMedicaidGrp/TotalExpensePct'
V_MEDICAID_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_MEDICAID_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_MEDICAID_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_MEAN_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07C-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCosts/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedCosts/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCostsGrp/ActivitiesOrProgramsCnt'
V_MEAN_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_MEAN_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_MEAN_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_MEAN_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07C-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCostsGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCosts/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedCosts/PersonsServed'
V_MEAN_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_MEAN_PERS_SERVED <- xml_text( xml_find_all( doc, V_MEAN_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_MEAN_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07C-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCostsGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCosts/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedCosts/TotalCommunityBenefitExpense'
V_MEAN_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_MEAN_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_MEAN_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_MEAN_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07C-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedCosts/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCostsGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCosts/DirectOffsettingRevenue'
V_MEAN_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_MEAN_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_MEAN_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_MEAN_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07C-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCostsGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCosts/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedCosts/NetCommunityBenefitExpense'
V_MEAN_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_MEAN_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_MEAN_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_MEAN_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07C-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCosts/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/UnreimbursedCosts/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/UnreimbursedCostsGrp/TotalExpensePct'
V_MEAN_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_MEAN_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_MEAN_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_TOT_FA_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07D-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCareGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCare/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCharityCare/NumberOfActivitiesOrPrograms'
V4 <- '//Return/ReturnData/IRS990ScheduleH/TotalFinancialAssistanceTyp/ActivitiesOrProgramsCnt'
V_TOT_FA_NUM_ACT_PROG <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_TOT_FA_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_TOT_FA_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_TOT_FA_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07D-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalFinancialAssistanceTyp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCareGrp/PersonsServedCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCare/PersonsServed'
V4 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCharityCare/PersonsServed'
V_TOT_FA_PERS_SERVED <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_TOT_FA_PERS_SERVED <- xml_text( xml_find_all( doc, V_TOT_FA_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_TOT_FA_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07D-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCare/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCharityCare/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCareGrp/TotalCommunityBenefitExpnsAmt'
V4 <- '//Return/ReturnData/IRS990ScheduleH/TotalFinancialAssistanceTyp/TotalCommunityBenefitExpnsAmt'
V_TOT_FA_EXP_TOT_COM_BEN <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_TOT_FA_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_TOT_FA_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_TOT_FA_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07D-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalFinancialAssistanceTyp/DirectOffsettingRevenueAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCharityCare/DirectOffsettingRevenue'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCare/DirectOffsettingRevenue'
V4 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCareGrp/DirectOffsettingRevenueAmt'
V_TOT_FA_REV_DIRECT_OFFSET <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_TOT_FA_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_TOT_FA_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_TOT_FA_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07D-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCare/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCharityCare/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCareGrp/NetCommunityBenefitExpnsAmt'
V4 <- '//Return/ReturnData/IRS990ScheduleH/TotalFinancialAssistanceTyp/NetCommunityBenefitExpnsAmt'
V_TOT_FA_EXP_NET_COM_BEN <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_TOT_FA_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_TOT_FA_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_TOT_FA_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07D-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCare/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCharityCare/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalFinancialAssistanceTyp/TotalExpensePct'
V4 <- '//Return/ReturnData/IRS990ScheduleH/TotalCharityCareGrp/TotalExpensePct'
V_TOT_FA_PCT_EXP_TOT <- paste( V1, V2, V3, V4 , sep='|' )
SH_01_TOT_FA_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_TOT_FA_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_H_SVC_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07E-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServicesGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServices/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CommunityHealthServices/NumberOfActivitiesOrPrograms'
V_H_SVC_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SVC_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_H_SVC_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_H_SVC_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07E-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServicesGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServices/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CommunityHealthServices/PersonsServed'
V_H_SVC_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SVC_PERS_SERVED <- xml_text( xml_find_all( doc, V_H_SVC_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_H_SVC_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07E-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServices/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CommunityHealthServices/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServicesGrp/TotalCommunityBenefitExpnsAmt'
V_H_SVC_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SVC_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_H_SVC_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_H_SVC_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07E-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CommunityHealthServices/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServicesGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServices/DirectOffsettingRevenue'
V_H_SVC_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SVC_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_H_SVC_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_H_SVC_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07E-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServices/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CommunityHealthServices/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServicesGrp/NetCommunityBenefitExpnsAmt'
V_H_SVC_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SVC_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_H_SVC_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_H_SVC_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07E-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServices/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CommunityHealthServices/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunityHealthServicesGrp/TotalExpensePct'
V_H_SVC_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SVC_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_H_SVC_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_H_EDU_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07F-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducationGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducation/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/HealthProfessionsEducation/NumberOfActivitiesOrPrograms'
V_H_EDU_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_H_EDU_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_H_EDU_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_H_EDU_PERS_SERVEDU
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07F-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducationGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducation/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/HealthProfessionsEducation/PersonsServed'
V_H_EDU_PERS_SERVEDU <- paste( V1, V2, V3 , sep='|' )
SH_01_H_EDU_PERS_SERVEDU <- xml_text( xml_find_all( doc, V_H_EDU_PERS_SERVEDU ) )




## VARIABLE NAME:  SH_01_H_EDU_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07F-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducation/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/HealthProfessionsEducation/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducationGrp/TotalCommunityBenefitExpnsAmt'
V_H_EDU_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_H_EDU_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_H_EDU_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_H_EDU_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07F-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/HealthProfessionsEducation/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducationGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducation/DirectOffsettingRevenue'
V_H_EDU_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_H_EDU_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_H_EDU_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_H_EDU_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07F-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducation/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/HealthProfessionsEducation/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducationGrp/NetCommunityBenefitExpnsAmt'
V_H_EDU_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_H_EDU_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_H_EDU_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_H_EDU_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07F-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducationGrp/TotalExpensePct'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthProfessionsEducation/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/HealthProfessionsEducation/PercentOfTotalExpense'
V_H_EDU_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_H_EDU_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_H_EDU_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_H_SUBSID_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07G-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServicesGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServices/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/SubsidizedHealthServices/NumberOfActivitiesOrPrograms'
V_H_SUBSID_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SUBSID_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_H_SUBSID_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_H_SUBSID_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07G-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServicesGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServices/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/SubsidizedHealthServices/PersonsServed'
V_H_SUBSID_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SUBSID_PERS_SERVED <- xml_text( xml_find_all( doc, V_H_SUBSID_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_H_SUBSID_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07G-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServices/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/SubsidizedHealthServices/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServicesGrp/TotalCommunityBenefitExpnsAmt'
V_H_SUBSID_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SUBSID_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_H_SUBSID_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_H_SUBSID_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07G-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/SubsidizedHealthServices/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServicesGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServices/DirectOffsettingRevenue'
V_H_SUBSID_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SUBSID_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_H_SUBSID_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_H_SUBSID_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07G-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServices/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/SubsidizedHealthServices/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServicesGrp/NetCommunityBenefitExpnsAmt'
V_H_SUBSID_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SUBSID_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_H_SUBSID_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_H_SUBSID_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07G-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServices/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/SubsidizedHealthServices/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/SubsidizedHealthServicesGrp/TotalExpensePct'
V_H_SUBSID_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_H_SUBSID_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_H_SUBSID_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_RSRCH_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07H-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/ResearchGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Research/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/Research/NumberOfActivitiesOrPrograms'
V_RSRCH_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_RSRCH_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_RSRCH_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_RSRCH_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07H-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Research/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/Research/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/ResearchGrp/PersonsServedCnt'
V_RSRCH_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_RSRCH_PERS_SERVED <- xml_text( xml_find_all( doc, V_RSRCH_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_RSRCH_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07H-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/ResearchGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Research/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/Research/TotalCommunityBenefitExpense'
V_RSRCH_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_RSRCH_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_RSRCH_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_RSRCH_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07H-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/Research/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/ResearchGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Research/DirectOffsettingRevenue'
V_RSRCH_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_RSRCH_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_RSRCH_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_RSRCH_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07H-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/ResearchGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Research/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/Research/NetCommunityBenefitExpense'
V_RSRCH_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_RSRCH_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_RSRCH_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_RSRCH_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07H-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Research/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/Research/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/ResearchGrp/TotalExpensePct'
V_RSRCH_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_RSRCH_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_RSRCH_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_CASH_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07I-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CashAndInKindContributions/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributionsGrp/ActivitiesOrProgramsCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributions/NumberOfActivitiesOrPrograms'
V_CASH_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_CASH_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_CASH_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_CASH_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07I-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CashAndInKindContributions/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributions/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributionsGrp/PersonsServedCnt'
V_CASH_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_CASH_PERS_SERVED <- xml_text( xml_find_all( doc, V_CASH_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_CASH_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07I-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CashAndInKindContributions/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributions/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributionsGrp/TotalCommunityBenefitExpnsAmt'
V_CASH_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_CASH_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_CASH_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_CASH_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07I-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CashAndInKindContributions/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributionsGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributions/DirectOffsettingRevenue'
V_CASH_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_CASH_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_CASH_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_CASH_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07I-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CashAndInKindContributions/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributions/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributionsGrp/NetCommunityBenefitExpnsAmt'
V_CASH_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_CASH_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_CASH_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_CASH_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07I-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/CashAndInKindContributions/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributions/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CashAndInKindContributionsGrp/TotalExpensePct'
V_CASH_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_CASH_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_CASH_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_TOT_OTH_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07J-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefitsGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefits/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalOtherBenefits/NumberOfActivitiesOrPrograms'
V_TOT_OTH_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_OTH_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_TOT_OTH_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_TOT_OTH_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07J-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefitsGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefits/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalOtherBenefits/PersonsServed'
V_TOT_OTH_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_OTH_PERS_SERVED <- xml_text( xml_find_all( doc, V_TOT_OTH_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_TOT_OTH_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07J-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefits/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalOtherBenefits/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefitsGrp/TotalCommunityBenefitExpnsAmt'
V_TOT_OTH_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_OTH_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_TOT_OTH_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_TOT_OTH_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07J-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalOtherBenefits/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefitsGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefits/DirectOffsettingRevenue'
V_TOT_OTH_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_OTH_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_TOT_OTH_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_TOT_OTH_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07J-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefits/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalOtherBenefits/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefitsGrp/NetCommunityBenefitExpnsAmt'
V_TOT_OTH_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_OTH_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_TOT_OTH_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_TOT_OTH_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07J-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefits/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalOtherBenefits/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalOtherBenefitsGrp/TotalExpensePct'
V_TOT_OTH_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_OTH_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_TOT_OTH_PCT_EXP_TOT ) )




## VARIABLE NAME:  SH_01_TOT_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-01-LINE-07K-COL-A
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefitsGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefits/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCommunityBenefits/NumberOfActivitiesOrPrograms'
V_TOT_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_NUM_ACT_PROG <- xml_text( xml_find_all( doc, V_TOT_NUM_ACT_PROG ) )




## VARIABLE NAME:  SH_01_TOT_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-01-LINE-07K-COL-B
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefitsGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefits/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCommunityBenefits/PersonsServed'
V_TOT_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_PERS_SERVED <- xml_text( xml_find_all( doc, V_TOT_PERS_SERVED ) )




## VARIABLE NAME:  SH_01_TOT_EXP_TOT_COM_BEN
## DESCRIPTION:  Total community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07K-COL-C
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefits/TotalCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCommunityBenefits/TotalCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefitsGrp/TotalCommunityBenefitExpnsAmt'
V_TOT_EXP_TOT_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_EXP_TOT_COM_BEN <- xml_text( xml_find_all( doc, V_TOT_EXP_TOT_COM_BEN ) )




## VARIABLE NAME:  SH_01_TOT_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-01-LINE-07K-COL-D
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCommunityBenefits/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefitsGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefits/DirectOffsettingRevenue'
V_TOT_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_REV_DIRECT_OFFSET <- xml_text( xml_find_all( doc, V_TOT_REV_DIRECT_OFFSET ) )




## VARIABLE NAME:  SH_01_TOT_EXP_NET_COM_BEN
## DESCRIPTION:  Net community benefit expense
## LOCATION:  SCHED-H-PART-01-LINE-07K-COL-E
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefits/NetCommunityBenefitExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCommunityBenefits/NetCommunityBenefitExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefitsGrp/NetCommunityBenefitExpnsAmt'
V_TOT_EXP_NET_COM_BEN <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_EXP_NET_COM_BEN <- xml_text( xml_find_all( doc, V_TOT_EXP_NET_COM_BEN ) )




## VARIABLE NAME:  SH_01_TOT_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-01-LINE-07K-COL-F
## TABLE:  SH-P01-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefits/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartI/TotalCommunityBenefits/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommunityBenefitsGrp/TotalExpensePct'
V_TOT_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_01_TOT_PCT_EXP_TOT <- xml_text( xml_find_all( doc, V_TOT_PCT_EXP_TOT ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SH_01_FAP_X,SH_01_FAP_WRITTEN_X,SH_01_FAP_ALL_HOSPITAL_X,SH_01_FAP_INDIV_HOSPITAL_X,SH_01_FAP_MOST_HOSPITAL_X,SH_01_FPG_FREE_CARE_PCT_100_X,SH_01_FPG_FREE_CARE_PCT_150_X,SH_01_FPG_FREE_CARE_PCT_200_X,SH_01_FPG_FREE_CARE_PCT_OTH,SH_01_FPG_FREE_CARE_PCT_OTH_X,SH_01_FPG_FREE_CARE_X,SH_01_FPG_DCNT_CARE_PCT_200_X,SH_01_FPG_DCNT_CARE_PCT_250_X,SH_01_FPG_DCNT_CARE_PCT_300_X,SH_01_FPG_DCNT_CARE_PCT_350_X,SH_01_FPG_DCNT_CARE_PCT_400_X,SH_01_FPG_DCNT_CARE_PCT_OTH,SH_01_FPG_DCNT_CARE_PCT_OTH_X,SH_01_FPG_DCNT_CARE_X,SH_01_FAP_FREE_DCNT_CARE_X,SH_01_FA_AMT_BUDGETED_CARE_X,SH_01_FA_EXP_EXCEED_BUDGET_X,SH_01_FA_UNAVBL_PROV_CARE_X,SH_01_REP_ANNUAL_COM_BEN_X,SH_01_REP_AVBL_PUB_X,SH_01_FA_NUM_ACT_PROG,SH_01_FA_PERS_SERVED,SH_01_FA_EXP_TOT_COM_BEN,SH_01_FA_REV_DIRECT_OFFSET,SH_01_FA_EXP_NET_COM_BEN,SH_01_FA_PCT_EXP_TOT,SH_01_MEDICAID_NUM_ACT_PROG,SH_01_MEDICAID_PERS_SERVED,SH_01_MEDICAID_EXP_TOT_COM_BEN,SH_01_MEDICAID_REV_DIRECT_OFFSET,SH_01_MEDICAID_EXP_NET_COM_BEN,SH_01_MEDICAID_PCT_EXP_TOT,SH_01_MEAN_NUM_ACT_PROG,SH_01_MEAN_PERS_SERVED,SH_01_MEAN_EXP_TOT_COM_BEN,SH_01_MEAN_REV_DIRECT_OFFSET,SH_01_MEAN_EXP_NET_COM_BEN,SH_01_MEAN_PCT_EXP_TOT,SH_01_TOT_FA_NUM_ACT_PROG,SH_01_TOT_FA_PERS_SERVED,SH_01_TOT_FA_EXP_TOT_COM_BEN,SH_01_TOT_FA_REV_DIRECT_OFFSET,SH_01_TOT_FA_EXP_NET_COM_BEN,SH_01_TOT_FA_PCT_EXP_TOT,SH_01_H_SVC_NUM_ACT_PROG,SH_01_H_SVC_PERS_SERVED,SH_01_H_SVC_EXP_TOT_COM_BEN,SH_01_H_SVC_REV_DIRECT_OFFSET,SH_01_H_SVC_EXP_NET_COM_BEN,SH_01_H_SVC_PCT_EXP_TOT,SH_01_H_EDU_NUM_ACT_PROG,SH_01_H_EDU_PERS_SERVEDU,SH_01_H_EDU_EXP_TOT_COM_BEN,SH_01_H_EDU_REV_DIRECT_OFFSET,SH_01_H_EDU_EXP_NET_COM_BEN,SH_01_H_EDU_PCT_EXP_TOT,SH_01_H_SUBSID_NUM_ACT_PROG,SH_01_H_SUBSID_PERS_SERVED,SH_01_H_SUBSID_EXP_TOT_COM_BEN,SH_01_H_SUBSID_REV_DIRECT_OFFSET,SH_01_H_SUBSID_EXP_NET_COM_BEN,SH_01_H_SUBSID_PCT_EXP_TOT,SH_01_RSRCH_NUM_ACT_PROG,SH_01_RSRCH_PERS_SERVED,SH_01_RSRCH_EXP_TOT_COM_BEN,SH_01_RSRCH_REV_DIRECT_OFFSET,SH_01_RSRCH_EXP_NET_COM_BEN,SH_01_RSRCH_PCT_EXP_TOT,SH_01_CASH_NUM_ACT_PROG,SH_01_CASH_PERS_SERVED,SH_01_CASH_EXP_TOT_COM_BEN,SH_01_CASH_REV_DIRECT_OFFSET,SH_01_CASH_EXP_NET_COM_BEN,SH_01_CASH_PCT_EXP_TOT,SH_01_TOT_OTH_NUM_ACT_PROG,SH_01_TOT_OTH_PERS_SERVED,SH_01_TOT_OTH_EXP_TOT_COM_BEN,SH_01_TOT_OTH_REV_DIRECT_OFFSET,SH_01_TOT_OTH_EXP_NET_COM_BEN,SH_01_TOT_OTH_PCT_EXP_TOT,SH_01_TOT_NUM_ACT_PROG,SH_01_TOT_PERS_SERVED,SH_01_TOT_EXP_TOT_COM_BEN,SH_01_TOT_REV_DIRECT_OFFSET,SH_01_TOT_EXP_NET_COM_BEN,SH_01_TOT_PCT_EXP_TOT)
df <- as.data.frame( var.list )


return( df )


}


