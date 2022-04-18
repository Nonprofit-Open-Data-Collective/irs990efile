#' @title 
#'   Build table F9-P06-T00-GOVERNANCE
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P06_T00_GOVERNANCE <- function( doc, url )
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


## VARIABLE NAME:  F9_06_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part VI
## LOCATION:  F990-EZ-PART-05-LINE-00
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartVI'
V2 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartVIInd'
V3 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVI'
V4 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVIInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_06_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_06_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_06_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_INFO_SCHED_O_X <-  paste0( '{', F9_06_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_NUM_VOTING_MEMB
## DESCRIPTION:  Number of voting governing body members
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-01A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/NbrVotingGoverningBodyMembers'
V2 <- '//Return/ReturnData/IRS990/GoverningBodyVotingMembersCnt'
V3 <- '//Return/ReturnData/IRS990/NbrVotingGoverningBodyMembers'
V_GVRN_NUM_VOTING_MEMB <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_NUM_VOTING_MEMB <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_NUM_VOTING_MEMB ) )
if( length( F9_06_GVRN_NUM_VOTING_MEMB ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_NUM_VOTING_MEMB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_NUM_VOTING_MEMB <-  paste0( '{', F9_06_GVRN_NUM_VOTING_MEMB, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_NUM_VOTING_MEMB_IND
## DESCRIPTION:  Number of independent voting members
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-01B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/NumberIndependentVotingMembers'
V2 <- '//Return/ReturnData/IRS990/IndependentVotingMemberCnt'
V3 <- '//Return/ReturnData/IRS990/NumberIndependentVotingMembers'
V_GVRN_NUM_VOTING_MEMB_IND <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_NUM_VOTING_MEMB_IND <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_NUM_VOTING_MEMB_IND ) )
if( length( F9_06_GVRN_NUM_VOTING_MEMB_IND ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_NUM_VOTING_MEMB_IND, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_NUM_VOTING_MEMB_IND <-  paste0( '{', F9_06_GVRN_NUM_VOTING_MEMB_IND, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_DTK_FAMBIZ_RELATION_X
## DESCRIPTION:  Officer, director, trustee, or key employee has family or business relationship with other officer, directore, trustee, or key employee?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-02
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FamilyOrBusinessRelationship'
V2 <- '//Return/ReturnData/IRS990/FamilyOrBusinessRlnInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/FamilyOrBusinessRelationship'
V_GVRN_DTK_FAMBIZ_RELATION_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_DTK_FAMBIZ_RELATION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_DTK_FAMBIZ_RELATION_X ) )
if( length( F9_06_GVRN_DTK_FAMBIZ_RELATION_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_DTK_FAMBIZ_RELATION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_DTK_FAMBIZ_RELATION_X <-  paste0( '{', F9_06_GVRN_DTK_FAMBIZ_RELATION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_DELEGATE_MGMT_DUTY_X
## DESCRIPTION:  Delegation of management duties?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-03
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DelegationOfManagementDuties'
V2 <- '//Return/ReturnData/IRS990/DelegationOfMgmtDutiesInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/DelegationOfManagementDuties'
V_GVRN_DELEGATE_MGMT_DUTY_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_DELEGATE_MGMT_DUTY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_DELEGATE_MGMT_DUTY_X ) )
if( length( F9_06_GVRN_DELEGATE_MGMT_DUTY_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_DELEGATE_MGMT_DUTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_DELEGATE_MGMT_DUTY_X <-  paste0( '{', F9_06_GVRN_DELEGATE_MGMT_DUTY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_CHANGE_DOC_X
## DESCRIPTION:  Were any changes made in the organizing or governing documents but not reported to the IRS?
## LOCATION:  F990-EZ-PART-05-LINE-34
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/MadeChangesToOrgnzngEtcDoc'
V2 <- '//Return/ReturnData/IRS990EZ/ChgMadeToOrgnzngDocNotRptInd'
V3 <- '//Return/ReturnData/IRS990/ChangesToOrganizingDocs'
V4 <- '//Return/ReturnData/IRS990/ChangeToOrgDocumentsInd'
V5 <- '//Return/ReturnData/IRS990/Form990PartVI/ChangesToOrganizingDocs'
V_GVRN_CHANGE_DOC_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_06_GVRN_CHANGE_DOC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_CHANGE_DOC_X ) )
if( length( F9_06_GVRN_CHANGE_DOC_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_CHANGE_DOC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_CHANGE_DOC_X <-  paste0( '{', F9_06_GVRN_CHANGE_DOC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_ASSET_DIVERSION_X
## DESCRIPTION:  Material diversion or misuse?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-05
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/MaterialDiversionOrMisuse'
V2 <- '//Return/ReturnData/IRS990/MaterialDiversionOrMisuse'
V3 <- '//Return/ReturnData/IRS990/MaterialDiversionOrMisuseInd'
V_GVRN_ASSET_DIVERSION_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_ASSET_DIVERSION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_ASSET_DIVERSION_X ) )
if( length( F9_06_GVRN_ASSET_DIVERSION_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_ASSET_DIVERSION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_ASSET_DIVERSION_X <-  paste0( '{', F9_06_GVRN_ASSET_DIVERSION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_MEMB_STCKHLDR_X
## DESCRIPTION:  Members or stockholders?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-06
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/MembersOrStockholders'
V2 <- '//Return/ReturnData/IRS990/MembersOrStockholders'
V3 <- '//Return/ReturnData/IRS990/MembersOrStockholdersInd'
V_GVRN_MEMB_STCKHLDR_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_MEMB_STCKHLDR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_MEMB_STCKHLDR_X ) )
if( length( F9_06_GVRN_MEMB_STCKHLDR_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_MEMB_STCKHLDR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_MEMB_STCKHLDR_X <-  paste0( '{', F9_06_GVRN_MEMB_STCKHLDR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_PERS_ELECT_MEMB_X
## DESCRIPTION:  Organization has persons who had power to elect or appoint board members?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-07A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ElectionOfBoardMembers'
V2 <- '//Return/ReturnData/IRS990/ElectionOfBoardMembersInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/ElectionOfBoardMembers'
V_GVRN_PERS_ELECT_MEMB_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_PERS_ELECT_MEMB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_PERS_ELECT_MEMB_X ) )
if( length( F9_06_GVRN_PERS_ELECT_MEMB_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_PERS_ELECT_MEMB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_PERS_ELECT_MEMB_X <-  paste0( '{', F9_06_GVRN_PERS_ELECT_MEMB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_DECISION_APPROV_X
## DESCRIPTION:  Governance decisions subject to approval by others outside governing body?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-07B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DecisionsSubjectToApprovaInd'
V2 <- '//Return/ReturnData/IRS990/DecisionsSubjectToApproval'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/DecisionsSubjectToApproval'
V_GVRN_DECISION_APPROV_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_DECISION_APPROV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_DECISION_APPROV_X ) )
if( length( F9_06_GVRN_DECISION_APPROV_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_DECISION_APPROV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_DECISION_APPROV_X <-  paste0( '{', F9_06_GVRN_DECISION_APPROV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_DOC_GVRN_BODY_X
## DESCRIPTION:  Minutes of governing body?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-08A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/MinutesOfGoverningBody'
V2 <- '//Return/ReturnData/IRS990/MinutesOfGoverningBody'
V3 <- '//Return/ReturnData/IRS990/MinutesOfGoverningBodyInd'
V_GVRN_DOC_GVRN_BODY_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_DOC_GVRN_BODY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_DOC_GVRN_BODY_X ) )
if( length( F9_06_GVRN_DOC_GVRN_BODY_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_DOC_GVRN_BODY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_DOC_GVRN_BODY_X <-  paste0( '{', F9_06_GVRN_DOC_GVRN_BODY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_DOC_COMMITTEE_X
## DESCRIPTION:  Minutes of committees?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-08B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/MinutesOfCommittees'
V2 <- '//Return/ReturnData/IRS990/MinutesOfCommittees'
V3 <- '//Return/ReturnData/IRS990/MinutesOfCommitteesInd'
V_GVRN_DOC_COMMITTEE_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_DOC_COMMITTEE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_DOC_COMMITTEE_X ) )
if( length( F9_06_GVRN_DOC_COMMITTEE_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_DOC_COMMITTEE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_DOC_COMMITTEE_X <-  paste0( '{', F9_06_GVRN_DOC_COMMITTEE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_GVRN_DTK_NO_MAILING_ADDR_X
## DESCRIPTION:  Officer mailing address?
## LOCATION:  F990-PC-PART-06-SECTION-A-LINE-09
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/OfficerMailingAddress'
V2 <- '//Return/ReturnData/IRS990/OfficerMailingAddress'
V3 <- '//Return/ReturnData/IRS990/OfficerMailingAddressInd'
V_GVRN_DTK_NO_MAILING_ADDR_X <- paste( V1, V2, V3 , sep='|' )
F9_06_GVRN_DTK_NO_MAILING_ADDR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GVRN_DTK_NO_MAILING_ADDR_X ) )
if( length( F9_06_GVRN_DTK_NO_MAILING_ADDR_X ) > 1 )
{ 
  create_record( varname=F9_06_GVRN_DTK_NO_MAILING_ADDR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_GVRN_DTK_NO_MAILING_ADDR_X <-  paste0( '{', F9_06_GVRN_DTK_NO_MAILING_ADDR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_CHPTR_AFFIL_X
## DESCRIPTION:  Local chapters?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-10A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/LocalChapters'
V2 <- '//Return/ReturnData/IRS990/LocalChapters'
V3 <- '//Return/ReturnData/IRS990/LocalChaptersInd'
V_POLICY_CHPTR_AFFIL_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_CHPTR_AFFIL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_CHPTR_AFFIL_X ) )
if( length( F9_06_POLICY_CHPTR_AFFIL_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_CHPTR_AFFIL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_CHPTR_AFFIL_X <-  paste0( '{', F9_06_POLICY_CHPTR_AFFIL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_CHPTR_REFERENCE_X
## DESCRIPTION:  Policies reference chapters?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-10B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/PoliciesReferenceChapters'
V2 <- '//Return/ReturnData/IRS990/PoliciesReferenceChapters'
V3 <- '//Return/ReturnData/IRS990/PoliciesReferenceChaptersInd'
V_POLICY_CHPTR_REFERENCE_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_CHPTR_REFERENCE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_CHPTR_REFERENCE_X ) )
if( length( F9_06_POLICY_CHPTR_REFERENCE_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_CHPTR_REFERENCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_CHPTR_REFERENCE_X <-  paste0( '{', F9_06_POLICY_CHPTR_REFERENCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_FORM990_GVRN_BODY_X
## DESCRIPTION:  Form 990 provided to governing body?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-11A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/Form990ProvidedToGoverningBody'
V2 <- '//Return/ReturnData/IRS990/Form990ProvidedToGoverningBody'
V3 <- '//Return/ReturnData/IRS990/Form990ProvidedToGvrnBodyInd'
V_POLICY_FORM990_GVRN_BODY_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_FORM990_GVRN_BODY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_FORM990_GVRN_BODY_X ) )
if( length( F9_06_POLICY_FORM990_GVRN_BODY_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_FORM990_GVRN_BODY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_FORM990_GVRN_BODY_X <-  paste0( '{', F9_06_POLICY_FORM990_GVRN_BODY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_COI_X
## DESCRIPTION:  Organization have conflict of interest policy?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-12A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConflictOfInterestPolicy'
V2 <- '//Return/ReturnData/IRS990/ConflictOfInterestPolicyInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/ConflictOfInterestPolicy'
V_POLICY_COI_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_COI_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_COI_X ) )
if( length( F9_06_POLICY_COI_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_COI_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_COI_X <-  paste0( '{', F9_06_POLICY_COI_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_COI_DISCLOSURE_X
## DESCRIPTION:  Annual disclosure of interests by covered persons?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-12B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AnnualDisclosureCoveredPersons'
V2 <- '//Return/ReturnData/IRS990/AnnualDisclosureCoveredPrsnInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/AnnualDisclosureCoveredPersons'
V_POLICY_COI_DISCLOSURE_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_COI_DISCLOSURE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_COI_DISCLOSURE_X ) )
if( length( F9_06_POLICY_COI_DISCLOSURE_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_COI_DISCLOSURE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_COI_DISCLOSURE_X <-  paste0( '{', F9_06_POLICY_COI_DISCLOSURE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_COI_MONITOR_X
## DESCRIPTION:  Regular monitoring and enforcement?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-12C
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/RegularMonitoringEnforcement'
V2 <- '//Return/ReturnData/IRS990/RegularMonitoringEnforcement'
V3 <- '//Return/ReturnData/IRS990/RegularMonitoringEnfrcInd'
V_POLICY_COI_MONITOR_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_COI_MONITOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_COI_MONITOR_X ) )
if( length( F9_06_POLICY_COI_MONITOR_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_COI_MONITOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_COI_MONITOR_X <-  paste0( '{', F9_06_POLICY_COI_MONITOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_WHSTLBLWR_X
## DESCRIPTION:  Whistleblower policy?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-13
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/WhistleblowerPolicy'
V2 <- '//Return/ReturnData/IRS990/WhistleblowerPolicy'
V3 <- '//Return/ReturnData/IRS990/WhistleblowerPolicyInd'
V_POLICY_WHSTLBLWR_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_WHSTLBLWR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_WHSTLBLWR_X ) )
if( length( F9_06_POLICY_WHSTLBLWR_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_WHSTLBLWR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_WHSTLBLWR_X <-  paste0( '{', F9_06_POLICY_WHSTLBLWR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_DOC_RETENTION_X
## DESCRIPTION:  Organization has written document retention policy?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-14
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DocumentRetentionPolicy'
V2 <- '//Return/ReturnData/IRS990/DocumentRetentionPolicyInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/DocumentRetentionPolicy'
V_POLICY_DOC_RETENTION_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_DOC_RETENTION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_DOC_RETENTION_X ) )
if( length( F9_06_POLICY_DOC_RETENTION_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_DOC_RETENTION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_DOC_RETENTION_X <-  paste0( '{', F9_06_POLICY_DOC_RETENTION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_COMP_PROCESS_CEO_X
## DESCRIPTION:  Compensation process CEO?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-15A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompensationProcessCEO'
V2 <- '//Return/ReturnData/IRS990/CompensationProcessCEOInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/CompensationProcessCEO'
V_POLICY_COMP_PROCESS_CEO_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_COMP_PROCESS_CEO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_COMP_PROCESS_CEO_X ) )
if( length( F9_06_POLICY_COMP_PROCESS_CEO_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_COMP_PROCESS_CEO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_COMP_PROCESS_CEO_X <-  paste0( '{', F9_06_POLICY_COMP_PROCESS_CEO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_COMP_PROCESS_OTH_X
## DESCRIPTION:  Compensation process other?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-15B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompensationProcessOther'
V2 <- '//Return/ReturnData/IRS990/CompensationProcessOtherInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/CompensationProcessOther'
V_POLICY_COMP_PROCESS_OTH_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_COMP_PROCESS_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_COMP_PROCESS_OTH_X ) )
if( length( F9_06_POLICY_COMP_PROCESS_OTH_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_COMP_PROCESS_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_COMP_PROCESS_OTH_X <-  paste0( '{', F9_06_POLICY_COMP_PROCESS_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_JV_X
## DESCRIPTION:  Investment in joint venture?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-16A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/InvestmentInJointVenture'
V2 <- '//Return/ReturnData/IRS990/InvestmentInJointVenture'
V3 <- '//Return/ReturnData/IRS990/InvestmentInJointVentureInd'
V_POLICY_JV_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_JV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_JV_X ) )
if( length( F9_06_POLICY_JV_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_JV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_JV_X <-  paste0( '{', F9_06_POLICY_JV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLICY_JV_PROC_X
## DESCRIPTION:  Written policy or procedure?
## LOCATION:  F990-PC-PART-06-SECTION-B-LINE-16B
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/WrittenPolicyOrProcedure'
V2 <- '//Return/ReturnData/IRS990/WrittenPolicyOrProcedure'
V3 <- '//Return/ReturnData/IRS990/WrittenPolicyOrProcedureInd'
V_POLICY_JV_PROC_X <- paste( V1, V2, V3 , sep='|' )
F9_06_POLICY_JV_PROC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_JV_PROC_X ) )
if( length( F9_06_POLICY_JV_PROC_X ) > 1 )
{ 
  create_record( varname=F9_06_POLICY_JV_PROC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLICY_JV_PROC_X <-  paste0( '{', F9_06_POLICY_JV_PROC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_STATES_FILED
## DESCRIPTION:  States where return filed
## LOCATION:  F990-EZ-PART-05-LINE-41
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/StatesWhereCopyOfReturnIsFiled'
V2 <- '//Return/ReturnData/IRS990EZ/StatesWhereCopyOfReturnIsFldCd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/StatesWhereCopyOfReturnIsFiled'
V4 <- '//Return/ReturnData/IRS990/StatesWhereCopyOfReturnIsFiled'
V5 <- '//Return/ReturnData/IRS990/StatesWhereCopyOfReturnIsFldCd'
V_DISCLOSURE_STATES_FILED <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_06_DISCLOSURE_STATES_FILED <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_STATES_FILED ) )
if( length( F9_06_DISCLOSURE_STATES_FILED ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_STATES_FILED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_STATES_FILED <-  paste0( '{', F9_06_DISCLOSURE_STATES_FILED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_AVBL_OTH_WEB_X
## DESCRIPTION:  Form990 Part VI - Other website
## LOCATION:  F990-PC-PART-06-SECTION-C-LINE-18
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/OtherWebsite'
V2 <- '//Return/ReturnData/IRS990/OtherWebsite'
V3 <- '//Return/ReturnData/IRS990/OtherWebsiteInd'
V_DISCLOSURE_AVBL_OTH_WEB_X <- paste( V1, V2, V3 , sep='|' )
F9_06_DISCLOSURE_AVBL_OTH_WEB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_AVBL_OTH_WEB_X ) )
if( length( F9_06_DISCLOSURE_AVBL_OTH_WEB_X ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_AVBL_OTH_WEB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_AVBL_OTH_WEB_X <-  paste0( '{', F9_06_DISCLOSURE_AVBL_OTH_WEB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_AVBL_OTH_X
## DESCRIPTION:  Form available Other (explain in Schedule O)
## LOCATION:  F990-PC-PART-06-SECTION-C-LINE-18
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

F9_06_DISCLOSURE_AVBL_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990/OtherInd' ) )
if( length( F9_06_DISCLOSURE_AVBL_OTH_X ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_AVBL_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_AVBL_OTH_X <-  paste0( '{', F9_06_DISCLOSURE_AVBL_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_AVBL_OWN_WEB_X
## DESCRIPTION:  Form990 Part VI - Own website
## LOCATION:  F990-PC-PART-06-SECTION-C-LINE-18
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVI/OwnWebsite'
V2 <- '//Return/ReturnData/IRS990/OwnWebsite'
V3 <- '//Return/ReturnData/IRS990/OwnWebsiteInd'
V_DISCLOSURE_AVBL_OWN_WEB_X <- paste( V1, V2, V3 , sep='|' )
F9_06_DISCLOSURE_AVBL_OWN_WEB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_AVBL_OWN_WEB_X ) )
if( length( F9_06_DISCLOSURE_AVBL_OWN_WEB_X ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_AVBL_OWN_WEB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_AVBL_OWN_WEB_X <-  paste0( '{', F9_06_DISCLOSURE_AVBL_OWN_WEB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_AVBL_REQUEST_X
## DESCRIPTION:  Form available upon request
## LOCATION:  F990-PC-PART-06-SECTION-C-LINE-18
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/UponRequest'
V2 <- '//Return/ReturnData/IRS990/UponRequestInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVI/UponRequest'
V_DISCLOSURE_AVBL_REQUEST_X <- paste( V1, V2, V3 , sep='|' )
F9_06_DISCLOSURE_AVBL_REQUEST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_AVBL_REQUEST_X ) )
if( length( F9_06_DISCLOSURE_AVBL_REQUEST_X ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_AVBL_REQUEST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_AVBL_REQUEST_X <-  paste0( '{', F9_06_DISCLOSURE_AVBL_REQUEST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_ADDR_CITY
## DESCRIPTION:  Person who possesses the organization's books and records: foreign address, city
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/City'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/CityNm'
V3 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/City'
V4 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/CityNm'
V5 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressForeign/City'
V6 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressUS/City'
V7 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/City'
V8 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/CityNm'
V9 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/City'
V10 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/CityNm'
V11 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressForeign/City'
V12 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressUS/City'
V13 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressForeign/City'
V14 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressUS/City'
V_DISCLOSURE_BOOK_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 , sep='|' )
F9_06_DISCLOSURE_BOOK_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_ADDR_CITY ) )
if( length( F9_06_DISCLOSURE_BOOK_ADDR_CITY ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_ADDR_CITY <-  paste0( '{', F9_06_DISCLOSURE_BOOK_ADDR_CITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_ADDR_CNTR
## DESCRIPTION:  Person who possesses the organization's books and records: foreign address, country
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/Country'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/CountryCd'
V3 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressForeign/Country'
V4 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressForeign/Country'
V5 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/Country'
V6 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressForeign/Country'
V_DISCLOSURE_BOOK_ADDR_CNTR <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_06_DISCLOSURE_BOOK_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_ADDR_CNTR ) )
if( length( F9_06_DISCLOSURE_BOOK_ADDR_CNTR ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_ADDR_CNTR <-  paste0( '{', F9_06_DISCLOSURE_BOOK_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_ADDR_L1
## DESCRIPTION:  Person who possesses the organization's books and records: foreign address, address line 1
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/AddressLine1'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/AddressLine1Txt'
V3 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/AddressLine1'
V4 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/AddressLine1Txt'
V5 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressForeign/AddressLine1'
V6 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressUS/AddressLine1'
V7 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/AddressLine1'
V8 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/AddressLine1Txt'
V9 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/AddressLine1'
V10 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/AddressLine1Txt'
V11 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressForeign/AddressLine1'
V12 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressUS/AddressLine1'
V13 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressForeign/AddressLine1'
V14 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressUS/AddressLine1'
V_DISCLOSURE_BOOK_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 , sep='|' )
F9_06_DISCLOSURE_BOOK_ADDR_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_ADDR_L1 ) )
if( length( F9_06_DISCLOSURE_BOOK_ADDR_L1 ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_ADDR_L1 <-  paste0( '{', F9_06_DISCLOSURE_BOOK_ADDR_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_ADDR_L2
## DESCRIPTION:  Person who possesses the organization's books and records: foreign address, address line 2
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/AddressLine2'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/AddressLine2Txt'
V3 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/AddressLine2'
V4 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/AddressLine2Txt'
V5 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressForeign/AddressLine2'
V6 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressUS/AddressLine2'
V7 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/AddressLine2'
V8 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/AddressLine2Txt'
V9 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/AddressLine2'
V10 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/AddressLine2Txt'
V11 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressForeign/AddressLine2'
V12 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressUS/AddressLine2'
V13 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressForeign/AddressLine2'
V14 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressUS/AddressLine2'
V_DISCLOSURE_BOOK_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 , sep='|' )
F9_06_DISCLOSURE_BOOK_ADDR_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_ADDR_L2 ) )
if( length( F9_06_DISCLOSURE_BOOK_ADDR_L2 ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_ADDR_L2 <-  paste0( '{', F9_06_DISCLOSURE_BOOK_ADDR_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_ADDR_STATE
## DESCRIPTION:  Person who possesses the organization's books and records: foreign address, provice or state
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/ProvinceOrState'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm'
V3 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/State'
V4 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/StateAbbreviationCd'
V5 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressForeign/ProvinceOrState'
V6 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressUS/State'
V7 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/CountryCd'
V8 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/ProvinceOrState'
V9 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm'
V10 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/State'
V11 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/StateAbbreviationCd'
V12 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressForeign/ProvinceOrState'
V13 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressUS/State'
V14 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressForeign/ProvinceOrState'
V15 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressUS/State'
V_DISCLOSURE_BOOK_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14, V15 , sep='|' )
F9_06_DISCLOSURE_BOOK_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_ADDR_STATE ) )
if( length( F9_06_DISCLOSURE_BOOK_ADDR_STATE ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_ADDR_STATE <-  paste0( '{', F9_06_DISCLOSURE_BOOK_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_ADDR_ZIP
## DESCRIPTION:  Person who possesses the organization's books and records: foreign address, postal code
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/ForeignPostalCd'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/ForeignAddress/PostalCode'
V3 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/ZIPCd'
V4 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/USAddress/ZIPCode'
V5 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressForeign/PostalCode'
V6 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/AddressUS/ZIPCode'
V7 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/ForeignPostalCd'
V8 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/ForeignAddress/PostalCode'
V9 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/ZIPCd'
V10 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/USAddress/ZIPCode'
V11 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressForeign/PostalCode'
V12 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/AddressUS/ZIPCode'
V13 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressForeign/PostalCode'
V14 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/AddressUS/ZIPCode'
V_DISCLOSURE_BOOK_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13, V14 , sep='|' )
F9_06_DISCLOSURE_BOOK_ADDR_ZIP <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_ADDR_ZIP ) )
if( length( F9_06_DISCLOSURE_BOOK_ADDR_ZIP ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_ADDR_ZIP <-  paste0( '{', F9_06_DISCLOSURE_BOOK_ADDR_ZIP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_NAME_L1
## DESCRIPTION:  Business who possesses the organization's books and records: name, line 1
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt'
V3 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/NameBusiness/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/BusinessName/BusinessNameLine1'
V5 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt'
V6 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/NameBusiness/BusinessNameLine1'
V7 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/NameBusiness/BusinessNameLine1'
V_DISCLOSURE_BOOK_NAME_L1 <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_06_DISCLOSURE_BOOK_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_NAME_L1 ) )
if( length( F9_06_DISCLOSURE_BOOK_NAME_L1 ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_NAME_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_NAME_L1 <-  paste0( '{', F9_06_DISCLOSURE_BOOK_NAME_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_NAME_L2
## DESCRIPTION:  Business who possesses the organization's books and records: name, line 2
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt'
V3 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2'
V4 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/BusinessName/BusinessNameLine2'
V5 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt'
V6 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2'
V7 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/NameBusiness/BusinessNameLine2'
V_DISCLOSURE_BOOK_NAME_L2 <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_06_DISCLOSURE_BOOK_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_NAME_L2 ) )
if( length( F9_06_DISCLOSURE_BOOK_NAME_L2 ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_NAME_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_NAME_L2 <-  paste0( '{', F9_06_DISCLOSURE_BOOK_NAME_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_NAME_PERS
## DESCRIPTION:  Person who possesses the organization's books and records: name
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/PersonNm'
V2 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/NamePerson'
V3 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/PersonNm'
V4 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/NamePerson'
V5 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/NamePerson'
V_DISCLOSURE_BOOK_NAME_PERS <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_06_DISCLOSURE_BOOK_NAME_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_NAME_PERS ) )
if( length( F9_06_DISCLOSURE_BOOK_NAME_PERS ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_NAME_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_NAME_PERS <-  paste0( '{', F9_06_DISCLOSURE_BOOK_NAME_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_DISCLOSURE_BOOK_PHONE
## DESCRIPTION:  Person who possesses the organization's books and records: telephone number
## LOCATION:  F990-EZ-PART-05-LINE-42A
## TABLE:  F9-P06-T00-GOVERNANCE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/BooksInCareOfDetail/PhoneNum'
V2 <- '//Return/ReturnData/IRS990EZ/TheBooksAreInCareOf/TelephoneNumber'
V3 <- '//Return/ReturnData/IRS990/BooksInCareOfDetail/PhoneNum'
V4 <- '//Return/ReturnData/IRS990/Form990PartVI/TheBooksAreInCareOf/TelephoneNumber'
V5 <- '//Return/ReturnData/IRS990/TheBooksAreInCareOf/TelephoneNumber'
V_DISCLOSURE_BOOK_PHONE <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_06_DISCLOSURE_BOOK_PHONE <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCLOSURE_BOOK_PHONE ) )
if( length( F9_06_DISCLOSURE_BOOK_PHONE ) > 1 )
{ 
  create_record( varname=F9_06_DISCLOSURE_BOOK_PHONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_DISCLOSURE_BOOK_PHONE <-  paste0( '{', F9_06_DISCLOSURE_BOOK_PHONE, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_06_INFO_SCHED_O_X,F9_06_GVRN_NUM_VOTING_MEMB,F9_06_GVRN_NUM_VOTING_MEMB_IND,F9_06_GVRN_DTK_FAMBIZ_RELATION_X,F9_06_GVRN_DELEGATE_MGMT_DUTY_X,F9_06_GVRN_CHANGE_DOC_X,F9_06_GVRN_ASSET_DIVERSION_X,F9_06_GVRN_MEMB_STCKHLDR_X,F9_06_GVRN_PERS_ELECT_MEMB_X,F9_06_GVRN_DECISION_APPROV_X,F9_06_GVRN_DOC_GVRN_BODY_X,F9_06_GVRN_DOC_COMMITTEE_X,F9_06_GVRN_DTK_NO_MAILING_ADDR_X,F9_06_POLICY_CHPTR_AFFIL_X,F9_06_POLICY_CHPTR_REFERENCE_X,F9_06_POLICY_FORM990_GVRN_BODY_X,F9_06_POLICY_COI_X,F9_06_POLICY_COI_DISCLOSURE_X,F9_06_POLICY_COI_MONITOR_X,F9_06_POLICY_WHSTLBLWR_X,F9_06_POLICY_DOC_RETENTION_X,F9_06_POLICY_COMP_PROCESS_CEO_X,F9_06_POLICY_COMP_PROCESS_OTH_X,F9_06_POLICY_JV_X,F9_06_POLICY_JV_PROC_X,F9_06_DISCLOSURE_STATES_FILED,F9_06_DISCLOSURE_AVBL_OTH_WEB_X,F9_06_DISCLOSURE_AVBL_OTH_X,F9_06_DISCLOSURE_AVBL_OWN_WEB_X,F9_06_DISCLOSURE_AVBL_REQUEST_X,F9_06_DISCLOSURE_BOOK_ADDR_CITY,F9_06_DISCLOSURE_BOOK_ADDR_CNTR,F9_06_DISCLOSURE_BOOK_ADDR_L1,F9_06_DISCLOSURE_BOOK_ADDR_L2,F9_06_DISCLOSURE_BOOK_ADDR_STATE,F9_06_DISCLOSURE_BOOK_ADDR_ZIP,F9_06_DISCLOSURE_BOOK_NAME_L1,F9_06_DISCLOSURE_BOOK_NAME_L2,F9_06_DISCLOSURE_BOOK_NAME_PERS,F9_06_DISCLOSURE_BOOK_PHONE)
df <- as.data.frame( var.list )


return( df )


}


