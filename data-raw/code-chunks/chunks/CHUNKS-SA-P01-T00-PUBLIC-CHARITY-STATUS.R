#' @title 
#'   Build table SA-P01-T00-PUBLIC-CHARITY-STATUS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P01_T00_PUBLIC_CHARITY_STATUS <- function( doc, url )
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


## VARIABLE NAME:  SA_01_PCSTAT_CHURCH_X
## DESCRIPTION:  A church; convention of churches; or association of churches. Section 170(b)(1)(A)(i)
## LOCATION:  SCHED-A-PART-01-LINE-01
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Church170b1Ai'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/Church170b1Ai'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ChurchInd'
V_PCSTAT_CHURCH_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_CHURCH_X <- xml_text( xml_find_all( doc, V_PCSTAT_CHURCH_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SCHOOL_X
## DESCRIPTION:  A school. Section 170(b)(1)(A)(ii)
## LOCATION:  SCHED-A-PART-01-LINE-02
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/School170b1Aii'
V2 <- '//Return/ReturnData/IRS990ScheduleA/School170b1Aii'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SchoolInd'
V_PCSTAT_SCHOOL_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SCHOOL_X <- xml_text( xml_find_all( doc, V_PCSTAT_SCHOOL_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_X
## DESCRIPTION:  A hospital or a cooperative hospital service organization. Section 170(b)(1)(A)(iii)
## LOCATION:  SCHED-A-PART-01-LINE-03
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/Hospital170b1Aiii'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Hospital170b1Aiii'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalInd'
V_PCSTAT_HOSPITAL_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_HOSPITAL_X <- xml_text( xml_find_all( doc, V_PCSTAT_HOSPITAL_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_ADDR_CITY
## DESCRIPTION:  Address - Address - US
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Address/City'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/HospitalNameAndAddress/City'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/City'
V4 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/CityNm'
V_PCSTAT_HOSPITAL_ADDR_CITY <- paste( V1, V2, V3, V4 , sep='|' )
SA_01_PCSTAT_HOSPITAL_ADDR_CITY <- xml_text( xml_find_all( doc, V_PCSTAT_HOSPITAL_ADDR_CITY ) )




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_ADDR_CNTR
## DESCRIPTION:  Foreign address Country
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Country'
V2 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/CountryCd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Address/Country'
V_PCSTAT_HOSPITAL_ADDR_CNTR <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_HOSPITAL_ADDR_CNTR <- xml_text( xml_find_all( doc, V_PCSTAT_HOSPITAL_ADDR_CNTR ) )




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_ADDR_STATE
## DESCRIPTION:  Address - US state name
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Address/State'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/HospitalNameAndAddress/State'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/State'
V4 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/StateAbbreviationCd'
V_PCSTAT_HOSPITAL_ADDR_STATE <- paste( V1, V2, V3, V4 , sep='|' )
SA_01_PCSTAT_HOSPITAL_ADDR_STATE <- xml_text( xml_find_all( doc, V_PCSTAT_HOSPITAL_ADDR_STATE ) )




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_NAME_L1
## DESCRIPTION:  Name - BusinessNameLine1
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/HospitalNameAndAddress/Name/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Name/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/SupportedOrganizationName/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/SupportedOrganizationName/BusinessNameLine1Txt'
V_PCSTAT_HOSPITAL_NAME_L1 <- paste( V1, V2, V3, V4 , sep='|' )
SA_01_PCSTAT_HOSPITAL_NAME_L1 <- xml_text( xml_find_all( doc, V_PCSTAT_HOSPITAL_NAME_L1 ) )




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_NAME_L2
## DESCRIPTION:  Name - BusinessNameLine2
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/HospitalNameAndAddress/Name/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Name/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/SupportedOrganizationName/BusinessNameLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/SupportedOrganizationName/BusinessNameLine2Txt'
V_PCSTAT_HOSPITAL_NAME_L2 <- paste( V1, V2, V3, V4 , sep='|' )
SA_01_PCSTAT_HOSPITAL_NAME_L2 <- xml_text( xml_find_all( doc, V_PCSTAT_HOSPITAL_NAME_L2 ) )




## VARIABLE NAME:  SA_01_PCSTAT_MEDICAL_RSRCH_X
## DESCRIPTION:  A medical research organization operated in conjunction with a hospital. Section 170(b)(1)(A)(iii)
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/MedicalResearchOrganizationInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/MedicalResearchOrg170b1Aiii'
V3 <- '//Return/ReturnData/IRS990ScheduleA/MedicalResearchOrg170b1Aiii'
V_PCSTAT_MEDICAL_RSRCH_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_MEDICAL_RSRCH_X <- xml_text( xml_find_all( doc, V_PCSTAT_MEDICAL_RSRCH_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_COLLEGE_BEN_X
## DESCRIPTION:  An organization operated for the benefit of a college or university owned or operated by a governmental unit. Section 170(b)(1)(A)(iv).
## LOCATION:  SCHED-A-PART-01-LINE-05
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CollegeOrganizationInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/CollegeSupportOrg170b1Aiv'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/CollegeSupportOrg170b1Aiv'
V_PCSTAT_COLLEGE_BEN_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_COLLEGE_BEN_X <- xml_text( xml_find_all( doc, V_PCSTAT_COLLEGE_BEN_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_GOVT_X
## DESCRIPTION:  A Federal; state; or local government or governmental unit. Section 170(b)(1)(A)(v)
## LOCATION:  SCHED-A-PART-01-LINE-06
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovernmentalUnitInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/GovernmentalUnit170b1Av'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GovernmentalUnit170b1Av'
V_PCSTAT_GOVT_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_GOVT_X <- xml_text( xml_find_all( doc, V_PCSTAT_GOVT_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_GOVT_PUB_SUPPORT_X
## DESCRIPTION:  An organization that normally receives a substantial part of its support from a governmental unit or from the general public. 			Section 170(b)(1)(A)(vi)
## LOCATION:  SCHED-A-PART-01-LINE-07
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/PublicOrganization170Ind'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/PubliclySupportedOrg170b1Avi'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PubliclySupportedOrg170b1Avi'
V_PCSTAT_GOVT_PUB_SUPPORT_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_GOVT_PUB_SUPPORT_X <- xml_text( xml_find_all( doc, V_PCSTAT_GOVT_PUB_SUPPORT_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_COM_TRUST_X
## DESCRIPTION:  A community trust. Section 170(b)(1)(A)(vi)
## LOCATION:  SCHED-A-PART-01-LINE-08
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CommunityTrust170b1Avi'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/CommunityTrust170b1Avi'
V3 <- '//Return/ReturnData/IRS990ScheduleA/CommunityTrustInd'
V_PCSTAT_COM_TRUST_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_COM_TRUST_X <- xml_text( xml_find_all( doc, V_PCSTAT_COM_TRUST_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_PUB_SUPPORT_X
## DESCRIPTION:  Publicly supported organization 509(a)(2)
## LOCATION:  SCHED-A-PART-01-LINE-10
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/PubliclySupportedOrg509a2'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PubliclySupportedOrg509a2'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PubliclySupportedOrg509a2Ind'
V_PCSTAT_PUB_SUPPORT_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_PUB_SUPPORT_X <- xml_text( xml_find_all( doc, V_PCSTAT_PUB_SUPPORT_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_PUB_SAFETY_TEST_X
## DESCRIPTION:  An organization organized and operated to test for public safety. Section 509(a)(4)
## LOCATION:  SCHED-A-PART-01-LINE-11
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/TestingForPublicSafety509a4'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TestingForPublicSafety509a4'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TestPublicSafetyInd'
V_PCSTAT_PUB_SAFETY_TEST_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_PUB_SAFETY_TEST_X <- xml_text( xml_find_all( doc, V_PCSTAT_PUB_SAFETY_TEST_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_ORG_X
## DESCRIPTION:  Supporting organization 509(a)(3)
## LOCATION:  SCHED-A-PART-01-LINE-12
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrganization509a3'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrganization509a3'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrganization509a3Ind'
V_PCSTAT_SUPPORT_ORG_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_ORG_X <- xml_text( xml_find_all( doc, V_PCSTAT_SUPPORT_ORG_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T1_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 1
## LOCATION:  SCHED-A-PART-01-LINE-12A
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType1Ind'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type1'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type1'
V_PCSTAT_SUPPORT_T1_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_T1_X <- xml_text( xml_find_all( doc, V_PCSTAT_SUPPORT_T1_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T2_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 2
## LOCATION:  SCHED-A-PART-01-LINE-12B
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType2Ind'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type2'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type2'
V_PCSTAT_SUPPORT_T2_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_T2_X <- xml_text( xml_find_all( doc, V_PCSTAT_SUPPORT_T2_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T3_FUNC_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 3 functionally integrated
## LOCATION:  SCHED-A-PART-01-LINE-12C
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType3FuncIntInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type3FuncInt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type3FuncInt'
V_PCSTAT_SUPPORT_T3_FUNC_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_T3_FUNC_X <- xml_text( xml_find_all( doc, V_PCSTAT_SUPPORT_T3_FUNC_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 3 Non-functionally integrated
## LOCATION:  SCHED-A-PART-01-LINE-12D
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType3NonFuncInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type3NonFunc'
V_PCSTAT_SUPPORT_T3_NOFUNC_X <- paste( V1, V2 , sep='|' )
SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X <- xml_text( xml_find_all( doc, V_PCSTAT_SUPPORT_T3_NOFUNC_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_DETERMIN_IRS_X
## DESCRIPTION:  Does the organization have a written determination from the IRS that it is a Type I; Type II or Type III supporting organization?
## LOCATION:  SCHED-A-PART-01-LINE-12E
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/IRSWrittenDeterminationInd'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/WrittenIRSDetermination'
V3 <- '//Return/ReturnData/IRS990ScheduleA/WrittenIRSDetermination'
V_PCSTAT_DETERMIN_IRS_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_DETERMIN_IRS_X <- xml_text( xml_find_all( doc, V_PCSTAT_DETERMIN_IRS_X ) )




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_ORG_NUM
## DESCRIPTION:  Number of supported organizations
## LOCATION:  SCHED-A-PART-01-LINE-12F
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_01_PCSTAT_SUPPORT_ORG_NUM <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/SupportedOrganizationsCnt' ) )





var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SA_01_PCSTAT_CHURCH_X,SA_01_PCSTAT_SCHOOL_X,SA_01_PCSTAT_HOSPITAL_X,SA_01_PCSTAT_HOSPITAL_ADDR_CITY,SA_01_PCSTAT_HOSPITAL_ADDR_CNTR,SA_01_PCSTAT_HOSPITAL_ADDR_STATE,SA_01_PCSTAT_HOSPITAL_NAME_L1,SA_01_PCSTAT_HOSPITAL_NAME_L2,SA_01_PCSTAT_MEDICAL_RSRCH_X,SA_01_PCSTAT_COLLEGE_BEN_X,SA_01_PCSTAT_GOVT_X,SA_01_PCSTAT_GOVT_PUB_SUPPORT_X,SA_01_PCSTAT_COM_TRUST_X,SA_01_PCSTAT_PUB_SUPPORT_X,SA_01_PCSTAT_PUB_SAFETY_TEST_X,SA_01_PCSTAT_SUPPORT_ORG_X,SA_01_PCSTAT_SUPPORT_T1_X,SA_01_PCSTAT_SUPPORT_T2_X,SA_01_PCSTAT_SUPPORT_T3_FUNC_X,SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X,SA_01_PCSTAT_DETERMIN_IRS_X,SA_01_PCSTAT_SUPPORT_ORG_NUM)
df <- as.data.frame( var.list )


return( df )


}


