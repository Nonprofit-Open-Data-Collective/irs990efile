#' @title 
#'   Build table F9-P00-T00-HEADER
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P00_T00_HEADER <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_00_IRS_TRUST_CUSTOMER_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_CUSTOMER_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/TrustedCustomerCd' ) )
if( length( F9_00_IRS_TRUST_CUSTOMER_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_CUSTOMER_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_CUSTOMER_X <-  paste0( '{', F9_00_IRS_TRUST_CUSTOMER_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_RESP_PARTY_INFO_CURR_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_RESP_PARTY_INFO_CURR_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/IRSResponsiblePrtyInfoCurrInd' ) )
if( length( F9_00_IRS_RESP_PARTY_INFO_CURR_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_RESP_PARTY_INFO_CURR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_RESP_PARTY_INFO_CURR_X <-  paste0( '{', F9_00_IRS_RESP_PARTY_INFO_CURR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_AUTENTICATED_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_AUTENTICATED_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/AuthenticationAssuranceLevelCd' ) )
if( length( F9_00_IRS_TRUST_AUTENTICATED_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_AUTENTICATED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_AUTENTICATED_X <-  paste0( '{', F9_00_IRS_TRUST_AUTENTICATED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_IDENTITY_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_IDENTITY_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/IdentityAssuranceLevelCd' ) )
if( length( F9_00_IRS_TRUST_IDENTITY_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_IDENTITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_IDENTITY_X <-  paste0( '{', F9_00_IRS_TRUST_IDENTITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_DEVICE_ID
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

V1 <- '//Return/ReturnHeader/FilingSecurityInformation/AtSubmissionCreationDeviceId'
V2 <- '//Return/ReturnHeader/FilingSecurityInformation/AtSubmissionFilingDeviceId'
V_IRS_SEC_DEVICE_ID <- paste( V1, V2 , sep='|' )
F9_00_IRS_SEC_DEVICE_ID <- xml2::xml_text( xml2::xml_find_all( doc, V_IRS_SEC_DEVICE_ID ) )
if( length( F9_00_IRS_SEC_DEVICE_ID ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_DEVICE_ID, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_DEVICE_ID <-  paste0( '{', F9_00_IRS_SEC_DEVICE_ID, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_IP_ADDR
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_SEC_IP_ADDR <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/FilingSecurityInformation/IPAddress/IPv4AddressTxt' ) )
if( length( F9_00_IRS_SEC_IP_ADDR ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_IP_ADDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_IP_ADDR <-  paste0( '{', F9_00_IRS_SEC_IP_ADDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_FILING_LIC_TYPE
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_SEC_FILING_LIC_TYPE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/FilingSecurityInformation/FilingLicenseTypeCd' ) )
if( length( F9_00_IRS_SEC_FILING_LIC_TYPE ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_FILING_LIC_TYPE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_FILING_LIC_TYPE <-  paste0( '{', F9_00_IRS_SEC_FILING_LIC_TYPE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_IP_DATE
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_SEC_IP_DATE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/FilingSecurityInformation/IPDt' ) )
if( length( F9_00_IRS_SEC_IP_DATE ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_IP_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_IP_DATE <-  paste0( '{', F9_00_IRS_SEC_IP_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_IP_TIME
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_SEC_IP_TIME <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/FilingSecurityInformation/IPTm' ) )
if( length( F9_00_IRS_SEC_IP_TIME ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_IP_TIME, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_IP_TIME <-  paste0( '{', F9_00_IRS_SEC_IP_TIME, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_IP_TIME_ZONE
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_SEC_IP_TIME_ZONE <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/FilingSecurityInformation/IPTimezoneCd' ) )
if( length( F9_00_IRS_SEC_IP_TIME_ZONE ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_IP_TIME_ZONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_IP_TIME_ZONE <-  paste0( '{', F9_00_IRS_SEC_IP_TIME_ZONE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_FED_ASSURANCE_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_FED_ASSURANCE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/FederatedAssuranceLevelCd' ) )
if( length( F9_00_IRS_TRUST_FED_ASSURANCE_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_FED_ASSURANCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_FED_ASSURANCE_X <-  paste0( '{', F9_00_IRS_TRUST_FED_ASSURANCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_OOB_VERIFIED_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_OOB_VERIFIED_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/OOBSecurityVerificationCd' ) )
if( length( F9_00_IRS_TRUST_OOB_VERIFIED_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_OOB_VERIFIED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_OOB_VERIFIED_X <-  paste0( '{', F9_00_IRS_TRUST_OOB_VERIFIED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_RQR_OOB_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_RQR_OOB_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/LastSubmissionRqrOOBCd' ) )
if( length( F9_00_IRS_TRUST_RQR_OOB_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_RQR_OOB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_RQR_OOB_X <-  paste0( '{', F9_00_IRS_TRUST_RQR_OOB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_SEC_SUBMISSION_ID
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

V1 <- '//Return/ReturnHeader/FilingSecurityInformation/FederalOriginalSubmissionId'
V2 <- '//Return/ReturnHeader/FilingSecurityInformation/FederalOriginalSubmissionIdDt'
V_IRS_SEC_SUBMISSION_ID <- paste( V1, V2 , sep='|' )
F9_00_IRS_SEC_SUBMISSION_ID <- xml2::xml_text( xml2::xml_find_all( doc, V_IRS_SEC_SUBMISSION_ID ) )
if( length( F9_00_IRS_SEC_SUBMISSION_ID ) > 1 )
{ 
  create_record( varname=F9_00_IRS_SEC_SUBMISSION_ID, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_SEC_SUBMISSION_ID <-  paste0( '{', F9_00_IRS_SEC_SUBMISSION_ID, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_REASONABLE_CAUSE_TXT
## DESCRIPTION:  If the return isn't filed by the due date (including any extension granted), provide a reasonable-cause explanation giving the reasons for not filing on time.
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/ReasonableCauseExplanation/ExplanationTxt'
V2 <- '//Return/ReturnData/ReasonableCauseExplanation/Explanation'
V_REASONABLE_CAUSE_TXT <- paste( V1, V2 , sep='|' )
F9_00_REASONABLE_CAUSE_TXT <- xml2::xml_text( xml2::xml_find_all( doc, V_REASONABLE_CAUSE_TXT ) )
if( length( F9_00_REASONABLE_CAUSE_TXT ) > 1 )
{ 
  create_record( varname=F9_00_REASONABLE_CAUSE_TXT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_REASONABLE_CAUSE_TXT <-  paste0( '{', F9_00_REASONABLE_CAUSE_TXT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_PHONE
## DESCRIPTION:  Filing Organization Telephone Number
## LOCATION:  F990-PC-PART-00-SECTION-E
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnHeader/Filer/ForeignPhoneNum'
V2 <- '//Return/ReturnHeader/Filer/Phone'
V3 <- '//Return/ReturnHeader/Filer/PhoneNum'
V_ORG_PHONE <- paste( V1, V2, V3 , sep='|' )
F9_00_ORG_PHONE <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_PHONE ) )
if( length( F9_00_ORG_PHONE ) > 1 )
{ 
  create_record( varname=F9_00_ORG_PHONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_PHONE <-  paste0( '{', F9_00_ORG_PHONE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_PW_CHANGE_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_PW_CHANGE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/ProfilePasswordChangeInd' ) )
if( length( F9_00_IRS_TRUST_PW_CHANGE_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_PW_CHANGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_PW_CHANGE_X <-  paste0( '{', F9_00_IRS_TRUST_PW_CHANGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_GRO_RCPT_LT50K_X
## DESCRIPTION:  Gross receipts are less than the filing threshold ($25K or $50K depending on the year of the form)
## LOCATION:  F990-EZ-PART-00-SECTION-K
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

F9_00_GRO_RCPT_LT50K_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990EZ/GrossReceiptsLessThan25000' ) )
if( length( F9_00_GRO_RCPT_LT50K_X ) > 1 )
{ 
  create_record( varname=F9_00_GRO_RCPT_LT50K_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_GRO_RCPT_LT50K_X <-  paste0( '{', F9_00_GRO_RCPT_LT50K_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_NAME_CHANGE_X
## DESCRIPTION:  Indicates that the organization changed its name
## LOCATION:  F990-PC-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990/NameChangeInd'
V2 <- '//Return/ReturnData/IRS990EZ/NameChangeInd'
V_ORG_NAME_CHANGE_X <- paste( V1, V2 , sep='|' )
F9_00_ORG_NAME_CHANGE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_NAME_CHANGE_X ) )
if( length( F9_00_ORG_NAME_CHANGE_X ) > 1 )
{ 
  create_record( varname=F9_00_ORG_NAME_CHANGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_NAME_CHANGE_X <-  paste0( '{', F9_00_ORG_NAME_CHANGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_IN_CARE_OF
## DESCRIPTION:  In care of
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  

V1 <- '//Return/ReturnHeader/Filer/InCareOfName'
V2 <- '//Return/ReturnHeader/Filer/InCareOfNm'
V_ORG_ADDR_IN_CARE_OF <- paste( V1, V2 , sep='|' )
F9_00_ORG_ADDR_IN_CARE_OF <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_IN_CARE_OF ) )
if( length( F9_00_ORG_ADDR_IN_CARE_OF ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_IN_CARE_OF, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_IN_CARE_OF <-  paste0( '{', F9_00_ORG_ADDR_IN_CARE_OF, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_APPLICATION_PEND_X
## DESCRIPTION:  Indicates that the application for tax exempt status is pending
## LOCATION:  F990-EZ-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

F9_00_APPLICATION_PEND_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990EZ/ApplicationPendingInd' ) )
if( length( F9_00_APPLICATION_PEND_X ) > 1 )
{ 
  create_record( varname=F9_00_APPLICATION_PEND_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_APPLICATION_PEND_X <-  paste0( '{', F9_00_APPLICATION_PEND_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_DISASTER_RELIEF
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_DISASTER_RELIEF <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/DisasterReliefTxt' ) )
if( length( F9_00_DISASTER_RELIEF ) > 1 )
{ 
  create_record( varname=F9_00_DISASTER_RELIEF, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_DISASTER_RELIEF <-  paste0( '{', F9_00_DISASTER_RELIEF, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_PROFILE_CHANGE_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_PROFILE_CHANGE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/ProfileEmailAddressChangeInd' ) )
if( length( F9_00_IRS_TRUST_PROFILE_CHANGE_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_PROFILE_CHANGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_PROFILE_CHANGE_X <-  paste0( '{', F9_00_IRS_TRUST_PROFILE_CHANGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PERS_SSN
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_02_PREP_PERS_SSN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/PreparerPersonGrp/SSN' ) )
if( length( F9_02_PREP_PERS_SSN ) > 1 )
{ 
  create_record( varname=F9_02_PREP_PERS_SSN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PERS_SSN <-  paste0( '{', F9_02_PREP_PERS_SSN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_IRS_TRUST_USRNAME_CHANGE_X
## DESCRIPTION:  
## LOCATION:  
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  
## PRODUCTION RULE:  

F9_00_IRS_TRUST_USRNAME_CHANGE_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/AdditionalFilerInformation/TrustedCustomerGrp/ProfileUserNameChangeInd' ) )
if( length( F9_00_IRS_TRUST_USRNAME_CHANGE_X ) > 1 )
{ 
  create_record( varname=F9_00_IRS_TRUST_USRNAME_CHANGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_IRS_TRUST_USRNAME_CHANGE_X <-  paste0( '{', F9_00_IRS_TRUST_USRNAME_CHANGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_FORM_ADDR_CHANGE_X
## DESCRIPTION:  Indicates this form has an address change
## LOCATION:  F990-PC-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressChange'
V2 <- '//Return/ReturnData/IRS990/AddressChangeInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/AddressChange'
V4 <- '//Return/ReturnData/IRS990EZ/AddressChange'
V5 <- '//Return/ReturnData/IRS990EZ/AddressChangeInd'
V_FORM_ADDR_CHANGE_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_FORM_ADDR_CHANGE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FORM_ADDR_CHANGE_X ) )
if( length( F9_00_FORM_ADDR_CHANGE_X ) > 1 )
{ 
  create_record( varname=F9_00_FORM_ADDR_CHANGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_FORM_ADDR_CHANGE_X <-  paste0( '{', F9_00_FORM_ADDR_CHANGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_ADDR_L1
## DESCRIPTION:  Address of Principal Officer (Foreign Line 1)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerForeign/AddressLine1'
V2 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerUS/AddressLine1'
V3 <- '//Return/ReturnData/IRS990/ForeignAddress/AddressLine1'
V4 <- '//Return/ReturnData/IRS990/ForeignAddress/AddressLine1Txt'
V5 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressForeign/AddressLine1'
V6 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressUS/AddressLine1'
V7 <- '//Return/ReturnData/IRS990/USAddress/AddressLine1'
V8 <- '//Return/ReturnData/IRS990/USAddress/AddressLine1Txt'
V_PRIN_OFF_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_00_PRIN_OFF_ADDR_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_ADDR_L1 ) )
if( length( F9_00_PRIN_OFF_ADDR_L1 ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_ADDR_L1 <-  paste0( '{', F9_00_PRIN_OFF_ADDR_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_ADDR_L2
## DESCRIPTION:  Address of Principal Officer (Foreign Line 2)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerForeign/AddressLine2'
V2 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerUS/AddressLine2'
V3 <- '//Return/ReturnData/IRS990/ForeignAddress/AddressLine2'
V4 <- '//Return/ReturnData/IRS990/ForeignAddress/AddressLine2Txt'
V5 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressForeign/AddressLine2'
V6 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressUS/AddressLine2'
V7 <- '//Return/ReturnData/IRS990/USAddress/AddressLine2'
V8 <- '//Return/ReturnData/IRS990/USAddress/AddressLine2Txt'
V_PRIN_OFF_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_00_PRIN_OFF_ADDR_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_ADDR_L2 ) )
if( length( F9_00_PRIN_OFF_ADDR_L2 ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_ADDR_L2 <-  paste0( '{', F9_00_PRIN_OFF_ADDR_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_ADDR_CITY
## DESCRIPTION:  Address of Principal Officer (Foreign City)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerForeign/City'
V2 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerUS/City'
V3 <- '//Return/ReturnData/IRS990/ForeignAddress/City'
V4 <- '//Return/ReturnData/IRS990/ForeignAddress/CityNm'
V5 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressForeign/City'
V6 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressUS/City'
V7 <- '//Return/ReturnData/IRS990/USAddress/City'
V8 <- '//Return/ReturnData/IRS990/USAddress/CityNm'
V_PRIN_OFF_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_00_PRIN_OFF_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_ADDR_CITY ) )
if( length( F9_00_PRIN_OFF_ADDR_CITY ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_ADDR_CITY <-  paste0( '{', F9_00_PRIN_OFF_ADDR_CITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_ADDR_CNTR
## DESCRIPTION:  Address of Principal Officer (Foreign Country)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerForeign/Country'
V2 <- '//Return/ReturnData/IRS990/ForeignAddress/Country'
V3 <- '//Return/ReturnData/IRS990/ForeignAddress/CountryCd'
V4 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressForeign/Country'
V_PRIN_OFF_ADDR_CNTR <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_PRIN_OFF_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_ADDR_CNTR ) )
if( length( F9_00_PRIN_OFF_ADDR_CNTR ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_ADDR_CNTR <-  paste0( '{', F9_00_PRIN_OFF_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_ADDR_ZIP
## DESCRIPTION:  Address of Principal Officer (Foreign Postal Code)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerForeign/PostalCode'
V2 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerUS/ZIPCode'
V3 <- '//Return/ReturnData/IRS990/ForeignAddress/ForeignPostalCd'
V4 <- '//Return/ReturnData/IRS990/ForeignAddress/PostalCode'
V5 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressForeign/PostalCode'
V6 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressUS/ZIPCode'
V7 <- '//Return/ReturnData/IRS990/USAddress/ZIPCd'
V8 <- '//Return/ReturnData/IRS990/USAddress/ZIPCode'
V_PRIN_OFF_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_00_PRIN_OFF_ADDR_ZIP <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_ADDR_ZIP ) )
if( length( F9_00_PRIN_OFF_ADDR_ZIP ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_ADDR_ZIP <-  paste0( '{', F9_00_PRIN_OFF_ADDR_ZIP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_ADDR_STATE
## DESCRIPTION:  Address of Principal Officer (Foreign State)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerForeign/ProvinceOrState'
V2 <- '//Return/ReturnData/IRS990/AddressPrincipalOfficerUS/State'
V3 <- '//Return/ReturnData/IRS990/ForeignAddress/ProvinceOrState'
V4 <- '//Return/ReturnData/IRS990/ForeignAddress/ProvinceOrStateNm'
V5 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressForeign/ProvinceOrState'
V6 <- '//Return/ReturnData/IRS990/Form990PartI/AddressOfPrincipalOfficer/AddressUS/State'
V7 <- '//Return/ReturnData/IRS990/USAddress/State'
V8 <- '//Return/ReturnData/IRS990/USAddress/StateAbbreviationCd'
V_PRIN_OFF_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_00_PRIN_OFF_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_ADDR_STATE ) )
if( length( F9_00_PRIN_OFF_ADDR_STATE ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_ADDR_STATE <-  paste0( '{', F9_00_PRIN_OFF_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ALL_AFFIL_INCL_X
## DESCRIPTION:  Indicates this form includes all subordinate organizations
## LOCATION:  F990-PC-PART-00-SECTION-HB
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AllAffiliatesIncluded'
V2 <- '//Return/ReturnData/IRS990/AllAffiliatesIncludedInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/AllAffiliatesIncluded'
V_ALL_AFFIL_INCL_X <- paste( V1, V2, V3 , sep='|' )
F9_00_ALL_AFFIL_INCL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ALL_AFFIL_INCL_X ) )
if( length( F9_00_ALL_AFFIL_INCL_X ) > 1 )
{ 
  create_record( varname=F9_00_ALL_AFFIL_INCL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ALL_AFFIL_INCL_X <-  paste0( '{', F9_00_ALL_AFFIL_INCL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_RETURN_AMENDED_X
## DESCRIPTION:  Inidcates this form is an amended return
## LOCATION:  F990-PC-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AmendedReturn'
V2 <- '//Return/ReturnData/IRS990/AmendedReturnInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/AmendedReturn'
V4 <- '//Return/ReturnData/IRS990EZ/AmendedReturn'
V5 <- '//Return/ReturnData/IRS990EZ/AmendedReturnInd'
V_RETURN_AMENDED_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_RETURN_AMENDED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RETURN_AMENDED_X ) )
if( length( F9_00_RETURN_AMENDED_X ) > 1 )
{ 
  create_record( varname=F9_00_RETURN_AMENDED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_RETURN_AMENDED_X <-  paste0( '{', F9_00_RETURN_AMENDED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_LEGAL_DMCL_CNTR
## DESCRIPTION:  Countryof legam domicile
## LOCATION:  F990-PC-PART-00-SECTION-M
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CountryLegalDomicile'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/CountryLegalDomicile'
V3 <- '//Return/ReturnData/IRS990/LegalDomicileCountryCd'
V_LEGAL_DMCL_CNTR <- paste( V1, V2, V3 , sep='|' )
F9_00_LEGAL_DMCL_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_LEGAL_DMCL_CNTR ) )
if( length( F9_00_LEGAL_DMCL_CNTR ) > 1 )
{ 
  create_record( varname=F9_00_LEGAL_DMCL_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_LEGAL_DMCL_CNTR <-  paste0( '{', F9_00_LEGAL_DMCL_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_NAME_DBA_L1
## DESCRIPTION:  Doing business as (line 1)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DoingBusinessAs/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990/DoingBusinessAsName/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990/DoingBusinessAsName/BusinessNameLine1Txt'
V_ORG_NAME_DBA_L1 <- paste( V1, V2, V3 , sep='|' )
F9_00_ORG_NAME_DBA_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_NAME_DBA_L1 ) )
if( length( F9_00_ORG_NAME_DBA_L1 ) > 1 )
{ 
  create_record( varname=F9_00_ORG_NAME_DBA_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_NAME_DBA_L1 <-  paste0( '{', F9_00_ORG_NAME_DBA_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_NAME_DBA_L2
## DESCRIPTION:  Doing business as (line 2)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DoingBusinessAs/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990/DoingBusinessAsName/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990/DoingBusinessAsName/BusinessNameLine2Txt'
V_ORG_NAME_DBA_L2 <- paste( V1, V2, V3 , sep='|' )
F9_00_ORG_NAME_DBA_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_NAME_DBA_L2 ) )
if( length( F9_00_ORG_NAME_DBA_L2 ) > 1 )
{ 
  create_record( varname=F9_00_ORG_NAME_DBA_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_NAME_DBA_L2 <-  paste0( '{', F9_00_ORG_NAME_DBA_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_RETURN_FINAL_X
## DESCRIPTION:  Indicates this return is a final return
## LOCATION:  F990-PC-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FinalReturn'
V2 <- '//Return/ReturnData/IRS990/FinalReturnInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartI/TerminationReturn'
V4 <- '//Return/ReturnData/IRS990/TerminatedReturn'
V5 <- '//Return/ReturnData/IRS990/TerminationReturn'
V6 <- '//Return/ReturnData/IRS990EZ/FinalReturn'
V7 <- '//Return/ReturnData/IRS990EZ/FinalReturnInd'
V8 <- '//Return/ReturnData/IRS990EZ/TerminatedReturn'
V9 <- '//Return/ReturnData/IRS990EZ/TerminationReturn'
V_RETURN_FINAL_X <- paste( V1, V2, V3, V4, V5, V6, V7, V8, V9 , sep='|' )
F9_00_RETURN_FINAL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RETURN_FINAL_X ) )
if( length( F9_00_RETURN_FINAL_X ) > 1 )
{ 
  create_record( varname=F9_00_RETURN_FINAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_RETURN_FINAL_X <-  paste0( '{', F9_00_RETURN_FINAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_GRO_RCPT
## DESCRIPTION:  Gross receipts
## LOCATION:  F990-PC-PART-00-SECTION-G
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/GrossReceipts'
V2 <- '//Return/ReturnData/IRS990/GrossReceipts'
V3 <- '//Return/ReturnData/IRS990/GrossReceiptsAmt'
V4 <- '//Return/ReturnData/IRS990EZ/GrossReceipts'
V5 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsAmt'
V_GRO_RCPT <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_GRO_RCPT <- xml2::xml_text( xml2::xml_find_all( doc, V_GRO_RCPT ) )
if( length( F9_00_GRO_RCPT ) > 1 )
{ 
  create_record( varname=F9_00_GRO_RCPT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_GRO_RCPT <-  paste0( '{', F9_00_GRO_RCPT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_GROUP_EXEMPT_NUM
## DESCRIPTION:  Group exemption number
## LOCATION:  F990-PC-PART-00-SECTION-HC
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/GroupExemptionNumber'
V2 <- '//Return/ReturnData/IRS990/GroupExemptionNum'
V3 <- '//Return/ReturnData/IRS990/GroupExemptionNumber'
V4 <- '//Return/ReturnData/IRS990EZ/GroupExemptionNum'
V5 <- '//Return/ReturnData/IRS990EZ/GroupExemptionNumber'
V_GROUP_EXEMPT_NUM <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_GROUP_EXEMPT_NUM <- xml2::xml_text( xml2::xml_find_all( doc, V_GROUP_EXEMPT_NUM ) )
if( length( F9_00_GROUP_EXEMPT_NUM ) > 1 )
{ 
  create_record( varname=F9_00_GROUP_EXEMPT_NUM, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_GROUP_EXEMPT_NUM <-  paste0( '{', F9_00_GROUP_EXEMPT_NUM, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_RETURN_GROUP_X
## DESCRIPTION:  Group return for affiliates?
## LOCATION:  F990-PC-PART-00-SECTION-HA
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/GroupReturnForAffiliates'
V2 <- '//Return/ReturnData/IRS990/GroupReturn'
V3 <- '//Return/ReturnData/IRS990/GroupReturnForAffiliates'
V4 <- '//Return/ReturnData/IRS990/GroupReturnForAffiliatesInd'
V_RETURN_GROUP_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_RETURN_GROUP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RETURN_GROUP_X ) )
if( length( F9_00_RETURN_GROUP_X ) > 1 )
{ 
  create_record( varname=F9_00_RETURN_GROUP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_RETURN_GROUP_X <-  paste0( '{', F9_00_RETURN_GROUP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_RETURN_INITIAL_X
## DESCRIPTION:  Indicates this is an initial return
## LOCATION:  F990-PC-PART-00-SECTION-B
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/InitialReturn'
V2 <- '//Return/ReturnData/IRS990/InitialReturn'
V3 <- '//Return/ReturnData/IRS990/InitialReturnInd'
V4 <- '//Return/ReturnData/IRS990EZ/InitialReturn'
V5 <- '//Return/ReturnData/IRS990EZ/InitialReturnInd'
V_RETURN_INITIAL_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_RETURN_INITIAL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RETURN_INITIAL_X ) )
if( length( F9_00_RETURN_INITIAL_X ) > 1 )
{ 
  create_record( varname=F9_00_RETURN_INITIAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_RETURN_INITIAL_X <-  paste0( '{', F9_00_RETURN_INITIAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_NAME_ORG_L1
## DESCRIPTION:  Name Business - BusinessNameLine1
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NameOfPrincipalOfficer/NameBusiness/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990/Form990PartI/NameOfPrincipalOfficer/NameBusiness/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990/NameOfPrincipalOfficerBusiness/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990/PrincipalOfcrBusinessAddress/BusinessNameLine1'
V5 <- '//Return/ReturnData/IRS990/PrincipalOfcrBusinessAddress/BusinessNameLine1Txt'
V6 <- '//Return/ReturnData/IRS990/PrincipalOfcrBusinessName/BusinessNameLine1Txt'
V_PRIN_OFF_NAME_ORG_L1 <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_00_PRIN_OFF_NAME_ORG_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_NAME_ORG_L1 ) )
if( length( F9_00_PRIN_OFF_NAME_ORG_L1 ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_NAME_ORG_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_NAME_ORG_L1 <-  paste0( '{', F9_00_PRIN_OFF_NAME_ORG_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_NAME_PERS
## DESCRIPTION:  Name Of Principal Officer - Name - Person
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/NameOfPrincipalOfficer/NamePerson'
V2 <- '//Return/ReturnData/IRS990/NameOfPrincipalOfficerPerson'
V3 <- '//Return/ReturnData/IRS990/PrincipalOfficerNm'
V_PRIN_OFF_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
F9_00_PRIN_OFF_NAME_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_NAME_PERS ) )
if( length( F9_00_PRIN_OFF_NAME_PERS ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_NAME_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_NAME_PERS <-  paste0( '{', F9_00_PRIN_OFF_NAME_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_EXEMPT_STAT_4947A1_X
## DESCRIPTION:  Indicates a 4947(a)(1) organization
## LOCATION:  F990-PC-PART-00-SECTION-I
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/Organization4947a1'
V2 <- '//Return/ReturnData/IRS990/Organization4947a1'
V3 <- '//Return/ReturnData/IRS990/Organization4947a1NotPFInd'
V4 <- '//Return/ReturnData/IRS990EZ/Organization4947a1'
V5 <- '//Return/ReturnData/IRS990EZ/Organization4947a1NotPFInd'
V_EXEMPT_STAT_4947A1_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_EXEMPT_STAT_4947A1_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EXEMPT_STAT_4947A1_X ) )
if( length( F9_00_EXEMPT_STAT_4947A1_X ) > 1 )
{ 
  create_record( varname=F9_00_EXEMPT_STAT_4947A1_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_EXEMPT_STAT_4947A1_X <-  paste0( '{', F9_00_EXEMPT_STAT_4947A1_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_EXEMPT_STAT_501C_X
## DESCRIPTION:  Indicates a 501(c) organization
## LOCATION:  F990-PC-PART-00-SECTION-I
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/Organization501c'
V2 <- '//Return/ReturnData/IRS990/Organization501c'
V3 <- '//Return/ReturnData/IRS990/Organization501cInd'
V4 <- '//Return/ReturnData/IRS990EZ/Organization501c'
V5 <- '//Return/ReturnData/IRS990EZ/Organization501cInd'
V_EXEMPT_STAT_501C_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_EXEMPT_STAT_501C_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EXEMPT_STAT_501C_X ) )
if( length( F9_00_EXEMPT_STAT_501C_X ) > 1 )
{ 
  create_record( varname=F9_00_EXEMPT_STAT_501C_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_EXEMPT_STAT_501C_X <-  paste0( '{', F9_00_EXEMPT_STAT_501C_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_EXEMPT_STAT_527_X
## DESCRIPTION:  Indicates a 527 organization
## LOCATION:  F990-PC-PART-00-SECTION-I
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

F9_00_EXEMPT_STAT_527_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990/Form990PartI/Organization527' ) )
if( length( F9_00_EXEMPT_STAT_527_X ) > 1 )
{ 
  create_record( varname=F9_00_EXEMPT_STAT_527_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_EXEMPT_STAT_527_X <-  paste0( '{', F9_00_EXEMPT_STAT_527_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_LEGAL_DMCL_STATE
## DESCRIPTION:  State of legal domicile
## LOCATION:  F990-PC-PART-00-SECTION-M
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/StateLegalDomicile'
V2 <- '//Return/ReturnData/IRS990/LegalDomicileStateCd'
V3 <- '//Return/ReturnData/IRS990/StateLegalDomicile'
V_LEGAL_DMCL_STATE <- paste( V1, V2, V3 , sep='|' )
F9_00_LEGAL_DMCL_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_LEGAL_DMCL_STATE ) )
if( length( F9_00_LEGAL_DMCL_STATE ) > 1 )
{ 
  create_record( varname=F9_00_LEGAL_DMCL_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_LEGAL_DMCL_STATE <-  paste0( '{', F9_00_LEGAL_DMCL_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TYPE_ORG_ASSOC_X
## DESCRIPTION:  Type of organization - association
## LOCATION:  F990-PC-PART-00-SECTION-K
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TypeOfOrganizationAssociation'
V2 <- '//Return/ReturnData/IRS990/TypeOfOrganizationAssociation'
V3 <- '//Return/ReturnData/IRS990/TypeOfOrganizationAssocInd'
V4 <- '//Return/ReturnData/IRS990EZ/TypeOfOrganizationAssocInd'
V_TYPE_ORG_ASSOC_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_TYPE_ORG_ASSOC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TYPE_ORG_ASSOC_X ) )
if( length( F9_00_TYPE_ORG_ASSOC_X ) > 1 )
{ 
  create_record( varname=F9_00_TYPE_ORG_ASSOC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TYPE_ORG_ASSOC_X <-  paste0( '{', F9_00_TYPE_ORG_ASSOC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TYPE_ORG_CORP_X
## DESCRIPTION:  Type of organization - corporation
## LOCATION:  F990-PC-PART-00-SECTION-K
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TypeOfOrganizationCorporation'
V2 <- '//Return/ReturnData/IRS990/TypeOfOrganizationCorpInd'
V3 <- '//Return/ReturnData/IRS990/TypeOfOrganizationCorporation'
V4 <- '//Return/ReturnData/IRS990EZ/TypeOfOrganizationCorpInd'
V5 <- '//Return/ReturnData/IRS990EZ/TypeOfOrganizationCorporation'
V_TYPE_ORG_CORP_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_TYPE_ORG_CORP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TYPE_ORG_CORP_X ) )
if( length( F9_00_TYPE_ORG_CORP_X ) > 1 )
{ 
  create_record( varname=F9_00_TYPE_ORG_CORP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TYPE_ORG_CORP_X <-  paste0( '{', F9_00_TYPE_ORG_CORP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TYPE_ORG_OTH_X
## DESCRIPTION:  Type of organization - other
## LOCATION:  F990-PC-PART-00-SECTION-K
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TypeOfOrganizationOther'
V2 <- '//Return/ReturnData/IRS990/TypeOfOrganizationOther'
V3 <- '//Return/ReturnData/IRS990/TypeOfOrganizationOtherInd'
V4 <- '//Return/ReturnData/IRS990EZ/TypeOfOrganizationOtherInd'
V_TYPE_ORG_OTH_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_TYPE_ORG_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TYPE_ORG_OTH_X ) )
if( length( F9_00_TYPE_ORG_OTH_X ) > 1 )
{ 
  create_record( varname=F9_00_TYPE_ORG_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TYPE_ORG_OTH_X <-  paste0( '{', F9_00_TYPE_ORG_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TYPE_ORG_TRUST_X
## DESCRIPTION:  Type of organization - trust
## LOCATION:  F990-PC-PART-00-SECTION-K
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TypeOfOrganizationTrust'
V2 <- '//Return/ReturnData/IRS990/TypeOfOrganizationTrust'
V3 <- '//Return/ReturnData/IRS990/TypeOfOrganizationTrustInd'
V4 <- '//Return/ReturnData/IRS990EZ/TypeOfOrganizationTrustInd'
V_TYPE_ORG_TRUST_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_TYPE_ORG_TRUST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TYPE_ORG_TRUST_X ) )
if( length( F9_00_TYPE_ORG_TRUST_X ) > 1 )
{ 
  create_record( varname=F9_00_TYPE_ORG_TRUST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TYPE_ORG_TRUST_X <-  paste0( '{', F9_00_TYPE_ORG_TRUST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TYPE_ORG_OTH_DESC
## DESCRIPTION:  Type of organization - other description
## LOCATION:  F990-PC-PART-00-SECTION-K
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/TypeOfOrgOtherDescription'
V2 <- '//Return/ReturnData/IRS990/OtherOrganizationDsc'
V3 <- '//Return/ReturnData/IRS990/TypeOfOrgOtherDescription'
V4 <- '//Return/ReturnData/IRS990/TypeOfOrgOtherDescriptionInd'
V5 <- '//Return/ReturnData/IRS990EZ/TypeOfOrganizationOtherDesc'
V_TYPE_ORG_OTH_DESC <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_TYPE_ORG_OTH_DESC <- xml2::xml_text( xml2::xml_find_all( doc, V_TYPE_ORG_OTH_DESC ) )
if( length( F9_00_TYPE_ORG_OTH_DESC ) > 1 )
{ 
  create_record( varname=F9_00_TYPE_ORG_OTH_DESC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TYPE_ORG_OTH_DESC <-  paste0( '{', F9_00_TYPE_ORG_OTH_DESC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_WEBSITE
## DESCRIPTION:  Form990 Part I - Web site
## LOCATION:  F990-PC-PART-00-SECTION-J
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/WebSite'
V2 <- '//Return/ReturnData/IRS990/WebSite'
V3 <- '//Return/ReturnData/IRS990/WebsiteAddressTxt'
V4 <- '//Return/ReturnData/IRS990EZ/WebSite'
V5 <- '//Return/ReturnData/IRS990EZ/WebsiteAddressTxt'
V_ORG_WEBSITE <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_00_ORG_WEBSITE <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_WEBSITE ) )
if( length( F9_00_ORG_WEBSITE ) > 1 )
{ 
  create_record( varname=F9_00_ORG_WEBSITE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_WEBSITE <-  paste0( '{', F9_00_ORG_WEBSITE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_YEAR_FORMATION
## DESCRIPTION:  Year of formation
## LOCATION:  F990-PC-PART-00-SECTION-L
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartI/YearFormation'
V2 <- '//Return/ReturnData/IRS990/FormationYr'
V3 <- '//Return/ReturnData/IRS990/YearFormation'
V_YEAR_FORMATION <- paste( V1, V2, V3 , sep='|' )
F9_00_YEAR_FORMATION <- xml2::xml_text( xml2::xml_find_all( doc, V_YEAR_FORMATION ) )
if( length( F9_00_YEAR_FORMATION ) > 1 )
{ 
  create_record( varname=F9_00_YEAR_FORMATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_YEAR_FORMATION <-  paste0( '{', F9_00_YEAR_FORMATION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_PRIN_OFF_NAME_ORG_L2
## DESCRIPTION:  Name of Principal Officer (Business, Line 2)
## LOCATION:  F990-PC-PART-00-SECTION-F
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/NameOfPrincipalOfficerBusiness/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990/PrincipalOfcrBusinessAddress/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990/PrincipalOfcrBusinessAddress/BusinessNameLine2Txt'
V4 <- '//Return/ReturnData/IRS990/PrincipalOfcrBusinessName/BusinessNameLine2Txt'
V_PRIN_OFF_NAME_ORG_L2 <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_PRIN_OFF_NAME_ORG_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PRIN_OFF_NAME_ORG_L2 ) )
if( length( F9_00_PRIN_OFF_NAME_ORG_L2 ) > 1 )
{ 
  create_record( varname=F9_00_PRIN_OFF_NAME_ORG_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_PRIN_OFF_NAME_ORG_L2 <-  paste0( '{', F9_00_PRIN_OFF_NAME_ORG_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_EXEMPT_STAT_501C3_X
## DESCRIPTION:  Indicates a 501(c)(3) organization
## LOCATION:  F990-PC-PART-00-SECTION-I
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Organization501c3'
V2 <- '//Return/ReturnData/IRS990/Organization501c3Ind'
V3 <- '//Return/ReturnData/IRS990EZ/Organization501c3'
V4 <- '//Return/ReturnData/IRS990EZ/Organization501c3Ind'
V_EXEMPT_STAT_501C3_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_EXEMPT_STAT_501C3_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EXEMPT_STAT_501C3_X ) )
if( length( F9_00_EXEMPT_STAT_501C3_X ) > 1 )
{ 
  create_record( varname=F9_00_EXEMPT_STAT_501C3_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_EXEMPT_STAT_501C3_X <-  paste0( '{', F9_00_EXEMPT_STAT_501C3_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_SPECIAL_COND_DESC
## DESCRIPTION:  Special condition description
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/SpecialConditionDesc'
V2 <- '//Return/ReturnData/IRS990/SpecialConditionDescription'
V3 <- '//Return/ReturnData/IRS990EZ/SpecialConditionDesc'
V4 <- '//Return/ReturnData/IRS990EZ/SpecialConditionDescription'
V_SPECIAL_COND_DESC <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_SPECIAL_COND_DESC <- xml2::xml_text( xml2::xml_find_all( doc, V_SPECIAL_COND_DESC ) )
if( length( F9_00_SPECIAL_COND_DESC ) > 1 )
{ 
  create_record( varname=F9_00_SPECIAL_COND_DESC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_SPECIAL_COND_DESC <-  paste0( '{', F9_00_SPECIAL_COND_DESC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_L1
## DESCRIPTION:  Address of Filing Organization (US Line 1)
## LOCATION:  F990-EZ-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/USAddress/AddressLine1'
V2 <- '//Return/ReturnData/IRS990EZ/USAddress/AddressLine1Txt'
V3 <- '//Return/ReturnHeader/Filer/ForeignAddress/AddressLine1'
V4 <- '//Return/ReturnHeader/Filer/ForeignAddress/AddressLine1Txt'
V5 <- '//Return/ReturnHeader/Filer/USAddress/AddressLine1'
V6 <- '//Return/ReturnHeader/Filer/USAddress/AddressLine1Txt'
V_ORG_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_00_ORG_ADDR_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_L1 ) )
if( length( F9_00_ORG_ADDR_L1 ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_L1 <-  paste0( '{', F9_00_ORG_ADDR_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_CITY
## DESCRIPTION:  Address of Filing Organization (US City)
## LOCATION:  F990-EZ-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/USAddress/City'
V2 <- '//Return/ReturnData/IRS990EZ/USAddress/CityNm'
V3 <- '//Return/ReturnHeader/Filer/ForeignAddress/City'
V4 <- '//Return/ReturnHeader/Filer/ForeignAddress/CityNm'
V5 <- '//Return/ReturnHeader/Filer/USAddress/City'
V6 <- '//Return/ReturnHeader/Filer/USAddress/CityNm'
V_ORG_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_00_ORG_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_CITY ) )
if( length( F9_00_ORG_ADDR_CITY ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_CITY <-  paste0( '{', F9_00_ORG_ADDR_CITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_STATE
## DESCRIPTION:  Address of Filing Organization (US State)
## LOCATION:  F990-EZ-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/USAddress/State'
V2 <- '//Return/ReturnData/IRS990EZ/USAddress/StateAbbreviationCd'
V3 <- '//Return/ReturnHeader/Filer/ForeignAddress/ProvinceOrState'
V4 <- '//Return/ReturnHeader/Filer/ForeignAddress/ProvinceOrStateNm'
V5 <- '//Return/ReturnHeader/Filer/USAddress/State'
V6 <- '//Return/ReturnHeader/Filer/USAddress/StateAbbreviationCd'
V_ORG_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_00_ORG_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_STATE ) )
if( length( F9_00_ORG_ADDR_STATE ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_STATE <-  paste0( '{', F9_00_ORG_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_ZIP
## DESCRIPTION:  Address of Filing Organization (US Zip Code)
## LOCATION:  F990-EZ-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/USAddress/ZIPCd'
V2 <- '//Return/ReturnData/IRS990EZ/USAddress/ZIPCode'
V3 <- '//Return/ReturnHeader/Filer/ForeignAddress/ForeignPostalCd'
V4 <- '//Return/ReturnHeader/Filer/ForeignAddress/PostalCode'
V5 <- '//Return/ReturnHeader/Filer/USAddress/ZIPCd'
V6 <- '//Return/ReturnHeader/Filer/USAddress/ZIPCode'
V_ORG_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_00_ORG_ADDR_ZIP <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_ZIP ) )
if( length( F9_00_ORG_ADDR_ZIP ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_ZIP <-  paste0( '{', F9_00_ORG_ADDR_ZIP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_BUILD_TIME_STAMP
## DESCRIPTION:  Build time stamp - IRS internal field
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

F9_00_BUILD_TIME_STAMP <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/BuildTS' ) )
if( length( F9_00_BUILD_TIME_STAMP ) > 1 )
{ 
  create_record( varname=F9_00_BUILD_TIME_STAMP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_BUILD_TIME_STAMP <-  paste0( '{', F9_00_BUILD_TIME_STAMP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_NAME_L1
## DESCRIPTION:  Name of Filing Organization (line 1)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt'
V3 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine1'
V_ORG_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
F9_00_ORG_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_NAME_L1 ) )
if( length( F9_00_ORG_NAME_L1 ) > 1 )
{ 
  create_record( varname=F9_00_ORG_NAME_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_NAME_L1 <-  paste0( '{', F9_00_ORG_NAME_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_NAME_L2
## DESCRIPTION:  Name of Filing Organization (line 2)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2Txt'
V3 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine2'
V_ORG_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
F9_00_ORG_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_NAME_L2 ) )
if( length( F9_00_ORG_NAME_L2 ) > 1 )
{ 
  create_record( varname=F9_00_ORG_NAME_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_NAME_L2 <-  paste0( '{', F9_00_ORG_NAME_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_NAME_ORG_CTRL
## DESCRIPTION:  Name of Filing Organization (Control Text)
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/BusinessNameControlTxt'
V2 <- '//Return/ReturnHeader/Filer/NameControl'
V_NAME_ORG_CTRL <- paste( V1, V2 , sep='|' )
F9_00_NAME_ORG_CTRL <- xml2::xml_text( xml2::xml_find_all( doc, V_NAME_ORG_CTRL ) )
if( length( F9_00_NAME_ORG_CTRL ) > 1 )
{ 
  create_record( varname=F9_00_NAME_ORG_CTRL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_NAME_ORG_CTRL <-  paste0( '{', F9_00_NAME_ORG_CTRL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_EIN
## DESCRIPTION:  Orgainization Employer Identification Number (EIN)
## LOCATION:  F990-PC-PART-00-SECTION-D
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

F9_00_ORG_EIN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )
if( length( F9_00_ORG_EIN ) > 1 )
{ 
  create_record( varname=F9_00_ORG_EIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_EIN <-  paste0( '{', F9_00_ORG_EIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_L2
## DESCRIPTION:  Address of Filing Organization (Foreign Line 2)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/ForeignAddress/AddressLine2'
V2 <- '//Return/ReturnHeader/Filer/ForeignAddress/AddressLine2Txt'
V3 <- '//Return/ReturnHeader/Filer/USAddress/AddressLine2'
V4 <- '//Return/ReturnHeader/Filer/USAddress/AddressLine2Txt'
V_ORG_ADDR_L2 <- paste( V1, V2, V3, V4 , sep='|' )
F9_00_ORG_ADDR_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_L2 ) )
if( length( F9_00_ORG_ADDR_L2 ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_L2 <-  paste0( '{', F9_00_ORG_ADDR_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_ORG_ADDR_CNTR
## DESCRIPTION:  Address of Filing Organization (Foreign Country)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/ForeignAddress/Country'
V2 <- '//Return/ReturnHeader/Filer/ForeignAddress/CountryCd'
V_ORG_ADDR_CNTR <- paste( V1, V2 , sep='|' )
F9_00_ORG_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_ADDR_CNTR ) )
if( length( F9_00_ORG_ADDR_CNTR ) > 1 )
{ 
  create_record( varname=F9_00_ORG_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_ORG_ADDR_CNTR <-  paste0( '{', F9_00_ORG_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_RETURN_TIME_STAMP
## DESCRIPTION:  The date and time when the return was created
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnTs'
V2 <- '//Return/ReturnHeader/Timestamp'
V_RETURN_TIME_STAMP <- paste( V1, V2 , sep='|' )
F9_00_RETURN_TIME_STAMP <- xml2::xml_text( xml2::xml_find_all( doc, V_RETURN_TIME_STAMP ) )
if( length( F9_00_RETURN_TIME_STAMP ) > 1 )
{ 
  create_record( varname=F9_00_RETURN_TIME_STAMP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_RETURN_TIME_STAMP <-  paste0( '{', F9_00_RETURN_TIME_STAMP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
V_RETURN_TYPE <- paste( V1, V2 , sep='|' )
F9_00_RETURN_TYPE <- xml2::xml_text( xml2::xml_find_all( doc, V_RETURN_TYPE ) )
if( length( F9_00_RETURN_TYPE ) > 1 )
{ 
  create_record( varname=F9_00_RETURN_TYPE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_RETURN_TYPE <-  paste0( '{', F9_00_RETURN_TYPE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TAX_PERIOD_BEGIN_DATE
## DESCRIPTION:  Tax period begin date
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxPeriodBeginDate'
V2 <- '//Return/ReturnHeader/TaxPeriodBeginDt'
V_TAX_PERIOD_BEGIN_DATE <- paste( V1, V2 , sep='|' )
F9_00_TAX_PERIOD_BEGIN_DATE <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_PERIOD_BEGIN_DATE ) )
if( length( F9_00_TAX_PERIOD_BEGIN_DATE ) > 1 )
{ 
  create_record( varname=F9_00_TAX_PERIOD_BEGIN_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TAX_PERIOD_BEGIN_DATE <-  paste0( '{', F9_00_TAX_PERIOD_BEGIN_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TAX_PERIOD_END_DATE
## DESCRIPTION:  Tax period end date
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxPeriodEndDate'
V2 <- '//Return/ReturnHeader/TaxPeriodEndDt'
V_TAX_PERIOD_END_DATE <- paste( V1, V2 , sep='|' )
F9_00_TAX_PERIOD_END_DATE <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_PERIOD_END_DATE ) )
if( length( F9_00_TAX_PERIOD_END_DATE ) > 1 )
{ 
  create_record( varname=F9_00_TAX_PERIOD_END_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TAX_PERIOD_END_DATE <-  paste0( '{', F9_00_TAX_PERIOD_END_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_00_TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
V_TAX_YEAR <- paste( V1, V2 , sep='|' )
F9_00_TAX_YEAR <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_YEAR ) )
if( length( F9_00_TAX_YEAR ) > 1 )
{ 
  create_record( varname=F9_00_TAX_YEAR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_00_TAX_YEAR <-  paste0( '{', F9_00_TAX_YEAR, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_00_IRS_TRUST_CUSTOMER_X,F9_00_IRS_RESP_PARTY_INFO_CURR_X,F9_00_IRS_TRUST_AUTENTICATED_X,F9_00_IRS_TRUST_IDENTITY_X,F9_00_IRS_SEC_DEVICE_ID,F9_00_IRS_SEC_IP_ADDR,F9_00_IRS_SEC_FILING_LIC_TYPE,F9_00_IRS_SEC_IP_DATE,F9_00_IRS_SEC_IP_TIME,F9_00_IRS_SEC_IP_TIME_ZONE,F9_00_IRS_TRUST_FED_ASSURANCE_X,F9_00_IRS_TRUST_OOB_VERIFIED_X,F9_00_IRS_TRUST_RQR_OOB_X,F9_00_IRS_SEC_SUBMISSION_ID,F9_00_REASONABLE_CAUSE_TXT,F9_00_ORG_PHONE,F9_00_IRS_TRUST_PW_CHANGE_X,F9_00_GRO_RCPT_LT50K_X,F9_00_ORG_NAME_CHANGE_X,F9_00_ORG_ADDR_IN_CARE_OF,F9_00_APPLICATION_PEND_X,F9_00_DISASTER_RELIEF,F9_00_IRS_TRUST_PROFILE_CHANGE_X,F9_02_PREP_PERS_SSN,F9_00_IRS_TRUST_USRNAME_CHANGE_X,F9_00_FORM_ADDR_CHANGE_X,F9_00_PRIN_OFF_ADDR_L1,F9_00_PRIN_OFF_ADDR_L2,F9_00_PRIN_OFF_ADDR_CITY,F9_00_PRIN_OFF_ADDR_CNTR,F9_00_PRIN_OFF_ADDR_ZIP,F9_00_PRIN_OFF_ADDR_STATE,F9_00_ALL_AFFIL_INCL_X,F9_00_RETURN_AMENDED_X,F9_00_LEGAL_DMCL_CNTR,F9_00_ORG_NAME_DBA_L1,F9_00_ORG_NAME_DBA_L2,F9_00_RETURN_FINAL_X,F9_00_GRO_RCPT,F9_00_GROUP_EXEMPT_NUM,F9_00_RETURN_GROUP_X,F9_00_RETURN_INITIAL_X,F9_00_PRIN_OFF_NAME_ORG_L1,F9_00_PRIN_OFF_NAME_PERS,F9_00_EXEMPT_STAT_4947A1_X,F9_00_EXEMPT_STAT_501C_X,F9_00_EXEMPT_STAT_527_X,F9_00_LEGAL_DMCL_STATE,F9_00_TYPE_ORG_ASSOC_X,F9_00_TYPE_ORG_CORP_X,F9_00_TYPE_ORG_OTH_X,F9_00_TYPE_ORG_TRUST_X,F9_00_TYPE_ORG_OTH_DESC,F9_00_ORG_WEBSITE,F9_00_YEAR_FORMATION,F9_00_PRIN_OFF_NAME_ORG_L2,F9_00_EXEMPT_STAT_501C3_X,F9_00_SPECIAL_COND_DESC,F9_00_ORG_ADDR_L1,F9_00_ORG_ADDR_CITY,F9_00_ORG_ADDR_STATE,F9_00_ORG_ADDR_ZIP,F9_00_BUILD_TIME_STAMP,F9_00_ORG_NAME_L1,F9_00_ORG_NAME_L2,F9_00_NAME_ORG_CTRL,F9_00_ORG_EIN,F9_00_ORG_ADDR_L2,F9_00_ORG_ADDR_CNTR,F9_00_RETURN_TIME_STAMP,F9_00_RETURN_TYPE,F9_00_TAX_PERIOD_BEGIN_DATE,F9_00_TAX_PERIOD_END_DATE,F9_00_TAX_YEAR)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


