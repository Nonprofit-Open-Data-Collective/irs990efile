#' @title 
#'   Build table F9-P12-T00-FINANCIAL-REPORTING
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P12_T00_FINANCIAL_REPORTING <- function( doc, url )
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


## VARIABLE NAME:  F9_12_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part XII
## LOCATION:  F990-PC-PART-12-LINE-00
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartXII'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartXIIInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_12_INFO_SCHED_O_X <- xml_text( xml_find_all( doc, V_INFO_SCHED_O_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_METHOD_ACC_ACCRU_X
## DESCRIPTION:  Method of accounting - Accrual
## LOCATION:  F990-PC-PART-12-LINE-01
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartXI/MethodOfAccountingAccrual'
V2 <- '//Return/ReturnData/IRS990/MethodOfAccountingAccrual'
V3 <- '//Return/ReturnData/IRS990/MethodOfAccountingAccrualInd'
V4 <- '//Return/ReturnData/IRS990EZ/MethodOfAccountingAccrual'
V5 <- '//Return/ReturnData/IRS990EZ/MethodOfAccountingAccrualInd'
V_FINSTAT_METHOD_ACC_ACCRU_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_12_FINSTAT_METHOD_ACC_ACCRU_X <- xml_text( xml_find_all( doc, V_FINSTAT_METHOD_ACC_ACCRU_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_METHOD_ACC_CASH_X
## DESCRIPTION:  Method of accounting - Cash
## LOCATION:  F990-PC-PART-12-LINE-01
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartXI/MethodOfAccountingCash'
V2 <- '//Return/ReturnData/IRS990/MethodOfAccountingCash'
V3 <- '//Return/ReturnData/IRS990/MethodOfAccountingCashInd'
V4 <- '//Return/ReturnData/IRS990EZ/MethodOfAccountingCash'
V5 <- '//Return/ReturnData/IRS990EZ/MethodOfAccountingCashInd'
V_FINSTAT_METHOD_ACC_CASH_X <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_12_FINSTAT_METHOD_ACC_CASH_X <- xml_text( xml_find_all( doc, V_FINSTAT_METHOD_ACC_CASH_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_METHOD_ACC_OTH
## DESCRIPTION:  Indicates method of accounting is other
## LOCATION:  F990-EZ-PART-00-SECTION-G
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/MethodOfAccountingOther'
V2 <- '//Return/ReturnData/IRS990EZ/MethodOfAccountingOtherDesc'
V_FINSTAT_METHOD_ACC_OTH <- paste( V1, V2 , sep='|' )
F9_12_FINSTAT_METHOD_ACC_OTH <- xml_text( xml_find_all( doc, V_FINSTAT_METHOD_ACC_OTH ) )




## VARIABLE NAME:  F9_12_FINSTAT_METHOD_ACC_OTH_X
## DESCRIPTION:  Method of accounting - Other
## LOCATION:  F990-PC-PART-12-LINE-01
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartXI/MethodOfAccountingOther'
V2 <- '//Return/ReturnData/IRS990/MethodOfAccountingOther'
V3 <- '//Return/ReturnData/IRS990/MethodOfAccountingOtherInd'
V_FINSTAT_METHOD_ACC_OTH_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_METHOD_ACC_OTH_X <- xml_text( xml_find_all( doc, V_FINSTAT_METHOD_ACC_OTH_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_COMPILE_BOTH_X
## DESCRIPTION:  Accountant Compile Or Review Basis - FinancialStatementBoth
## LOCATION:  F990-PC-PART-12-LINE-02A
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountantCompileOrReviewBasis/FinancialStatementBoth'
V2 <- '//Return/ReturnData/IRS990/AcctCompileOrReviewBasisGrp/ConsolAndSepBasisFinclStmtInd'
V_FINSTAT_COMPILE_BOTH_X <- paste( V1, V2 , sep='|' )
F9_12_FINSTAT_COMPILE_BOTH_X <- xml_text( xml_find_all( doc, V_FINSTAT_COMPILE_BOTH_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_COMPILE_CONSOL_X
## DESCRIPTION:  Accountant Compile Or Review Basis - FinancialStatementConsolidated
## LOCATION:  F990-PC-PART-12-LINE-02A
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountantCompileOrReviewBasis/FinancialStatementConsolidated'
V2 <- '//Return/ReturnData/IRS990/AcctCompileOrReviewBasisGrp/ConsolidatedBasisFinclStmtInd'
V_FINSTAT_COMPILE_CONSOL_X <- paste( V1, V2 , sep='|' )
F9_12_FINSTAT_COMPILE_CONSOL_X <- xml_text( xml_find_all( doc, V_FINSTAT_COMPILE_CONSOL_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_COMPILE_SEP_X
## DESCRIPTION:  Accountant Compile Or Review Basis - FinancialStatementSeparate
## LOCATION:  F990-PC-PART-12-LINE-02A
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountantCompileOrReviewBasis/FinancialStatementSeparate'
V2 <- '//Return/ReturnData/IRS990/AcctCompileOrReviewBasisGrp/SeparateBasisFinclStmtInd'
V_FINSTAT_COMPILE_SEP_X <- paste( V1, V2 , sep='|' )
F9_12_FINSTAT_COMPILE_SEP_X <- xml_text( xml_find_all( doc, V_FINSTAT_COMPILE_SEP_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_COMPILE_X
## DESCRIPTION:  Accountant provide compilation or review?
## LOCATION:  F990-PC-PART-12-LINE-02A
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountantCompileOrReview'
V2 <- '//Return/ReturnData/IRS990/AccountantCompileOrReviewInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartXI/AccountantCompileOrReview'
V_FINSTAT_COMPILE_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_COMPILE_X <- xml_text( xml_find_all( doc, V_FINSTAT_COMPILE_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_AUDIT_BOTH_X
## DESCRIPTION:  Financial statement issued on consolidated and separate basis
## LOCATION:  F990-PC-PART-12-LINE-02B
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FinancialStatementBoth'
V2 <- '//Return/ReturnData/IRS990/FSAuditedBasis/FinancialStatementBoth'
V3 <- '//Return/ReturnData/IRS990/FSAuditedBasisGrp/ConsolAndSepBasisFinclStmtInd'
V_FINSTAT_AUDIT_BOTH_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_AUDIT_BOTH_X <- xml_text( xml_find_all( doc, V_FINSTAT_AUDIT_BOTH_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_AUDIT_CONSOL_X
## DESCRIPTION:  Financial statement issued on consolidated basis
## LOCATION:  F990-PC-PART-12-LINE-02B
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FinancialStatementConsolidated'
V2 <- '//Return/ReturnData/IRS990/FSAuditedBasis/FinancialStatementConsolidated'
V3 <- '//Return/ReturnData/IRS990/FSAuditedBasisGrp/ConsolidatedBasisFinclStmtInd'
V_FINSTAT_AUDIT_CONSOL_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_AUDIT_CONSOL_X <- xml_text( xml_find_all( doc, V_FINSTAT_AUDIT_CONSOL_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_AUDIT_SEP_X
## DESCRIPTION:  Financial statement issued on separate basis
## LOCATION:  F990-PC-PART-12-LINE-02B
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FinancialStatementSeparate'
V2 <- '//Return/ReturnData/IRS990/FSAuditedBasis/FinancialStatementSeparate'
V3 <- '//Return/ReturnData/IRS990/FSAuditedBasisGrp/SeparateBasisFinclStmtInd'
V_FINSTAT_AUDIT_SEP_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_AUDIT_SEP_X <- xml_text( xml_find_all( doc, V_FINSTAT_AUDIT_SEP_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_AUDIT_X
## DESCRIPTION:  Financial sheets audited?
## LOCATION:  F990-PC-PART-12-LINE-02B
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartXI/FSAudited'
V2 <- '//Return/ReturnData/IRS990/FSAudited'
V3 <- '//Return/ReturnData/IRS990/FSAuditedInd'
V_FINSTAT_AUDIT_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_AUDIT_X <- xml_text( xml_find_all( doc, V_FINSTAT_AUDIT_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_AUDIT_COMMITTEE_X
## DESCRIPTION:  Does the organization have an audit committee?
## LOCATION:  F990-PC-PART-12-LINE-02C
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AuditCommittee'
V2 <- '//Return/ReturnData/IRS990/AuditCommitteeInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartXI/AuditCommittee'
V_FINSTAT_AUDIT_COMMITTEE_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_AUDIT_COMMITTEE_X <- xml_text( xml_find_all( doc, V_FINSTAT_AUDIT_COMMITTEE_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_FED_AUDIT_REQ_X
## DESCRIPTION:  Federal grant audit required?
## LOCATION:  F990-PC-PART-12-LINE-03A
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FederalGrantAuditRequired'
V2 <- '//Return/ReturnData/IRS990/FederalGrantAuditRequiredInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartXI/FederalGrantAuditRequired'
V_FINSTAT_FED_AUDIT_REQ_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_FED_AUDIT_REQ_X <- xml_text( xml_find_all( doc, V_FINSTAT_FED_AUDIT_REQ_X ) )




## VARIABLE NAME:  F9_12_FINSTAT_FED_AUDIT_PERF_X
## DESCRIPTION:  Federal grant audit performed?
## LOCATION:  F990-PC-PART-12-LINE-03B
## TABLE:  F9-P12-T00-FINANCIAL-REPORTING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FederalGrantAuditPerformed'
V2 <- '//Return/ReturnData/IRS990/FederalGrantAuditPerformedInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartXI/FederalGrantAuditPerformed'
V_FINSTAT_FED_AUDIT_PERF_X <- paste( V1, V2, V3 , sep='|' )
F9_12_FINSTAT_FED_AUDIT_PERF_X <- xml_text( xml_find_all( doc, V_FINSTAT_FED_AUDIT_PERF_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_12_INFO_SCHED_O_X,F9_12_FINSTAT_METHOD_ACC_ACCRU_X,F9_12_FINSTAT_METHOD_ACC_CASH_X,F9_12_FINSTAT_METHOD_ACC_OTH,F9_12_FINSTAT_METHOD_ACC_OTH_X,F9_12_FINSTAT_COMPILE_BOTH_X,F9_12_FINSTAT_COMPILE_CONSOL_X,F9_12_FINSTAT_COMPILE_SEP_X,F9_12_FINSTAT_COMPILE_X,F9_12_FINSTAT_AUDIT_BOTH_X,F9_12_FINSTAT_AUDIT_CONSOL_X,F9_12_FINSTAT_AUDIT_SEP_X,F9_12_FINSTAT_AUDIT_X,F9_12_FINSTAT_AUDIT_COMMITTEE_X,F9_12_FINSTAT_FED_AUDIT_REQ_X,F9_12_FINSTAT_FED_AUDIT_PERF_X)
df <- as.data.frame( var.list )


return( df )


}


