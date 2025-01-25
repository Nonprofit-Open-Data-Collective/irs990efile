#' @title 
#'   Build table F9-P06-T00-GOVERNANCE-EZ
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P06_T00_GOVERNANCE_EZ <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_06_ACT_NOT_PREVIOUSLY_REP_X
## DESCRIPTION:  Did the organization engage in any activity not previously reported to the IRS?
## LOCATION:  F990-EZ-PART-05-LINE-33
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ActivitiesNotPreviouslyRpt'
V2 <- '//Return/ReturnData/IRS990EZ/ActivitiesNotPreviouslyRptInd'
V_ACT_NOT_PREVIOUSLY_REP_X <- paste( V1, V2 , sep='|' )
F9_06_ACT_NOT_PREVIOUSLY_REP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ACT_NOT_PREVIOUSLY_REP_X ) )
if( length( F9_06_ACT_NOT_PREVIOUSLY_REP_X ) > 1 )
{ 
  create_record( varname=F9_06_ACT_NOT_PREVIOUSLY_REP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_ACT_NOT_PREVIOUSLY_REP_X <-  paste0( '{', F9_06_ACT_NOT_PREVIOUSLY_REP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_TAX_IMPOSED_ORG_MGR
## DESCRIPTION:  Amount of tax imposed on the organization managers etc during the year under sections 4912; 4955; and 4958
## LOCATION:  F990-EZ-PART-05-LINE-40C
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/AmountOfTaxImposedOnOrgMgr'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedOnOrganizationMgrAmt'
V_TAX_IMPOSED_ORG_MGR <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_ORG_MGR <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_IMPOSED_ORG_MGR ) )
if( length( F9_06_TAX_IMPOSED_ORG_MGR ) > 1 )
{ 
  create_record( varname=F9_06_TAX_IMPOSED_ORG_MGR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_TAX_IMPOSED_ORG_MGR <-  paste0( '{', F9_06_TAX_IMPOSED_ORG_MGR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_TAX_REIMBURSED_ORG
## DESCRIPTION:  Amount of tax on line 89c; above; reimbursed by the organization
## LOCATION:  F990-EZ-PART-05-LINE-40D
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/AmountOfTaxReimbursedByOrg'
V2 <- '//Return/ReturnData/IRS990EZ/TaxReimbursedByOrganizationAmt'
V_TAX_REIMBURSED_ORG <- paste( V1, V2 , sep='|' )
F9_06_TAX_REIMBURSED_ORG <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_REIMBURSED_ORG ) )
if( length( F9_06_TAX_REIMBURSED_ORG ) > 1 )
{ 
  create_record( varname=F9_06_TAX_REIMBURSED_ORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_TAX_REIMBURSED_ORG <-  paste0( '{', F9_06_TAX_REIMBURSED_ORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLI_FORM1120_POL_FILED_X
## DESCRIPTION:  Did the organization file Form 1120-POL for this year?
## LOCATION:  F990-EZ-PART-05-LINE-37B
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/DidOrgFileForm1120POLThisYear'
V2 <- '//Return/ReturnData/IRS990EZ/Form1120PolFiledInd'
V_POLI_FORM1120_POL_FILED_X <- paste( V1, V2 , sep='|' )
F9_06_POLI_FORM1120_POL_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLI_FORM1120_POL_FILED_X ) )
if( length( F9_06_POLI_FORM1120_POL_FILED_X ) > 1 )
{ 
  create_record( varname=F9_06_POLI_FORM1120_POL_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLI_FORM1120_POL_FILED_X <-  paste0( '{', F9_06_POLI_FORM1120_POL_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_POLI_EXP
## DESCRIPTION:  Direct or indirect political expenditures.
## LOCATION:  F990-EZ-PART-05-LINE-37A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/DirectIndirectPltclExpendAmt'
V2 <- '//Return/ReturnData/IRS990EZ/DirectIndirectPoliticalExpend'
V_POLI_EXP <- paste( V1, V2 , sep='|' )
F9_06_POLI_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_POLI_EXP ) )
if( length( F9_06_POLI_EXP ) > 1 )
{ 
  create_record( varname=F9_06_POLI_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_POLI_EXP <-  paste0( '{', F9_06_POLI_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_TAX_IMPOSED_IRC_4911
## DESCRIPTION:  501(c)(3) Organizations: Amount of tax imposed on the organization furing the year under section 4911
## LOCATION:  F990-EZ-PART-05-LINE-40A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4911'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4911Amt'
V_TAX_IMPOSED_IRC_4911 <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_IRC_4911 <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_IMPOSED_IRC_4911 ) )
if( length( F9_06_TAX_IMPOSED_IRC_4911 ) > 1 )
{ 
  create_record( varname=F9_06_TAX_IMPOSED_IRC_4911, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_TAX_IMPOSED_IRC_4911 <-  paste0( '{', F9_06_TAX_IMPOSED_IRC_4911, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_TAX_IMPOSED_IRC_4912
## DESCRIPTION:  501(c)(3) Organizations: Amount of tax imposed on the organization furing the year under section 4912
## LOCATION:  F990-EZ-PART-05-LINE-40A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4912'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4912Amt'
V_TAX_IMPOSED_IRC_4912 <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_IRC_4912 <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_IMPOSED_IRC_4912 ) )
if( length( F9_06_TAX_IMPOSED_IRC_4912 ) > 1 )
{ 
  create_record( varname=F9_06_TAX_IMPOSED_IRC_4912, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_TAX_IMPOSED_IRC_4912 <-  paste0( '{', F9_06_TAX_IMPOSED_IRC_4912, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_06_TAX_IMPOSED_IRC_4955
## DESCRIPTION:  501(c)(3) Organizations: Amount of tax imposed on the organization furing the year under section 4955
## LOCATION:  F990-EZ-PART-05-LINE-40A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4955'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4955Amt'
V_TAX_IMPOSED_IRC_4955 <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_IRC_4955 <- xml2::xml_text( xml2::xml_find_all( doc, V_TAX_IMPOSED_IRC_4955 ) )
if( length( F9_06_TAX_IMPOSED_IRC_4955 ) > 1 )
{ 
  create_record( varname=F9_06_TAX_IMPOSED_IRC_4955, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_06_TAX_IMPOSED_IRC_4955 <-  paste0( '{', F9_06_TAX_IMPOSED_IRC_4955, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_06_ACT_NOT_PREVIOUSLY_REP_X,F9_06_TAX_IMPOSED_ORG_MGR,F9_06_TAX_REIMBURSED_ORG,F9_06_POLI_FORM1120_POL_FILED_X,F9_06_POLI_EXP,F9_06_TAX_IMPOSED_IRC_4911,F9_06_TAX_IMPOSED_IRC_4912,F9_06_TAX_IMPOSED_IRC_4955)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


