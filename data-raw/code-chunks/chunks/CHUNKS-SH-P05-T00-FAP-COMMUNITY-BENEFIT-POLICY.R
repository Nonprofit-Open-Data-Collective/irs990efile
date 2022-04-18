#' @title 
#'   Build table SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SH_P05_T00_FAP_COMMUNITY_BENEFIT_POLICY <- function( doc, url )
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


## VARIABLE NAME:  SH_05_HOSPITAL_NUM
## DESCRIPTION:  Hospital facility number
## LOCATION:  SCHED-H-PART-05-SECTION-A-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionA/FacilityNumber'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFacilitiesGrp/FacilityNum'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFacilitiesCnt'
V4 <- '//Return/ReturnData/IRS990ScheduleH/NumberOfHospitalFacilities'
V_HOSPITAL_NUM <- paste( V1, V2, V3, V4 , sep='|' )
SH_05_HOSPITAL_NUM <- xml_text( xml_find_all( doc, V_HOSPITAL_NUM ) )




## VARIABLE NAME:  SH_05_HOSPITAL_FACILITY_LINE_NUM
## DESCRIPTION:  Line number of hospital facility
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/HospitalFacilityNumber'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FacilityNum'
V_HOSPITAL_FACILITY_LINE_NUM <- paste( V1, V2 , sep='|' )
SH_05_HOSPITAL_FACILITY_LINE_NUM <- xml_text( xml_find_all( doc, V_HOSPITAL_FACILITY_LINE_NUM ) )




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
SH_05_HOSPITAL_FACILITY_NAME_L1 <- xml_text( xml_find_all( doc, V_HOSPITAL_FACILITY_NAME_L1 ) )




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
SH_05_HOSPITAL_FACILITY_NAME_L2 <- xml_text( xml_find_all( doc, V_HOSPITAL_FACILITY_NAME_L2 ) )




## VARIABLE NAME:  SH_05_CHNA_FIRST_LIC_X
## DESCRIPTION:  First licensed; registered or recognized by a State in current year or preceding prior year?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-01
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_FIRST_LIC_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FirstLicensedCYOrPYInd' ) )





## VARIABLE NAME:  SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X
## DESCRIPTION:  Acquired or placed into service as tax-exempt hospital in current year or  preceding prior year?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-02
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/TaxExemptHospitalCYOrPYInd' ) )





## VARIABLE NAME:  SH_05_CHNA_CONDUCTED_X
## DESCRIPTION:  Conduct community needs health assessments?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CHNAConducted'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedInd'
V_CHNA_CONDUCTED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_CONDUCTED_X <- xml_text( xml_find_all( doc, V_CHNA_CONDUCTED_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_DEFINITION_COM_X
## DESCRIPTION:  Definition of community served
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CommunityDefinition'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityDefinitionInd'
V_CHNA_DESC_DEFINITION_COM_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_DEFINITION_COM_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_DEFINITION_COM_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_DEMOGRAPHICS_X
## DESCRIPTION:  Demographics of community
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CommunityDemographics'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityDemographicsInd'
V_CHNA_DESC_DEMOGRAPHICS_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_DEMOGRAPHICS_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_DEMOGRAPHICS_X ) )




## VARIABLE NAME:  SH_01_CHNA_DESC_RESOURCES_X
## DESCRIPTION:  Existing health care facilities and resources
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExistingResources'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExistingResourcesInd'
V_CHNA_DESC_RESOURCES_X <- paste( V1, V2 , sep='|' )
SH_01_CHNA_DESC_RESOURCES_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_RESOURCES_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_DATA_OBTAINED_X
## DESCRIPTION:  How data obtained
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/HowDataObtained'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/HowDataObtainedInd'
V_CHNA_DESC_DATA_OBTAINED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_DATA_OBTAINED_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_DATA_OBTAINED_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_HEALTH_NEED_X
## DESCRIPTION:  Health needs of community
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CommunityHealthNeeds'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityHealthNeedsInd'
V_CHNA_DESC_HEALTH_NEED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_HEALTH_NEED_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_HEALTH_NEED_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_HEALTH_ISSUE_X
## DESCRIPTION:  Other health issues
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherHealthIssues'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherHealthIssuesInd'
V_CHNA_DESC_HEALTH_ISSUE_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_HEALTH_ISSUE_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_HEALTH_ISSUE_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_IDENTIFYING_X
## DESCRIPTION:  Identifying process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03G
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/IdentifyingProcess'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommunityHlthNeedsIdProcessInd'
V_CHNA_DESC_IDENTIFYING_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_IDENTIFYING_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_IDENTIFYING_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_CONSULTING_X
## DESCRIPTION:  Consulting process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03H
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ConsultingProcess'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ConsultingProcessInd'
V_CHNA_DESC_CONSULTING_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_CONSULTING_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_CONSULTING_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_INFO_GAP_X
## DESCRIPTION:  Information gaps
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03I
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/InformationGaps'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/InformationGapsInd'
V_CHNA_DESC_INFO_GAP_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_INFO_GAP_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_INFO_GAP_X ) )




## VARIABLE NAME:  SH_05_CHNA_DESC_OTH_X
## DESCRIPTION:  CHNA describes other
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-03J
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/Other'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherInd'
V_CHNA_DESC_OTH_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_DESC_OTH_X <- xml_text( xml_find_all( doc, V_CHNA_DESC_OTH_X ) )




## VARIABLE NAME:  SH_05_CHNA_YEAR_CONDUCTED
## DESCRIPTION:  Year last conducted CHNA
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-04
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NeedsAssessmentConducted'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedYr'
V_CHNA_YEAR_CONDUCTED <- paste( V1, V2 , sep='|' )
SH_05_CHNA_YEAR_CONDUCTED <- xml_text( xml_find_all( doc, V_CHNA_YEAR_CONDUCTED ) )




## VARIABLE NAME:  SH_05_CHNA_TAKE_COM_ACC_X
## DESCRIPTION:  Take community input into account
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-05
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/TakeIntoAccount'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/TakeIntoAccountOthersInputInd'
V_CHNA_TAKE_COM_ACC_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_TAKE_COM_ACC_X <- xml_text( xml_find_all( doc, V_CHNA_TAKE_COM_ACC_X ) )




## VARIABLE NAME:  SH_05_CHNA_FACILITY_OTH_X
## DESCRIPTION:  Other hospital facilities?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-06A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherFacilities'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedWithOtherFcltsInd'
V_CHNA_FACILITY_OTH_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_FACILITY_OTH_X <- xml_text( xml_find_all( doc, V_CHNA_FACILITY_OTH_X ) )




## VARIABLE NAME:  SH_05_CHNA_FACILITY_NON_X
## DESCRIPTION:  Other than hospital facilities?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-06B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_FACILITY_NON_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAConductedWithNonFcltsInd' ) )





## VARIABLE NAME:  SH_05_CHNA_AVBL_PUB_X
## DESCRIPTION:  CHNA widely available to public?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CHNAWidelyAvailable'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CHNAReportWidelyAvailableInd'
V_CHNA_AVBL_PUB_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_AVBL_PUB_X <- xml_text( xml_find_all( doc, V_CHNA_AVBL_PUB_X ) )




## VARIABLE NAME:  SH_05_CHNA_AVBL_WEBSITE
## DESCRIPTION:  Hospital facilities website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_WEBSITE <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OwnWebsiteURLTxt' ) )





## VARIABLE NAME:  SH_05_CHNA_AVBL_WEBSITE_X
## DESCRIPTION:  Available on own website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OwnWebsite'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/RptAvailableOnOwnWebsiteInd'
V_CHNA_AVBL_WEBSITE_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_AVBL_WEBSITE_X <- xml_text( xml_find_all( doc, V_CHNA_AVBL_WEBSITE_X ) )




## VARIABLE NAME:  SH_05_CHNA_AVBL_OTH_WEBSITE
## DESCRIPTION:  Other website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_OTH_WEBSITE <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherWebsiteURLTxt' ) )





## VARIABLE NAME:  SH_05_CHNA_AVBL_OTH_WEBSITE_X
## DESCRIPTION:  Hospital Fclty Policies Prctc Grp - Other website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_OTH_WEBSITE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherWebsiteInd' ) )





## VARIABLE NAME:  SH_05_CHNA_AVBL_PAPER_COPY_X
## DESCRIPTION:  Made paper copy  available for public inspection
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_AVBL_PAPER_COPY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PaperCopyPublicInspectionInd' ) )





## VARIABLE NAME:  SH_05_CHNA_AVBL_OTH_METHOD_X
## DESCRIPTION:  Available other method
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-07D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherMethod'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/RptAvailableThruOtherMethodInd'
V_CHNA_AVBL_OTH_METHOD_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_AVBL_OTH_METHOD_X <- xml_text( xml_find_all( doc, V_CHNA_AVBL_OTH_METHOD_X ) )




## VARIABLE NAME:  SH_05_CHNA_IMPLEMENT_ADOPT_X
## DESCRIPTION:  Adopt implementation strategy?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-08
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_IMPLEMENT_ADOPT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ImplementationStrategyAdoptInd' ) )





## VARIABLE NAME:  SH_05_CHNA_IMPLEMENT_ADOPT_YEAR
## DESCRIPTION:  Year last adopted implementation strategy
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-09
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_05_CHNA_IMPLEMENT_ADOPT_YEAR <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ImplementationStrategyAdptYr' ) )





## VARIABLE NAME:  SH_05_CHNA_STRATEGY_WEBSITE_X
## DESCRIPTION:  Implementation strategy posted on website?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-10
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_STRATEGY_WEBSITE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StrategyPostedWebsiteInd' ) )





## VARIABLE NAME:  SH_05_CHNA_STRATEGY_WEBSITE
## DESCRIPTION:  Implementation strategy website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-10A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_CHNA_STRATEGY_WEBSITE <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StrategyWebsiteURLTxt' ) )





## VARIABLE NAME:  SH_05_CHNA_STRATEGY_ATTACHED_X
## DESCRIPTION:  Implementation strategy attached to return?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-10B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_CHNA_STRATEGY_ATTACHED_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/StrategyAttachedInd' ) )





## VARIABLE NAME:  SH_05_CHNA_EXCISE_TAX_4959_X
## DESCRIPTION:  Form990 Schedule HPart VSection B - OrganizationIncurExciseTax
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-12A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OrganizationIncurExciseTax'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OrganizationIncurExciseTaxInd'
V_CHNA_EXCISE_TAX_4959_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_EXCISE_TAX_4959_X <- xml_text( xml_find_all( doc, V_CHNA_EXCISE_TAX_4959_X ) )




## VARIABLE NAME:  SH_05_CHNA_4959_FORM4720_FILED_X
## DESCRIPTION:  File Form 4720 to report the section 4959 excise tax?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-12B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/Form4720FiledInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/FileForm4720ReportExciseTax'
V_CHNA_4959_FORM4720_FILED_X <- paste( V1, V2 , sep='|' )
SH_05_CHNA_4959_FORM4720_FILED_X <- xml_text( xml_find_all( doc, V_CHNA_4959_FORM4720_FILED_X ) )




## VARIABLE NAME:  SH_05_CHNA_EXCISE_TAX_4959_AMT
## DESCRIPTION:  Form990 Schedule HPart VSection B - ExciseReportForm4720ForAllAmt
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-12C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExciseReportForm4720ForAllAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExciseReportForm4720ForAllAmt'
V_CHNA_EXCISE_TAX_4959_AMT <- paste( V1, V2 , sep='|' )
SH_05_CHNA_EXCISE_TAX_4959_AMT <- xml_text( xml_find_all( doc, V_CHNA_EXCISE_TAX_4959_AMT ) )




## VARIABLE NAME:  SH_05_FAP_CRITERIA_EXPLAIN_X
## DESCRIPTION:  Policy explains eligibility criteria for financial assistance?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EligCriteriaExplainedInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/EligibilityCriteriaExplained'
V_FAP_CRITERIA_EXPLAIN_X <- paste( V1, V2 , sep='|' )
SH_05_FAP_CRITERIA_EXPLAIN_X <- xml_text( xml_find_all( doc, V_FAP_CRITERIA_EXPLAIN_X ) )




## VARIABLE NAME:  SH_05_FAP_CRITERIA_PCT_FPG_DCNT
## DESCRIPTION:  Percentage of FPG used to determine discount care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_PCT_FPG_DCNT <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGFamilyIncmLmtDscntCarePct' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_PCT_FPG_FREE
## DESCRIPTION:  Percentage of FPG used to determine free care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_PCT_FPG_FREE <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGFamilyIncmLmtFreeCarePct' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_PCT_FPG_X
## DESCRIPTION:  Explained free care percent and discounted care percent
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_PCT_FPG_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FPGFamilyIncmLmtFreeDscntInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_INCOME_X
## DESCRIPTION:  Income level criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_INCOME_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/IncomeLevelCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_ASSET_X
## DESCRIPTION:  Asset level criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_ASSET_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AssetLevelCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_INDIGENCY_X
## DESCRIPTION:  Medical indigency criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_INDIGENCY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/MedicalIndigencyCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_INSURANCE_X
## DESCRIPTION:  Insurance status criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_INSURANCE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/InsuranceStatusCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_UNINSURED_X
## DESCRIPTION:  Underinsurance status criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_UNINSURED_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/UnderinsuranceStatCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_RESIDENCY_X
## DESCRIPTION:  Residency criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13G
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_RESIDENCY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ResidencyCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_CRITERIA_OTH_X
## DESCRIPTION:  Other criteria
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-13H
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_CRITERIA_OTH_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherCriteriaInd' ) )





## VARIABLE NAME:  SH_05_FAP_BASIS_EXPLAIN_X
## DESCRIPTION:  Policy explains basis for calculating amounts?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-14
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExplainsBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ExplainedBasisInd'
V_FAP_BASIS_EXPLAIN_X <- paste( V1, V2 , sep='|' )
SH_05_FAP_BASIS_EXPLAIN_X <- xml_text( xml_find_all( doc, V_FAP_BASIS_EXPLAIN_X ) )




## VARIABLE NAME:  SH_05_FAP_METHOD_EXPLAIN_X
## DESCRIPTION:  Policy explains method for applying for assistance?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ExplainsApplicationMethod'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AppFinancialAsstExplnInd'
V_FAP_METHOD_EXPLAIN_X <- paste( V1, V2 , sep='|' )
SH_05_FAP_METHOD_EXPLAIN_X <- xml_text( xml_find_all( doc, V_FAP_METHOD_EXPLAIN_X ) )




## VARIABLE NAME:  SH_05_FAP_METHOD_DESC_INFO_X
## DESCRIPTION:  Described information as part of application.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_DESC_INFO_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/DescribedInfoInd' ) )





## VARIABLE NAME:  SH_05_FAP_METHOD_DESC_DOC_X
## DESCRIPTION:  Described supporting documentation as part of application.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_DESC_DOC_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/DescribedSuprtDocInd' ) )





## VARIABLE NAME:  SH_05_FAP_METHOD_INFO_HOSPITAL_X
## DESCRIPTION:  Provided  contact information of hospital staff.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_INFO_HOSPITAL_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ProvidedHospitalContactInd' ) )





## VARIABLE NAME:  SH_05_FAP_METHOD_INFO_NPO_X
## DESCRIPTION:  Provided contact information of nonprofit organization.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_INFO_NPO_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ProvidedNonprofitContactInd' ) )





## VARIABLE NAME:  SH_05_FAP_METHOD_OTH_X
## DESCRIPTION:  Other method used to explain.
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-15E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_METHOD_OTH_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherMethodInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_PUBLICITY_X
## DESCRIPTION:  Policy includes publicity measures?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_PUBLICITY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/IncludesPublicityMeasuresInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_WEBSITE 
## DESCRIPTION:  FAP website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_WEBSITE  <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAvailableOnWebsiteURLTxt' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_WEBSITE_X
## DESCRIPTION:  FAP widely available on a website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_WEBSITE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAvailableOnWebsiteInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_FORM_WEBSITE
## DESCRIPTION:  FAP application form website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_FORM_WEBSITE <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAppAvailableOnWebsiteURLTxt' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_FORM_WEBSITE_X
## DESCRIPTION:  FAP application form widely available on a website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_FORM_WEBSITE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAppAvailableOnWebsiteInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_SUMMARY_WEBSITE
## DESCRIPTION:  FAP plain language summary website URL
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_SUMMARY_WEBSITE <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPSummaryOnWebsiteURLTxt' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_SUMMARY_WEBSITE_X
## DESCRIPTION:  FAP plain language summary on a website
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_SUMMARY_WEBSITE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPSummaryOnWebsiteInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_REQUEST_X
## DESCRIPTION:  FAP available upon request and without charge
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_REQUEST_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAvlblOnRequestNoChargeInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_FORM_REQUEST_X
## DESCRIPTION:  FAP application form available upon request and without charge
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_FORM_REQUEST_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPAppAvlblOnRequestNoChrgInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_SUMMARY_REQUEST_X
## DESCRIPTION:  FAP plain language summary available upon request and without charge
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_SUMMARY_REQUEST_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPSumAvlblOnRequestNoChrgInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_COM_NOTIFIED_X
## DESCRIPTION:  Notified community about availability of FAP
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16H
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_COM_NOTIFIED_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CommuntityNotifiedFAPInd' ) )





## VARIABLE NAME:  SH_05_FAP_AVBL_OTH_PUBLICITY_X
## DESCRIPTION:  Other publicity
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-16I
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_FAP_AVBL_OTH_PUBLICITY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherPublicityInd' ) )





## VARIABLE NAME:  SH_05_BILL_EXPLAIN_ACT_NOPAY_X
## DESCRIPTION:  Policy explains actions taken upon non-payment?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-17
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ActionsOnNonpayment'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/FAPActionsOnNonpaymentInd'
V_BILL_EXPLAIN_ACT_NOPAY_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_EXPLAIN_ACT_NOPAY_X <- xml_text( xml_find_all( doc, V_BILL_EXPLAIN_ACT_NOPAY_X ) )




## VARIABLE NAME:  SH_05_BILL_PERMIT_AGENCY_X
## DESCRIPTION:  Report to credit agency permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitReportToCreditAgency'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitReportToCreditAgencyInd'
V_BILL_PERMIT_AGENCY_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_PERMIT_AGENCY_X <- xml_text( xml_find_all( doc, V_BILL_PERMIT_AGENCY_X ) )




## VARIABLE NAME:  SH_05_BILL_PERMIT_SELL_DEBT_X
## DESCRIPTION:  Selling debt permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_PERMIT_SELL_DEBT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitSellingDebtInd' ) )





## VARIABLE NAME:  SH_05_BILL_PERMIT_LEGAL_X
## DESCRIPTION:  Actions that required a legal or judicial process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_PERMIT_LEGAL_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitLegalJudicialProcessInd' ) )





## VARIABLE NAME:  SH_05_BILL_PERMIT_OTH_ACT_X
## DESCRIPTION:  Other actions permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/PermitOtherActions'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitOtherActionsInd'
V_BILL_PERMIT_OTH_ACT_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_PERMIT_OTH_ACT_X <- xml_text( xml_find_all( doc, V_BILL_PERMIT_OTH_ACT_X ) )




## VARIABLE NAME:  SH_05_BILL_PERMIT_NO_ACT_X
## DESCRIPTION:  None of these actions or similar actions permitted
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-18F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_PERMIT_NO_ACT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/PermitNoActionsInd' ) )





## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_COLLEC_X
## DESCRIPTION:  Authorize third-party to engage in collection activities?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/CollectionActivities'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/CollectionActivitiesInd'
V_BILL_3RD_PARTY_COLLEC_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_3RD_PARTY_COLLEC_X <- xml_text( xml_find_all( doc, V_BILL_3RD_PARTY_COLLEC_X ) )




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_AGENCY_X
## DESCRIPTION:  Credit agency engaged
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/ReportToCreditAgency'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/ReportingToCreditAgencyInd'
V_BILL_3RD_PARTY_AGENCY_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_3RD_PARTY_AGENCY_X <- xml_text( xml_find_all( doc, V_BILL_3RD_PARTY_AGENCY_X ) )




## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_SELL_DEBT_X
## DESCRIPTION:  Selling debt engaged
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_3RD_PARTY_SELL_DEBT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EngagedSellingDebtInd' ) )





## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_LEGAL_X
## DESCRIPTION:  Engaged actions that required a legal or judicial process
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_3RD_PARTY_LEGAL_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EngagedLegalJudicialProcessInd' ) )





## VARIABLE NAME:  SH_05_BILL_3RD_PARTY_OTH_ACT_X
## DESCRIPTION:  Other actions engaged
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-19E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherActions'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherActionsInd'
V_BILL_3RD_PARTY_OTH_ACT_X <- paste( V1, V2 , sep='|' )
SH_05_BILL_3RD_PARTY_OTH_ACT_X <- xml_text( xml_find_all( doc, V_BILL_3RD_PARTY_OTH_ACT_X ) )




## VARIABLE NAME:  SH_05_BILL_MADE_OTH_ACT_X
## DESCRIPTION:  Other action taken
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-20E
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_MADE_OTH_ACT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherActionsTakenInd' ) )





## VARIABLE NAME:  SH_05_BILL_MADE_NO_ACT_X
## DESCRIPTION:  None of these efforts were made
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-20F
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SH_05_BILL_MADE_NO_ACT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NoneMadeInd' ) )





## VARIABLE NAME:  SH_05_EMERGENCY_NODISCR_POLICY_X
## DESCRIPTION:  Non-discriminatory emergency medical care policy?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NondiscrimEmergencyCarePolicy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NondisEmergencyCarePolicyInd'
V_EMERGENCY_NODISCR_POLICY_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_NODISCR_POLICY_X <- xml_text( xml_find_all( doc, V_EMERGENCY_NODISCR_POLICY_X ) )




## VARIABLE NAME:  SH_05_EMERGENCY_NO_CARE_X
## DESCRIPTION:  No emergency care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21A
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NoEmergencyCare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NoEmergencyCareInd'
V_EMERGENCY_NO_CARE_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_NO_CARE_X <- xml_text( xml_find_all( doc, V_EMERGENCY_NO_CARE_X ) )




## VARIABLE NAME:  SH_05_EMERGENCY_NO_POLICY_X
## DESCRIPTION:  No emergency policy
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21B
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/NoEmergencyPolicy'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/NoEmergencyCarePolicyInd'
V_EMERGENCY_NO_POLICY_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_NO_POLICY_X <- xml_text( xml_find_all( doc, V_EMERGENCY_NO_POLICY_X ) )




## VARIABLE NAME:  SH_05_EMERGENCY_LIMIT_CARE_X
## DESCRIPTION:  Limits emergency care
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21C
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/EmergencyCareLimited'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/EmergencyCareLimitedInd'
V_EMERGENCY_LIMIT_CARE_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_LIMIT_CARE_X <- xml_text( xml_find_all( doc, V_EMERGENCY_LIMIT_CARE_X ) )




## VARIABLE NAME:  SH_05_EMERGENCY_OTH_REASON_X
## DESCRIPTION:  Form990 Schedule HPart VSection B - Other reason
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-21D
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/OtherReason'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/OtherReasonInd'
V_EMERGENCY_OTH_REASON_X <- paste( V1, V2 , sep='|' )
SH_05_EMERGENCY_OTH_REASON_X <- xml_text( xml_find_all( doc, V_EMERGENCY_OTH_REASON_X ) )




## VARIABLE NAME:  SH_05_CHARGE_MT_AMT_BILLED_X
## DESCRIPTION:  Charged more than amount generally billed?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-23
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/AmountsGenerallyBilled'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/AmountsGenerallyBilledInd'
V_CHARGE_MT_AMT_BILLED_X <- paste( V1, V2 , sep='|' )
SH_05_CHARGE_MT_AMT_BILLED_X <- xml_text( xml_find_all( doc, V_CHARGE_MT_AMT_BILLED_X ) )




## VARIABLE NAME:  SH_05_CHARGE_FAP_GRO_CHARGE_X
## DESCRIPTION:  Gross charges in billing?
## LOCATION:  SCHED-H-PART-05-SECTION-B-LINE-24
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionB/GrossCharges'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HospitalFcltyPoliciesPrctcGrp/GrossChargesInd'
V_CHARGE_FAP_GRO_CHARGE_X <- paste( V1, V2 , sep='|' )
SH_05_CHARGE_FAP_GRO_CHARGE_X <- xml_text( xml_find_all( doc, V_CHARGE_FAP_GRO_CHARGE_X ) )




## VARIABLE NAME:  SH_05_NON_HOSPITAL_NUM
## DESCRIPTION:  Number of other facilities
## LOCATION:  SCHED-H-PART-05-SECTION-D-LINE-00
## TABLE:  SH-P05-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartVSectionC/NumberOfOtherFacilities'
V2 <- '//Return/ReturnData/IRS990ScheduleH/FacilityNum'
V3 <- '//Return/ReturnData/IRS990ScheduleH/OthHlthCareFcltsNotHospitalGrp/FacilityNum'
V_NON_HOSPITAL_NUM <- paste( V1, V2, V3 , sep='|' )
SH_05_NON_HOSPITAL_NUM <- xml_text( xml_find_all( doc, V_NON_HOSPITAL_NUM ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SH_05_HOSPITAL_NUM,SH_05_HOSPITAL_FACILITY_LINE_NUM,SH_05_HOSPITAL_FACILITY_NAME_L1,SH_05_HOSPITAL_FACILITY_NAME_L2,SH_05_CHNA_FIRST_LIC_X,SH_05_CHNA_TAX_EXEMPT_HOSPITAL_X,SH_05_CHNA_CONDUCTED_X,SH_05_CHNA_DESC_DEFINITION_COM_X,SH_05_CHNA_DESC_DEMOGRAPHICS_X,SH_01_CHNA_DESC_RESOURCES_X,SH_05_CHNA_DESC_DATA_OBTAINED_X,SH_05_CHNA_DESC_HEALTH_NEED_X,SH_05_CHNA_DESC_HEALTH_ISSUE_X,SH_05_CHNA_DESC_IDENTIFYING_X,SH_05_CHNA_DESC_CONSULTING_X,SH_05_CHNA_DESC_INFO_GAP_X,SH_05_CHNA_DESC_OTH_X,SH_05_CHNA_YEAR_CONDUCTED,SH_05_CHNA_TAKE_COM_ACC_X,SH_05_CHNA_FACILITY_OTH_X,SH_05_CHNA_FACILITY_NON_X,SH_05_CHNA_AVBL_PUB_X,SH_05_CHNA_AVBL_WEBSITE,SH_05_CHNA_AVBL_WEBSITE_X,SH_05_CHNA_AVBL_OTH_WEBSITE,SH_05_CHNA_AVBL_OTH_WEBSITE_X,SH_05_CHNA_AVBL_PAPER_COPY_X,SH_05_CHNA_AVBL_OTH_METHOD_X,SH_05_CHNA_IMPLEMENT_ADOPT_X,SH_05_CHNA_IMPLEMENT_ADOPT_YEAR,SH_05_CHNA_STRATEGY_WEBSITE_X,SH_05_CHNA_STRATEGY_WEBSITE,SH_05_CHNA_STRATEGY_ATTACHED_X,SH_05_CHNA_EXCISE_TAX_4959_X,SH_05_CHNA_4959_FORM4720_FILED_X,SH_05_CHNA_EXCISE_TAX_4959_AMT,SH_05_FAP_CRITERIA_EXPLAIN_X,SH_05_FAP_CRITERIA_PCT_FPG_DCNT,SH_05_FAP_CRITERIA_PCT_FPG_FREE,SH_05_FAP_CRITERIA_PCT_FPG_X,SH_05_FAP_CRITERIA_INCOME_X,SH_05_FAP_CRITERIA_ASSET_X,SH_05_FAP_CRITERIA_INDIGENCY_X,SH_05_FAP_CRITERIA_INSURANCE_X,SH_05_FAP_CRITERIA_UNINSURED_X,SH_05_FAP_CRITERIA_RESIDENCY_X,SH_05_FAP_CRITERIA_OTH_X,SH_05_FAP_BASIS_EXPLAIN_X,SH_05_FAP_METHOD_EXPLAIN_X,SH_05_FAP_METHOD_DESC_INFO_X,SH_05_FAP_METHOD_DESC_DOC_X,SH_05_FAP_METHOD_INFO_HOSPITAL_X,SH_05_FAP_METHOD_INFO_NPO_X,SH_05_FAP_METHOD_OTH_X,SH_05_FAP_AVBL_PUBLICITY_X,SH_05_FAP_AVBL_WEBSITE ,SH_05_FAP_AVBL_WEBSITE_X,SH_05_FAP_AVBL_FORM_WEBSITE,SH_05_FAP_AVBL_FORM_WEBSITE_X,SH_05_FAP_AVBL_SUMMARY_WEBSITE,SH_05_FAP_AVBL_SUMMARY_WEBSITE_X,SH_05_FAP_AVBL_REQUEST_X,SH_05_FAP_AVBL_FORM_REQUEST_X,SH_05_FAP_AVBL_SUMMARY_REQUEST_X,SH_05_FAP_AVBL_COM_NOTIFIED_X,SH_05_FAP_AVBL_OTH_PUBLICITY_X,SH_05_BILL_EXPLAIN_ACT_NOPAY_X,SH_05_BILL_PERMIT_AGENCY_X,SH_05_BILL_PERMIT_SELL_DEBT_X,SH_05_BILL_PERMIT_LEGAL_X,SH_05_BILL_PERMIT_OTH_ACT_X,SH_05_BILL_PERMIT_NO_ACT_X,SH_05_BILL_3RD_PARTY_COLLEC_X,SH_05_BILL_3RD_PARTY_AGENCY_X,SH_05_BILL_3RD_PARTY_SELL_DEBT_X,SH_05_BILL_3RD_PARTY_LEGAL_X,SH_05_BILL_3RD_PARTY_OTH_ACT_X,SH_05_BILL_MADE_OTH_ACT_X,SH_05_BILL_MADE_NO_ACT_X,SH_05_EMERGENCY_NODISCR_POLICY_X,SH_05_EMERGENCY_NO_CARE_X,SH_05_EMERGENCY_NO_POLICY_X,SH_05_EMERGENCY_LIMIT_CARE_X,SH_05_EMERGENCY_OTH_REASON_X,SH_05_CHARGE_MT_AMT_BILLED_X,SH_05_CHARGE_FAP_GRO_CHARGE_X,SH_05_NON_HOSPITAL_NUM)
df <- as.data.frame( var.list )


return( df )


}


