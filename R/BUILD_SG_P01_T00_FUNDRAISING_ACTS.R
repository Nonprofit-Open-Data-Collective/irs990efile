#' @title 
#'   Build table SG-P01-T00-FUNDRAISING-ACTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SG_P01_T00_FUNDRAISING_ACTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


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
SG_01_FUNDR_SVC_AGREEMENT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_SVC_AGREEMENT_X ) )
if( length( SG_01_FUNDR_SVC_AGREEMENT_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_SVC_AGREEMENT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_SVC_AGREEMENT_X <-  paste0( '{', SG_01_FUNDR_SVC_AGREEMENT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_LIST_STATES_ORG_LIC
## DESCRIPTION:  Literal for all states
## LOCATION:  SCHED-G-PART-01-LINE-03
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AllStates'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AllStatesCd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/LicensedStates'
V4 <- '//Return/ReturnData/IRS990ScheduleG/LicensedStates'
V5 <- '//Return/ReturnData/IRS990ScheduleG/LicensedStatesCd'
V_LIST_STATES_ORG_LIC <- paste( V1, V2, V3, V4, V5 , sep='|' )
SG_01_LIST_STATES_ORG_LIC <- xml2::xml_text( xml2::xml_find_all( doc, V_LIST_STATES_ORG_LIC ) )
if( length( SG_01_LIST_STATES_ORG_LIC ) > 1 )
{ 
  create_record( varname=SG_01_LIST_STATES_ORG_LIC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_LIST_STATES_ORG_LIC <-  paste0( '{', SG_01_LIST_STATES_ORG_LIC, '}', collapse=';' ) 
} 




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
SG_01_FUNDR_ACT_SOL_EMAIL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SOL_EMAIL_X ) )
if( length( SG_01_FUNDR_ACT_SOL_EMAIL_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SOL_EMAIL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SOL_EMAIL_X <-  paste0( '{', SG_01_FUNDR_ACT_SOL_EMAIL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_IN_PERSON_X
## DESCRIPTION:  In-person solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01D
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/InPersonSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/InPersonSolicitations'
V3 <- '//Return/ReturnData/IRS990ScheduleG/InPersonSolicitationsInd'
V_FUNDR_ACT_SOL_IN_PERSON_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_IN_PERSON_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SOL_IN_PERSON_X ) )
if( length( SG_01_FUNDR_ACT_SOL_IN_PERSON_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SOL_IN_PERSON_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SOL_IN_PERSON_X <-  paste0( '{', SG_01_FUNDR_ACT_SOL_IN_PERSON_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_MAIL_X
## DESCRIPTION:  Mail solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01A
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/MailSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/MailSolicitations'
V3 <- '//Return/ReturnData/IRS990ScheduleG/MailSolicitationsInd'
V_FUNDR_ACT_SOL_MAIL_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_MAIL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SOL_MAIL_X ) )
if( length( SG_01_FUNDR_ACT_SOL_MAIL_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SOL_MAIL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SOL_MAIL_X <-  paste0( '{', SG_01_FUNDR_ACT_SOL_MAIL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_PHONE_X
## DESCRIPTION:  Phone solicitations
## LOCATION:  SCHED-G-PART-01-LINE-01C
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/PhoneSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PhoneSolicitations'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PhoneSolicitationsInd'
V_FUNDR_ACT_SOL_PHONE_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_PHONE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SOL_PHONE_X ) )
if( length( SG_01_FUNDR_ACT_SOL_PHONE_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SOL_PHONE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SOL_PHONE_X <-  paste0( '{', SG_01_FUNDR_ACT_SOL_PHONE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X
## DESCRIPTION:  Solicitation of government grants
## LOCATION:  SCHED-G-PART-01-LINE-01F
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/SolicitationOfGovtGrants'
V2 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfGovtGrants'
V3 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfGovtGrantsInd'
V_FUNDR_ACT_SOL_GOVT_GRANT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SOL_GOVT_GRANT_X ) )
if( length( SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X <-  paste0( '{', SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDR_ACT_SOL_NONGOVT_X
## DESCRIPTION:  Solicitation of non-govt grants
## LOCATION:  SCHED-G-PART-01-LINE-01E
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/SolicitationOfNonGovtGrants'
V2 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfNonGovtGrants'
V3 <- '//Return/ReturnData/IRS990ScheduleG/SolicitationOfNonGovtGrantsInd'
V_FUNDR_ACT_SOL_NONGOVT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SOL_NONGOVT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SOL_NONGOVT_X ) )
if( length( SG_01_FUNDR_ACT_SOL_NONGOVT_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SOL_NONGOVT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SOL_NONGOVT_X <-  paste0( '{', SG_01_FUNDR_ACT_SOL_NONGOVT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDR_ACT_SPECIAL_EVNT_X
## DESCRIPTION:  Special fundraising events
## LOCATION:  SCHED-G-PART-01-LINE-01G
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/SpecialFundraisingEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/SpecialFundraisingEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/SpecialFundraisingEventsInd'
V_FUNDR_ACT_SPECIAL_EVNT_X <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDR_ACT_SPECIAL_EVNT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_ACT_SPECIAL_EVNT_X ) )
if( length( SG_01_FUNDR_ACT_SPECIAL_EVNT_X ) > 1 )
{ 
  create_record( varname=SG_01_FUNDR_ACT_SPECIAL_EVNT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDR_ACT_SPECIAL_EVNT_X <-  paste0( '{', SG_01_FUNDR_ACT_SPECIAL_EVNT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDRAISER_ACT_GRORCPT_TOT
## DESCRIPTION:  Total gross receipts
## LOCATION:  SCHED-G-PART-01-LINE-02B-COL-iv-TOT
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/TotalGrossReceipts'
V2 <- '//Return/ReturnData/IRS990ScheduleG/TotalGrossReceipts'
V3 <- '//Return/ReturnData/IRS990ScheduleG/TotalGrossReceiptsAmt'
V_FUNDRAISER_ACT_GRORCPT_TOT <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDRAISER_ACT_GRORCPT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDRAISER_ACT_GRORCPT_TOT ) )
if( length( SG_01_FUNDRAISER_ACT_GRORCPT_TOT ) > 1 )
{ 
  create_record( varname=SG_01_FUNDRAISER_ACT_GRORCPT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDRAISER_ACT_GRORCPT_TOT <-  paste0( '{', SG_01_FUNDRAISER_ACT_GRORCPT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDRAISER_AMT_ORG_TOT
## DESCRIPTION:  Total net to organization
## LOCATION:  SCHED-G-PART-01-LINE-02B-COL-vi-TOT
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/TotalNetToOrganization'
V2 <- '//Return/ReturnData/IRS990ScheduleG/TotalNetToOrganization'
V3 <- '//Return/ReturnData/IRS990ScheduleG/TotalNetToOrganizationAmt'
V_FUNDRAISER_AMT_ORG_TOT <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDRAISER_AMT_ORG_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDRAISER_AMT_ORG_TOT ) )
if( length( SG_01_FUNDRAISER_AMT_ORG_TOT ) > 1 )
{ 
  create_record( varname=SG_01_FUNDRAISER_AMT_ORG_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDRAISER_AMT_ORG_TOT <-  paste0( '{', SG_01_FUNDRAISER_AMT_ORG_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_01_FUNDRAISER_AMT_PAID_TOT
## DESCRIPTION:  Total retained by contractors
## LOCATION:  SCHED-G-PART-01-LINE-02B-COL-v-TOT
## TABLE:  SG-P01-T00-FUNDRAISING-ACTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartI/TotalRetainedByContractors'
V2 <- '//Return/ReturnData/IRS990ScheduleG/TotalRetainedByContractors'
V3 <- '//Return/ReturnData/IRS990ScheduleG/TotalRetainedByContractorsAmt'
V_FUNDRAISER_AMT_PAID_TOT <- paste( V1, V2, V3 , sep='|' )
SG_01_FUNDRAISER_AMT_PAID_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDRAISER_AMT_PAID_TOT ) )
if( length( SG_01_FUNDRAISER_AMT_PAID_TOT ) > 1 )
{ 
  create_record( varname=SG_01_FUNDRAISER_AMT_PAID_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_01_FUNDRAISER_AMT_PAID_TOT <-  paste0( '{', SG_01_FUNDRAISER_AMT_PAID_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SG_01_FUNDR_SVC_AGREEMENT_X,SG_01_LIST_STATES_ORG_LIC,SG_01_FUNDR_ACT_SOL_EMAIL_X,SG_01_FUNDR_ACT_SOL_IN_PERSON_X,SG_01_FUNDR_ACT_SOL_MAIL_X,SG_01_FUNDR_ACT_SOL_PHONE_X,SG_01_FUNDR_ACT_SOL_GOVT_GRANT_X,SG_01_FUNDR_ACT_SOL_NONGOVT_X,SG_01_FUNDR_ACT_SPECIAL_EVNT_X,SG_01_FUNDRAISER_ACT_GRORCPT_TOT,SG_01_FUNDRAISER_AMT_ORG_TOT,SG_01_FUNDRAISER_AMT_PAID_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


