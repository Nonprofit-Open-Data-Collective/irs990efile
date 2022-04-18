#' @title 
#'   Build table SG-P01-T00-FUNDRAISING-ACTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SG_P01_T00_FUNDRAISING_ACTS <- function( doc, url )
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


## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_MAIL_X
## DESCRIPTION:  Mail solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01A
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/MailSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/MailSolicitationsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/MailSolicitations'
V_FUNDR_ACT_SOL_MAIL_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_MAIL_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SOL_MAIL_X ) )




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_EMAIL_X
## DESCRIPTION:  Email solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01B
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EmailSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EmailSolicitationsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/EmailSolicitations'
V_FUNDR_ACT_SOL_EMAIL_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_EMAIL_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SOL_EMAIL_X ) )




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_PHONE_X
## DESCRIPTION:  Phone solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01C
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/PhoneSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PhoneSolicitationsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/PhoneSolicitations'
V_FUNDR_ACT_SOL_PHONE_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_PHONE_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SOL_PHONE_X ) )




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_IN_PERSON_X
## DESCRIPTION:  In-person solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01D
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/InPersonSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/InPersonSolicitationsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/InPersonSolicitations'
V_FUNDR_ACT_SOL_IN_PERSON_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_IN_PERSON_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SOL_IN_PERSON_X ) )




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_NONGOVT_X
## DESCRIPTION:  Solicitation of non-govt grants
## LOCATION:  SCHED-G-PART-01-LINE-01E
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfNonGovtGrants'
V2 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfNonGovtGrantsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/SolicitationOfNonGovtGrants'
V_FUNDR_ACT_SOL_NONGOVT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_NONGOVT_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SOL_NONGOVT_X ) )




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X
## DESCRIPTION:  Solicitation of government grants
## LOCATION:  SCHED-G-PART-01-LINE-01F
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfGovtGrants'
V2 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfGovtGrantsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/SolicitationOfGovtGrants'
V_FUNDR_ACT_SOL_GOVT_GRANT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SOL_GOVT_GRANT_X ) )




## VARIABLE NAME:  SG_01_FUNDR_ACT_SPECIAL_EVNT_X
## DESCRIPTION:  Special fundraising events
## LOCATION:  SCHED-G-PART-01-LINE-01G
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/SpecialFundraisingEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/SpecialFundraisingEventsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/SpecialFundraisingEvents'
V_FUNDR_ACT_SPECIAL_EVNT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SPECIAL_EVNT_X <- xml_text( xml_find_all( doc, V_FUNDR_ACT_SPECIAL_EVNT_X ) )




## VARIABLE NAME:  SG_01_FUNDR_SVC_AGREEMENT_X
## DESCRIPTION:  Did the organization have a written or oral agreement with any individual (including officers; directors; trustees or key employees listed in Form 990; Part VII) or entity in connection with professional fundraising activities?
## LOCATION:  SCHED-G-PART-01-LINE-02A
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AgreementRefFundraising'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AgrmtProfFundraisingActyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/AgreementRefFundraising'
V_FUNDR_SVC_AGREEMENT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_SVC_AGREEMENT_X <- xml_text( xml_find_all( doc, V_FUNDR_SVC_AGREEMENT_X ) )




## VARIABLE NAME:  SG_01_FUNDRAISER_ACT_GRORCPT_TOT
## DESCRIPTION:  Total gross receipts
## LOCATION:  SCHED-G-PART-01-LINE-02B-COL-iv-TOT
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/TotalGrossReceipts'
V2 <- '//Return/ReturnData/IRS990ScheduleG/TotalGrossReceiptsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/TotalGrossReceipts'
V_FUNDRAISER_ACT_GRORCPT_TOT <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDRAISER_ACT_GRORCPT_TOT <- xml_text( xml_find_all( doc, V_FUNDRAISER_ACT_GRORCPT_TOT ) )




## VARIABLE NAME:  SG_01_FUNDRAISER_AMT_ORG_TOT
## DESCRIPTION:  Total net to organization
## LOCATION:  SCHED-G-PART-01-LINE-02B-COL-vi-TOT
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/TotalNetToOrganization'
V2 <- '//Return/ReturnData/IRS990ScheduleG/TotalNetToOrganizationAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/TotalNetToOrganization'
V_FUNDRAISER_AMT_ORG_TOT <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDRAISER_AMT_ORG_TOT <- xml_text( xml_find_all( doc, V_FUNDRAISER_AMT_ORG_TOT ) )




## VARIABLE NAME:  SG_01_FUNDRAISER_AMT_PAID_TOT
## DESCRIPTION:  Total retained by contractors
## LOCATION:  SCHED-G-PART-01-LINE-02B-COL-v-TOT
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/TotalRetainedByContractors'
V2 <- '//Return/ReturnData/IRS990ScheduleG/TotalRetainedByContractorsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/TotalRetainedByContractors'
V_FUNDRAISER_AMT_PAID_TOT <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDRAISER_AMT_PAID_TOT <- xml_text( xml_find_all( doc, V_FUNDRAISER_AMT_PAID_TOT ) )




## VARIABLE NAME:  SG_01_LIST_STATES_ORG_LIC
## DESCRIPTION:  List all states in which the organization is registered or licensed to solicit funds or has been notified it is exempt from registration or licensing
## LOCATION:  SCHED-G-PART-01-LINE-03
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/LicensedStates'
V2 <- '//Return/ReturnData/IRS990ScheduleG/LicensedStatesCd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/LicensedStates'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AllStates'
V5 <- '//Return/ReturnData/IRS990ScheduleG/AllStatesCd'
V_LIST_STATES_ORG_LIC <- paste( V1, V2, V3, V4, V5 , sep='|' )
SG_01_LIST_STATES_ORG_LIC <- xml_text( xml_find_all( doc, V_LIST_STATES_ORG_LIC ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SG_01_FUNDR_ACT_SOL_MAIL_X,SG_01_FUNDR_ACT_SOL_EMAIL_X,SG_01_FUNDR_ACT_SOL_PHONE_X,SG_01_FUNDR_ACT_SOL_IN_PERSON_X,SG_01_FUNDR_ACT_SOL_NONGOVT_X,SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X,SG_01_FUNDR_ACT_SPECIAL_EVNT_X,SG_01_FUNDR_SVC_AGREEMENT_X,SG_01_FUNDRAISER_ACT_GRORCPT_TOT,SG_01_FUNDRAISER_AMT_ORG_TOT,SG_01_FUNDRAISER_AMT_PAID_TOT,SG_01_LIST_STATES_ORG_LIC)
df <- as.data.frame( var.list )


return( df )


}


