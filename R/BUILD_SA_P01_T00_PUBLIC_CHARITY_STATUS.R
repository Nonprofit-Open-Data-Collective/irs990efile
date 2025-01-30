#' @title 
#'   Build table SA-P01-T00-PUBLIC-CHARITY-STATUS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P01_T00_PUBLIC_CHARITY_STATUS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_ORG_NUM
## DESCRIPTION:  Number of supported organizations
## LOCATION:  SCHED-A-PART-01-LINE-12F
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportedOrganizationsTotalCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalNumberOfSupportedOrgs'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportedOrganizationsCnt'
V_PCSTAT_SUPPORT_ORG_NUM <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_ORG_NUM <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_ORG_NUM ) )
if( length( SA_01_PCSTAT_SUPPORT_ORG_NUM ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_ORG_NUM, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_ORG_NUM <-  paste0( '{', SA_01_PCSTAT_SUPPORT_ORG_NUM, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_CERTIFICATION_X
## DESCRIPTION:  By checking this box; I certify that the organization is not controlled directly or indirectly by one or more disqualified persons other than foundation managers and other than one or more publicly supported organizations described in section 509(a)(1) or section 509(a)(2) (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-01-LINE-11E
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CertificationCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleA/CertificationInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/CertificationCheckbox'
V_PCSTAT_CERTIFICATION_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_CERTIFICATION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CERTIFICATION_X ) )
if( length( SA_01_PCSTAT_CERTIFICATION_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_CERTIFICATION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_CERTIFICATION_X <-  paste0( '{', SA_01_PCSTAT_CERTIFICATION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_CHURCH_X
## DESCRIPTION:  A church; convention of churches; or association of churches. Section 170(b)(1)(A)(i)
## LOCATION:  SCHED-A-PART-01-LINE-01
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Church170b1Ai'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ChurchInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/Church170b1Ai'
V_PCSTAT_CHURCH_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_CHURCH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CHURCH_X ) )
if( length( SA_01_PCSTAT_CHURCH_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_CHURCH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_CHURCH_X <-  paste0( '{', SA_01_PCSTAT_CHURCH_X, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_COLLEGE_BEN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_COLLEGE_BEN_X ) )
if( length( SA_01_PCSTAT_COLLEGE_BEN_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_COLLEGE_BEN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_COLLEGE_BEN_X <-  paste0( '{', SA_01_PCSTAT_COLLEGE_BEN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_COM_TRUST_X
## DESCRIPTION:  A community trust. Section 170(b)(1)(A)(vi)
## LOCATION:  SCHED-A-PART-01-LINE-08
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CommunityTrust170b1Avi'
V2 <- '//Return/ReturnData/IRS990ScheduleA/CommunityTrustInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/CommunityTrust170b1Avi'
V_PCSTAT_COM_TRUST_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_COM_TRUST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_COM_TRUST_X ) )
if( length( SA_01_PCSTAT_COM_TRUST_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_COM_TRUST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_COM_TRUST_X <-  paste0( '{', SA_01_PCSTAT_COM_TRUST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_CONTR_35PCT_CE_X
## DESCRIPTION:  A 35% controlled entity of a person described in (i) or (ii) above? Y or N (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-01-LINE-11G-iii
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/ContribBy35ControlledEntity'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Contribution35ControlledInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/ContribBy35ControlledEntity'
V_PCSTAT_CONTR_35PCT_CE_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_CONTR_35PCT_CE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CONTR_35PCT_CE_X ) )
if( length( SA_01_PCSTAT_CONTR_35PCT_CE_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_CONTR_35PCT_CE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_CONTR_35PCT_CE_X <-  paste0( '{', SA_01_PCSTAT_CONTR_35PCT_CE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_CONTR_PERS_X
## DESCRIPTION:  A person who controls; alone or together with persons in (ii) and (iii) below; the governing body of the supported organization? Y or N (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-01-LINE-11G-i
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/ContribByControllingIndividual'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ContributionControllerInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/ContribByControllingIndividual'
V_PCSTAT_CONTR_PERS_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_CONTR_PERS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CONTR_PERS_X ) )
if( length( SA_01_PCSTAT_CONTR_PERS_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_CONTR_PERS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_CONTR_PERS_X <-  paste0( '{', SA_01_PCSTAT_CONTR_PERS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_CONTR_FAM_PARTY_X
## DESCRIPTION:  A family member of a party described in (i) above? Y or N (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-01-LINE-11G-ii
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/ContributionByRelatedParty'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ContributionFamilyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/ContributionByRelatedParty'
V_PCSTAT_CONTR_FAM_PARTY_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_CONTR_FAM_PARTY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CONTR_FAM_PARTY_X ) )
if( length( SA_01_PCSTAT_CONTR_FAM_PARTY_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_CONTR_FAM_PARTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_CONTR_FAM_PARTY_X <-  paste0( '{', SA_01_PCSTAT_CONTR_FAM_PARTY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_GOVT_X
## DESCRIPTION:  A Federal; state; or local government or governmental unit. Section 170(b)(1)(A)(v)
## LOCATION:  SCHED-A-PART-01-LINE-06
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/GovernmentalUnit170b1Av'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovernmentalUnit170b1Av'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GovernmentalUnitInd'
V_PCSTAT_GOVT_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_GOVT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_GOVT_X ) )
if( length( SA_01_PCSTAT_GOVT_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_GOVT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_GOVT_X <-  paste0( '{', SA_01_PCSTAT_GOVT_X, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_HOSPITAL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_HOSPITAL_X ) )
if( length( SA_01_PCSTAT_HOSPITAL_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_HOSPITAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_HOSPITAL_X <-  paste0( '{', SA_01_PCSTAT_HOSPITAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_ADDR_CITY
## DESCRIPTION:  US address or foreign address
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/HospitalNameAndAddress/City'
V2 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Address/City'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/City'
V4 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/CityNm'
V_PCSTAT_HOSPITAL_ADDR_CITY <- paste( V1, V2, V3, V4 , sep='|' )
SA_01_PCSTAT_HOSPITAL_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_HOSPITAL_ADDR_CITY ) )
if( length( SA_01_PCSTAT_HOSPITAL_ADDR_CITY ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_HOSPITAL_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_HOSPITAL_ADDR_CITY <-  paste0( '{', SA_01_PCSTAT_HOSPITAL_ADDR_CITY, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_HOSPITAL_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_HOSPITAL_NAME_L1 ) )
if( length( SA_01_PCSTAT_HOSPITAL_NAME_L1 ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_HOSPITAL_NAME_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_HOSPITAL_NAME_L1 <-  paste0( '{', SA_01_PCSTAT_HOSPITAL_NAME_L1, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_HOSPITAL_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_HOSPITAL_NAME_L2 ) )
if( length( SA_01_PCSTAT_HOSPITAL_NAME_L2 ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_HOSPITAL_NAME_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_HOSPITAL_NAME_L2 <-  paste0( '{', SA_01_PCSTAT_HOSPITAL_NAME_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_ADDR_STATE
## DESCRIPTION:  US address or foreign address
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/HospitalNameAndAddress/State'
V2 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Address/State'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/State'
V4 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/StateAbbreviationCd'
V_PCSTAT_HOSPITAL_ADDR_STATE <- paste( V1, V2, V3, V4 , sep='|' )
SA_01_PCSTAT_HOSPITAL_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_HOSPITAL_ADDR_STATE ) )
if( length( SA_01_PCSTAT_HOSPITAL_ADDR_STATE ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_HOSPITAL_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_HOSPITAL_ADDR_STATE <-  paste0( '{', SA_01_PCSTAT_HOSPITAL_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_MEDICAL_RSRCH_X
## DESCRIPTION:  A medical research organization operated in conjunction with a hospital. Section 170(b)(1)(A)(iii)
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/MedicalResearchOrg170b1Aiii'
V2 <- '//Return/ReturnData/IRS990ScheduleA/MedicalResearchOrg170b1Aiii'
V3 <- '//Return/ReturnData/IRS990ScheduleA/MedicalResearchOrganizationInd'
V_PCSTAT_MEDICAL_RSRCH_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_MEDICAL_RSRCH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_MEDICAL_RSRCH_X ) )
if( length( SA_01_PCSTAT_MEDICAL_RSRCH_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_MEDICAL_RSRCH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_MEDICAL_RSRCH_X <-  paste0( '{', SA_01_PCSTAT_MEDICAL_RSRCH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_GOVT_PUB_SUPPORT_X
## DESCRIPTION:  An organization that normally receives a substantial part of its support from a governmental unit or from the general public. 			Section 170(b)(1)(A)(vi)
## LOCATION:  SCHED-A-PART-01-LINE-07
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/PubliclySupportedOrg170b1Avi'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PubliclySupportedOrg170b1Avi'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicOrganization170Ind'
V_PCSTAT_GOVT_PUB_SUPPORT_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_GOVT_PUB_SUPPORT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_GOVT_PUB_SUPPORT_X ) )
if( length( SA_01_PCSTAT_GOVT_PUB_SUPPORT_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_GOVT_PUB_SUPPORT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_GOVT_PUB_SUPPORT_X <-  paste0( '{', SA_01_PCSTAT_GOVT_PUB_SUPPORT_X, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_PUB_SUPPORT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_PUB_SUPPORT_X ) )
if( length( SA_01_PCSTAT_PUB_SUPPORT_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_PUB_SUPPORT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_PUB_SUPPORT_X <-  paste0( '{', SA_01_PCSTAT_PUB_SUPPORT_X, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_SCHOOL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SCHOOL_X ) )
if( length( SA_01_PCSTAT_SCHOOL_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SCHOOL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SCHOOL_X <-  paste0( '{', SA_01_PCSTAT_SCHOOL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT
## DESCRIPTION:  Sum of amounts of support
## LOCATION:  SCHED-A-PART-01-LINE-12G-COL-v-TOT
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SumOfAmounts'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SumOfAmounts'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportSumAmt'
V_PCSTAT_ORG_AMT_SUPPORT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_ORG_AMT_SUPPORT_TOT ) )
if( length( SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT <-  paste0( '{', SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T1_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 1
## LOCATION:  SCHED-A-PART-01-LINE-12A
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type1'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type1'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType1Ind'
V_PCSTAT_SUPPORT_T1_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_T1_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_T1_X ) )
if( length( SA_01_PCSTAT_SUPPORT_T1_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_T1_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_T1_X <-  paste0( '{', SA_01_PCSTAT_SUPPORT_T1_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T2_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 2
## LOCATION:  SCHED-A-PART-01-LINE-12B
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type2'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type2'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType2Ind'
V_PCSTAT_SUPPORT_T2_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_T2_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_T2_X ) )
if( length( SA_01_PCSTAT_SUPPORT_T2_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_T2_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_T2_X <-  paste0( '{', SA_01_PCSTAT_SUPPORT_T2_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T3_FUNC_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 3 functionally integrated
## LOCATION:  SCHED-A-PART-01-LINE-12C
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type3FuncInt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type3FuncInt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType3FuncIntInd'
V_PCSTAT_SUPPORT_T3_FUNC_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_SUPPORT_T3_FUNC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_T3_FUNC_X ) )
if( length( SA_01_PCSTAT_SUPPORT_T3_FUNC_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_T3_FUNC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_T3_FUNC_X <-  paste0( '{', SA_01_PCSTAT_SUPPORT_T3_FUNC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T3_OTH_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 3 Other (see SA-FORM-VERSION-2011-PART-01)
## LOCATION:  SCHED-A-PART-01-LINE-11D
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type3Other'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type3Other'
V_PCSTAT_SUPPORT_T3_OTH_X <- paste( V1, V2 , sep='|' )
SA_01_PCSTAT_SUPPORT_T3_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_T3_OTH_X ) )
if( length( SA_01_PCSTAT_SUPPORT_T3_OTH_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_T3_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_T3_OTH_X <-  paste0( '{', SA_01_PCSTAT_SUPPORT_T3_OTH_X, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_SUPPORT_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_ORG_X ) )
if( length( SA_01_PCSTAT_SUPPORT_ORG_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_ORG_X <-  paste0( '{', SA_01_PCSTAT_SUPPORT_ORG_X, '}', collapse=';' ) 
} 




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
SA_01_PCSTAT_PUB_SAFETY_TEST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_PUB_SAFETY_TEST_X ) )
if( length( SA_01_PCSTAT_PUB_SAFETY_TEST_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_PUB_SAFETY_TEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_PUB_SAFETY_TEST_X <-  paste0( '{', SA_01_PCSTAT_PUB_SAFETY_TEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_DETERMIN_IRS_X
## DESCRIPTION:  Does the organization have a written determination from the IRS that it is a Type I; Type II or Type III supporting organization?
## LOCATION:  SCHED-A-PART-01-LINE-12E
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/WrittenIRSDetermination'
V2 <- '//Return/ReturnData/IRS990ScheduleA/IRSWrittenDeterminationInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/WrittenIRSDetermination'
V_PCSTAT_DETERMIN_IRS_X <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_DETERMIN_IRS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_DETERMIN_IRS_X ) )
if( length( SA_01_PCSTAT_DETERMIN_IRS_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_DETERMIN_IRS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_DETERMIN_IRS_X <-  paste0( '{', SA_01_PCSTAT_DETERMIN_IRS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_HOSPITAL_ADDR_CNTR
## DESCRIPTION:  Foreign country name
## LOCATION:  SCHED-A-PART-01-LINE-04
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Address/Country'
V2 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddress/Country'
V3 <- '//Return/ReturnData/IRS990ScheduleA/HospitalNameAndAddressGrp/CountryCd'
V_PCSTAT_HOSPITAL_ADDR_CNTR <- paste( V1, V2, V3 , sep='|' )
SA_01_PCSTAT_HOSPITAL_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_HOSPITAL_ADDR_CNTR ) )
if( length( SA_01_PCSTAT_HOSPITAL_ADDR_CNTR ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_HOSPITAL_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_HOSPITAL_ADDR_CNTR <-  paste0( '{', SA_01_PCSTAT_HOSPITAL_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_ORG_AMT_OTH_TOT
## DESCRIPTION:  Sum of amounts of other support
## LOCATION:  SCHED-A-PART-01-LINE-12G-COL-vi-TOT
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_01_PCSTAT_ORG_AMT_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/OtherSupportSumAmt' ) )
if( length( SA_01_PCSTAT_ORG_AMT_OTH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_ORG_AMT_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_ORG_AMT_OTH_TOT <-  paste0( '{', SA_01_PCSTAT_ORG_AMT_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 3 Non-functionally integrated
## LOCATION:  SCHED-A-PART-01-LINE-12D
## TABLE:  SA-P01-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type3NonFunc'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrgType3NonFuncInd'
V_PCSTAT_SUPPORT_T3_NOFUNC_X <- paste( V1, V2 , sep='|' )
SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_T3_NOFUNC_X ) )
if( length( SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X ) > 1 )
{ 
  log_collapsed_record( varname=SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X <-  paste0( '{', SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SA_01_PCSTAT_SUPPORT_ORG_NUM,SA_01_PCSTAT_CERTIFICATION_X,SA_01_PCSTAT_CHURCH_X,SA_01_PCSTAT_COLLEGE_BEN_X,SA_01_PCSTAT_COM_TRUST_X,SA_01_PCSTAT_CONTR_35PCT_CE_X,SA_01_PCSTAT_CONTR_PERS_X,SA_01_PCSTAT_CONTR_FAM_PARTY_X,SA_01_PCSTAT_GOVT_X,SA_01_PCSTAT_HOSPITAL_X,SA_01_PCSTAT_HOSPITAL_ADDR_CITY,SA_01_PCSTAT_HOSPITAL_NAME_L1,SA_01_PCSTAT_HOSPITAL_NAME_L2,SA_01_PCSTAT_HOSPITAL_ADDR_STATE,SA_01_PCSTAT_MEDICAL_RSRCH_X,SA_01_PCSTAT_GOVT_PUB_SUPPORT_X,SA_01_PCSTAT_PUB_SUPPORT_X,SA_01_PCSTAT_SCHOOL_X,SA_01_PCSTAT_ORG_AMT_SUPPORT_TOT,SA_01_PCSTAT_SUPPORT_T1_X,SA_01_PCSTAT_SUPPORT_T2_X,SA_01_PCSTAT_SUPPORT_T3_FUNC_X,SA_01_PCSTAT_SUPPORT_T3_OTH_X,SA_01_PCSTAT_SUPPORT_ORG_X,SA_01_PCSTAT_PUB_SAFETY_TEST_X,SA_01_PCSTAT_DETERMIN_IRS_X,SA_01_PCSTAT_HOSPITAL_ADDR_CNTR,SA_01_PCSTAT_ORG_AMT_OTH_TOT,SA_01_PCSTAT_SUPPORT_T3_NOFUNC_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


