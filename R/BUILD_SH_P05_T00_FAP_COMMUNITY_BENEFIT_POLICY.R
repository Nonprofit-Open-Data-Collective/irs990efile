#' @title 
#'   Build table SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SH_P05_T00_FAP_COMMUNITY_BENEFIT_POLICY <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SH_05_FAP_METHOD_WRITTEN_X
## DESCRIPTION:  Individuals were notified about the FAP by being offered a paper copy of the plain language summary of the FAP, by receiving a conspicuous written notice about the FAP on their billing statements, and via conspicuous public displays or other measures reasonably calculated to attract patients' attention
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16G
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

SH_05_FAP_METHOD_WRITTEN_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ProvidedWrittenNoticeInd' ) )
if( length( SH_05_FAP_METHOD_WRITTEN_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_WRITTEN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_WRITTEN_X <-  paste0( '{', SH_05_FAP_METHOD_WRITTEN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_NON_HOSPITAL_NUM
## DESCRIPTION:  Number of other facilities
## LOCATION:  SCHED-H-PART-05-SECTION-D-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/FacilityNum'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionC/NumberOfOtherFacilities'
V3 <- '//Return/ReturnData/IRS990ScheduleH/OthHlthCareFcltsNotHospitalGrp/FacilityNum'
V_NON_HOSPITAL_NUM <- paste( V1, V2, V3 , sep='|' )
SH_05_NON_HOSPITAL_NUM <- xml2::xml_text( xml2::xml_find_all( doc, V_NON_HOSPITAL_NUM ) )
if( length( SH_05_NON_HOSPITAL_NUM ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_NON_HOSPITAL_NUM, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_NON_HOSPITAL_NUM <-  paste0( '{', SH_05_NON_HOSPITAL_NUM, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_HOSPITAL_NUM
## DESCRIPTION:  Hospital facility number
## LOCATION:  SCHED-H-PART-05-SECTION-A-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionA/FacilityNumber'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFacilitiesCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFacilitiesGrp/FacilityNum'
V4 <- '//Return/ReturnData/IRS990ScheduleH/NumberOfHospitalFacilities'
V_HOSPITAL_NUM <- paste( V1, V2, V3, V4 , sep='|' )
SH_05_HOSPITAL_NUM <- xml2::xml_text( xml2::xml_find_all( doc, V_HOSPITAL_NUM ) )
if( length( SH_05_HOSPITAL_NUM ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_HOSPITAL_NUM, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_HOSPITAL_NUM <-  paste0( '{', SH_05_HOSPITAL_NUM, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_EXPLAIN_ACT_NOPAY_X
## DESCRIPTION:  Policy explains actions taken upon non-payment?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-17
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ActionsOnNonpayment'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPActionsOnNonpaymentInd'
V_BILL_EXPLAIN_ACT_NOPAY_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_EXPLAIN_ACT_NOPAY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_EXPLAIN_ACT_NOPAY_X ) )
if( length( SH_05_BILL_EXPLAIN_ACT_NOPAY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_EXPLAIN_ACT_NOPAY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_EXPLAIN_ACT_NOPAY_X <-  paste0( '{', SH_05_BILL_EXPLAIN_ACT_NOPAY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHARGE_MT_AMT_BILLED_X
## DESCRIPTION:  Charged more than amount generally billed?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-23
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AmountsGenerallyBilled'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AmountsGenerallyBilledInd'
V_CHARGE_MT_AMT_BILLED_X <- paste( V1, V2 , sep='|' )
SH_05_CHARGE_MT_AMT_BILLED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARGE_MT_AMT_BILLED_X ) )
if( length( SH_05_CHARGE_MT_AMT_BILLED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHARGE_MT_AMT_BILLED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHARGE_MT_AMT_BILLED_X <-  paste0( '{', SH_05_CHARGE_MT_AMT_BILLED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_CONDUCTED_X
## DESCRIPTION:  Conduct community needs health assessments?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CHNAConducted'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedInd'
V_CHNA_CONDUCTED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_CONDUCTED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_CONDUCTED_X ) )
if( length( SH_05_CHNA_CONDUCTED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_CONDUCTED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_CONDUCTED_X <-  paste0( '{', SH_05_CHNA_CONDUCTED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_PUB_X
## DESCRIPTION:  CHNA widely available to public?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CHNAWidelyAvailable'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAReportWidelyAvailableInd'
V_CHNA_AVBL_PUB_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_AVBL_PUB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_AVBL_PUB_X ) )
if( length( SH_05_CHNA_AVBL_PUB_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_PUB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_PUB_X <-  paste0( '{', SH_05_CHNA_AVBL_PUB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_COLLEC_X
## DESCRIPTION:  Authorize third-party to engage in collection activities?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CollectionActivities'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CollectionActivitiesInd'
V_BILL_3RD_PARTY_COLLEC_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_3RD_PARTY_COLLEC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_3RD_PARTY_COLLEC_X ) )
if( length( SH_05_BILL_3RD_PARTY_COLLEC_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_3RD_PARTY_COLLEC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_3RD_PARTY_COLLEC_X <-  paste0( '{', SH_05_BILL_3RD_PARTY_COLLEC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_DEFINITION_COM_X
## DESCRIPTION:  Definition of community served
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CommunityDefinition'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityDefinitionInd'
V_CHNA_DESC_DEFINITION_COM_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_DEFINITION_COM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_DEFINITION_COM_X ) )
if( length( SH_05_CHNA_DESC_DEFINITION_COM_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_DEFINITION_COM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_DEFINITION_COM_X <-  paste0( '{', SH_05_CHNA_DESC_DEFINITION_COM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_DEMOGRAPHICS_X
## DESCRIPTION:  Demographics of community
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CommunityDemographics'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityDemographicsInd'
V_CHNA_DESC_DEMOGRAPHICS_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_DEMOGRAPHICS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_DEMOGRAPHICS_X ) )
if( length( SH_05_CHNA_DESC_DEMOGRAPHICS_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_DEMOGRAPHICS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_DEMOGRAPHICS_X <-  paste0( '{', SH_05_CHNA_DESC_DEMOGRAPHICS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_HEALTH_NEED_X
## DESCRIPTION:  Health needs of community
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CommunityHealthNeeds'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityHealthNeedsInd'
V_CHNA_DESC_HEALTH_NEED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_HEALTH_NEED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_HEALTH_NEED_X ) )
if( length( SH_05_CHNA_DESC_HEALTH_NEED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_HEALTH_NEED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_HEALTH_NEED_X <-  paste0( '{', SH_05_CHNA_DESC_HEALTH_NEED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_CONSULTING_X
## DESCRIPTION:  Consulting process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03H
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ConsultingProcess'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ConsultingProcessInd'
V_CHNA_DESC_CONSULTING_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_CONSULTING_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_CONSULTING_X ) )
if( length( SH_05_CHNA_DESC_CONSULTING_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_CONSULTING_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_CONSULTING_X <-  paste0( '{', SH_05_CHNA_DESC_CONSULTING_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_EXPLAIN_X
## DESCRIPTION:  Policy explains eligibility criteria for financial assistance?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/EligibilityCriteriaExplained'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EligCriteriaExplainedInd'
V_FAP_CRITERIA_EXPLAIN_X <- paste( V1, V2 , sep='|' )
SH_05_FAP_CRITERIA_EXPLAIN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_CRITERIA_EXPLAIN_X ) )
if( length( SH_05_FAP_CRITERIA_EXPLAIN_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_EXPLAIN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_EXPLAIN_X <-  paste0( '{', SH_05_FAP_CRITERIA_EXPLAIN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_EMERGENCY_LIMIT_CARE_X
## DESCRIPTION:  Limits emergency care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/EmergencyCareLimited'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EmergencyCareLimitedInd'
V_EMERGENCY_LIMIT_CARE_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_LIMIT_CARE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMERGENCY_LIMIT_CARE_X ) )
if( length( SH_05_EMERGENCY_LIMIT_CARE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_EMERGENCY_LIMIT_CARE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_EMERGENCY_LIMIT_CARE_X <-  paste0( '{', SH_05_EMERGENCY_LIMIT_CARE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_EXCISE_TAX_4959_AMT
## DESCRIPTION:  Form990 Schedule HPart VSection B - ExciseReportForm4720ForAllAmt
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-12C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExciseReportForm4720ForAllAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExciseReportForm4720ForAllAmt'
V_CHNA_EXCISE_TAX_4959_AMT <- paste( V1, V2 , sep='|' )
SH_05_CHNA_EXCISE_TAX_4959_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_EXCISE_TAX_4959_AMT ) )
if( length( SH_05_CHNA_EXCISE_TAX_4959_AMT ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_EXCISE_TAX_4959_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_EXCISE_TAX_4959_AMT <-  paste0( '{', SH_05_CHNA_EXCISE_TAX_4959_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_01_CHNA_DESC_RESOURCES_X
## DESCRIPTION:  Existing health care facilities and resources
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExistingResources'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExistingResourcesInd'
V_CHNA_DESC_RESOURCES_X <- paste( V1, V2 , sep='|' )
SH_01_CHNA_DESC_RESOURCES_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_RESOURCES_X ) )
if( length( SH_01_CHNA_DESC_RESOURCES_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_01_CHNA_DESC_RESOURCES_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_01_CHNA_DESC_RESOURCES_X <-  paste0( '{', SH_01_CHNA_DESC_RESOURCES_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_METHOD_EXPLAIN_X
## DESCRIPTION:  Policy explains method for applying for assistance?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExplainsApplicationMethod'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AppFinancialAsstExplnInd'
V_FAP_METHOD_EXPLAIN_X <- paste( V1, V2 , sep='|' )
SH_05_FAP_METHOD_EXPLAIN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_METHOD_EXPLAIN_X ) )
if( length( SH_05_FAP_METHOD_EXPLAIN_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_EXPLAIN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_EXPLAIN_X <-  paste0( '{', SH_05_FAP_METHOD_EXPLAIN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_BASIS_EXPLAIN_X
## DESCRIPTION:  Policy explains basis for calculating amounts?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-14
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExplainsBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExplainedBasisInd'
V_FAP_BASIS_EXPLAIN_X <- paste( V1, V2 , sep='|' )
SH_05_FAP_BASIS_EXPLAIN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FAP_BASIS_EXPLAIN_X ) )
if( length( SH_05_FAP_BASIS_EXPLAIN_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_BASIS_EXPLAIN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_BASIS_EXPLAIN_X <-  paste0( '{', SH_05_FAP_BASIS_EXPLAIN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_4959_FORM4720_FILED_X
## DESCRIPTION:  Form990 Schedule HPart VSection B - FileForm4720ReportExciseTax
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-12B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/FileForm4720ReportExciseTax'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/Form4720FiledInd'
V_CHNA_4959_FORM4720_FILED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_4959_FORM4720_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_4959_FORM4720_FILED_X ) )
if( length( SH_05_CHNA_4959_FORM4720_FILED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_4959_FORM4720_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_4959_FORM4720_FILED_X <-  paste0( '{', SH_05_CHNA_4959_FORM4720_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHARGE_FAP_GRO_CHARGE_X
## DESCRIPTION:  Gross charges in billing?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-24
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/GrossCharges'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/GrossChargesInd'
V_CHARGE_FAP_GRO_CHARGE_X <- paste( V1, V2 , sep='|' )
SH_05_CHARGE_FAP_GRO_CHARGE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARGE_FAP_GRO_CHARGE_X ) )
if( length( SH_05_CHARGE_FAP_GRO_CHARGE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHARGE_FAP_GRO_CHARGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHARGE_FAP_GRO_CHARGE_X <-  paste0( '{', SH_05_CHARGE_FAP_GRO_CHARGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_HOSPITAL_FACILITY_NAME_L1
## DESCRIPTION:  Hospital Facility Name - BusinessNameLine1
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/HospitalFacilityName/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/HospitalFacilityName/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/HospitalFacilityName/BusinessNameLine1Txt'
V_HOSPITAL_FACILITY_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
SH_05_HOSPITAL_FACILITY_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_HOSPITAL_FACILITY_NAME_L1 ) )
if( length( SH_05_HOSPITAL_FACILITY_NAME_L1 ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_HOSPITAL_FACILITY_NAME_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_HOSPITAL_FACILITY_NAME_L1 <-  paste0( '{', SH_05_HOSPITAL_FACILITY_NAME_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_HOSPITAL_FACILITY_NAME_L2
## DESCRIPTION:  Hospital Facility Name - BusinessNameLine2
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/HospitalFacilityName/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/HospitalFacilityName/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/HospitalFacilityName/BusinessNameLine2Txt'
V_HOSPITAL_FACILITY_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
SH_05_HOSPITAL_FACILITY_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_HOSPITAL_FACILITY_NAME_L2 ) )
if( length( SH_05_HOSPITAL_FACILITY_NAME_L2 ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_HOSPITAL_FACILITY_NAME_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_HOSPITAL_FACILITY_NAME_L2 <-  paste0( '{', SH_05_HOSPITAL_FACILITY_NAME_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_HOSPITAL_FACILITY_LINE_NUM
## DESCRIPTION:  Line number of hospital facility
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/HospitalFacilityNumber'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FacilityNum'
V_HOSPITAL_FACILITY_LINE_NUM <- paste( V1, V2 , sep='|' )
SH_05_HOSPITAL_FACILITY_LINE_NUM <- xml2::xml_text( xml2::xml_find_all( doc, V_HOSPITAL_FACILITY_LINE_NUM ) )
if( length( SH_05_HOSPITAL_FACILITY_LINE_NUM ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_HOSPITAL_FACILITY_LINE_NUM, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_HOSPITAL_FACILITY_LINE_NUM <-  paste0( '{', SH_05_HOSPITAL_FACILITY_LINE_NUM, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_DATA_OBTAINED_X
## DESCRIPTION:  How data obtained
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/HowDataObtained'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/HowDataObtainedInd'
V_CHNA_DESC_DATA_OBTAINED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_DATA_OBTAINED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_DATA_OBTAINED_X ) )
if( length( SH_05_CHNA_DESC_DATA_OBTAINED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_DATA_OBTAINED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_DATA_OBTAINED_X <-  paste0( '{', SH_05_CHNA_DESC_DATA_OBTAINED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_IDENTIFYING_X
## DESCRIPTION:  Identifying process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03G
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/IdentifyingProcess'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityHlthNeedsIdProcessInd'
V_CHNA_DESC_IDENTIFYING_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_IDENTIFYING_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_IDENTIFYING_X ) )
if( length( SH_05_CHNA_DESC_IDENTIFYING_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_IDENTIFYING_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_IDENTIFYING_X <-  paste0( '{', SH_05_CHNA_DESC_IDENTIFYING_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_INFO_GAP_X
## DESCRIPTION:  Information gaps
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03I
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/InformationGaps'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/InformationGapsInd'
V_CHNA_DESC_INFO_GAP_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_INFO_GAP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_INFO_GAP_X ) )
if( length( SH_05_CHNA_DESC_INFO_GAP_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_INFO_GAP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_INFO_GAP_X <-  paste0( '{', SH_05_CHNA_DESC_INFO_GAP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_YEAR_CONDUCTED
## DESCRIPTION:  Year last conducted CHNA
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-04
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NeedsAssessmentConducted'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedYr'
V_CHNA_YEAR_CONDUCTED <- paste( V1, V2 , sep='|' )
SH_05_CHNA_YEAR_CONDUCTED <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_YEAR_CONDUCTED ) )
if( length( SH_05_CHNA_YEAR_CONDUCTED ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_YEAR_CONDUCTED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_YEAR_CONDUCTED <-  paste0( '{', SH_05_CHNA_YEAR_CONDUCTED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_EMERGENCY_NO_CARE_X
## DESCRIPTION:  No emergency care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NoEmergencyCare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NoEmergencyCareInd'
V_EMERGENCY_NO_CARE_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_NO_CARE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMERGENCY_NO_CARE_X ) )
if( length( SH_05_EMERGENCY_NO_CARE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_EMERGENCY_NO_CARE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_EMERGENCY_NO_CARE_X <-  paste0( '{', SH_05_EMERGENCY_NO_CARE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_EMERGENCY_NO_POLICY_X
## DESCRIPTION:  No emergency policy
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NoEmergencyPolicy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NoEmergencyCarePolicyInd'
V_EMERGENCY_NO_POLICY_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_NO_POLICY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMERGENCY_NO_POLICY_X ) )
if( length( SH_05_EMERGENCY_NO_POLICY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_EMERGENCY_NO_POLICY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_EMERGENCY_NO_POLICY_X <-  paste0( '{', SH_05_EMERGENCY_NO_POLICY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_EMERGENCY_NODISCR_POLICY_X
## DESCRIPTION:  Non-discriminatory emergency medical care policy?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NondiscrimEmergencyCarePolicy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NondisEmergencyCarePolicyInd'
V_EMERGENCY_NODISCR_POLICY_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_NODISCR_POLICY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMERGENCY_NODISCR_POLICY_X ) )
if( length( SH_05_EMERGENCY_NODISCR_POLICY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_EMERGENCY_NODISCR_POLICY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_EMERGENCY_NODISCR_POLICY_X <-  paste0( '{', SH_05_EMERGENCY_NODISCR_POLICY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_EXCISE_TAX_4959_X
## DESCRIPTION:  Form990 Schedule HPart VSection B - OrganizationIncurExciseTax
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-12A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OrganizationIncurExciseTax'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OrganizationIncurExciseTaxInd'
V_CHNA_EXCISE_TAX_4959_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_EXCISE_TAX_4959_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_EXCISE_TAX_4959_X ) )
if( length( SH_05_CHNA_EXCISE_TAX_4959_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_EXCISE_TAX_4959_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_EXCISE_TAX_4959_X <-  paste0( '{', SH_05_CHNA_EXCISE_TAX_4959_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_OTH_X
## DESCRIPTION:  CHNA describes other
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03J
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/Other'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherInd'
V_CHNA_DESC_OTH_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_OTH_X ) )
if( length( SH_05_CHNA_DESC_OTH_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_OTH_X <-  paste0( '{', SH_05_CHNA_DESC_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_OTH_ACT_X
## DESCRIPTION:  Other actions engaged
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherActions'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherActionsInd'
V_BILL_3RD_PARTY_OTH_ACT_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_3RD_PARTY_OTH_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_3RD_PARTY_OTH_ACT_X ) )
if( length( SH_05_BILL_3RD_PARTY_OTH_ACT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_3RD_PARTY_OTH_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_3RD_PARTY_OTH_ACT_X <-  paste0( '{', SH_05_BILL_3RD_PARTY_OTH_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_FACILITY_OTH_X
## DESCRIPTION:  Other hospital facilities?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-06A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherFacilities'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedWithOtherFcltsInd'
V_CHNA_FACILITY_OTH_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_FACILITY_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_FACILITY_OTH_X ) )
if( length( SH_05_CHNA_FACILITY_OTH_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_FACILITY_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_FACILITY_OTH_X <-  paste0( '{', SH_05_CHNA_FACILITY_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_DESC_HEALTH_ISSUE_X
## DESCRIPTION:  Other health issues
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherHealthIssues'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherHealthIssuesInd'
V_CHNA_DESC_HEALTH_ISSUE_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_HEALTH_ISSUE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_DESC_HEALTH_ISSUE_X ) )
if( length( SH_05_CHNA_DESC_HEALTH_ISSUE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_DESC_HEALTH_ISSUE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_DESC_HEALTH_ISSUE_X <-  paste0( '{', SH_05_CHNA_DESC_HEALTH_ISSUE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_OTH_METHOD_X
## DESCRIPTION:  Available other method
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherMethod'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/RptAvailableThruOtherMethodInd'
V_CHNA_AVBL_OTH_METHOD_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_AVBL_OTH_METHOD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_AVBL_OTH_METHOD_X ) )
if( length( SH_05_CHNA_AVBL_OTH_METHOD_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_OTH_METHOD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_OTH_METHOD_X <-  paste0( '{', SH_05_CHNA_AVBL_OTH_METHOD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_EMERGENCY_OTH_REASON_X
## DESCRIPTION:  Form990 Schedule HPart VSection B - Other reason
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherReason'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherReasonInd'
V_EMERGENCY_OTH_REASON_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_OTH_REASON_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMERGENCY_OTH_REASON_X ) )
if( length( SH_05_EMERGENCY_OTH_REASON_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_EMERGENCY_OTH_REASON_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_EMERGENCY_OTH_REASON_X <-  paste0( '{', SH_05_EMERGENCY_OTH_REASON_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_WEBSITE_X
## DESCRIPTION:  Available on own website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OwnWebsite'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/RptAvailableOnOwnWebsiteInd'
V_CHNA_AVBL_WEBSITE_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_AVBL_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_AVBL_WEBSITE_X ) )
if( length( SH_05_CHNA_AVBL_WEBSITE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_WEBSITE_X <-  paste0( '{', SH_05_CHNA_AVBL_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_PERMIT_OTH_ACT_X
## DESCRIPTION:  Other actions permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitOtherActions'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitOtherActionsInd'
V_BILL_PERMIT_OTH_ACT_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_PERMIT_OTH_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_PERMIT_OTH_ACT_X ) )
if( length( SH_05_BILL_PERMIT_OTH_ACT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_PERMIT_OTH_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_PERMIT_OTH_ACT_X <-  paste0( '{', SH_05_BILL_PERMIT_OTH_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_PERMIT_AGENCY_X
## DESCRIPTION:  Report to credit agency permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitReportToCreditAgency'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitReportToCreditAgencyInd'
V_BILL_PERMIT_AGENCY_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_PERMIT_AGENCY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_PERMIT_AGENCY_X ) )
if( length( SH_05_BILL_PERMIT_AGENCY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_PERMIT_AGENCY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_PERMIT_AGENCY_X <-  paste0( '{', SH_05_BILL_PERMIT_AGENCY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_AGENCY_X
## DESCRIPTION:  Credit agency engaged
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ReportToCreditAgency'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ReportingToCreditAgencyInd'
V_BILL_3RD_PARTY_AGENCY_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_3RD_PARTY_AGENCY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BILL_3RD_PARTY_AGENCY_X ) )
if( length( SH_05_BILL_3RD_PARTY_AGENCY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_3RD_PARTY_AGENCY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_3RD_PARTY_AGENCY_X <-  paste0( '{', SH_05_BILL_3RD_PARTY_AGENCY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_TAKE_COM_ACC_X
## DESCRIPTION:  Take community input into account
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-05
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/TakeIntoAccount'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/TakeIntoAccountOthersInputInd'
V_CHNA_TAKE_COM_ACC_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_TAKE_COM_ACC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHNA_TAKE_COM_ACC_X ) )
if( length( SH_05_CHNA_TAKE_COM_ACC_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_TAKE_COM_ACC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_TAKE_COM_ACC_X <-  paste0( '{', SH_05_CHNA_TAKE_COM_ACC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_ASSET_X
## DESCRIPTION:  Asset level criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_ASSET_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AssetLevelCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_ASSET_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_ASSET_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_ASSET_X <-  paste0( '{', SH_05_FAP_CRITERIA_ASSET_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_FACILITY_NON_X
## DESCRIPTION:  Other than hospital facilities?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-06B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_FACILITY_NON_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedWithNonFcltsInd' ) )
if( length( SH_05_CHNA_FACILITY_NON_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_FACILITY_NON_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_FACILITY_NON_X <-  paste0( '{', SH_05_CHNA_FACILITY_NON_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_COM_NOTIFIED_X
## DESCRIPTION:  Notified community about availability of FAP
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16H
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_COM_NOTIFIED_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommuntityNotifiedFAPInd' ) )
if( length( SH_05_FAP_AVBL_COM_NOTIFIED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_COM_NOTIFIED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_COM_NOTIFIED_X <-  paste0( '{', SH_05_FAP_AVBL_COM_NOTIFIED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_METHOD_DESC_INFO_X
## DESCRIPTION:  Described information as part of application.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_DESC_INFO_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/DescribedInfoInd' ) )
if( length( SH_05_FAP_METHOD_DESC_INFO_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_DESC_INFO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_DESC_INFO_X <-  paste0( '{', SH_05_FAP_METHOD_DESC_INFO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_METHOD_DESC_DOC_X
## DESCRIPTION:  Described supporting documentation as part of application.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_DESC_DOC_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/DescribedSuprtDocInd' ) )
if( length( SH_05_FAP_METHOD_DESC_DOC_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_DESC_DOC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_DESC_DOC_X <-  paste0( '{', SH_05_FAP_METHOD_DESC_DOC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_LEGAL_X
## DESCRIPTION:  Engaged actions that required a legal or judicial process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_3RD_PARTY_LEGAL_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EngagedLegalJudicialProcessInd' ) )
if( length( SH_05_BILL_3RD_PARTY_LEGAL_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_3RD_PARTY_LEGAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_3RD_PARTY_LEGAL_X <-  paste0( '{', SH_05_BILL_3RD_PARTY_LEGAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_SELL_DEBT_X
## DESCRIPTION:  Selling debt engaged
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_3RD_PARTY_SELL_DEBT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EngagedSellingDebtInd' ) )
if( length( SH_05_BILL_3RD_PARTY_SELL_DEBT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_3RD_PARTY_SELL_DEBT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_3RD_PARTY_SELL_DEBT_X <-  paste0( '{', SH_05_BILL_3RD_PARTY_SELL_DEBT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_FORM_WEBSITE_X
## DESCRIPTION:  FAP application form widely available on a website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_FORM_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAppAvailableOnWebsiteInd' ) )
if( length( SH_05_FAP_AVBL_FORM_WEBSITE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_FORM_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_FORM_WEBSITE_X <-  paste0( '{', SH_05_FAP_AVBL_FORM_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_FORM_WEBSITE
## DESCRIPTION:  FAP application form website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_FORM_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAppAvailableOnWebsiteURLTxt' ) )
if( length( SH_05_FAP_AVBL_FORM_WEBSITE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_FORM_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_FORM_WEBSITE <-  paste0( '{', SH_05_FAP_AVBL_FORM_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_FORM_REQUEST_X
## DESCRIPTION:  FAP application form available upon request and without charge
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_FORM_REQUEST_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAppAvlblOnRequestNoChrgInd' ) )
if( length( SH_05_FAP_AVBL_FORM_REQUEST_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_FORM_REQUEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_FORM_REQUEST_X <-  paste0( '{', SH_05_FAP_AVBL_FORM_REQUEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_WEBSITE_X
## DESCRIPTION:  FAP widely available on a website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAvailableOnWebsiteInd' ) )
if( length( SH_05_FAP_AVBL_WEBSITE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_WEBSITE_X <-  paste0( '{', SH_05_FAP_AVBL_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_WEBSITE
## DESCRIPTION:  FAP website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAvailableOnWebsiteURLTxt' ) )
if( length( SH_05_FAP_AVBL_WEBSITE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_WEBSITE <-  paste0( '{', SH_05_FAP_AVBL_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_REQUEST_X
## DESCRIPTION:  FAP available upon request and without charge
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_REQUEST_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAvlblOnRequestNoChargeInd' ) )
if( length( SH_05_FAP_AVBL_REQUEST_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_REQUEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_REQUEST_X <-  paste0( '{', SH_05_FAP_AVBL_REQUEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_SUMMARY_REQUEST_X
## DESCRIPTION:  FAP plain language summary available upon request and without charge
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_SUMMARY_REQUEST_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPSumAvlblOnRequestNoChrgInd' ) )
if( length( SH_05_FAP_AVBL_SUMMARY_REQUEST_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_SUMMARY_REQUEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_SUMMARY_REQUEST_X <-  paste0( '{', SH_05_FAP_AVBL_SUMMARY_REQUEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_SUMMARY_WEBSITE_X
## DESCRIPTION:  FAP plain language summary on a website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_SUMMARY_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPSummaryOnWebsiteInd' ) )
if( length( SH_05_FAP_AVBL_SUMMARY_WEBSITE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_SUMMARY_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_SUMMARY_WEBSITE_X <-  paste0( '{', SH_05_FAP_AVBL_SUMMARY_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_SUMMARY_WEBSITE
## DESCRIPTION:  FAP plain language summary website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_SUMMARY_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPSummaryOnWebsiteURLTxt' ) )
if( length( SH_05_FAP_AVBL_SUMMARY_WEBSITE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_SUMMARY_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_SUMMARY_WEBSITE <-  paste0( '{', SH_05_FAP_AVBL_SUMMARY_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_FIRST_LIC_X
## DESCRIPTION:  First licensed; registered or recognized by a State in current year or preceding prior year?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-01
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_FIRST_LIC_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FirstLicensedCYOrPYInd' ) )
if( length( SH_05_CHNA_FIRST_LIC_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_FIRST_LIC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_FIRST_LIC_X <-  paste0( '{', SH_05_CHNA_FIRST_LIC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_PCT_FPG_DCNT
## DESCRIPTION:  Percentage of FPG used to determine discount care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_PCT_FPG_DCNT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGFamilyIncmLmtDscntCarePct' ) )
if( length( SH_05_FAP_CRITERIA_PCT_FPG_DCNT ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_PCT_FPG_DCNT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_PCT_FPG_DCNT <-  paste0( '{', SH_05_FAP_CRITERIA_PCT_FPG_DCNT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_PCT_FPG_FREE
## DESCRIPTION:  Percentage of FPG used to determine free care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_PCT_FPG_FREE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGFamilyIncmLmtFreeCarePct' ) )
if( length( SH_05_FAP_CRITERIA_PCT_FPG_FREE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_PCT_FPG_FREE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_PCT_FPG_FREE <-  paste0( '{', SH_05_FAP_CRITERIA_PCT_FPG_FREE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_PCT_FPG_X
## DESCRIPTION:  Explained free care percent and discounted care percent
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_PCT_FPG_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGFamilyIncmLmtFreeDscntInd' ) )
if( length( SH_05_FAP_CRITERIA_PCT_FPG_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_PCT_FPG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_PCT_FPG_X <-  paste0( '{', SH_05_FAP_CRITERIA_PCT_FPG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_IMPLEMENT_ADOPT_X
## DESCRIPTION:  Adopt implementation strategy?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-08
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_IMPLEMENT_ADOPT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ImplementationStrategyAdoptInd' ) )
if( length( SH_05_CHNA_IMPLEMENT_ADOPT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_IMPLEMENT_ADOPT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_IMPLEMENT_ADOPT_X <-  paste0( '{', SH_05_CHNA_IMPLEMENT_ADOPT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_IMPLEMENT_ADOPT_YEAR
## DESCRIPTION:  Year last adopted implementation strategy
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-09
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_05_CHNA_IMPLEMENT_ADOPT_YEAR <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ImplementationStrategyAdptYr' ) )
if( length( SH_05_CHNA_IMPLEMENT_ADOPT_YEAR ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_IMPLEMENT_ADOPT_YEAR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_IMPLEMENT_ADOPT_YEAR <-  paste0( '{', SH_05_CHNA_IMPLEMENT_ADOPT_YEAR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_PUBLICITY_X
## DESCRIPTION:  Policy includes publicity measures?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_PUBLICITY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/IncludesPublicityMeasuresInd' ) )
if( length( SH_05_FAP_AVBL_PUBLICITY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_PUBLICITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_PUBLICITY_X <-  paste0( '{', SH_05_FAP_AVBL_PUBLICITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_INCOME_X
## DESCRIPTION:  Income level criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_INCOME_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/IncomeLevelCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_INCOME_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_INCOME_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_INCOME_X <-  paste0( '{', SH_05_FAP_CRITERIA_INCOME_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_INSURANCE_X
## DESCRIPTION:  Insurance status criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_INSURANCE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/InsuranceStatusCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_INSURANCE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_INSURANCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_INSURANCE_X <-  paste0( '{', SH_05_FAP_CRITERIA_INSURANCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_INDIGENCY_X
## DESCRIPTION:  Medical indigency criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_INDIGENCY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/MedicalIndigencyCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_INDIGENCY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_INDIGENCY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_INDIGENCY_X <-  paste0( '{', SH_05_FAP_CRITERIA_INDIGENCY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_MADE_NO_ACT_X
## DESCRIPTION:  None of these efforts were made
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-20F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_MADE_NO_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NoneMadeInd' ) )
if( length( SH_05_BILL_MADE_NO_ACT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_MADE_NO_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_MADE_NO_ACT_X <-  paste0( '{', SH_05_BILL_MADE_NO_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_MADE_OTH_ACT_X
## DESCRIPTION:  Other action taken
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-20E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_MADE_OTH_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherActionsTakenInd' ) )
if( length( SH_05_BILL_MADE_OTH_ACT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_MADE_OTH_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_MADE_OTH_ACT_X <-  paste0( '{', SH_05_BILL_MADE_OTH_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_OTH_X
## DESCRIPTION:  Other criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13H
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_OTH_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_OTH_X <-  paste0( '{', SH_05_FAP_CRITERIA_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_METHOD_OTH_X
## DESCRIPTION:  Other method used to explain.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherMethodInd' ) )
if( length( SH_05_FAP_METHOD_OTH_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_OTH_X <-  paste0( '{', SH_05_FAP_METHOD_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_AVBL_OTH_PUBLICITY_X
## DESCRIPTION:  Other publicity
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16I
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_OTH_PUBLICITY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherPublicityInd' ) )
if( length( SH_05_FAP_AVBL_OTH_PUBLICITY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_AVBL_OTH_PUBLICITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_AVBL_OTH_PUBLICITY_X <-  paste0( '{', SH_05_FAP_AVBL_OTH_PUBLICITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_OTH_WEBSITE_X
## DESCRIPTION:  Hospital Fclty Policies Prctc Grp - Other website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_OTH_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherWebsiteInd' ) )
if( length( SH_05_CHNA_AVBL_OTH_WEBSITE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_OTH_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_OTH_WEBSITE_X <-  paste0( '{', SH_05_CHNA_AVBL_OTH_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_OTH_WEBSITE
## DESCRIPTION:  Other website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_OTH_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherWebsiteURLTxt' ) )
if( length( SH_05_CHNA_AVBL_OTH_WEBSITE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_OTH_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_OTH_WEBSITE <-  paste0( '{', SH_05_CHNA_AVBL_OTH_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_WEBSITE
## DESCRIPTION:  Hospital facilities website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OwnWebsiteURLTxt' ) )
if( length( SH_05_CHNA_AVBL_WEBSITE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_WEBSITE <-  paste0( '{', SH_05_CHNA_AVBL_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_AVBL_PAPER_COPY_X
## DESCRIPTION:  Made paper copy  available for public inspection
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_PAPER_COPY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PaperCopyPublicInspectionInd' ) )
if( length( SH_05_CHNA_AVBL_PAPER_COPY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_AVBL_PAPER_COPY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_AVBL_PAPER_COPY_X <-  paste0( '{', SH_05_CHNA_AVBL_PAPER_COPY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_PERMIT_LEGAL_X
## DESCRIPTION:  Actions that required a legal or judicial process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_PERMIT_LEGAL_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitLegalJudicialProcessInd' ) )
if( length( SH_05_BILL_PERMIT_LEGAL_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_PERMIT_LEGAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_PERMIT_LEGAL_X <-  paste0( '{', SH_05_BILL_PERMIT_LEGAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_PERMIT_NO_ACT_X
## DESCRIPTION:  None of these actions or similar actions permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_PERMIT_NO_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitNoActionsInd' ) )
if( length( SH_05_BILL_PERMIT_NO_ACT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_PERMIT_NO_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_PERMIT_NO_ACT_X <-  paste0( '{', SH_05_BILL_PERMIT_NO_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_BILL_PERMIT_SELL_DEBT_X
## DESCRIPTION:  Selling debt permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_PERMIT_SELL_DEBT_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitSellingDebtInd' ) )
if( length( SH_05_BILL_PERMIT_SELL_DEBT_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_BILL_PERMIT_SELL_DEBT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_BILL_PERMIT_SELL_DEBT_X <-  paste0( '{', SH_05_BILL_PERMIT_SELL_DEBT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_METHOD_INFO_HOSPITAL_X
## DESCRIPTION:  Provided  contact information of hospital staff.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_INFO_HOSPITAL_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ProvidedHospitalContactInd' ) )
if( length( SH_05_FAP_METHOD_INFO_HOSPITAL_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_INFO_HOSPITAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_INFO_HOSPITAL_X <-  paste0( '{', SH_05_FAP_METHOD_INFO_HOSPITAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_METHOD_INFO_NPO_X
## DESCRIPTION:  Provided contact information of nonprofit organization.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_INFO_NPO_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ProvidedNonprofitContactInd' ) )
if( length( SH_05_FAP_METHOD_INFO_NPO_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_METHOD_INFO_NPO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_METHOD_INFO_NPO_X <-  paste0( '{', SH_05_FAP_METHOD_INFO_NPO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_RESIDENCY_X
## DESCRIPTION:  Residency criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13G
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_RESIDENCY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ResidencyCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_RESIDENCY_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_RESIDENCY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_RESIDENCY_X <-  paste0( '{', SH_05_FAP_CRITERIA_RESIDENCY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_STRATEGY_ATTACHED_X
## DESCRIPTION:  Implementation strategy attached to return?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-10B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_STRATEGY_ATTACHED_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StrategyAttachedInd' ) )
if( length( SH_05_CHNA_STRATEGY_ATTACHED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_STRATEGY_ATTACHED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_STRATEGY_ATTACHED_X <-  paste0( '{', SH_05_CHNA_STRATEGY_ATTACHED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_STRATEGY_WEBSITE_X
## DESCRIPTION:  Implementation strategy posted on website?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-10
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_STRATEGY_WEBSITE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StrategyPostedWebsiteInd' ) )
if( length( SH_05_CHNA_STRATEGY_WEBSITE_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_STRATEGY_WEBSITE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_STRATEGY_WEBSITE_X <-  paste0( '{', SH_05_CHNA_STRATEGY_WEBSITE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_STRATEGY_WEBSITE
## DESCRIPTION:  Implementation strategy website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-10A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_CHNA_STRATEGY_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StrategyWebsiteURLTxt' ) )
if( length( SH_05_CHNA_STRATEGY_WEBSITE ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_STRATEGY_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_STRATEGY_WEBSITE <-  paste0( '{', SH_05_CHNA_STRATEGY_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X
## DESCRIPTION:  Acquired or placed into service as tax-exempt hospital in current year or  preceding prior year?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-02
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/TaxExemptHospitalCYOrPYInd' ) )
if( length( SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X <-  paste0( '{', SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_05_FAP_CRITERIA_UNINSURED_X
## DESCRIPTION:  Underinsurance status criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_UNINSURED_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/UnderinsuranceStatCriteriaInd' ) )
if( length( SH_05_FAP_CRITERIA_UNINSURED_X ) > 1 )
{ 
  log_collapsed_record( varname=SH_05_FAP_CRITERIA_UNINSURED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_05_FAP_CRITERIA_UNINSURED_X <-  paste0( '{', SH_05_FAP_CRITERIA_UNINSURED_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SH_05_FAP_METHOD_WRITTEN_X,SH_05_NON_HOSPITAL_NUM,SH_05_HOSPITAL_NUM,SH_05_BILL_EXPLAIN_ACT_NOPAY_X,SH_05_CHARGE_MT_AMT_BILLED_X,SH_05_CHNA_CONDUCTED_X,SH_05_CHNA_AVBL_PUB_X,SH_05_BILL_3RD_PARTY_COLLEC_X,SH_05_CHNA_DESC_DEFINITION_COM_X,SH_05_CHNA_DESC_DEMOGRAPHICS_X,SH_05_CHNA_DESC_HEALTH_NEED_X,SH_05_CHNA_DESC_CONSULTING_X,SH_05_FAP_CRITERIA_EXPLAIN_X,SH_05_EMERGENCY_LIMIT_CARE_X,SH_05_CHNA_EXCISE_TAX_4959_AMT,SH_01_CHNA_DESC_RESOURCES_X,SH_05_FAP_METHOD_EXPLAIN_X,SH_05_FAP_BASIS_EXPLAIN_X,SH_05_CHNA_4959_FORM4720_FILED_X,SH_05_CHARGE_FAP_GRO_CHARGE_X,SH_05_HOSPITAL_FACILITY_NAME_L1,SH_05_HOSPITAL_FACILITY_NAME_L2,SH_05_HOSPITAL_FACILITY_LINE_NUM,SH_05_CHNA_DESC_DATA_OBTAINED_X,SH_05_CHNA_DESC_IDENTIFYING_X,SH_05_CHNA_DESC_INFO_GAP_X,SH_05_CHNA_YEAR_CONDUCTED,SH_05_EMERGENCY_NO_CARE_X,SH_05_EMERGENCY_NO_POLICY_X,SH_05_EMERGENCY_NODISCR_POLICY_X,SH_05_CHNA_EXCISE_TAX_4959_X,SH_05_CHNA_DESC_OTH_X,SH_05_BILL_3RD_PARTY_OTH_ACT_X,SH_05_CHNA_FACILITY_OTH_X,SH_05_CHNA_DESC_HEALTH_ISSUE_X,SH_05_CHNA_AVBL_OTH_METHOD_X,SH_05_EMERGENCY_OTH_REASON_X,SH_05_CHNA_AVBL_WEBSITE_X,SH_05_BILL_PERMIT_OTH_ACT_X,SH_05_BILL_PERMIT_AGENCY_X,SH_05_BILL_3RD_PARTY_AGENCY_X,SH_05_CHNA_TAKE_COM_ACC_X,SH_05_FAP_CRITERIA_ASSET_X,SH_05_CHNA_FACILITY_NON_X,SH_05_FAP_AVBL_COM_NOTIFIED_X,SH_05_FAP_METHOD_DESC_INFO_X,SH_05_FAP_METHOD_DESC_DOC_X,SH_05_BILL_3RD_PARTY_LEGAL_X,SH_05_BILL_3RD_PARTY_SELL_DEBT_X,SH_05_FAP_AVBL_FORM_WEBSITE_X,SH_05_FAP_AVBL_FORM_WEBSITE,SH_05_FAP_AVBL_FORM_REQUEST_X,SH_05_FAP_AVBL_WEBSITE_X,SH_05_FAP_AVBL_WEBSITE,SH_05_FAP_AVBL_REQUEST_X,SH_05_FAP_AVBL_SUMMARY_REQUEST_X,SH_05_FAP_AVBL_SUMMARY_WEBSITE_X,SH_05_FAP_AVBL_SUMMARY_WEBSITE,SH_05_CHNA_FIRST_LIC_X,SH_05_FAP_CRITERIA_PCT_FPG_DCNT,SH_05_FAP_CRITERIA_PCT_FPG_FREE,SH_05_FAP_CRITERIA_PCT_FPG_X,SH_05_CHNA_IMPLEMENT_ADOPT_X,SH_05_CHNA_IMPLEMENT_ADOPT_YEAR,SH_05_FAP_AVBL_PUBLICITY_X,SH_05_FAP_CRITERIA_INCOME_X,SH_05_FAP_CRITERIA_INSURANCE_X,SH_05_FAP_CRITERIA_INDIGENCY_X,SH_05_BILL_MADE_NO_ACT_X,SH_05_BILL_MADE_OTH_ACT_X,SH_05_FAP_CRITERIA_OTH_X,SH_05_FAP_METHOD_OTH_X,SH_05_FAP_AVBL_OTH_PUBLICITY_X,SH_05_CHNA_AVBL_OTH_WEBSITE_X,SH_05_CHNA_AVBL_OTH_WEBSITE,SH_05_CHNA_AVBL_WEBSITE,SH_05_CHNA_AVBL_PAPER_COPY_X,SH_05_BILL_PERMIT_LEGAL_X,SH_05_BILL_PERMIT_NO_ACT_X,SH_05_BILL_PERMIT_SELL_DEBT_X,SH_05_FAP_METHOD_INFO_HOSPITAL_X,SH_05_FAP_METHOD_INFO_NPO_X,SH_05_FAP_CRITERIA_RESIDENCY_X,SH_05_CHNA_STRATEGY_ATTACHED_X,SH_05_CHNA_STRATEGY_WEBSITE_X,SH_05_CHNA_STRATEGY_WEBSITE,SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X,SH_05_FAP_CRITERIA_UNINSURED_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


