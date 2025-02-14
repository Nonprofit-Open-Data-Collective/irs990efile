#' @title 
#'   Build table F9-P06-T00-GOVERNANCE-EZ
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P06_T00_GOVERNANCE_EZ <- function( doc, url )
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


## VARIABLE NAME:  F9_06_ACT_NOT_PREVIOUSLY_REP_X
## DESCRIPTION:  Did the organization engage in any activity not previously reported to the IRS?
## LOCATION:  F990-EZ-PART-05-LINE-33
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ActivitiesNotPreviouslyRpt'
V2 <- '//Return/ReturnData/IRS990EZ/ActivitiesNotPreviouslyRptInd'
V_ACT_NOT_PREVIOUSLY_REP_X <- paste( V1, V2 , sep='|' )
F9_06_ACT_NOT_PREVIOUSLY_REP_X <- xml_text( xml_find_all( doc, V_ACT_NOT_PREVIOUSLY_REP_X ) )




## VARIABLE NAME:  F9_06_POLI_EXP
## DESCRIPTION:  Direct or indirect political expenditures.
## LOCATION:  F990-EZ-PART-05-LINE-37A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/DirectIndirectPoliticalExpend'
V2 <- '//Return/ReturnData/IRS990EZ/DirectIndirectPltclExpendAmt'
V_POLI_EXP <- paste( V1, V2 , sep='|' )
F9_06_POLI_EXP <- xml_text( xml_find_all( doc, V_POLI_EXP ) )




## VARIABLE NAME:  F9_06_POLI_FORM1120_POL_FILED_X
## DESCRIPTION:  Did the organization file Form 1120-POL for this year?
## LOCATION:  F990-EZ-PART-05-LINE-37B
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/DidOrgFileForm1120POLThisYear'
V2 <- '//Return/ReturnData/IRS990EZ/Form1120PolFiledInd'
V_POLI_FORM1120_POL_FILED_X <- paste( V1, V2 , sep='|' )
F9_06_POLI_FORM1120_POL_FILED_X <- xml_text( xml_find_all( doc, V_POLI_FORM1120_POL_FILED_X ) )




## VARIABLE NAME:  F9_06_TAX_IMPOSED_IRC_4911
## DESCRIPTION:  501(c)(3) Organizations: Amount of tax imposed on the organization furing the year under section 4911
## LOCATION:  F990-EZ-PART-05-LINE-40A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4911'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4911Amt'
V_TAX_IMPOSED_IRC_4911 <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_IRC_4911 <- xml_text( xml_find_all( doc, V_TAX_IMPOSED_IRC_4911 ) )




## VARIABLE NAME:  F9_06_TAX_IMPOSED_IRC_4912
## DESCRIPTION:  501(c)(3) Organizations: Amount of tax imposed on the organization furing the year under section 4912
## LOCATION:  F990-EZ-PART-05-LINE-40A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4912'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4912Amt'
V_TAX_IMPOSED_IRC_4912 <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_IRC_4912 <- xml_text( xml_find_all( doc, V_TAX_IMPOSED_IRC_4912 ) )




## VARIABLE NAME:  F9_06_TAX_IMPOSED_IRC_4955
## DESCRIPTION:  501(c)(3) Organizations: Amount of tax imposed on the organization furing the year under section 4955
## LOCATION:  F990-EZ-PART-05-LINE-40A
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4955'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedUnderIRC4955Amt'
V_TAX_IMPOSED_IRC_4955 <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_IRC_4955 <- xml_text( xml_find_all( doc, V_TAX_IMPOSED_IRC_4955 ) )




## VARIABLE NAME:  F9_06_TAX_IMPOSED_ORG_MGR
## DESCRIPTION:  Amount of tax imposed on the organization managers etc during the year under sections 4912; 4955; and 4958
## LOCATION:  F990-EZ-PART-05-LINE-40C
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/AmountOfTaxImposedOnOrgMgr'
V2 <- '//Return/ReturnData/IRS990EZ/TaxImposedOnOrganizationMgrAmt'
V_TAX_IMPOSED_ORG_MGR <- paste( V1, V2 , sep='|' )
F9_06_TAX_IMPOSED_ORG_MGR <- xml_text( xml_find_all( doc, V_TAX_IMPOSED_ORG_MGR ) )




## VARIABLE NAME:  F9_06_TAX_REIMBURSED_ORG
## DESCRIPTION:  Amount of tax on line 89c; above; reimbursed by the organization
## LOCATION:  F990-EZ-PART-05-LINE-40D
## TABLE:  F9-P06-T00-GOVERNANCE-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/AmountOfTaxReimbursedByOrg'
V2 <- '//Return/ReturnData/IRS990EZ/TaxReimbursedByOrganizationAmt'
V_TAX_REIMBURSED_ORG <- paste( V1, V2 , sep='|' )
F9_06_TAX_REIMBURSED_ORG <- xml_text( xml_find_all( doc, V_TAX_REIMBURSED_ORG ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_06_ACT_NOT_PREVIOUSLY_REP_X,F9_06_POLI_EXP,F9_06_POLI_FORM1120_POL_FILED_X,F9_06_TAX_IMPOSED_IRC_4911,F9_06_TAX_IMPOSED_IRC_4912,F9_06_TAX_IMPOSED_IRC_4955,F9_06_TAX_IMPOSED_ORG_MGR,F9_06_TAX_REIMBURSED_ORG)
df <- as.data.frame( var.list )


return( df )


}


