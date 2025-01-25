#' @title 
#'   Build table SD-P11-T00-RECONCILIATION-REVENUE
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P11_T00_RECONCILIATION_REVENUE <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_11_RECO_REV_DONATED_SVC
## DESCRIPTION:  Donated services and use of facilities
## LOCATION:  SCHED-D-PART-11-LINE-02B
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DonatedServicesAndUseFcltsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DonatedSrvcAndUseOfFacilities'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/DonatedSrvcAndUseOfFacilities'
V_RECO_REV_DONATED_SVC <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_DONATED_SVC <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_DONATED_SVC ) )
if( length( SD_11_RECO_REV_DONATED_SVC ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_DONATED_SVC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_DONATED_SVC <-  paste0( '{', SD_11_RECO_REV_DONATED_SVC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_TOT_PER_AFS
## DESCRIPTION:  Form990 Schedule DPart XI - Total revenue
## LOCATION:  SCHED-D-PART-11-LINE-01
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/TotalRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/TotRevenueEtcAuditedFinclStmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalRevEtcAuditedFinclStmtAmt'
V4 <- '//Return/ReturnData/IRS990ScheduleD/TotRevenueEtcAuditedFinclStmt'
V_RECO_REV_TOT_PER_AFS <- paste( V1, V2, V3, V4 , sep='|' )
SD_11_RECO_REV_TOT_PER_AFS <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_TOT_PER_AFS ) )
if( length( SD_11_RECO_REV_TOT_PER_AFS ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_TOT_PER_AFS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_TOT_PER_AFS <-  paste0( '{', SD_11_RECO_REV_TOT_PER_AFS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_INVEST_NO_INCL
## DESCRIPTION:  Investment expenses not included on Form 990; Part VIII; line 7b
## LOCATION:  SCHED-D-PART-11-LINE-04A
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/InvestmentExpensesNotIncluded'
V2 <- '//Return/ReturnData/IRS990ScheduleD/InvestmentExpensesNotIncldAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/InvestmentExpensesNotIncluded'
V_RECO_REV_INVEST_NO_INCL <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_INVEST_NO_INCL <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_INVEST_NO_INCL ) )
if( length( SD_11_RECO_REV_INVEST_NO_INCL ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_INVEST_NO_INCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_INVEST_NO_INCL <-  paste0( '{', SD_11_RECO_REV_INVEST_NO_INCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_SUBTRACT_L2E_L1
## DESCRIPTION:  Part XII line 1 minus Part XII line 2e
## LOCATION:  SCHED-D-PART-11-LINE-03
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/Line1MinusLine2e'
V2 <- '//Return/ReturnData/IRS990ScheduleD/RevenueSubtotal'
V3 <- '//Return/ReturnData/IRS990ScheduleD/RevenueSubtotalAmt'
V_RECO_REV_SUBTRACT_L2E_L1 <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_SUBTRACT_L2E_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_SUBTRACT_L2E_L1 ) )
if( length( SD_11_RECO_REV_SUBTRACT_L2E_L1 ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_SUBTRACT_L2E_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_SUBTRACT_L2E_L1 <-  paste0( '{', SD_11_RECO_REV_SUBTRACT_L2E_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_NUGAINS_INVEST
## DESCRIPTION:  Net unrealized gains on investments
## LOCATION:  SCHED-D-PART-11-LINE-02A
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/NetUnrealizedGainsInvestments'
V2 <- '//Return/ReturnData/IRS990ScheduleD/NetUnrealizedGainsInvestments'
V3 <- '//Return/ReturnData/IRS990ScheduleD/NetUnrealizedGainsInvstAmt'
V_RECO_REV_NUGAINS_INVEST <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_NUGAINS_INVEST <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_NUGAINS_INVEST ) )
if( length( SD_11_RECO_REV_NUGAINS_INVEST ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_NUGAINS_INVEST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_NUGAINS_INVEST <-  paste0( '{', SD_11_RECO_REV_NUGAINS_INVEST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_OTH
## DESCRIPTION:  Other revenues
## LOCATION:  SCHED-D-PART-11-LINE-02D
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/OtherRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherRevenues'
V_RECO_REV_OTH <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_OTH ) )
if( length( SD_11_RECO_REV_OTH ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_OTH <-  paste0( '{', SD_11_RECO_REV_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_OTH_NO_INCL
## DESCRIPTION:  Other revenues not included
## LOCATION:  SCHED-D-PART-11-LINE-04B
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/OtherRevenuesNotIncluded'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherRevenuesNotIncluded'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherRevenuesNotIncludedAmt'
V_RECO_REV_OTH_NO_INCL <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_OTH_NO_INCL <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_OTH_NO_INCL ) )
if( length( SD_11_RECO_REV_OTH_NO_INCL ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_OTH_NO_INCL, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_OTH_NO_INCL <-  paste0( '{', SD_11_RECO_REV_OTH_NO_INCL, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_GRANT_PY
## DESCRIPTION:  Recoveries of prior year grants
## LOCATION:  SCHED-D-PART-11-LINE-02C
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/RecoveriesOfPriorYearGrants'
V2 <- '//Return/ReturnData/IRS990ScheduleD/RecoveriesOfPriorYearGrants'
V3 <- '//Return/ReturnData/IRS990ScheduleD/RecoveriesPriorYearGrantsAmt'
V_RECO_REV_GRANT_PY <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_GRANT_PY <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_GRANT_PY ) )
if( length( SD_11_RECO_REV_GRANT_PY ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_GRANT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_GRANT_PY <-  paste0( '{', SD_11_RECO_REV_GRANT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_ADD_L2ABCD
## DESCRIPTION:  Total amounts; add lines 2a through 2d
## LOCATION:  SCHED-D-PART-11-LINE-02E
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/TotalAmountsLine2aTo2d'
V2 <- '//Return/ReturnData/IRS990ScheduleD/RevenueNotReportedAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/RevenueNotRptdF990'
V_RECO_REV_ADD_L2ABCD <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_ADD_L2ABCD <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_ADD_L2ABCD ) )
if( length( SD_11_RECO_REV_ADD_L2ABCD ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_ADD_L2ABCD, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_ADD_L2ABCD <-  paste0( '{', SD_11_RECO_REV_ADD_L2ABCD, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_ADD_L4AB
## DESCRIPTION:  Total amounts; add lines 4a through 4b
## LOCATION:  SCHED-D-PART-11-LINE-04C
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/TotalAmountsLine4aTo4b'
V2 <- '//Return/ReturnData/IRS990ScheduleD/RevenueNotReportedFinclStmtAmt'
V_RECO_REV_ADD_L4AB <- paste( V1, V2 , sep='|' )
SD_11_RECO_REV_ADD_L4AB <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_ADD_L4AB ) )
if( length( SD_11_RECO_REV_ADD_L4AB ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_ADD_L4AB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_ADD_L4AB <-  paste0( '{', SD_11_RECO_REV_ADD_L4AB, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_11_RECO_REV_TOT
## DESCRIPTION:  Total revenue (Form 990; Part 1; Line 12). Add lines 3 and 4c
## LOCATION:  SCHED-D-PART-11-LINE-05
## TABLE:  SD-P11-T00-RECONCILIATION-REVENUE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXII/TotalRevenuePerForm990'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalRevenuePerForm990'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalRevenuePerForm990Amt'
V_RECO_REV_TOT <- paste( V1, V2, V3 , sep='|' )
SD_11_RECO_REV_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_REV_TOT ) )
if( length( SD_11_RECO_REV_TOT ) > 1 )
{ 
  create_record( varname=SD_11_RECO_REV_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_11_RECO_REV_TOT <-  paste0( '{', SD_11_RECO_REV_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_11_RECO_REV_DONATED_SVC,SD_11_RECO_REV_TOT_PER_AFS,SD_11_RECO_REV_INVEST_NO_INCL,SD_11_RECO_REV_SUBTRACT_L2E_L1,SD_11_RECO_REV_NUGAINS_INVEST,SD_11_RECO_REV_OTH,SD_11_RECO_REV_OTH_NO_INCL,SD_11_RECO_REV_GRANT_PY,SD_11_RECO_REV_ADD_L2ABCD,SD_11_RECO_REV_ADD_L4AB,SD_11_RECO_REV_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


