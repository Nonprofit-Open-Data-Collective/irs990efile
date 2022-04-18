#' @title 
#'   Build table SJ-P01-T00-COMPENSATION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SJ_P01_T00_COMPENSATION <- function( doc, url )
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


## VARIABLE NAME:  SJ_01_COMP_PROV_CLUB_DUE_FEE_X
## DESCRIPTION:  Club dues or fees
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/ClubDuesOrFees'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/ClubDuesOrFeesInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/ClubDuesOrFees'
V_COMP_PROV_CLUB_DUE_FEE_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_CLUB_DUE_FEE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_CLUB_DUE_FEE_X ) )
if( length( SJ_01_COMP_PROV_CLUB_DUE_FEE_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_CLUB_DUE_FEE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_CLUB_DUE_FEE_X <-  paste0( '{', SJ_01_COMP_PROV_CLUB_DUE_FEE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_DISCRETIONARY_X
## DESCRIPTION:  Discretionary spending account
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/DiscretionarySpendingAccount'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/DiscretionarySpendingAcctInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/DiscretionarySpendingAccount'
V_COMP_PROV_DISCRETIONARY_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_DISCRETIONARY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_DISCRETIONARY_X ) )
if( length( SJ_01_COMP_PROV_DISCRETIONARY_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_DISCRETIONARY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_DISCRETIONARY_X <-  paste0( '{', SJ_01_COMP_PROV_DISCRETIONARY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_FIRST_CLASS_X
## DESCRIPTION:  First class or charter travel
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/FirstClassOrCharterTravel'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/FirstClassOrCharterTravelInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/FirstClassOrCharterTravel'
V_COMP_PROV_FIRST_CLASS_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_FIRST_CLASS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_FIRST_CLASS_X ) )
if( length( SJ_01_COMP_PROV_FIRST_CLASS_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_FIRST_CLASS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_FIRST_CLASS_X <-  paste0( '{', SJ_01_COMP_PROV_FIRST_CLASS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_HOUSING_ALLOW_X
## DESCRIPTION:  Housing allowance or residence
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/HousingAllowanceOrResidence'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/HousingAllowanceOrResidence'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/HousingAllowanceOrResidenceInd'
V_COMP_PROV_HOUSING_ALLOW_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_HOUSING_ALLOW_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_HOUSING_ALLOW_X ) )
if( length( SJ_01_COMP_PROV_HOUSING_ALLOW_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_HOUSING_ALLOW_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_HOUSING_ALLOW_X <-  paste0( '{', SJ_01_COMP_PROV_HOUSING_ALLOW_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_INDEMNIFY_X
## DESCRIPTION:  Idemnification and gross-up payments
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/IdemnificationGrossUpPayments'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/IdemnificationGrossUpPayments'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/IdemnificationGrossUpPmtsInd'
V_COMP_PROV_INDEMNIFY_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_INDEMNIFY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_INDEMNIFY_X ) )
if( length( SJ_01_COMP_PROV_INDEMNIFY_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_INDEMNIFY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_INDEMNIFY_X <-  paste0( '{', SJ_01_COMP_PROV_INDEMNIFY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_PERSONAL_SVC_X
## DESCRIPTION:  Personal services
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/PersonalServices'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/PersonalServices'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/PersonalServicesInd'
V_COMP_PROV_PERSONAL_SVC_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_PERSONAL_SVC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_PERSONAL_SVC_X ) )
if( length( SJ_01_COMP_PROV_PERSONAL_SVC_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_PERSONAL_SVC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_PERSONAL_SVC_X <-  paste0( '{', SJ_01_COMP_PROV_PERSONAL_SVC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_TRAVEL_X
## DESCRIPTION:  Travel for companions
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/TravelForCompanions'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/TravelForCompanions'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/TravelForCompanionsInd'
V_COMP_PROV_TRAVEL_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_TRAVEL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_TRAVEL_X ) )
if( length( SJ_01_COMP_PROV_TRAVEL_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_TRAVEL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_TRAVEL_X <-  paste0( '{', SJ_01_COMP_PROV_TRAVEL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PROV_USE_RESIDENCE_X
## DESCRIPTION:  Payments for use of residence
## LOCATION:  SCHED-J-PART-01-LINE-01A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/PaymentsForUseOfResidence'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/PaymentsForUseOfResidence'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/PaymentsForUseOfResidenceInd'
V_COMP_PROV_USE_RESIDENCE_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PROV_USE_RESIDENCE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PROV_USE_RESIDENCE_X ) )
if( length( SJ_01_COMP_PROV_USE_RESIDENCE_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PROV_USE_RESIDENCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PROV_USE_RESIDENCE_X <-  paste0( '{', SJ_01_COMP_PROV_USE_RESIDENCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_WRITTEN_POLICY_X
## DESCRIPTION:  Written policy reference T and E expenses?
## LOCATION:  SCHED-J-PART-01-LINE-01B
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/WrittenPolicyReTAndEExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/WrittenPolicyRefTAndEExpnssInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/WrittenPolicyReTAndEExpenses'
V_COMP_WRITTEN_POLICY_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_WRITTEN_POLICY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_WRITTEN_POLICY_X ) )
if( length( SJ_01_COMP_WRITTEN_POLICY_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_WRITTEN_POLICY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_WRITTEN_POLICY_X <-  paste0( '{', SJ_01_COMP_WRITTEN_POLICY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_SUBSTANTIATION_REQ_X
## DESCRIPTION:  Substantiation required?
## LOCATION:  SCHED-J-PART-01-LINE-02
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/SubstantiationRequired'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/SubstantiationRequired'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/SubstantiationRequiredInd'
V_COMP_SUBSTANTIATION_REQ_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_SUBSTANTIATION_REQ_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_SUBSTANTIATION_REQ_X ) )
if( length( SJ_01_COMP_SUBSTANTIATION_REQ_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_SUBSTANTIATION_REQ_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_SUBSTANTIATION_REQ_X <-  paste0( '{', SJ_01_COMP_SUBSTANTIATION_REQ_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_METHOD_BOARD_APPROV_X
## DESCRIPTION:  Board or committee approval
## LOCATION:  SCHED-J-PART-01-LINE-03
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/BoardOrCommitteeApproval'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/BoardOrCommitteeApprovalInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/BoardOrCommitteeApproval'
V_COMP_METHOD_BOARD_APPROV_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_METHOD_BOARD_APPROV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_METHOD_BOARD_APPROV_X ) )
if( length( SJ_01_COMP_METHOD_BOARD_APPROV_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_METHOD_BOARD_APPROV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_METHOD_BOARD_APPROV_X <-  paste0( '{', SJ_01_COMP_METHOD_BOARD_APPROV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_METHOD_COMMITTEE_X
## DESCRIPTION:  Compensation committee
## LOCATION:  SCHED-J-PART-01-LINE-03
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/CompensationCommittee'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/CompensationCommitteeInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/CompensationCommittee'
V_COMP_METHOD_COMMITTEE_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_METHOD_COMMITTEE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_METHOD_COMMITTEE_X ) )
if( length( SJ_01_COMP_METHOD_COMMITTEE_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_METHOD_COMMITTEE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_METHOD_COMMITTEE_X <-  paste0( '{', SJ_01_COMP_METHOD_COMMITTEE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_METHOD_CONSULTANT_X
## DESCRIPTION:  Independent consultant
## LOCATION:  SCHED-J-PART-01-LINE-03
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/IndependentConsultant'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/IndependentConsultant'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/IndependentConsultantInd'
V_COMP_METHOD_CONSULTANT_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_METHOD_CONSULTANT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_METHOD_CONSULTANT_X ) )
if( length( SJ_01_COMP_METHOD_CONSULTANT_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_METHOD_CONSULTANT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_METHOD_CONSULTANT_X <-  paste0( '{', SJ_01_COMP_METHOD_CONSULTANT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_METHOD_EMPL_KONTR_X
## DESCRIPTION:  Written employment contract
## LOCATION:  SCHED-J-PART-01-LINE-03
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/WrittenEmploymentContract'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/WrittenEmploymentContract'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/WrittenEmploymentContractInd'
V_COMP_METHOD_EMPL_KONTR_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_METHOD_EMPL_KONTR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_METHOD_EMPL_KONTR_X ) )
if( length( SJ_01_COMP_METHOD_EMPL_KONTR_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_METHOD_EMPL_KONTR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_METHOD_EMPL_KONTR_X <-  paste0( '{', SJ_01_COMP_METHOD_EMPL_KONTR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_METHOD_OTH_ORG_990_X
## DESCRIPTION:  Form 990 of other organizations
## LOCATION:  SCHED-J-PART-01-LINE-03
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990OfOtherOrganizations'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/Form990OfOtherOrganizationsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/Form990OfOtherOrganizations'
V_COMP_METHOD_OTH_ORG_990_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_METHOD_OTH_ORG_990_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_METHOD_OTH_ORG_990_X ) )
if( length( SJ_01_COMP_METHOD_OTH_ORG_990_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_METHOD_OTH_ORG_990_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_METHOD_OTH_ORG_990_X <-  paste0( '{', SJ_01_COMP_METHOD_OTH_ORG_990_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_METHOD_SURVEY_X
## DESCRIPTION:  Compensation survey
## LOCATION:  SCHED-J-PART-01-LINE-03
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/CompensationSurvey'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/CompensationSurveyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/CompensationSurvey'
V_COMP_METHOD_SURVEY_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_METHOD_SURVEY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_METHOD_SURVEY_X ) )
if( length( SJ_01_COMP_METHOD_SURVEY_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_METHOD_SURVEY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_METHOD_SURVEY_X <-  paste0( '{', SJ_01_COMP_METHOD_SURVEY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PAY_SEVERANCE_X
## DESCRIPTION:  Severance payment?
## LOCATION:  SCHED-J-PART-01-LINE-04A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/SeverancePayment'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/SeverancePayment'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/SeverancePaymentInd'
V_COMP_PAY_SEVERANCE_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PAY_SEVERANCE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PAY_SEVERANCE_X ) )
if( length( SJ_01_COMP_PAY_SEVERANCE_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PAY_SEVERANCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PAY_SEVERANCE_X <-  paste0( '{', SJ_01_COMP_PAY_SEVERANCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PAY_RETIREMENT_PLAN_X
## DESCRIPTION:  Supplemental nonqualified retirement plan?
## LOCATION:  SCHED-J-PART-01-LINE-04B
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/SupplementalNonqualRetirePlan'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/SupplementalNonqualRetirePlan'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/SupplementalNonqualRtrPlanInd'
V_COMP_PAY_RETIREMENT_PLAN_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PAY_RETIREMENT_PLAN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PAY_RETIREMENT_PLAN_X ) )
if( length( SJ_01_COMP_PAY_RETIREMENT_PLAN_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PAY_RETIREMENT_PLAN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PAY_RETIREMENT_PLAN_X <-  paste0( '{', SJ_01_COMP_PAY_RETIREMENT_PLAN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_PAY_EQUITY_BASED_X
## DESCRIPTION:  Equity based compensation arrangement?
## LOCATION:  SCHED-J-PART-01-LINE-04C
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/EquityBasedCompArrangement'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/EquityBasedCompArrngmInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/EquityBasedCompArrangement'
V_COMP_PAY_EQUITY_BASED_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_PAY_EQUITY_BASED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_PAY_EQUITY_BASED_X ) )
if( length( SJ_01_COMP_PAY_EQUITY_BASED_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_PAY_EQUITY_BASED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_PAY_EQUITY_BASED_X <-  paste0( '{', SJ_01_COMP_PAY_EQUITY_BASED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_CONTINGENT_REV_ORG_X
## DESCRIPTION:  Compensation based on revenue of filing org?
## LOCATION:  SCHED-J-PART-01-LINE-05A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/CompBasedOnRevenueOfFilingOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/CompBasedOnRevenueOfFlngOrgInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/CompBasedOnRevenueOfFilingOrg'
V_COMP_CONTINGENT_REV_ORG_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_CONTINGENT_REV_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_CONTINGENT_REV_ORG_X ) )
if( length( SJ_01_COMP_CONTINGENT_REV_ORG_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_CONTINGENT_REV_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_CONTINGENT_REV_ORG_X <-  paste0( '{', SJ_01_COMP_CONTINGENT_REV_ORG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_CONTINGENT_REV_RLTD_X
## DESCRIPTION:  Compensation based on revenue of related orgs?
## LOCATION:  SCHED-J-PART-01-LINE-05B
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/CompBasedOnRevenueRelatedOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/CompBsdOnRevRelatedOrgsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/CompBasedOnRevenueRelatedOrgs'
V_COMP_CONTINGENT_REV_RLTD_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_CONTINGENT_REV_RLTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_CONTINGENT_REV_RLTD_X ) )
if( length( SJ_01_COMP_CONTINGENT_REV_RLTD_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_CONTINGENT_REV_RLTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_CONTINGENT_REV_RLTD_X <-  paste0( '{', SJ_01_COMP_CONTINGENT_REV_RLTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_CONTINGENT_NET_ORG_X
## DESCRIPTION:  Compensation based on net earnings of filing org?
## LOCATION:  SCHED-J-PART-01-LINE-06A
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/CompBasedNetEarningsFilingOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/CompBsdNetEarnsFlngOrgInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/CompBasedNetEarningsFilingOrg'
V_COMP_CONTINGENT_NET_ORG_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_CONTINGENT_NET_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_CONTINGENT_NET_ORG_X ) )
if( length( SJ_01_COMP_CONTINGENT_NET_ORG_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_CONTINGENT_NET_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_CONTINGENT_NET_ORG_X <-  paste0( '{', SJ_01_COMP_CONTINGENT_NET_ORG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_CONTINGENT_NET_RLTD_X
## DESCRIPTION:  Compensation based on net earnings of related orgs?
## LOCATION:  SCHED-J-PART-01-LINE-06B
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/CompBasedNetEarningsRelateOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/CompBsdNetEarnsRltdOrgsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/CompBasedNetEarningsRelateOrgs'
V_COMP_CONTINGENT_NET_RLTD_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_CONTINGENT_NET_RLTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_CONTINGENT_NET_RLTD_X ) )
if( length( SJ_01_COMP_CONTINGENT_NET_RLTD_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_CONTINGENT_NET_RLTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_CONTINGENT_NET_RLTD_X <-  paste0( '{', SJ_01_COMP_CONTINGENT_NET_RLTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_NON_FIXED_PAYMENT_X
## DESCRIPTION:  Any non-fixed payments?
## LOCATION:  SCHED-J-PART-01-LINE-07
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/AnyNonFixedPayments'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/AnyNonFixedPaymentsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/AnyNonFixedPayments'
V_COMP_NON_FIXED_PAYMENT_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_NON_FIXED_PAYMENT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_NON_FIXED_PAYMENT_X ) )
if( length( SJ_01_COMP_NON_FIXED_PAYMENT_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_NON_FIXED_PAYMENT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_NON_FIXED_PAYMENT_X <-  paste0( '{', SJ_01_COMP_NON_FIXED_PAYMENT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_KONTR_EXCEPTION_X
## DESCRIPTION:  Initial contract exception?
## LOCATION:  SCHED-J-PART-01-LINE-08
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/Form990ScheduleJPartI/InitialContractException'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/InitialContractException'
V3 <- '//Return/ReturnData/IRS990ScheduleJ/InitialContractExceptionInd'
V_COMP_KONTR_EXCEPTION_X <- paste( V1, V2, V3 , sep='|' )
SJ_01_COMP_KONTR_EXCEPTION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_KONTR_EXCEPTION_X ) )
if( length( SJ_01_COMP_KONTR_EXCEPTION_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_KONTR_EXCEPTION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_KONTR_EXCEPTION_X <-  paste0( '{', SJ_01_COMP_KONTR_EXCEPTION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SJ_01_COMP_REBUTTABLE_PROC_X
## DESCRIPTION:  Rebuttable presumption procedure?
## LOCATION:  SCHED-J-PART-01-LINE-09
## TABLE:  SJ-P01-T00-COMPENSATION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleJ/RebuttablePresumptionProcedure'
V2 <- '//Return/ReturnData/IRS990ScheduleJ/RebuttablePresumptionProcInd'
V_COMP_REBUTTABLE_PROC_X <- paste( V1, V2 , sep='|' )
SJ_01_COMP_REBUTTABLE_PROC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_REBUTTABLE_PROC_X ) )
if( length( SJ_01_COMP_REBUTTABLE_PROC_X ) > 1 )
{ 
  create_record( varname=SJ_01_COMP_REBUTTABLE_PROC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SJ_01_COMP_REBUTTABLE_PROC_X <-  paste0( '{', SJ_01_COMP_REBUTTABLE_PROC_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SJ_01_COMP_PROV_CLUB_DUE_FEE_X,SJ_01_COMP_PROV_DISCRETIONARY_X,SJ_01_COMP_PROV_FIRST_CLASS_X,SJ_01_COMP_PROV_HOUSING_ALLOW_X,SJ_01_COMP_PROV_INDEMNIFY_X,SJ_01_COMP_PROV_PERSONAL_SVC_X,SJ_01_COMP_PROV_TRAVEL_X,SJ_01_COMP_PROV_USE_RESIDENCE_X,SJ_01_COMP_WRITTEN_POLICY_X,SJ_01_COMP_SUBSTANTIATION_REQ_X,SJ_01_COMP_METHOD_BOARD_APPROV_X,SJ_01_COMP_METHOD_COMMITTEE_X,SJ_01_COMP_METHOD_CONSULTANT_X,SJ_01_COMP_METHOD_EMPL_KONTR_X,SJ_01_COMP_METHOD_OTH_ORG_990_X,SJ_01_COMP_METHOD_SURVEY_X,SJ_01_COMP_PAY_SEVERANCE_X,SJ_01_COMP_PAY_RETIREMENT_PLAN_X,SJ_01_COMP_PAY_EQUITY_BASED_X,SJ_01_COMP_CONTINGENT_REV_ORG_X,SJ_01_COMP_CONTINGENT_REV_RLTD_X,SJ_01_COMP_CONTINGENT_NET_ORG_X,SJ_01_COMP_CONTINGENT_NET_RLTD_X,SJ_01_COMP_NON_FIXED_PAYMENT_X,SJ_01_COMP_KONTR_EXCEPTION_X,SJ_01_COMP_REBUTTABLE_PROC_X)
df <- as.data.frame( var.list )


return( df )


}


