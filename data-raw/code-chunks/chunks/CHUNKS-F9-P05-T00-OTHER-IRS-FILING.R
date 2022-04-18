#' @title 
#'   Build table F9-P05-T00-OTHER-IRS-FILING
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P05_T00_OTHER_IRS_FILING <- function( doc, url )
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


## VARIABLE NAME:  F9_05_INFO_SCHED_O_X
## DESCRIPTION:  Does Schedule O contains a response to a question in Part V?
## LOCATION:  F990-EZ-PART-05-LINE-00
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartV'
V2 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartVInd'
V3 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartV'
V4 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_INFO_SCHED_O_X <- xml_text( xml_find_all( doc, V_INFO_SCHED_O_X ) )




## VARIABLE NAME:  F9_05_NUM_FORM_1096_BOX_3
## DESCRIPTION:  Number forms transmitted with 1096
## LOCATION:  F990-PC-PART-05-LINE-01A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/IRPDocumentCnt'
V2 <- '//Return/ReturnData/IRS990/NumberFormsTransmittedWith1096'
V_NUM_FORM_1096_BOX_3 <- paste( V1, V2 , sep='|' )
F9_05_NUM_FORM_1096_BOX_3 <- xml_text( xml_find_all( doc, V_NUM_FORM_1096_BOX_3 ) )




## VARIABLE NAME:  F9_05_NUM_FORM_W2G
## DESCRIPTION:  Number W-2Gs included in 1a
## LOCATION:  F990-PC-PART-05-LINE-01B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/NumberW2GIncludedIn1A'
V2 <- '//Return/ReturnData/IRS990/IRPDocumentW2GCnt'
V3 <- '//Return/ReturnData/IRS990/NumberW2GIncluded'
V_NUM_FORM_W2G <- paste( V1, V2, V3 , sep='|' )
F9_05_NUM_FORM_W2G <- xml_text( xml_find_all( doc, V_NUM_FORM_W2G ) )




## VARIABLE NAME:  F9_05_COMPLY_BACKUP_WITHHOLD_X
## DESCRIPTION:  Compliance with backup witholding?
## LOCATION:  F990-PC-PART-05-LINE-01C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BackupWthldComplianceInd'
V2 <- '//Return/ReturnData/IRS990/ComplianceWithBackupWitholding'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/ComplianceWithBackupWitholding'
V_COMPLY_BACKUP_WITHHOLD_X <- paste( V1, V2, V3 , sep='|' )
F9_05_COMPLY_BACKUP_WITHHOLD_X <- xml_text( xml_find_all( doc, V_COMPLY_BACKUP_WITHHOLD_X ) )




## VARIABLE NAME:  F9_05_NUM_EMPL
## DESCRIPTION:  Number of employees
## LOCATION:  F990-PC-PART-05-LINE-02A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/NumberOfEmployees'
V2 <- '//Return/ReturnData/IRS990/EmployeeCnt'
V3 <- '//Return/ReturnData/IRS990/NumberOfEmployees'
V_NUM_EMPL <- paste( V1, V2, V3 , sep='|' )
F9_05_NUM_EMPL <- xml_text( xml_find_all( doc, V_NUM_EMPL ) )




## VARIABLE NAME:  F9_05_EMPL_TAX_RETURN_FILED_X
## DESCRIPTION:  Employment tax returns filed?
## LOCATION:  F990-PC-PART-05-LINE-02B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/EmploymentTaxReturnsFiled'
V2 <- '//Return/ReturnData/IRS990/EmploymentTaxReturnsFiledInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/EmploymentTaxReturnsFiled'
V_EMPL_TAX_RETURN_FILED_X <- paste( V1, V2, V3 , sep='|' )
F9_05_EMPL_TAX_RETURN_FILED_X <- xml_text( xml_find_all( doc, V_EMPL_TAX_RETURN_FILED_X ) )




## VARIABLE NAME:  F9_05_UBIZ_IMCOME_OVER_LIMIT_X
## DESCRIPTION:  Unrelated business income?
## LOCATION:  F990-EZ-PART-05-LINE-35A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OrganizationHadUBI'
V2 <- '//Return/ReturnData/IRS990EZ/OrganizationHadUBIInd'
V3 <- '//Return/ReturnData/IRS990EZ/UnrelatedBusIncmOverLimitInd'
V4 <- '//Return/ReturnData/IRS990EZ/UnrelatedBusinessIncome'
V5 <- '//Return/ReturnData/IRS990/Form990PartV/UnrelatedBusinessIncome'
V6 <- '//Return/ReturnData/IRS990/UnrelatedBusIncmOverLimitInd'
V7 <- '//Return/ReturnData/IRS990/UnrelatedBusinessIncome'
V_UBIZ_IMCOME_OVER_LIMIT_X <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_UBIZ_IMCOME_OVER_LIMIT_X <- xml_text( xml_find_all( doc, V_UBIZ_IMCOME_OVER_LIMIT_X ) )




## VARIABLE NAME:  F9_05_UBIZ_FORM_990T_FILED_X
## DESCRIPTION:  Form 990-T filed?
## LOCATION:  F990-EZ-PART-05-LINE-35B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/Form990-TFiled'
V2 <- '//Return/ReturnData/IRS990EZ/Form990TFiledInd'
V3 <- '//Return/ReturnData/IRS990EZ/OrganizationFiled990T'
V4 <- '//Return/ReturnData/IRS990EZ/OrganizationFiled990TInd'
V5 <- '//Return/ReturnData/IRS990/Form990PartV/Form990-TFiled'
V6 <- '//Return/ReturnData/IRS990/Form990-TFiled'
V7 <- '//Return/ReturnData/IRS990/Form990TFiledInd'
V_UBIZ_FORM_990T_FILED_X <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_UBIZ_FORM_990T_FILED_X <- xml_text( xml_find_all( doc, V_UBIZ_FORM_990T_FILED_X ) )




## VARIABLE NAME:  F9_05_FRGN_FIN_ACC_X
## DESCRIPTION:  Foreign financial account?
## LOCATION:  F990-EZ-PART-05-LINE-42B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccount'
V2 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccountInd'
V3 <- '//Return/ReturnData/IRS990/ForeignFinancialAccount'
V4 <- '//Return/ReturnData/IRS990/ForeignFinancialAccountInd'
V5 <- '//Return/ReturnData/IRS990/Form990PartV/ForeignFinancialAccount'
V_FRGN_FIN_ACC_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_05_FRGN_FIN_ACC_X <- xml_text( xml_find_all( doc, V_FRGN_FIN_ACC_X ) )




## VARIABLE NAME:  F9_05_FRGN_FIN_ACC_CNTR
## DESCRIPTION:  Name of foreign country
## LOCATION:  F990-EZ-PART-05-LINE-42B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ForeignCountryCd'
V2 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccountCntryCd'
V3 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccountCountry'
V4 <- '//Return/ReturnData/IRS990EZ/NameOfForeignCountry'
V5 <- '//Return/ReturnData/IRS990/ForeignCountryCd'
V6 <- '//Return/ReturnData/IRS990/Form990PartV/NameOfForeignCountry'
V7 <- '//Return/ReturnData/IRS990/NameOfForeignCountry'
V_FRGN_FIN_ACC_CNTR <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_FRGN_FIN_ACC_CNTR <- xml_text( xml_find_all( doc, V_FRGN_FIN_ACC_CNTR ) )




## VARIABLE NAME:  F9_05_PTST_X
## DESCRIPTION:  Prohibited tax shelter transaction?
## LOCATION:  F990-EZ-PART-05-LINE-40E
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ProhibitedTaxShelterTrans'
V2 <- '//Return/ReturnData/IRS990EZ/ProhibitedTaxShelterTransInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/ProhibitedTaxShelterTrans'
V4 <- '//Return/ReturnData/IRS990/ProhibitedTaxShelterTrans'
V5 <- '//Return/ReturnData/IRS990/ProhibitedTaxShelterTransInd'
V_PTST_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_05_PTST_X <- xml_text( xml_find_all( doc, V_PTST_X ) )




## VARIABLE NAME:  F9_05_PTST_PARTY_NOTIFY_X
## DESCRIPTION:  Taxable party notification?
## LOCATION:  F990-PC-PART-05-LINE-05B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/TaxablePartyNotification'
V2 <- '//Return/ReturnData/IRS990/TaxablePartyNotification'
V3 <- '//Return/ReturnData/IRS990/TaxablePartyNotificationInd'
V_PTST_PARTY_NOTIFY_X <- paste( V1, V2, V3 , sep='|' )
F9_05_PTST_PARTY_NOTIFY_X <- xml_text( xml_find_all( doc, V_PTST_PARTY_NOTIFY_X ) )




## VARIABLE NAME:  F9_05_PTST_FORM_8886T_FILED_X
## DESCRIPTION:  Form 8886-T filed?
## LOCATION:  F990-PC-PART-05-LINE-05C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form8886TFiled'
V2 <- '//Return/ReturnData/IRS990/Form8886TFiledInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/Form8886TFiled'
V_PTST_FORM_8886T_FILED_X <- paste( V1, V2, V3 , sep='|' )
F9_05_PTST_FORM_8886T_FILED_X <- xml_text( xml_find_all( doc, V_PTST_FORM_8886T_FILED_X ) )




## VARIABLE NAME:  F9_05_NONDEDUCT_CONTR_X
## DESCRIPTION:  Non-deductible contributions?
## LOCATION:  F990-PC-PART-05-LINE-06A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/NonDeductibleContributions'
V2 <- '//Return/ReturnData/IRS990/NonDeductibleContributions'
V3 <- '//Return/ReturnData/IRS990/NondeductibleContributionsInd'
V_NONDEDUCT_CONTR_X <- paste( V1, V2, V3 , sep='|' )
F9_05_NONDEDUCT_CONTR_X <- xml_text( xml_find_all( doc, V_NONDEDUCT_CONTR_X ) )




## VARIABLE NAME:  F9_05_NONDEDUCT_CONTR_NOTIFY_X
## DESCRIPTION:  Non-deduct. disclosure?
## LOCATION:  F990-PC-PART-05-LINE-06B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/NonDeductibleDisclosure'
V2 <- '//Return/ReturnData/IRS990/NondeductibleContriDisclInd'
V3 <- '//Return/ReturnData/IRS990/NonDeductibleDisclosure'
V_NONDEDUCT_CONTR_NOTIFY_X <- paste( V1, V2, V3 , sep='|' )
F9_05_NONDEDUCT_CONTR_NOTIFY_X <- xml_text( xml_find_all( doc, V_NONDEDUCT_CONTR_NOTIFY_X ) )




## VARIABLE NAME:  F9_05_170C_QUID_PRO_QUO_CONTR_X
## DESCRIPTION:  Quid pro quo contributions?
## LOCATION:  F990-PC-PART-05-LINE-07A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/QuidProQuoContributions'
V2 <- '//Return/ReturnData/IRS990/QuidProQuoContributions'
V3 <- '//Return/ReturnData/IRS990/QuidProQuoContributionsInd'
V_170C_QUID_PRO_QUO_CONTR_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_QUID_PRO_QUO_CONTR_X <- xml_text( xml_find_all( doc, V_170C_QUID_PRO_QUO_CONTR_X ) )




## VARIABLE NAME:  F9_05_170C_QUID_PRO_QUO_NOTIFY_X
## DESCRIPTION:  Quid pro quo disclosure?
## LOCATION:  F990-PC-PART-05-LINE-07B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/QuidProQuoDisclosure'
V2 <- '//Return/ReturnData/IRS990/QuidProQuoContriDisclInd'
V3 <- '//Return/ReturnData/IRS990/QuidProQuoDisclosure'
V_170C_QUID_PRO_QUO_NOTIFY_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_QUID_PRO_QUO_NOTIFY_X <- xml_text( xml_find_all( doc, V_170C_QUID_PRO_QUO_NOTIFY_X ) )




## VARIABLE NAME:  F9_05_170C_FORM_8282_REQ_X
## DESCRIPTION:  Form 8282 property disposed of?
## LOCATION:  F990-PC-PART-05-LINE-07C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/Form8282PropertyDisposedOf'
V2 <- '//Return/ReturnData/IRS990/Form8282PropertyDisposedOf'
V3 <- '//Return/ReturnData/IRS990/Form8282PropertyDisposedOfInd'
V_170C_FORM_8282_REQ_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_FORM_8282_REQ_X <- xml_text( xml_find_all( doc, V_170C_FORM_8282_REQ_X ) )




## VARIABLE NAME:  F9_05_170C_NUM_FORM_8282_FILED_X
## DESCRIPTION:  Number of 8282s filed
## LOCATION:  F990-PC-PART-05-LINE-07D
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form8282FiledCnt'
V2 <- '//Return/ReturnData/IRS990/Form990PartV/NumberOf8282Filed'
V3 <- '//Return/ReturnData/IRS990/NumberOf8282Filed'
V_170C_NUM_FORM_8282_FILED_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_NUM_FORM_8282_FILED_X <- xml_text( xml_find_all( doc, V_170C_NUM_FORM_8282_FILED_X ) )




## VARIABLE NAME:  F9_05_170C_FUNDS_FOR_PREMIUM_X
## DESCRIPTION:  Funds to pay premiums?
## LOCATION:  F990-PC-PART-05-LINE-07E
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/FundsToPayPremiums'
V2 <- '//Return/ReturnData/IRS990/FundsToPayPremiums'
V3 <- '//Return/ReturnData/IRS990/RcvFndsToPayPrsnlBnftCntrctInd'
V_170C_FUNDS_FOR_PREMIUM_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_FUNDS_FOR_PREMIUM_X <- xml_text( xml_find_all( doc, V_170C_FUNDS_FOR_PREMIUM_X ) )




## VARIABLE NAME:  F9_05_170C_PREMIUM_PAID_X
## DESCRIPTION:  Premiums paid?
## LOCATION:  F990-PC-PART-05-LINE-07F
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/PremiumsPaid'
V2 <- '//Return/ReturnData/IRS990/PayPremiumsPrsnlBnftCntrctInd'
V3 <- '//Return/ReturnData/IRS990/PremiumsPaid'
V_170C_PREMIUM_PAID_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_PREMIUM_PAID_X <- xml_text( xml_find_all( doc, V_170C_PREMIUM_PAID_X ) )




## VARIABLE NAME:  F9_05_170C_FORM_8899_FILED_X
## DESCRIPTION:  Form 8899 filed?
## LOCATION:  F990-PC-PART-05-LINE-07G
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form8899Filed'
V2 <- '//Return/ReturnData/IRS990/Form8899Filedind'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/Form8899Filed'
V_170C_FORM_8899_FILED_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_FORM_8899_FILED_X <- xml_text( xml_find_all( doc, V_170C_FORM_8899_FILED_X ) )




## VARIABLE NAME:  F9_05_170C_FORM_1098C_FILED_X
## DESCRIPTION:  Form 1098-C filed?
## LOCATION:  F990-PC-PART-05-LINE-07H
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form1098CFiled'
V2 <- '//Return/ReturnData/IRS990/Form1098CFiledInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/Form1098CFiled'
V_170C_FORM_1098C_FILED_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_FORM_1098C_FILED_X <- xml_text( xml_find_all( doc, V_170C_FORM_1098C_FILED_X ) )




## VARIABLE NAME:  F9_05_DAF_EXCESS_BIZ_HOLDING_X
## DESCRIPTION:  Donor advised fund have excess business holdings?
## LOCATION:  F990-PC-PART-05-LINE-08
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DAFExcessBusinessHoldingsInd'
V2 <- '//Return/ReturnData/IRS990/ExcessBusinessHoldings'
V3 <- '//Return/ReturnData/IRS990/ExcessBusinessHoldingsInd'
V4 <- '//Return/ReturnData/IRS990/Form990PartV/ExcessBusinessHoldings'
V_DAF_EXCESS_BIZ_HOLDING_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_DAF_EXCESS_BIZ_HOLDING_X <- xml_text( xml_find_all( doc, V_DAF_EXCESS_BIZ_HOLDING_X ) )




## VARIABLE NAME:  F9_05_DAF_TAXABLE_DIST_X
## DESCRIPTION:  DAFs - Taxable distributions?
## LOCATION:  F990-PC-PART-05-LINE-09A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/TaxableDistributions'
V2 <- '//Return/ReturnData/IRS990/TaxableDistributionsInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/TaxableDistributions'
V_DAF_TAXABLE_DIST_X <- paste( V1, V2, V3 , sep='|' )
F9_05_DAF_TAXABLE_DIST_X <- xml_text( xml_find_all( doc, V_DAF_TAXABLE_DIST_X ) )




## VARIABLE NAME:  F9_05_DAF_DIST_DONOR_X
## DESCRIPTION:  DAFs - Distribution to donor?
## LOCATION:  F990-PC-PART-05-LINE-09B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DistributionToDonor'
V2 <- '//Return/ReturnData/IRS990/DistributionToDonorInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/DistributionToDonor'
V_DAF_DIST_DONOR_X <- paste( V1, V2, V3 , sep='|' )
F9_05_DAF_DIST_DONOR_X <- xml_text( xml_find_all( doc, V_DAF_DIST_DONOR_X ) )




## VARIABLE NAME:  F9_05_501C7_INITIATION_FEES
## DESCRIPTION:  501(c)(7) orgs: Initiation fees and capital contributions included on line 9
## LOCATION:  F990-EZ-PART-05-LINE-39A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InitiationFeesAmount'
V2 <- '//Return/ReturnData/IRS990EZ/InitiationFeesAndCapContriAmt'
V3 <- '//Return/ReturnData/IRS990EZ/InitiationFeesAndCapitalContri'
V4 <- '//Return/ReturnData/IRS990/InitiationFeesAmount'
V5 <- '//Return/ReturnData/IRS990/InitiationFeesAndCapContriAmt'
V6 <- '//Return/ReturnData/IRS990/Form990PartV/InitiationFeesAmount'
V_501C7_INITIATION_FEES <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_05_501C7_INITIATION_FEES <- xml_text( xml_find_all( doc, V_501C7_INITIATION_FEES ) )




## VARIABLE NAME:  F9_05_501C7_GRO_RCPT_PUB_USE
## DESCRIPTION:  501(c)(7) orgs: Gross receipts, included on line 9, for public use of club facilities
## LOCATION:  F990-EZ-PART-05-LINE-39B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsForPublicUse'
V2 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsForPublicUseAmt'
V3 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsAmount'
V4 <- '//Return/ReturnData/IRS990/GrossReceiptsAmount'
V5 <- '//Return/ReturnData/IRS990/GrossReceiptsForPublicUseAmt'
V6 <- '//Return/ReturnData/IRS990/Form990PartV/GrossReceiptsAmount'
V_501C7_GRO_RCPT_PUB_USE <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_05_501C7_GRO_RCPT_PUB_USE <- xml_text( xml_find_all( doc, V_501C7_GRO_RCPT_PUB_USE ) )




## VARIABLE NAME:  F9_05_501C12_GRO_INCOME_MEMB
## DESCRIPTION:  Gross income from members
## LOCATION:  F990-PC-PART-05-LINE-11A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/GrossIncomeFromMembers'
V2 <- '//Return/ReturnData/IRS990/GrossIncomeFromMembers'
V3 <- '//Return/ReturnData/IRS990/MembersAndShrGrossIncomeAmt'
V_501C12_GRO_INCOME_MEMB <- paste( V1, V2, V3 , sep='|' )
F9_05_501C12_GRO_INCOME_MEMB <- xml_text( xml_find_all( doc, V_501C12_GRO_INCOME_MEMB ) )




## VARIABLE NAME:  F9_05_501C12_GRO_INCOME_OTH
## DESCRIPTION:  Gross income, other sources
## LOCATION:  F990-PC-PART-05-LINE-11B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/GrossIncomeOtherSources'
V2 <- '//Return/ReturnData/IRS990/OtherSourcesGrossIncomeAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/GrossIncomeOtherSources'
V_501C12_GRO_INCOME_OTH <- paste( V1, V2, V3 , sep='|' )
F9_05_501C12_GRO_INCOME_OTH <- xml_text( xml_find_all( doc, V_501C12_GRO_INCOME_OTH ) )




## VARIABLE NAME:  F9_05_4947_FORM_990_FILED_1041_X
## DESCRIPTION:  Filed 990 in lieu of 1041?
## LOCATION:  F990-EZ-PART-05-LINE-43
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/FiledLieu1041'
V2 <- '//Return/ReturnData/IRS990EZ/OrgFiledInLieuOfForm1041Ind'
V3 <- '//Return/ReturnData/IRS990EZ/NECTFilingForm990'
V4 <- '//Return/ReturnData/IRS990EZ/NECTFilingForm990Ind'
V5 <- '//Return/ReturnData/IRS990/FiledLieu1041'
V6 <- '//Return/ReturnData/IRS990/OrgFiledInLieuOfForm1041Ind'
V7 <- '//Return/ReturnData/IRS990/Form990PartV/FiledLieu1041'
V_4947_FORM_990_FILED_1041_X <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_4947_FORM_990_FILED_1041_X <- xml_text( xml_find_all( doc, V_4947_FORM_990_FILED_1041_X ) )




## VARIABLE NAME:  F9_05_4947_TAX_EXEMPT_INT_AMT
## DESCRIPTION:  Indicates section 4947(a)(1) nonexempt charitable trusts filing Form 990 in lieu of Form 1041
## LOCATION:  F990-EZ-PART-05-LINE-43
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TaxExemptInterestAmt'
V2 <- '//Return/ReturnData/IRS990/Form990PartV/AmountOfTaxExemptInterest'
V3 <- '//Return/ReturnData/IRS990/AmountOfTaxExemptInterest'
V4 <- '//Return/ReturnData/IRS990/TaxExemptInterestAmt'
V_4947_TAX_EXEMPT_INT_AMT <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_4947_TAX_EXEMPT_INT_AMT <- xml_text( xml_find_all( doc, V_4947_TAX_EXEMPT_INT_AMT ) )




## VARIABLE NAME:  F9_05_501C29_LIC_HEALTH_PLAN_X
## DESCRIPTION:  Is the organization licensed to issue qualified health plans in more than one state?
## LOCATION:  F990-PC-PART-05-LINE-13A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/LicensedMoreThanOneState'
V2 <- '//Return/ReturnData/IRS990/LicensedMoreThanOneStateInd'
V_501C29_LIC_HEALTH_PLAN_X <- paste( V1, V2 , sep='|' )
F9_05_501C29_LIC_HEALTH_PLAN_X <- xml_text( xml_find_all( doc, V_501C29_LIC_HEALTH_PLAN_X ) )




## VARIABLE NAME:  F9_05_501C29_STATE_RESERVE_AMT
## DESCRIPTION:  State required reserves amount
## LOCATION:  F990-PC-PART-05-LINE-13B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/StateRequiredReserves'
V2 <- '//Return/ReturnData/IRS990/StateRequiredReservesAmt'
V_501C29_STATE_RESERVE_AMT <- paste( V1, V2 , sep='|' )
F9_05_501C29_STATE_RESERVE_AMT <- xml_text( xml_find_all( doc, V_501C29_STATE_RESERVE_AMT ) )




## VARIABLE NAME:  F9_05_501C29_RESERVE_MAINT_AMT
## DESCRIPTION:  Reserves maintained amount
## LOCATION:  F990-PC-PART-05-LINE-13C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AmtReservesMaintained'
V2 <- '//Return/ReturnData/IRS990/ReservesMaintainedAmt'
V_501C29_RESERVE_MAINT_AMT <- paste( V1, V2 , sep='|' )
F9_05_501C29_RESERVE_MAINT_AMT <- xml_text( xml_find_all( doc, V_501C29_RESERVE_MAINT_AMT ) )




## VARIABLE NAME:  F9_05_TANNING_SVC_PROV_X
## DESCRIPTION:  Payments received for indoor tanning services?
## LOCATION:  F990-EZ-PART-05-LINE-44C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/IndoorTanningServices'
V2 <- '//Return/ReturnData/IRS990EZ/IndoorTanningServicesInd'
V3 <- '//Return/ReturnData/IRS990EZ/TanningServicesProvided'
V4 <- '//Return/ReturnData/IRS990EZ/TanningServicesProvidedInd'
V5 <- '//Return/ReturnData/IRS990/IndoorTanningServices'
V6 <- '//Return/ReturnData/IRS990/IndoorTanningServicesInd'
V_TANNING_SVC_PROV_X <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_05_TANNING_SVC_PROV_X <- xml_text( xml_find_all( doc, V_TANNING_SVC_PROV_X ) )




## VARIABLE NAME:  F9_05_TANNING_FORM_720_FILED_X
## DESCRIPTION:  Form 720 filed and taxes paid on indoor tanning services?
## LOCATION:  F990-EZ-PART-05-LINE-44D
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/Form720Filed'
V2 <- '//Return/ReturnData/IRS990EZ/Form720FiledInd'
V3 <- '//Return/ReturnData/IRS990/Form720Filed'
V4 <- '//Return/ReturnData/IRS990/Form720FiledInd'
V_TANNING_FORM_720_FILED_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_TANNING_FORM_720_FILED_X <- xml_text( xml_find_all( doc, V_TANNING_FORM_720_FILED_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_05_INFO_SCHED_O_X,F9_05_NUM_FORM_1096_BOX_3,F9_05_NUM_FORM_W2G,F9_05_COMPLY_BACKUP_WITHHOLD_X,F9_05_NUM_EMPL,F9_05_EMPL_TAX_RETURN_FILED_X,F9_05_UBIZ_IMCOME_OVER_LIMIT_X,F9_05_UBIZ_FORM_990T_FILED_X,F9_05_FRGN_FIN_ACC_X,F9_05_FRGN_FIN_ACC_CNTR,F9_05_PTST_X,F9_05_PTST_PARTY_NOTIFY_X,F9_05_PTST_FORM_8886T_FILED_X,F9_05_NONDEDUCT_CONTR_X,F9_05_NONDEDUCT_CONTR_NOTIFY_X,F9_05_170C_QUID_PRO_QUO_CONTR_X,F9_05_170C_QUID_PRO_QUO_NOTIFY_X,F9_05_170C_FORM_8282_REQ_X,F9_05_170C_NUM_FORM_8282_FILED_X,F9_05_170C_FUNDS_FOR_PREMIUM_X,F9_05_170C_PREMIUM_PAID_X,F9_05_170C_FORM_8899_FILED_X,F9_05_170C_FORM_1098C_FILED_X,F9_05_DAF_EXCESS_BIZ_HOLDING_X,F9_05_DAF_TAXABLE_DIST_X,F9_05_DAF_DIST_DONOR_X,F9_05_501C7_INITIATION_FEES,F9_05_501C7_GRO_RCPT_PUB_USE,F9_05_501C12_GRO_INCOME_MEMB,F9_05_501C12_GRO_INCOME_OTH,F9_05_4947_FORM_990_FILED_1041_X,F9_05_4947_TAX_EXEMPT_INT_AMT,F9_05_501C29_LIC_HEALTH_PLAN_X,F9_05_501C29_STATE_RESERVE_AMT,F9_05_501C29_RESERVE_MAINT_AMT,F9_05_TANNING_SVC_PROV_X,F9_05_TANNING_FORM_720_FILED_X)
df <- as.data.frame( var.list )


return( df )


}


