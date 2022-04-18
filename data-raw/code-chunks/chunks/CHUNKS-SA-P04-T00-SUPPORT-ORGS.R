#' @title 
#'   Build table SA-P04-T00-SUPPORT-ORGS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P04_T00_SUPPORT_ORGS <- function( doc, url )
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


## VARIABLE NAME:  SA_04_ALL_ORG_NAME_DOC_LISTED_X
## DESCRIPTION:  All supported organizations listed by name in governing documents?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-01
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_NAME_DOC_LISTED_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ListedByNameGoverningDocInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_NONDETERMIN_IRS_X
## DESCRIPTION:  Any supported organization that does not have IRS determination?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-02
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_NONDETERMIN_IRS_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SuprtOrgNoIRSDeterminationInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_501C456_X
## DESCRIPTION:  Supported org described in Section 501(c)(4); (5); (6)?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-03A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_501C456_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SupportedOrgSectionC456Ind' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_QUAL_X
## DESCRIPTION:  Confirmed supported org qualified?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-03B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_QUAL_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SupportedOrgQualifiedInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_170C2B_PURPOSE_X
## DESCRIPTION:  Ensure support used exclusively for section 170(c)(2)(B) purposes?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-03C
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_170C2B_PURPOSE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SuprtExclusivelySec170c2BInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_FRGN_X
## DESCRIPTION:  Any supported organized not organized in the United States?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-04A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_FRGN_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SupportedOrgNotOrganizedUSInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_CTRL_GRANT_FRGN_X
## DESCRIPTION:  Ultimate control in deciding whether to make grants to foreign supported org?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-04B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_CTRL_GRANT_FRGN_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ControlDecidingGrntFrgnOrgInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_SUPPORT_FRGN_X
## DESCRIPTION:  Support any foreign organizations that does not have IRS determination?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-04C
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_SUPPORT_FRGN_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SupportForeignOrgNoDetermInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_CHANGE_ORG_X
## DESCRIPTION:  Organization add; substitute or remove any supported org during the year?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-05A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_CHANGE_ORG_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/OrganizationChangeSuprtOrgInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_T12_ONLY_X
## DESCRIPTION:  Supported organization part of a class already designated in orgs organizing document?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-05B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_T12_ONLY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SupportedOrgClassDesignatedInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_SUBSTITUT_ONLY_X
## DESCRIPTION:  Substitution the result of an event beyond the organization's control?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-05C
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_SUBSTITUT_ONLY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SubstitutionBeyondOrgCntlInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_SUPPORT_OTH_X
## DESCRIPTION:  Support anyone other than supported organizations?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-06
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_SUPPORT_OTH_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/SupportNonSupportedOrgInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_PAY_CONTRIBUTOR_X
## DESCRIPTION:  Provide grant; loan; compensation to a substantial contributor?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-07
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_PAY_CONTRIBUTOR_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/PaymentSubstantialContribtrInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_LOAN_PERS_DSQ_X
## DESCRIPTION:  Loan to disqualified person?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-08
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_LOAN_PERS_DSQ_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/LoanDisqualifiedPersonInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_CTRL_BY_PERS_DSQ_X
## DESCRIPTION:  Controlled by one or more disqualified persons?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-09A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_CTRL_BY_PERS_DSQ_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ControlledDisqualifiedPrsnInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_PERS_DSQ_CTRL_X
## DESCRIPTION:  Disqualified person hold controlling interest in any entity which supporting org had an interest?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-09B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_PERS_DSQ_CTRL_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/DisqualifiedPrsnControllIntInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_PERS_DSQ_OWN_X
## DESCRIPTION:  Disqualified person have an ownership interest in assets which supporting org had an interest?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-09C
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_PERS_DSQ_OWN_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/DisqualifiedPrsnOwnrIntInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_EXCESS_BIZ_RULES_X
## DESCRIPTION:  Subject to excess business holding rules?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-10A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_EXCESS_BIZ_RULES_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ExcessBusinessHoldingsRulesInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_EXCESS_BIZ_HOLD_X
## DESCRIPTION:  Excess business holdings in the tax year?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-10B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_EXCESS_BIZ_HOLD_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ExcessBusinessHoldingsInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_CONTR_PERS_X
## DESCRIPTION:  A person who controls; alone or together with persons in (ii) and (iii) below; the governing body of the supported organization?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-11A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_CONTR_PERS_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ContributionControllerInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_CONTR_FAM_X
## DESCRIPTION:  A family member of a party described in (i) above?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-11B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_CONTR_FAM_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/ContributionFamilyInd' ) )





## VARIABLE NAME:  SA_04_ALL_ORG_CONTR_35PCT_CE_X
## DESCRIPTION:  A 35% controlled entity of a person described in (i) or (ii) above?
## LOCATION:  SCHED-A-PART-04-SECTION-A-LINE-11C
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_ALL_ORG_CONTR_35PCT_CE_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchASupportingOrgGrp/Contribution35ControlledInd' ) )





## VARIABLE NAME:  SA_04_T1_ORG_DIR_TRUST_APPONT_X
## DESCRIPTION:  Directors; trustees; or membership of supported org have power to regularly appoint or elect at least majority of orgs directors or trustees?
## LOCATION:  SCHED-A-PART-04-SECTION-B-LINE-01
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T1_ORG_DIR_TRUST_APPONT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType1SuprtOrgGrp/PowerAppointMajorityDirTrstInd' ) )





## VARIABLE NAME:  SA_04_T1_ORG_BEN_OTH_X
## DESCRIPTION:  Operate for the benefit of any other supported organization?
## LOCATION:  SCHED-A-PART-04-SECTION-B-LINE-02
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T1_ORG_BEN_OTH_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType1SuprtOrgGrp/OperateBenefitNonSuprtOrgInd' ) )





## VARIABLE NAME:  SA_04_T2_ORG_MAJORITY_DIRTRUST_X
## DESCRIPTION:  Also a majority of the directors or trustees of each of the organizations supported orgs?
## LOCATION:  SCHED-A-PART-04-SECTION-C-LINE-01
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T2_ORG_MAJORITY_DIRTRUST_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/MajorityDirTrstSupportedOrgInd' ) )





## VARIABLE NAME:  SA_04_T3_ORG_DOC_PROV_TIMELY_X
## DESCRIPTION:  Timely provided written notice; copy of Form 990; and governing documents?
## LOCATION:  SCHED-A-PART-04-SECTION-D-LINE-01
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3_ORG_DOC_PROV_TIMELY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3SprtOrgAllGrp/TimelyProvidedDocumentsInd' ) )





## VARIABLE NAME:  SA_04_T3_ORG_OFFS_RELATIONSHIP_X
## DESCRIPTION:  Maintained close and continuous working relationship with the supported organization?
## LOCATION:  SCHED-A-PART-04-SECTION-D-LINE-02
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3_ORG_OFFS_RELATIONSHIP_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3SprtOrgAllGrp/OfficersCloseRelationshipInd' ) )





## VARIABLE NAME:  SA_04_T3_ORG_VOICE_INVEST_X
## DESCRIPTION:  Supported organizations have significant voice in the organizations investment policies?
## LOCATION:  SCHED-A-PART-04-SECTION-D-LINE-02
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3_ORG_VOICE_INVEST_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3SprtOrgAllGrp/SupportedOrgVoiceInvestmentInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_ACT_TEST_X
## DESCRIPTION:  Satisfied activities test
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-01A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_ACT_TEST_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/ActivitiesTestInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_PARENT_X
## DESCRIPTION:  Parent of each of its supported organizations
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-01B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_PARENT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/ParentSupportedOrgInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_SUPPORT_GOVT_X
## DESCRIPTION:  Supported a governmental entity
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-01C
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_SUPPORT_GOVT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/GovernmentalEntityInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_ACT_EXEMPT_X
## DESCRIPTION:  Substantially all activities during the year directly further exempt purposes of the supported organization?
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-02A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_ACT_EXEMPT_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/ActivitiesFurtherExemptPrpsInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_ACT_ENGAGED_X
## DESCRIPTION:  Constitute activities that; but for the organizations involvement; supported org would have been engaged?
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-02B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_ACT_ENGAGED_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/ActivitiesEngagedOrgInvlmntInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_APOINT_OFF_X
## DESCRIPTION:  Power to regularly appoint or elect majority of the officers of each supported organization?
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-03A
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_APOINT_OFF_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/AppointElectMajorityOfficerInd' ) )





## VARIABLE NAME:  SA_04_T3FUNC_ORG_DIRECT_POLICY_X
## DESCRIPTION:  Exercise a substantial degree of direction over policies; programs or activities of each supported org?
## LOCATION:  SCHED-A-PART-04-SECTION-E-LINE-03B
## TABLE:  SA-P04-T00-SUPPORT-ORGS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

SA_04_T3FUNC_ORG_DIRECT_POLICY_X <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990SchAType3FuncIntGrp/ExerciseDirectionPoliciesInd' ) )





var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SA_04_ALL_ORG_NAME_DOC_LISTED_X,SA_04_ALL_ORG_NONDETERMIN_IRS_X,SA_04_ALL_ORG_501C456_X,SA_04_ALL_ORG_QUAL_X,SA_04_ALL_ORG_170C2B_PURPOSE_X,SA_04_ALL_ORG_FRGN_X,SA_04_ALL_ORG_CTRL_GRANT_FRGN_X,SA_04_ALL_ORG_SUPPORT_FRGN_X,SA_04_ALL_ORG_CHANGE_ORG_X,SA_04_ALL_ORG_T12_ONLY_X,SA_04_ALL_ORG_SUBSTITUT_ONLY_X,SA_04_ALL_ORG_SUPPORT_OTH_X,SA_04_ALL_ORG_PAY_CONTRIBUTOR_X,SA_04_ALL_ORG_LOAN_PERS_DSQ_X,SA_04_ALL_ORG_CTRL_BY_PERS_DSQ_X,SA_04_ALL_ORG_PERS_DSQ_CTRL_X,SA_04_ALL_ORG_PERS_DSQ_OWN_X,SA_04_ALL_ORG_EXCESS_BIZ_RULES_X,SA_04_ALL_ORG_EXCESS_BIZ_HOLD_X,SA_04_ALL_ORG_CONTR_PERS_X,SA_04_ALL_ORG_CONTR_FAM_X,SA_04_ALL_ORG_CONTR_35PCT_CE_X,SA_04_T1_ORG_DIR_TRUST_APPONT_X,SA_04_T1_ORG_BEN_OTH_X,SA_04_T2_ORG_MAJORITY_DIRTRUST_X,SA_04_T3_ORG_DOC_PROV_TIMELY_X,SA_04_T3_ORG_OFFS_RELATIONSHIP_X,SA_04_T3_ORG_VOICE_INVEST_X,SA_04_T3FUNC_ORG_ACT_TEST_X,SA_04_T3FUNC_ORG_PARENT_X,SA_04_T3FUNC_ORG_SUPPORT_GOVT_X,SA_04_T3FUNC_ORG_ACT_EXEMPT_X,SA_04_T3FUNC_ORG_ACT_ENGAGED_X,SA_04_T3FUNC_ORG_APOINT_OFF_X,SA_04_T3FUNC_ORG_DIRECT_POLICY_X)
df <- as.data.frame( var.list )


return( df )


}


