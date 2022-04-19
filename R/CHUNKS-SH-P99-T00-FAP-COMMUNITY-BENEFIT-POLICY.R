#' @title 
#'   Build table SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SH_P99_T00_FAP_COMMUNITY_BENEFIT_POLICY <- function( doc, url )
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


## VARIABLE NAME:  SH_99_CHNA_AVBL_REQUEST_X
## DESCRIPTION:  Needs assessment available upon request (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-05C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OnRequest'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/RptAvailableUponRequestInd'
V_CHNA_AVBL_REQUEST_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_AVBL_REQUEST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_AVBL_REQUEST_X ) )
if( length( SH_99_CHNA_AVBL_REQUEST_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_AVBL_REQUEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_AVBL_REQUEST_X <-  paste0( '{', SH_99_CHNA_AVBL_REQUEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_ADOPT_IMP_X
## DESCRIPTION:  Adoption of implementation strategy (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06A
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AdoptImplementStrategy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AdoptImplementationStrategyInd'
V_CHNA_NEED_ADOPT_IMP_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_ADOPT_IMP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_ADOPT_IMP_X ) )
if( length( SH_99_CHNA_NEED_ADOPT_IMP_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_ADOPT_IMP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_ADOPT_IMP_X <-  paste0( '{', SH_99_CHNA_NEED_ADOPT_IMP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_EXECUTE_IMP_X
## DESCRIPTION:  Execution of implementation strategy (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExecuteImplementStrategy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExecImplementationStrategyInd'
V_CHNA_NEED_EXECUTE_IMP_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_EXECUTE_IMP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_EXECUTE_IMP_X ) )
if( length( SH_99_CHNA_NEED_EXECUTE_IMP_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_EXECUTE_IMP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_EXECUTE_IMP_X <-  paste0( '{', SH_99_CHNA_NEED_EXECUTE_IMP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_DEVELOP_PLAN_X
## DESCRIPTION:  Development of community benefit plan (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/DevelopCommunityPlan'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/DevelopCommunityWidePlanInd'
V_CHNA_NEED_DEVELOP_PLAN_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_DEVELOP_PLAN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_DEVELOP_PLAN_X ) )
if( length( SH_99_CHNA_NEED_DEVELOP_PLAN_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_DEVELOP_PLAN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_DEVELOP_PLAN_X <-  paste0( '{', SH_99_CHNA_NEED_DEVELOP_PLAN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_PARTICIPA_PLAN_X
## DESCRIPTION:  Participation in community-wide benefit plan (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ParticipateCommunityPlan'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExecCommunityWidePlanInd'
V_CHNA_NEED_PARTICIPA_PLAN_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_PARTICIPA_PLAN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_PARTICIPA_PLAN_X ) )
if( length( SH_99_CHNA_NEED_PARTICIPA_PLAN_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_PARTICIPA_PLAN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_PARTICIPA_PLAN_X <-  paste0( '{', SH_99_CHNA_NEED_PARTICIPA_PLAN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_INCL_PLAN_X
## DESCRIPTION:  Inclusion in operational plans (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06E
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/IncludeOperationalPlans'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/IncludeOperationalPlanInd'
V_CHNA_NEED_INCL_PLAN_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_INCL_PLAN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_INCL_PLAN_X ) )
if( length( SH_99_CHNA_NEED_INCL_PLAN_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_INCL_PLAN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_INCL_PLAN_X <-  paste0( '{', SH_99_CHNA_NEED_INCL_PLAN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_ADOPT_BUDGET_X
## DESCRIPTION:  Operational of budget (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06F
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AdoptBudget'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AdoptBudgetInd'
V_CHNA_NEED_ADOPT_BUDGET_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_ADOPT_BUDGET_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_ADOPT_BUDGET_X ) )
if( length( SH_99_CHNA_NEED_ADOPT_BUDGET_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_ADOPT_BUDGET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_ADOPT_BUDGET_X <-  paste0( '{', SH_99_CHNA_NEED_ADOPT_BUDGET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_PRIORITIZA_X
## DESCRIPTION:  Prioritization of health needs (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06G
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PrioritizeHealthNeeds'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PrioritizeHealthNeedsInd'
V_CHNA_NEED_PRIORITIZA_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_PRIORITIZA_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_PRIORITIZA_X ) )
if( length( SH_99_CHNA_NEED_PRIORITIZA_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_PRIORITIZA_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_PRIORITIZA_X <-  paste0( '{', SH_99_CHNA_NEED_PRIORITIZA_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_PRIORITIZA_SVC_X
## DESCRIPTION:  Prioritization of health services (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06H
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PrioritizeServices'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PrioritizeServicesInd'
V_CHNA_NEED_PRIORITIZA_SVC_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_PRIORITIZA_SVC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_PRIORITIZA_SVC_X ) )
if( length( SH_99_CHNA_NEED_PRIORITIZA_SVC_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_PRIORITIZA_SVC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_PRIORITIZA_SVC_X <-  paste0( '{', SH_99_CHNA_NEED_PRIORITIZA_SVC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_OTH_X
## DESCRIPTION:  Other needs addressed (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-06I
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherNeedsAddressed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherNeedsAddressedInd'
V_CHNA_NEED_OTH_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_OTH_X ) )
if( length( SH_99_CHNA_NEED_OTH_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_OTH_X <-  paste0( '{', SH_99_CHNA_NEED_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHNA_NEED_ALL_ADDRESSED_X
## DESCRIPTION:  All needs addressed? (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-07
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AllNeedsAddressed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AllNeedsAddressedInd'
V_CHNA_NEED_ALL_ADDRESSED_X <- paste( V1, V2 , sep='|' )
SH_99_CHNA_NEED_ALL_ADDRESSED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_NEED_ALL_ADDRESSED_X ) )
if( length( SH_99_CHNA_NEED_ALL_ADDRESSED_X ) > 1 )
{ 
  create_record( varname=SH_99_CHNA_NEED_ALL_ADDRESSED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHNA_NEED_ALL_ADDRESSED_X <-  paste0( '{', SH_99_CHNA_NEED_ALL_ADDRESSED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_USE_FPG_FREE_CARE_PCT
## DESCRIPTION:  Percentage of FPG used to determine free care (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-10
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_99_FAP_USE_FPG_FREE_CARE_PCT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/FPGFreePercent' ) )
if( length( SH_99_FAP_USE_FPG_FREE_CARE_PCT ) > 1 )
{ 
  create_record( varname=SH_99_FAP_USE_FPG_FREE_CARE_PCT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_USE_FPG_FREE_CARE_PCT <-  paste0( '{', SH_99_FAP_USE_FPG_FREE_CARE_PCT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_USE_FPG_FREE_CARE_X
## DESCRIPTION:  Policy uses FPG determine free care? (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-10
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/UsesFPGFree'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGUsedDeterEligFreeCareInd'
V_FAP_USE_FPG_FREE_CARE_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_USE_FPG_FREE_CARE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_USE_FPG_FREE_CARE_X ) )
if( length( SH_99_FAP_USE_FPG_FREE_CARE_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_USE_FPG_FREE_CARE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_USE_FPG_FREE_CARE_X <-  paste0( '{', SH_99_FAP_USE_FPG_FREE_CARE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_USE_FPG_DCNT_CARE_PCT
## DESCRIPTION:  Percentage of FPG used to determine discount care (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-11
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_99_FAP_USE_FPG_DCNT_CARE_PCT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/FPGDiscountPercent' ) )
if( length( SH_99_FAP_USE_FPG_DCNT_CARE_PCT ) > 1 )
{ 
  create_record( varname=SH_99_FAP_USE_FPG_DCNT_CARE_PCT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_USE_FPG_DCNT_CARE_PCT <-  paste0( '{', SH_99_FAP_USE_FPG_DCNT_CARE_PCT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_USE_FPG_DCNT_CARE_X
## DESCRIPTION:  Policy uses FPG determine discounted care? (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-11
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/UsesFPGDiscounted'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGUsedDetermEligDscntCareInd'
V_FAP_USE_FPG_DCNT_CARE_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_USE_FPG_DCNT_CARE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_USE_FPG_DCNT_CARE_X ) )
if( length( SH_99_FAP_USE_FPG_DCNT_CARE_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_USE_FPG_DCNT_CARE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_USE_FPG_DCNT_CARE_X <-  paste0( '{', SH_99_FAP_USE_FPG_DCNT_CARE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_INCOME_X
## DESCRIPTION:  Income level basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12A
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/IncomeLevel'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/IncomeLevelInd'
V_FAP_FACTOR_INCOME_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_INCOME_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_INCOME_X ) )
if( length( SH_99_FAP_FACTOR_INCOME_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_INCOME_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_INCOME_X <-  paste0( '{', SH_99_FAP_FACTOR_INCOME_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_ASSET_X
## DESCRIPTION:  Asset level basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AssetLevel'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AssetLevelInd'
V_FAP_FACTOR_ASSET_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_ASSET_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_ASSET_X ) )
if( length( SH_99_FAP_FACTOR_ASSET_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_ASSET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_ASSET_X <-  paste0( '{', SH_99_FAP_FACTOR_ASSET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_INDIGENCY_X
## DESCRIPTION:  Medical indigency basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/MedicalIndigency'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/MedicalIndigencyInd'
V_FAP_FACTOR_INDIGENCY_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_INDIGENCY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_INDIGENCY_X ) )
if( length( SH_99_FAP_FACTOR_INDIGENCY_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_INDIGENCY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_INDIGENCY_X <-  paste0( '{', SH_99_FAP_FACTOR_INDIGENCY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_INSURANCE_X
## DESCRIPTION:  Insurance status basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/InsuranceStatus'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/InsuranceStatusInd'
V_FAP_FACTOR_INSURANCE_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_INSURANCE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_INSURANCE_X ) )
if( length( SH_99_FAP_FACTOR_INSURANCE_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_INSURANCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_INSURANCE_X <-  paste0( '{', SH_99_FAP_FACTOR_INSURANCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_UNINSURED_X
## DESCRIPTION:  Uninsured discount basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12E
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/UninsuredDiscount'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/UninsuredDiscountInd'
V_FAP_FACTOR_UNINSURED_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_UNINSURED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_UNINSURED_X ) )
if( length( SH_99_FAP_FACTOR_UNINSURED_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_UNINSURED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_UNINSURED_X <-  paste0( '{', SH_99_FAP_FACTOR_UNINSURED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_MEDICAID_X
## DESCRIPTION:  Medicaid/Medicare basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12F
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/MedicaidMedicare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/MedicaidMedicareInd'
V_FAP_FACTOR_MEDICAID_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_MEDICAID_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_MEDICAID_X ) )
if( length( SH_99_FAP_FACTOR_MEDICAID_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_MEDICAID_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_MEDICAID_X <-  paste0( '{', SH_99_FAP_FACTOR_MEDICAID_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_STATE_REG_X
## DESCRIPTION:  State regulation basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12G
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/StateRegulation'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StateRegulationInd'
V_FAP_FACTOR_STATE_REG_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_STATE_REG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_STATE_REG_X ) )
if( length( SH_99_FAP_FACTOR_STATE_REG_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_STATE_REG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_STATE_REG_X <-  paste0( '{', SH_99_FAP_FACTOR_STATE_REG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_RESIDENCY_X
## DESCRIPTION:  Residency basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12H
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_99_FAP_FACTOR_RESIDENCY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ResidencyInd' ) )
if( length( SH_99_FAP_FACTOR_RESIDENCY_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_RESIDENCY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_RESIDENCY_X <-  paste0( '{', SH_99_FAP_FACTOR_RESIDENCY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_FACTOR_OTH_X
## DESCRIPTION:  Form990 Schedule HPart VSection B - Other basis (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-12I
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherFactors'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherFactorsInd'
V_FAP_FACTOR_OTH_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_FACTOR_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_FACTOR_OTH_X ) )
if( length( SH_99_FAP_FACTOR_OTH_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_FACTOR_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_FACTOR_OTH_X <-  paste0( '{', SH_99_FAP_FACTOR_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_PUBLICITY_X
## DESCRIPTION:  Policy includes publicity measures? (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_99_FAP_PROV_PUBLICITY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/IncludesPublicityMeasures' ) )
if( length( SH_99_FAP_PROV_PUBLICITY_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_PUBLICITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_PUBLICITY_X <-  paste0( '{', SH_99_FAP_PROV_PUBLICITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_WEBSITE_X
## DESCRIPTION:  Posted on own website (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14A
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PostedOnWebsite'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PostedOnWebsiteInd'
V_FAP_PROV_WEBSITE_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_PROV_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_PROV_WEBSITE_X ) )
if( length( SH_99_FAP_PROV_WEBSITE_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_WEBSITE_X <-  paste0( '{', SH_99_FAP_PROV_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_ATTACH_INVOICE_X
## DESCRIPTION:  Attached to invoices (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AttachedToInvoices'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AttachedToInvoiceInd'
V_FAP_PROV_ATTACH_INVOICE_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_PROV_ATTACH_INVOICE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_PROV_ATTACH_INVOICE_X ) )
if( length( SH_99_FAP_PROV_ATTACH_INVOICE_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_ATTACH_INVOICE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_ATTACH_INVOICE_X <-  paste0( '{', SH_99_FAP_PROV_ATTACH_INVOICE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_EMERGENCY_ROOM_X
## DESCRIPTION:  Posted in emergency room or waiting room (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PostedInEmergencyRoom'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PostedInEmergencyRoomInd'
V_FAP_PROV_EMERGENCY_ROOM_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_PROV_EMERGENCY_ROOM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_PROV_EMERGENCY_ROOM_X ) )
if( length( SH_99_FAP_PROV_EMERGENCY_ROOM_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_EMERGENCY_ROOM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_EMERGENCY_ROOM_X <-  paste0( '{', SH_99_FAP_PROV_EMERGENCY_ROOM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_ADM_OFFICE_X
## DESCRIPTION:  Posted in admissions office (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PostedInAdmissionOffice'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PostedInAdmissionOfficeInd'
V_FAP_PROV_ADM_OFFICE_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_PROV_ADM_OFFICE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_PROV_ADM_OFFICE_X ) )
if( length( SH_99_FAP_PROV_ADM_OFFICE_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_ADM_OFFICE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_ADM_OFFICE_X <-  paste0( '{', SH_99_FAP_PROV_ADM_OFFICE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_ADM_X
## DESCRIPTION:  Provided upon admission (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14E
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ProvidedOnAdmission'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ProvidedOnAdmissionInd'
V_FAP_PROV_ADM_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_PROV_ADM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_PROV_ADM_X ) )
if( length( SH_99_FAP_PROV_ADM_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_ADM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_ADM_X <-  paste0( '{', SH_99_FAP_PROV_ADM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_REQUEST_X
## DESCRIPTION:  Financial assistance policy available upon request (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14F
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AvailableOnRequest'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AvailableOnRequestInd'
V_FAP_PROV_REQUEST_X <- paste( V1, V2 , sep='|' )
SH_99_FAP_PROV_REQUEST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_PROV_REQUEST_X ) )
if( length( SH_99_FAP_PROV_REQUEST_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_REQUEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_REQUEST_X <-  paste0( '{', SH_99_FAP_PROV_REQUEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_PROV_OTH_X
## DESCRIPTION:  Other publicity (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-14G
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_99_FAP_PROV_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherPublicity' ) )
if( length( SH_99_FAP_PROV_OTH_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_PROV_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_PROV_OTH_X <-  paste0( '{', SH_99_FAP_PROV_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_PERMIT_LAWSUIT_X
## DESCRIPTION:  Lawsuit permitted (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-16B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitLawsuit'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitLawsuitInd'
V_BILL_PERMIT_LAWSUIT_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_PERMIT_LAWSUIT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_PERMIT_LAWSUIT_X ) )
if( length( SH_99_BILL_PERMIT_LAWSUIT_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_PERMIT_LAWSUIT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_PERMIT_LAWSUIT_X <-  paste0( '{', SH_99_BILL_PERMIT_LAWSUIT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_PERMIT_LIEN_X
## DESCRIPTION:  Lien on residence permitted (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-16C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitLienOnResidence'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitLienOnResidenceInd'
V_BILL_PERMIT_LIEN_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_PERMIT_LIEN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_PERMIT_LIEN_X ) )
if( length( SH_99_BILL_PERMIT_LIEN_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_PERMIT_LIEN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_PERMIT_LIEN_X <-  paste0( '{', SH_99_BILL_PERMIT_LIEN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_PERMIT_BODY_ATTACH_X
## DESCRIPTION:  Body attachment permitted (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-16D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitBodyAttachment'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitBodyAttachmentsInd'
V_BILL_PERMIT_BODY_ATTACH_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_PERMIT_BODY_ATTACH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_PERMIT_BODY_ATTACH_X ) )
if( length( SH_99_BILL_PERMIT_BODY_ATTACH_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_PERMIT_BODY_ATTACH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_PERMIT_BODY_ATTACH_X <-  paste0( '{', SH_99_BILL_PERMIT_BODY_ATTACH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_FAP_AVBL_NOTICE_DISPLAY_X
## DESCRIPTION:  Notice of availability of FAP displayed throughout hospital facility (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-16G
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_99_FAP_AVBL_NOTICE_DISPLAY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPNoticeDisplayedInd' ) )
if( length( SH_99_FAP_AVBL_NOTICE_DISPLAY_X ) > 1 )
{ 
  create_record( varname=SH_99_FAP_AVBL_NOTICE_DISPLAY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_FAP_AVBL_NOTICE_DISPLAY_X <-  paste0( '{', SH_99_FAP_AVBL_NOTICE_DISPLAY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_3RD_PARTY_LAWSUIT_X
## DESCRIPTION:  Lawsuit engaged (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-17B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/Lawsuit'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/LawsuitInd'
V_BILL_3RD_PARTY_LAWSUIT_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_3RD_PARTY_LAWSUIT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_3RD_PARTY_LAWSUIT_X ) )
if( length( SH_99_BILL_3RD_PARTY_LAWSUIT_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_3RD_PARTY_LAWSUIT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_3RD_PARTY_LAWSUIT_X <-  paste0( '{', SH_99_BILL_3RD_PARTY_LAWSUIT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_3RD_PARTY_LIEN_X
## DESCRIPTION:  Lien on residence engaged (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-17C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/LienOnResidence'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/LiensOnResidencesInd'
V_BILL_3RD_PARTY_LIEN_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_3RD_PARTY_LIEN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_3RD_PARTY_LIEN_X ) )
if( length( SH_99_BILL_3RD_PARTY_LIEN_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_3RD_PARTY_LIEN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_3RD_PARTY_LIEN_X <-  paste0( '{', SH_99_BILL_3RD_PARTY_LIEN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_3RD_PARTY_BODY_X
## DESCRIPTION:  Body attachment engaged (see SH-FORM-VERSION-2013-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-17D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/BodyAttachment'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/BodyAttachmentsInd'
V_BILL_3RD_PARTY_BODY_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_3RD_PARTY_BODY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_3RD_PARTY_BODY_X ) )
if( length( SH_99_BILL_3RD_PARTY_BODY_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_3RD_PARTY_BODY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_3RD_PARTY_BODY_X <-  paste0( '{', SH_99_BILL_3RD_PARTY_BODY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_NOTIFIED_ADM_X
## DESCRIPTION:  Notified upon admission (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-20A
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NotifyUponAdmission'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPNotifiedUponAdmissionInd'
V_BILL_NOTIFIED_ADM_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_NOTIFIED_ADM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_NOTIFIED_ADM_X ) )
if( length( SH_99_BILL_NOTIFIED_ADM_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_NOTIFIED_ADM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_NOTIFIED_ADM_X <-  paste0( '{', SH_99_BILL_NOTIFIED_ADM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_NOTIFIED_DISCHARGE_X
## DESCRIPTION:  Notified prior to discharge (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-20B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NotifyBeforeDischarge'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPNotifiedBeforeDischargeInd'
V_BILL_NOTIFIED_DISCHARGE_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_NOTIFIED_DISCHARGE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_NOTIFIED_DISCHARGE_X ) )
if( length( SH_99_BILL_NOTIFIED_DISCHARGE_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_NOTIFIED_DISCHARGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_NOTIFIED_DISCHARGE_X <-  paste0( '{', SH_99_BILL_NOTIFIED_DISCHARGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_NOTIFIED_PATIENT_X
## DESCRIPTION:  Notified patients in communications (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-20C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NotifiedAllPatients'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPNotifiedAllPatientsInd'
V_BILL_NOTIFIED_PATIENT_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_NOTIFIED_PATIENT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_NOTIFIED_PATIENT_X ) )
if( length( SH_99_BILL_NOTIFIED_PATIENT_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_NOTIFIED_PATIENT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_NOTIFIED_PATIENT_X <-  paste0( '{', SH_99_BILL_NOTIFIED_PATIENT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_NOTIFIED_DOC_X
## DESCRIPTION:  Documented determination (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-20D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/DocumentedDetermination'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/DocumentedEligDeterminationInd'
V_BILL_NOTIFIED_DOC_X <- paste( V1, V2 , sep='|' )
SH_99_BILL_NOTIFIED_DOC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_NOTIFIED_DOC_X ) )
if( length( SH_99_BILL_NOTIFIED_DOC_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_NOTIFIED_DOC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_NOTIFIED_DOC_X <-  paste0( '{', SH_99_BILL_NOTIFIED_DOC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_BILL_NOTIFIED_OTH_ACT_X
## DESCRIPTION:  Other action taken (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-20E
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_99_BILL_NOTIFIED_OTH_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherActionsTaken' ) )
if( length( SH_99_BILL_NOTIFIED_OTH_ACT_X ) > 1 )
{ 
  create_record( varname=SH_99_BILL_NOTIFIED_OTH_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_BILL_NOTIFIED_OTH_ACT_X <-  paste0( '{', SH_99_BILL_NOTIFIED_OTH_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHARGE_LOW_RATE_X
## DESCRIPTION:  Charged amount in excess of lowest negotiated rates? (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-22A
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/LowestNegotiatedRates'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/LowestNegotiatedRatesInd'
V_CHARGE_LOW_RATE_X <- paste( V1, V2 , sep='|' )
SH_99_CHARGE_LOW_RATE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARGE_LOW_RATE_X ) )
if( length( SH_99_CHARGE_LOW_RATE_X ) > 1 )
{ 
  create_record( varname=SH_99_CHARGE_LOW_RATE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHARGE_LOW_RATE_X <-  paste0( '{', SH_99_CHARGE_LOW_RATE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHARGE_AVE_RATE_X
## DESCRIPTION:  Charged amount in excess of average negotiated rates? (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-22B
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AverageNegotiatedRates'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AverageNegotiatedRatesInd'
V_CHARGE_AVE_RATE_X <- paste( V1, V2 , sep='|' )
SH_99_CHARGE_AVE_RATE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARGE_AVE_RATE_X ) )
if( length( SH_99_CHARGE_AVE_RATE_X ) > 1 )
{ 
  create_record( varname=SH_99_CHARGE_AVE_RATE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHARGE_AVE_RATE_X <-  paste0( '{', SH_99_CHARGE_AVE_RATE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHARGE_MT_MEDICARE_RATE_X
## DESCRIPTION:  Charged more than medicare rate? (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-22C
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/MedicareRate'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/MedicareRatesInd'
V_CHARGE_MT_MEDICARE_RATE_X <- paste( V1, V2 , sep='|' )
SH_99_CHARGE_MT_MEDICARE_RATE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARGE_MT_MEDICARE_RATE_X ) )
if( length( SH_99_CHARGE_MT_MEDICARE_RATE_X ) > 1 )
{ 
  create_record( varname=SH_99_CHARGE_MT_MEDICARE_RATE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHARGE_MT_MEDICARE_RATE_X <-  paste0( '{', SH_99_CHARGE_MT_MEDICARE_RATE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_99_CHARGE_OTH_METHOD_X
## DESCRIPTION:  Used other method (see SH-FORM-VERSION-2015-PART-05)
## LOCATION:  SCHED-H-PART-99-SECTION-B-LINE-22D
## TABLE:  SH-P99-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/UsedOtherMethod'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherMethodUsedInd'
V_CHARGE_OTH_METHOD_X <- paste( V1, V2 , sep='|' )
SH_99_CHARGE_OTH_METHOD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARGE_OTH_METHOD_X ) )
if( length( SH_99_CHARGE_OTH_METHOD_X ) > 1 )
{ 
  create_record( varname=SH_99_CHARGE_OTH_METHOD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_99_CHARGE_OTH_METHOD_X <-  paste0( '{', SH_99_CHARGE_OTH_METHOD_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SH_99_CHNA_AVBL_REQUEST_X,SH_99_CHNA_NEED_ADOPT_IMP_X,SH_99_CHNA_NEED_EXECUTE_IMP_X,SH_99_CHNA_NEED_DEVELOP_PLAN_X,SH_99_CHNA_NEED_PARTICIPA_PLAN_X,SH_99_CHNA_NEED_INCL_PLAN_X,SH_99_CHNA_NEED_ADOPT_BUDGET_X,SH_99_CHNA_NEED_PRIORITIZA_X,SH_99_CHNA_NEED_PRIORITIZA_SVC_X,SH_99_CHNA_NEED_OTH_X,SH_99_CHNA_NEED_ALL_ADDRESSED_X,SH_99_FAP_USE_FPG_FREE_CARE_PCT,SH_99_FAP_USE_FPG_FREE_CARE_X,SH_99_FAP_USE_FPG_DCNT_CARE_PCT,SH_99_FAP_USE_FPG_DCNT_CARE_X,SH_99_FAP_FACTOR_INCOME_X,SH_99_FAP_FACTOR_ASSET_X,SH_99_FAP_FACTOR_INDIGENCY_X,SH_99_FAP_FACTOR_INSURANCE_X,SH_99_FAP_FACTOR_UNINSURED_X,SH_99_FAP_FACTOR_MEDICAID_X,SH_99_FAP_FACTOR_STATE_REG_X,SH_99_FAP_FACTOR_RESIDENCY_X,SH_99_FAP_FACTOR_OTH_X,SH_99_FAP_PROV_PUBLICITY_X,SH_99_FAP_PROV_WEBSITE_X,SH_99_FAP_PROV_ATTACH_INVOICE_X,SH_99_FAP_PROV_EMERGENCY_ROOM_X,SH_99_FAP_PROV_ADM_OFFICE_X,SH_99_FAP_PROV_ADM_X,SH_99_FAP_PROV_REQUEST_X,SH_99_FAP_PROV_OTH_X,SH_99_BILL_PERMIT_LAWSUIT_X,SH_99_BILL_PERMIT_LIEN_X,SH_99_BILL_PERMIT_BODY_ATTACH_X,SH_99_FAP_AVBL_NOTICE_DISPLAY_X,SH_99_BILL_3RD_PARTY_LAWSUIT_X,SH_99_BILL_3RD_PARTY_LIEN_X,SH_99_BILL_3RD_PARTY_BODY_X,SH_99_BILL_NOTIFIED_ADM_X,SH_99_BILL_NOTIFIED_DISCHARGE_X,SH_99_BILL_NOTIFIED_PATIENT_X,SH_99_BILL_NOTIFIED_DOC_X,SH_99_BILL_NOTIFIED_OTH_ACT_X,SH_99_CHARGE_LOW_RATE_X,SH_99_CHARGE_AVE_RATE_X,SH_99_CHARGE_MT_MEDICARE_RATE_X,SH_99_CHARGE_OTH_METHOD_X)
df <- as.data.frame( var.list )


return( df )


}


