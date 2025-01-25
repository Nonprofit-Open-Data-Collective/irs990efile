#' @title 
#'   Build table F9-P05-T00-OTHER-IRS-FILING
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P05_T00_OTHER_IRS_FILING <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_05_170C_FUNDS_FOR_PREMIUM_X
## DESCRIPTION:  Did the organization receive any funds, directly or indirectly, to pay premiums on a personal benefit contract?
## LOCATION:  F990-PC-PART-05-LINE-7E
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/TransferPrsnlBnftContractsDecl/DeclarationDesc'
V2 <- '//Return/ReturnData/TransferPrsnlBnftContractsDecl/Declaration'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/FundsToPayPremiums'
V4 <- '//Return/ReturnData/IRS990/FundsToPayPremiums'
V5 <- '//Return/ReturnData/IRS990/RcvFndsToPayPrsnlBnftCntrctInd'
V_170C_FUNDS_FOR_PREMIUM_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_05_170C_FUNDS_FOR_PREMIUM_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_FUNDS_FOR_PREMIUM_X ) )
if( length( F9_05_170C_FUNDS_FOR_PREMIUM_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_FUNDS_FOR_PREMIUM_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_FUNDS_FOR_PREMIUM_X <-  paste0( '{', F9_05_170C_FUNDS_FOR_PREMIUM_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_4947_TAX_EXEMPT_INT_AMT
## DESCRIPTION:  Indicates section 4947(a)(1) nonexempt charitable trusts filing Form 990 in lieu of Form 1041
## LOCATION:  F990-PC-PART-05-LINE-12B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AmountOfTaxExemptInterest'
V2 <- '//Return/ReturnData/IRS990/Form990PartV/AmountOfTaxExemptInterest'
V3 <- '//Return/ReturnData/IRS990/TaxExemptInterestAmt'
V4 <- '//Return/ReturnData/IRS990EZ/TaxExemptInterestAmt'
V_4947_TAX_EXEMPT_INT_AMT <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_4947_TAX_EXEMPT_INT_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_4947_TAX_EXEMPT_INT_AMT ) )
if( length( F9_05_4947_TAX_EXEMPT_INT_AMT ) > 1 )
{ 
  create_record( varname=F9_05_4947_TAX_EXEMPT_INT_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_4947_TAX_EXEMPT_INT_AMT <-  paste0( '{', F9_05_4947_TAX_EXEMPT_INT_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_501C29_RESERVE_MAINT_AMT
## DESCRIPTION:  Reserves maintained amount
## LOCATION:  F990-PC-PART-05-LINE-13C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AmtReservesMaintained'
V2 <- '//Return/ReturnData/IRS990/ReservesMaintainedAmt'
V_501C29_RESERVE_MAINT_AMT <- paste( V1, V2 , sep='|' )
F9_05_501C29_RESERVE_MAINT_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_501C29_RESERVE_MAINT_AMT ) )
if( length( F9_05_501C29_RESERVE_MAINT_AMT ) > 1 )
{ 
  create_record( varname=F9_05_501C29_RESERVE_MAINT_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C29_RESERVE_MAINT_AMT <-  paste0( '{', F9_05_501C29_RESERVE_MAINT_AMT, '}', collapse=';' ) 
} 




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
F9_05_COMPLY_BACKUP_WITHHOLD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMPLY_BACKUP_WITHHOLD_X ) )
if( length( F9_05_COMPLY_BACKUP_WITHHOLD_X ) > 1 )
{ 
  create_record( varname=F9_05_COMPLY_BACKUP_WITHHOLD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_COMPLY_BACKUP_WITHHOLD_X <-  paste0( '{', F9_05_COMPLY_BACKUP_WITHHOLD_X, '}', collapse=';' ) 
} 




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
F9_05_DAF_EXCESS_BIZ_HOLDING_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DAF_EXCESS_BIZ_HOLDING_X ) )
if( length( F9_05_DAF_EXCESS_BIZ_HOLDING_X ) > 1 )
{ 
  create_record( varname=F9_05_DAF_EXCESS_BIZ_HOLDING_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_DAF_EXCESS_BIZ_HOLDING_X <-  paste0( '{', F9_05_DAF_EXCESS_BIZ_HOLDING_X, '}', collapse=';' ) 
} 




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
F9_05_DAF_DIST_DONOR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DAF_DIST_DONOR_X ) )
if( length( F9_05_DAF_DIST_DONOR_X ) > 1 )
{ 
  create_record( varname=F9_05_DAF_DIST_DONOR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_DAF_DIST_DONOR_X <-  paste0( '{', F9_05_DAF_DIST_DONOR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_NUM_EMPL
## DESCRIPTION:  Number of employees on Form W-3
## LOCATION:  F990-PC-PART-05-LINE-02A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/EmployeeCnt'
V2 <- '//Return/ReturnData/IRS990/Form990PartV/NumberOfEmployees'
V3 <- '//Return/ReturnData/IRS990/NumberOfEmployees'
V_NUM_EMPL <- paste( V1, V2, V3 , sep='|' )
F9_05_NUM_EMPL <- xml2::xml_text( xml2::xml_find_all( doc, V_NUM_EMPL ) )
if( length( F9_05_NUM_EMPL ) > 1 )
{ 
  create_record( varname=F9_05_NUM_EMPL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_NUM_EMPL <-  paste0( '{', F9_05_NUM_EMPL, '}', collapse=';' ) 
} 




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
F9_05_EMPL_TAX_RETURN_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMPL_TAX_RETURN_FILED_X ) )
if( length( F9_05_EMPL_TAX_RETURN_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_EMPL_TAX_RETURN_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_EMPL_TAX_RETURN_FILED_X <-  paste0( '{', F9_05_EMPL_TAX_RETURN_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_4947_FORM_990_FILED_1041_X
## DESCRIPTION:  Filed 990 in lieu of 1041?
## LOCATION:  F990-PC-PART-05-LINE-12A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FiledLieu1041'
V2 <- '//Return/ReturnData/IRS990/Form990PartV/FiledLieu1041'
V3 <- '//Return/ReturnData/IRS990/OrgFiledInLieuOfForm1041Ind'
V4 <- '//Return/ReturnData/IRS990EZ/FiledLieu1041'
V5 <- '//Return/ReturnData/IRS990EZ/NECTFilingForm990'
V6 <- '//Return/ReturnData/IRS990EZ/NECTFilingForm990Ind'
V7 <- '//Return/ReturnData/IRS990EZ/OrgFiledInLieuOfForm1041Ind'
V_4947_FORM_990_FILED_1041_X <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_4947_FORM_990_FILED_1041_X <- xml2::xml_text( xml2::xml_find_all( doc, V_4947_FORM_990_FILED_1041_X ) )
if( length( F9_05_4947_FORM_990_FILED_1041_X ) > 1 )
{ 
  create_record( varname=F9_05_4947_FORM_990_FILED_1041_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_4947_FORM_990_FILED_1041_X <-  paste0( '{', F9_05_4947_FORM_990_FILED_1041_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_FRGN_FIN_ACC_CNTR
## DESCRIPTION:  Name of foreign country
## LOCATION:  F990-PC-PART-05-LINE-04B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ForeignCountryCd'
V2 <- '//Return/ReturnData/IRS990/Form990PartV/NameOfForeignCountry'
V3 <- '//Return/ReturnData/IRS990/NameOfForeignCountry'
V4 <- '//Return/ReturnData/IRS990EZ/ForeignCountryCd'
V5 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccountCntryCd'
V6 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccountCountry'
V7 <- '//Return/ReturnData/IRS990EZ/NameOfForeignCountry'
V_FRGN_FIN_ACC_CNTR <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_FRGN_FIN_ACC_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_FIN_ACC_CNTR ) )
if( length( F9_05_FRGN_FIN_ACC_CNTR ) > 1 )
{ 
  create_record( varname=F9_05_FRGN_FIN_ACC_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_FRGN_FIN_ACC_CNTR <-  paste0( '{', F9_05_FRGN_FIN_ACC_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_FRGN_FIN_ACC_X
## DESCRIPTION:  Foreign financial account?
## LOCATION:  F990-PC-PART-05-LINE-04A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ForeignFinancialAccount'
V2 <- '//Return/ReturnData/IRS990/ForeignFinancialAccountInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/ForeignFinancialAccount'
V4 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccount'
V5 <- '//Return/ReturnData/IRS990EZ/ForeignFinancialAccountInd'
V_FRGN_FIN_ACC_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_05_FRGN_FIN_ACC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_FIN_ACC_X ) )
if( length( F9_05_FRGN_FIN_ACC_X ) > 1 )
{ 
  create_record( varname=F9_05_FRGN_FIN_ACC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_FRGN_FIN_ACC_X <-  paste0( '{', F9_05_FRGN_FIN_ACC_X, '}', collapse=';' ) 
} 




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
F9_05_170C_FORM_1098C_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_FORM_1098C_FILED_X ) )
if( length( F9_05_170C_FORM_1098C_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_FORM_1098C_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_FORM_1098C_FILED_X <-  paste0( '{', F9_05_170C_FORM_1098C_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_TANNING_FORM_720_FILED_X
## DESCRIPTION:  Form 720 filed and taxes paid on indoor tanning services?
## LOCATION:  F990-PC-PART-05-LINE-14B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form720Filed'
V2 <- '//Return/ReturnData/IRS990/Form720FiledInd'
V3 <- '//Return/ReturnData/IRS990EZ/Form720Filed'
V4 <- '//Return/ReturnData/IRS990EZ/Form720FiledInd'
V_TANNING_FORM_720_FILED_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_TANNING_FORM_720_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TANNING_FORM_720_FILED_X ) )
if( length( F9_05_TANNING_FORM_720_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_TANNING_FORM_720_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_TANNING_FORM_720_FILED_X <-  paste0( '{', F9_05_TANNING_FORM_720_FILED_X, '}', collapse=';' ) 
} 




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
F9_05_170C_NUM_FORM_8282_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_NUM_FORM_8282_FILED_X ) )
if( length( F9_05_170C_NUM_FORM_8282_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_NUM_FORM_8282_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_NUM_FORM_8282_FILED_X <-  paste0( '{', F9_05_170C_NUM_FORM_8282_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_170C_FORM_8282_REQ_X
## DESCRIPTION:  Form 8282 required?
## LOCATION:  F990-PC-PART-05-LINE-07C
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form8282PropertyDisposedOf'
V2 <- '//Return/ReturnData/IRS990/Form8282PropertyDisposedOfInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartV/Form8282PropertyDisposedOf'
V_170C_FORM_8282_REQ_X <- paste( V1, V2, V3 , sep='|' )
F9_05_170C_FORM_8282_REQ_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_FORM_8282_REQ_X ) )
if( length( F9_05_170C_FORM_8282_REQ_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_FORM_8282_REQ_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_FORM_8282_REQ_X <-  paste0( '{', F9_05_170C_FORM_8282_REQ_X, '}', collapse=';' ) 
} 




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
F9_05_PTST_FORM_8886T_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PTST_FORM_8886T_FILED_X ) )
if( length( F9_05_PTST_FORM_8886T_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_PTST_FORM_8886T_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_PTST_FORM_8886T_FILED_X <-  paste0( '{', F9_05_PTST_FORM_8886T_FILED_X, '}', collapse=';' ) 
} 




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
F9_05_170C_FORM_8899_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_FORM_8899_FILED_X ) )
if( length( F9_05_170C_FORM_8899_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_FORM_8899_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_FORM_8899_FILED_X <-  paste0( '{', F9_05_170C_FORM_8899_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_UBIZ_FORM_990T_FILED_X
## DESCRIPTION:  Form 990-T filed?
## LOCATION:  F990-PC-PART-05-LINE-03B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/Form990-TFiled'
V2 <- '//Return/ReturnData/IRS990/Form990-TFiled'
V3 <- '//Return/ReturnData/IRS990/Form990TFiledInd'
V4 <- '//Return/ReturnData/IRS990EZ/Form990-TFiled'
V5 <- '//Return/ReturnData/IRS990EZ/Form990TFiledInd'
V6 <- '//Return/ReturnData/IRS990EZ/OrganizationFiled990T'
V7 <- '//Return/ReturnData/IRS990EZ/OrganizationFiled990TInd'
V_UBIZ_FORM_990T_FILED_X <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_UBIZ_FORM_990T_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_UBIZ_FORM_990T_FILED_X ) )
if( length( F9_05_UBIZ_FORM_990T_FILED_X ) > 1 )
{ 
  create_record( varname=F9_05_UBIZ_FORM_990T_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_UBIZ_FORM_990T_FILED_X <-  paste0( '{', F9_05_UBIZ_FORM_990T_FILED_X, '}', collapse=';' ) 
} 




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
F9_05_501C12_GRO_INCOME_MEMB <- xml2::xml_text( xml2::xml_find_all( doc, V_501C12_GRO_INCOME_MEMB ) )
if( length( F9_05_501C12_GRO_INCOME_MEMB ) > 1 )
{ 
  create_record( varname=F9_05_501C12_GRO_INCOME_MEMB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C12_GRO_INCOME_MEMB <-  paste0( '{', F9_05_501C12_GRO_INCOME_MEMB, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_501C12_GRO_INCOME_OTH
## DESCRIPTION:  Gross income; other sources
## LOCATION:  F990-PC-PART-05-LINE-11B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/GrossIncomeOtherSources'
V2 <- '//Return/ReturnData/IRS990/GrossIncomeOtherSources'
V3 <- '//Return/ReturnData/IRS990/OtherSourcesGrossIncomeAmt'
V_501C12_GRO_INCOME_OTH <- paste( V1, V2, V3 , sep='|' )
F9_05_501C12_GRO_INCOME_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_501C12_GRO_INCOME_OTH ) )
if( length( F9_05_501C12_GRO_INCOME_OTH ) > 1 )
{ 
  create_record( varname=F9_05_501C12_GRO_INCOME_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C12_GRO_INCOME_OTH <-  paste0( '{', F9_05_501C12_GRO_INCOME_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_501C7_GRO_RCPT_PUB_USE
## DESCRIPTION:  Gross receipts amount
## LOCATION:  F990-PC-PART-05-LINE-10B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/GrossReceiptsAmount'
V2 <- '//Return/ReturnData/IRS990/GrossReceiptsAmount'
V3 <- '//Return/ReturnData/IRS990/GrossReceiptsForPublicUseAmt'
V4 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsAmount'
V5 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsForPublicUse'
V6 <- '//Return/ReturnData/IRS990EZ/GrossReceiptsForPublicUseAmt'
V_501C7_GRO_RCPT_PUB_USE <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_05_501C7_GRO_RCPT_PUB_USE <- xml2::xml_text( xml2::xml_find_all( doc, V_501C7_GRO_RCPT_PUB_USE ) )
if( length( F9_05_501C7_GRO_RCPT_PUB_USE ) > 1 )
{ 
  create_record( varname=F9_05_501C7_GRO_RCPT_PUB_USE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C7_GRO_RCPT_PUB_USE <-  paste0( '{', F9_05_501C7_GRO_RCPT_PUB_USE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_501C7_INITIATION_FEES
## DESCRIPTION:  Initiation fees amount
## LOCATION:  F990-PC-PART-05-LINE-10A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/InitiationFeesAmount'
V2 <- '//Return/ReturnData/IRS990/InitiationFeesAmount'
V3 <- '//Return/ReturnData/IRS990/InitiationFeesAndCapContriAmt'
V4 <- '//Return/ReturnData/IRS990EZ/InitiationFeesAmount'
V5 <- '//Return/ReturnData/IRS990EZ/InitiationFeesAndCapContriAmt'
V6 <- '//Return/ReturnData/IRS990EZ/InitiationFeesAndCapitalContri'
V_501C7_INITIATION_FEES <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_05_501C7_INITIATION_FEES <- xml2::xml_text( xml2::xml_find_all( doc, V_501C7_INITIATION_FEES ) )
if( length( F9_05_501C7_INITIATION_FEES ) > 1 )
{ 
  create_record( varname=F9_05_501C7_INITIATION_FEES, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C7_INITIATION_FEES <-  paste0( '{', F9_05_501C7_INITIATION_FEES, '}', collapse=';' ) 
} 




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
F9_05_NONDEDUCT_CONTR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_NONDEDUCT_CONTR_X ) )
if( length( F9_05_NONDEDUCT_CONTR_X ) > 1 )
{ 
  create_record( varname=F9_05_NONDEDUCT_CONTR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_NONDEDUCT_CONTR_X <-  paste0( '{', F9_05_NONDEDUCT_CONTR_X, '}', collapse=';' ) 
} 




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
F9_05_NONDEDUCT_CONTR_NOTIFY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_NONDEDUCT_CONTR_NOTIFY_X ) )
if( length( F9_05_NONDEDUCT_CONTR_NOTIFY_X ) > 1 )
{ 
  create_record( varname=F9_05_NONDEDUCT_CONTR_NOTIFY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_NONDEDUCT_CONTR_NOTIFY_X <-  paste0( '{', F9_05_NONDEDUCT_CONTR_NOTIFY_X, '}', collapse=';' ) 
} 




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
F9_05_NUM_FORM_W2G <- xml2::xml_text( xml2::xml_find_all( doc, V_NUM_FORM_W2G ) )
if( length( F9_05_NUM_FORM_W2G ) > 1 )
{ 
  create_record( varname=F9_05_NUM_FORM_W2G, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_NUM_FORM_W2G <-  paste0( '{', F9_05_NUM_FORM_W2G, '}', collapse=';' ) 
} 




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
F9_05_170C_PREMIUM_PAID_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_PREMIUM_PAID_X ) )
if( length( F9_05_170C_PREMIUM_PAID_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_PREMIUM_PAID_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_PREMIUM_PAID_X <-  paste0( '{', F9_05_170C_PREMIUM_PAID_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_PTST_X
## DESCRIPTION:  Prohibited tax shelter transaction?
## LOCATION:  F990-PC-PART-05-LINE-05A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/ProhibitedTaxShelterTrans'
V2 <- '//Return/ReturnData/IRS990/ProhibitedTaxShelterTrans'
V3 <- '//Return/ReturnData/IRS990/ProhibitedTaxShelterTransInd'
V4 <- '//Return/ReturnData/IRS990EZ/ProhibitedTaxShelterTrans'
V5 <- '//Return/ReturnData/IRS990EZ/ProhibitedTaxShelterTransInd'
V_PTST_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_05_PTST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PTST_X ) )
if( length( F9_05_PTST_X ) > 1 )
{ 
  create_record( varname=F9_05_PTST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_PTST_X <-  paste0( '{', F9_05_PTST_X, '}', collapse=';' ) 
} 




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
F9_05_170C_QUID_PRO_QUO_CONTR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_QUID_PRO_QUO_CONTR_X ) )
if( length( F9_05_170C_QUID_PRO_QUO_CONTR_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_QUID_PRO_QUO_CONTR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_QUID_PRO_QUO_CONTR_X <-  paste0( '{', F9_05_170C_QUID_PRO_QUO_CONTR_X, '}', collapse=';' ) 
} 




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
F9_05_170C_QUID_PRO_QUO_NOTIFY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_170C_QUID_PRO_QUO_NOTIFY_X ) )
if( length( F9_05_170C_QUID_PRO_QUO_NOTIFY_X ) > 1 )
{ 
  create_record( varname=F9_05_170C_QUID_PRO_QUO_NOTIFY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_170C_QUID_PRO_QUO_NOTIFY_X <-  paste0( '{', F9_05_170C_QUID_PRO_QUO_NOTIFY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_DAF_TAXABLE_DIST_X
## DESCRIPTION:  Taxable distributions?
## LOCATION:  F990-PC-PART-05-LINE-09A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/TaxableDistributions'
V2 <- '//Return/ReturnData/IRS990/TaxableDistributions'
V3 <- '//Return/ReturnData/IRS990/TaxableDistributionsInd'
V_DAF_TAXABLE_DIST_X <- paste( V1, V2, V3 , sep='|' )
F9_05_DAF_TAXABLE_DIST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DAF_TAXABLE_DIST_X ) )
if( length( F9_05_DAF_TAXABLE_DIST_X ) > 1 )
{ 
  create_record( varname=F9_05_DAF_TAXABLE_DIST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_DAF_TAXABLE_DIST_X <-  paste0( '{', F9_05_DAF_TAXABLE_DIST_X, '}', collapse=';' ) 
} 




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
F9_05_PTST_PARTY_NOTIFY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PTST_PARTY_NOTIFY_X ) )
if( length( F9_05_PTST_PARTY_NOTIFY_X ) > 1 )
{ 
  create_record( varname=F9_05_PTST_PARTY_NOTIFY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_PTST_PARTY_NOTIFY_X <-  paste0( '{', F9_05_PTST_PARTY_NOTIFY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_UBIZ_IMCOME_OVER_LIMIT_X
## DESCRIPTION:  Unrelated business income?
## LOCATION:  F990-PC-PART-05-LINE-03A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartV/UnrelatedBusinessIncome'
V2 <- '//Return/ReturnData/IRS990/UnrelatedBusIncmOverLimitInd'
V3 <- '//Return/ReturnData/IRS990/UnrelatedBusinessIncome'
V4 <- '//Return/ReturnData/IRS990EZ/OrganizationHadUBI'
V5 <- '//Return/ReturnData/IRS990EZ/OrganizationHadUBIInd'
V6 <- '//Return/ReturnData/IRS990EZ/UnrelatedBusIncmOverLimitInd'
V7 <- '//Return/ReturnData/IRS990EZ/UnrelatedBusinessIncome'
V_UBIZ_IMCOME_OVER_LIMIT_X <- paste( V1, V2, V3, V4, V5, V6, V7 , sep='|' )
F9_05_UBIZ_IMCOME_OVER_LIMIT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_UBIZ_IMCOME_OVER_LIMIT_X ) )
if( length( F9_05_UBIZ_IMCOME_OVER_LIMIT_X ) > 1 )
{ 
  create_record( varname=F9_05_UBIZ_IMCOME_OVER_LIMIT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_UBIZ_IMCOME_OVER_LIMIT_X <-  paste0( '{', F9_05_UBIZ_IMCOME_OVER_LIMIT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_TANNING_SVC_PROV_X
## DESCRIPTION:  Payments received for indoor tanning services?
## LOCATION:  F990-PC-PART-05-LINE-14A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/IndoorTanningServices'
V2 <- '//Return/ReturnData/IRS990/IndoorTanningServicesInd'
V3 <- '//Return/ReturnData/IRS990EZ/IndoorTanningServices'
V4 <- '//Return/ReturnData/IRS990EZ/IndoorTanningServicesInd'
V5 <- '//Return/ReturnData/IRS990EZ/TanningServicesProvided'
V6 <- '//Return/ReturnData/IRS990EZ/TanningServicesProvidedInd'
V_TANNING_SVC_PROV_X <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_05_TANNING_SVC_PROV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TANNING_SVC_PROV_X ) )
if( length( F9_05_TANNING_SVC_PROV_X ) > 1 )
{ 
  create_record( varname=F9_05_TANNING_SVC_PROV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_TANNING_SVC_PROV_X <-  paste0( '{', F9_05_TANNING_SVC_PROV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_INFO_SCHED_O_X
## DESCRIPTION:  Does Schedule O contains a response to a question in Part V?
## LOCATION:  F990-PC-PART-05-LINE-00
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartV'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVInd'
V3 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartV'
V4 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartVInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_05_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_05_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_05_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_INFO_SCHED_O_X <-  paste0( '{', F9_05_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_NUM_FORM_1096_BOX_3
## DESCRIPTION:  Number forms transmitted with 1096
## LOCATION:  F990-PC-PART-05-LINE-01A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/IRPDocumentCnt'
V2 <- '//Return/ReturnData/IRS990/NumberFormsTransmittedWith1096'
V_NUM_FORM_1096_BOX_3 <- paste( V1, V2 , sep='|' )
F9_05_NUM_FORM_1096_BOX_3 <- xml2::xml_text( xml2::xml_find_all( doc, V_NUM_FORM_1096_BOX_3 ) )
if( length( F9_05_NUM_FORM_1096_BOX_3 ) > 1 )
{ 
  create_record( varname=F9_05_NUM_FORM_1096_BOX_3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_NUM_FORM_1096_BOX_3 <-  paste0( '{', F9_05_NUM_FORM_1096_BOX_3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_501C29_LIC_HEALTH_PLAN_X
## DESCRIPTION:  Is the organization licensed to issue qualified health plans in more than one state?
## LOCATION:  F990-PC-PART-05-LINE-13A
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/LicensedMoreThanOneState'
V2 <- '//Return/ReturnData/IRS990/LicensedMoreThanOneStateInd'
V_501C29_LIC_HEALTH_PLAN_X <- paste( V1, V2 , sep='|' )
F9_05_501C29_LIC_HEALTH_PLAN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_501C29_LIC_HEALTH_PLAN_X ) )
if( length( F9_05_501C29_LIC_HEALTH_PLAN_X ) > 1 )
{ 
  create_record( varname=F9_05_501C29_LIC_HEALTH_PLAN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C29_LIC_HEALTH_PLAN_X <-  paste0( '{', F9_05_501C29_LIC_HEALTH_PLAN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_05_501C29_STATE_RESERVE_AMT
## DESCRIPTION:  State required reserves amount
## LOCATION:  F990-PC-PART-05-LINE-13B
## TABLE:  F9-P05-T00-OTHER-IRS-FILING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/StateRequiredReserves'
V2 <- '//Return/ReturnData/IRS990/StateRequiredReservesAmt'
V_501C29_STATE_RESERVE_AMT <- paste( V1, V2 , sep='|' )
F9_05_501C29_STATE_RESERVE_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_501C29_STATE_RESERVE_AMT ) )
if( length( F9_05_501C29_STATE_RESERVE_AMT ) > 1 )
{ 
  create_record( varname=F9_05_501C29_STATE_RESERVE_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_05_501C29_STATE_RESERVE_AMT <-  paste0( '{', F9_05_501C29_STATE_RESERVE_AMT, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_05_170C_FUNDS_FOR_PREMIUM_X,F9_05_4947_TAX_EXEMPT_INT_AMT,F9_05_501C29_RESERVE_MAINT_AMT,F9_05_COMPLY_BACKUP_WITHHOLD_X,F9_05_DAF_EXCESS_BIZ_HOLDING_X,F9_05_DAF_DIST_DONOR_X,F9_05_NUM_EMPL,F9_05_EMPL_TAX_RETURN_FILED_X,F9_05_4947_FORM_990_FILED_1041_X,F9_05_FRGN_FIN_ACC_CNTR,F9_05_FRGN_FIN_ACC_X,F9_05_170C_FORM_1098C_FILED_X,F9_05_TANNING_FORM_720_FILED_X,F9_05_170C_NUM_FORM_8282_FILED_X,F9_05_170C_FORM_8282_REQ_X,F9_05_PTST_FORM_8886T_FILED_X,F9_05_170C_FORM_8899_FILED_X,F9_05_UBIZ_FORM_990T_FILED_X,F9_05_501C12_GRO_INCOME_MEMB,F9_05_501C12_GRO_INCOME_OTH,F9_05_501C7_GRO_RCPT_PUB_USE,F9_05_501C7_INITIATION_FEES,F9_05_NONDEDUCT_CONTR_X,F9_05_NONDEDUCT_CONTR_NOTIFY_X,F9_05_NUM_FORM_W2G,F9_05_170C_PREMIUM_PAID_X,F9_05_PTST_X,F9_05_170C_QUID_PRO_QUO_CONTR_X,F9_05_170C_QUID_PRO_QUO_NOTIFY_X,F9_05_DAF_TAXABLE_DIST_X,F9_05_PTST_PARTY_NOTIFY_X,F9_05_UBIZ_IMCOME_OVER_LIMIT_X,F9_05_TANNING_SVC_PROV_X,F9_05_INFO_SCHED_O_X,F9_05_NUM_FORM_1096_BOX_3,F9_05_501C29_LIC_HEALTH_PLAN_X,F9_05_501C29_STATE_RESERVE_AMT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


