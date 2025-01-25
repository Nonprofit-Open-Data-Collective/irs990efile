#' @title 
#'   Build table SD-P12-T00-RECONCILIATION-EXPENSES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P12_T00_RECONCILIATION_EXPENSES <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


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
SD_12_RECO_EXP_DONATED_SVC <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_DONATED_SVC ) )
if( length( SD_12_RECO_EXP_DONATED_SVC ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_DONATED_SVC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_DONATED_SVC <-  paste0( '{', SD_12_RECO_EXP_DONATED_SVC, '}', collapse=';' ) 
} 




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
SD_12_RECO_EXP_ADD_L2A_2D <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_ADD_L2A_2D ) )
if( length( SD_12_RECO_EXP_ADD_L2A_2D ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_ADD_L2A_2D, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_ADD_L2A_2D <-  paste0( '{', SD_12_RECO_EXP_ADD_L2A_2D, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_12_RECO_EXP_ADD_L4AB
## DESCRIPTION:  Total amounts; add lines 4a through 4b
## LOCATION:  SCHED-D-PART-12-LINE-04C
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesNotRptdOnFinStmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesNotRptFinclStmtAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotalAmountsLine4aTo4b'
V4 <- '//Return/ReturnData/IRS990ScheduleD/RevenueNotRptdOnFinStmt'
V_RECO_EXP_ADD_L4AB <- paste( V1, V2, V3, V4 , sep='|' )
SD_12_RECO_EXP_ADD_L4AB <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_ADD_L4AB ) )
if( length( SD_12_RECO_EXP_ADD_L4AB ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_ADD_L4AB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_ADD_L4AB <-  paste0( '{', SD_12_RECO_EXP_ADD_L4AB, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_12_RECO_EXP_SUBTOT_L1_M_L2E
## DESCRIPTION:  Part XIII line 1 minus Part XIII line 2e
## LOCATION:  SCHED-D-PART-12-LINE-03
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesSubtotal'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesSubtotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/Line1MinusLine2e'
V_RECO_EXP_SUBTOT_L1_M_L2E <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_SUBTOT_L1_M_L2E <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_SUBTOT_L1_M_L2E ) )
if( length( SD_12_RECO_EXP_SUBTOT_L1_M_L2E ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_SUBTOT_L1_M_L2E, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_SUBTOT_L1_M_L2E <-  paste0( '{', SD_12_RECO_EXP_SUBTOT_L1_M_L2E, '}', collapse=';' ) 
} 




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
SD_12_RECO_EXP_INVEST_NO_INCL <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_INVEST_NO_INCL ) )
if( length( SD_12_RECO_EXP_INVEST_NO_INCL ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_INVEST_NO_INCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_INVEST_NO_INCL <-  paste0( '{', SD_12_RECO_EXP_INVEST_NO_INCL, '}', collapse=';' ) 
} 




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
SD_12_RECO_EXP_LOSSES <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_LOSSES ) )
if( length( SD_12_RECO_EXP_LOSSES ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_LOSSES, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_LOSSES <-  paste0( '{', SD_12_RECO_EXP_LOSSES, '}', collapse=';' ) 
} 




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
SD_12_RECO_EXP_OTH_INCL <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_OTH_INCL ) )
if( length( SD_12_RECO_EXP_OTH_INCL ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_OTH_INCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_OTH_INCL <-  paste0( '{', SD_12_RECO_EXP_OTH_INCL, '}', collapse=';' ) 
} 




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
SD_12_RECO_EXP_OTH_NO_INCL <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_OTH_NO_INCL ) )
if( length( SD_12_RECO_EXP_OTH_NO_INCL ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_OTH_NO_INCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_OTH_NO_INCL <-  paste0( '{', SD_12_RECO_EXP_OTH_NO_INCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_12_RECO_EXP_PY_ADJ
## DESCRIPTION:  Prior year adjustments
## LOCATION:  SCHED-D-PART-12-LINE-02B
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/PriorYearAdjustments'
V2 <- '//Return/ReturnData/IRS990ScheduleD/PriorYearAdjustments'
V3 <- '//Return/ReturnData/IRS990ScheduleD/PriorYearAdjustmentsAmt'
V_RECO_EXP_PY_ADJ <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_PY_ADJ <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_PY_ADJ ) )
if( length( SD_12_RECO_EXP_PY_ADJ ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_PY_ADJ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_PY_ADJ <-  paste0( '{', SD_12_RECO_EXP_PY_ADJ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_12_RECO_EXP_TOT
## DESCRIPTION:  Total expenses (Form 990; Part I; Line 18). Add lines 3 and 4c
## LOCATION:  SCHED-D-PART-12-LINE-05
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotalExpensesPerForm990'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalExpensesPerForm990'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalExpensesPerForm990Amt'
V_RECO_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_TOT ) )
if( length( SD_12_RECO_EXP_TOT ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_TOT <-  paste0( '{', SD_12_RECO_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_12_RECO_EXP_TOT_PER_AFS
## DESCRIPTION:  Total Expenses; and Losses per audited financial statments
## LOCATION:  SCHED-D-PART-12-LINE-01
## TABLE:  SD-P12-T00-RECONCILIATION-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXIII/TotExpensesEtcAuditedFinclStmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotExpensesEtcAuditedFinclStmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotExpnsEtcAuditedFinclStmtAmt'
V_RECO_EXP_TOT_PER_AFS <- paste( V1, V2, V3 , sep='|' )
SD_12_RECO_EXP_TOT_PER_AFS <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_EXP_TOT_PER_AFS ) )
if( length( SD_12_RECO_EXP_TOT_PER_AFS ) > 1 )
{ 
  create_record( varname=SD_12_RECO_EXP_TOT_PER_AFS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_12_RECO_EXP_TOT_PER_AFS <-  paste0( '{', SD_12_RECO_EXP_TOT_PER_AFS, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_12_RECO_EXP_DONATED_SVC,SD_12_RECO_EXP_ADD_L2A_2D,SD_12_RECO_EXP_ADD_L4AB,SD_12_RECO_EXP_SUBTOT_L1_M_L2E,SD_12_RECO_EXP_INVEST_NO_INCL,SD_12_RECO_EXP_LOSSES,SD_12_RECO_EXP_OTH_INCL,SD_12_RECO_EXP_OTH_NO_INCL,SD_12_RECO_EXP_PY_ADJ,SD_12_RECO_EXP_TOT,SD_12_RECO_EXP_TOT_PER_AFS)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


