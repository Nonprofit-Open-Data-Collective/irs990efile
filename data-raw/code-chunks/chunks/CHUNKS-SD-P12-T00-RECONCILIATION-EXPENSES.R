#' @title 
#'   Build table SD-P12-T00-RECONCILIATION-EXPENSES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P12_T00_RECONCILIATION_EXPENSES <- function( doc, url )
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


## VARIABLE NAME:  SD_12_RECO_EXP_TOT_PER_AFS
## DESCRIPTION:  Total Expenses; and Losses per audited financial statments
## LOCATION:  SCHED-D-PART-12-LINE-01
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/TotExpnsEtcAuditedFinclStmtAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotExpensesEtcAuditedFinclStmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotExpensesEtcAuditedFinclStmt'
V_RECO_EXP_TOT_PER_AFS <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_TOT_PER_AFS <- xml_text( xml_find_all( doc, V_RECO_EXP_TOT_PER_AFS ) )




## VARIABLE NAME:  SD_12_RECO_EXP_DONATED_SVC
## DESCRIPTION:  Donated Services and Use of Facilities
## LOCATION:  SCHED-D-PART-12-LINE-02A
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DonatedServicesUseFcltsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DonatedServicesUseOfFacilities'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/DonatedServicesUseOfFacilities'
V_RECO_EXP_DONATED_SVC <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_DONATED_SVC <- xml_text( xml_find_all( doc, V_RECO_EXP_DONATED_SVC ) )




## VARIABLE NAME:  SD_12_RECO_EXP_PY_ADJ
## DESCRIPTION:  Prior year adjustments
## LOCATION:  SCHED-D-PART-12-LINE-02B
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/PriorYearAdjustmentsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/PriorYearAdjustments'
V3 <- '//Return/ReturnData/IRS990ScheduleD/PriorYearAdjustments'
V_RECO_EXP_PY_ADJ <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_PY_ADJ <- xml_text( xml_find_all( doc, V_RECO_EXP_PY_ADJ ) )




## VARIABLE NAME:  SD_12_RECO_EXP_LOSSES
## DESCRIPTION:  Losses reported
## LOCATION:  SCHED-D-PART-12-LINE-02C
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/LossesReported'
V2 <- '//Return/ReturnData/IRS990ScheduleD/LossesReported'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LossesReportedAmt'
V_RECO_EXP_LOSSES <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_LOSSES <- xml_text( xml_find_all( doc, V_RECO_EXP_LOSSES ) )




## VARIABLE NAME:  SD_12_RECO_EXP_OTH_INCL
## DESCRIPTION:  Other expenses included
## LOCATION:  SCHED-D-PART-12-LINE-02D
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/OtherExpensesIncluded'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherExpensesIncluded'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherExpensesIncludedAmt'
V_RECO_EXP_OTH_INCL <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_OTH_INCL <- xml_text( xml_find_all( doc, V_RECO_EXP_OTH_INCL ) )




## VARIABLE NAME:  SD_12_RECO_EXP_ADD_L2A_2D
## DESCRIPTION:  Total amounts; add lines 2a through 2d
## LOCATION:  SCHED-D-PART-12-LINE-02E
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesNotReportedAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesNotRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotalAmountsLine2aTo2d'
V_RECO_EXP_ADD_L2A_2D <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_ADD_L2A_2D <- xml_text( xml_find_all( doc, V_RECO_EXP_ADD_L2A_2D ) )




## VARIABLE NAME:  SD_12_RECO_EXP_SUBTOT_L1_M_L2E
## DESCRIPTION:  Part XII line 1 minus Part XII line 2e
## LOCATION:  SCHED-D-PART-12-LINE-03
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesSubtotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesSubtotal'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/Line1MinusLine2e'
V_RECO_EXP_SUBTOT_L1_M_L2E <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_SUBTOT_L1_M_L2E <- xml_text( xml_find_all( doc, V_RECO_EXP_SUBTOT_L1_M_L2E ) )




## VARIABLE NAME:  SD_12_RECO_EXP_INVEST_NO_INCL
## DESCRIPTION:  Investment expenses not included on Form 990; Part VIII; line 7b
## LOCATION:  SCHED-D-PART-12-LINE-04A
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/InvestmentExpensesNotIncluded'
V2 <- '//Return/ReturnData/IRS990ScheduleD/InvestmentExpensesNotIncld2Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/InvestmentExpensesNotIncluded2'
V_RECO_EXP_INVEST_NO_INCL <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_INVEST_NO_INCL <- xml_text( xml_find_all( doc, V_RECO_EXP_INVEST_NO_INCL ) )




## VARIABLE NAME:  SD_12_RECO_EXP_OTH_NO_INCL
## DESCRIPTION:  Other expenses
## LOCATION:  SCHED-D-PART-12-LINE-04B
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/OtherExpensesNotIncluded'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherExpensesNotIncluded'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherExpensesNotIncludedAmt'
V_RECO_EXP_OTH_NO_INCL <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_OTH_NO_INCL <- xml_text( xml_find_all( doc, V_RECO_EXP_OTH_NO_INCL ) )




## VARIABLE NAME:  SD_12_RECO_EXP_ADD_L4AB
## DESCRIPTION:  Total amounts; add lines 4a through 4b
## LOCATION:  SCHED-D-PART-12-LINE-04C
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesNotRptFinclStmtAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/RevenueNotRptdOnFinStmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesNotRptdOnFinStmt'
V4 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotalAmountsLine4aTo4b'
V_RECO_EXP_ADD_L4AB <- paste( V1, V2, V3, V4 , sep='|' )
SD_12_RECO_EXP_ADD_L4AB <- xml_text( xml_find_all( doc, V_RECO_EXP_ADD_L4AB ) )




## VARIABLE NAME:  SD_12_RECO_EXP_TOT 
## DESCRIPTION:  Total expenses (Form 990; Part I; Line 18). Add lines 3 and 4c
## LOCATION:  SCHED-D-PART-12-LINE-05
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/TotalExpensesPerForm990Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotalExpensesPerForm990'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalExpensesPerForm990'
V_RECO_EXP_TOT  <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_TOT  <- xml_text( xml_find_all( doc, V_RECO_EXP_TOT  ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_12_RECO_EXP_TOT_PER_AFS,SD_12_RECO_EXP_DONATED_SVC,SD_12_RECO_EXP_PY_ADJ,SD_12_RECO_EXP_LOSSES,SD_12_RECO_EXP_OTH_INCL,SD_12_RECO_EXP_ADD_L2A_2D,SD_12_RECO_EXP_SUBTOT_L1_M_L2E,SD_12_RECO_EXP_INVEST_NO_INCL,SD_12_RECO_EXP_OTH_NO_INCL,SD_12_RECO_EXP_ADD_L4AB,SD_12_RECO_EXP_TOT )
df <- as.data.frame( var.list )


return( df )


}


