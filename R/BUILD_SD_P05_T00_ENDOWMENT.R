#' @title 
#'   Build table SD-P05-T00-ENDOWMENT
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P05_T00_ENDOWMENT <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_05_RLTD_ORG_LISTED_SCHED_R_X
## DESCRIPTION:  Are related orgs listed on Schedule R?
## LOCATION:  SCHED-D-PART-05-LINE-03B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  SD_05_PC_REORLISCR, SD_05_PC_ARREORLISCR and SD_05_PC_ARREORLISCR are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/AreRelatedOrgsListedScheduleR'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/AreRelatedOrgsListedScheduleR'
V3 <- '//Return/ReturnData/IRS990ScheduleD/RelatedOrgListSchRInd'
V_RLTD_ORG_LISTED_SCHED_R_X <- paste( V1, V2, V3 , sep='|' )
SD_05_RLTD_ORG_LISTED_SCHED_R_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RLTD_ORG_LISTED_SCHED_R_X ) )
if( length( SD_05_RLTD_ORG_LISTED_SCHED_R_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_RLTD_ORG_LISTED_SCHED_R_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_RLTD_ORG_LISTED_SCHED_R_X <-  paste0( '{', SD_05_RLTD_ORG_LISTED_SCHED_R_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_PCT_L1G_BOARD_DESIGNATED
## DESCRIPTION:  Board designated EOY balance
## LOCATION:  SCHED-D-PART-05-LINE-02A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_BDBEOYPCT and SD_05_PC_BODEEOOYYBBA are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/BoardDesignatedBalanceEOYPct'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BoardDesignatedEOYBalance'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/BoardDesignatedEOYBalance'
V_PCT_L1G_BOARD_DESIGNATED <- paste( V1, V2, V3 , sep='|' )
SD_05_PCT_L1G_BOARD_DESIGNATED <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_L1G_BOARD_DESIGNATED ) )
if( length( SD_05_PCT_L1G_BOARD_DESIGNATED ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_PCT_L1G_BOARD_DESIGNATED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_PCT_L1G_BOARD_DESIGNATED <-  paste0( '{', SD_05_PCT_L1G_BOARD_DESIGNATED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYEENFUADEX, SD_05_PC_CURYEAADMEXP and SD_05_PC_CURYEAADMEXP are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/AdministrativeExpensesAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/AdministrativeExpenses'
V_ENDOW_EXP_ADMIN_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY ) )
if( length( SD_05_ENDOW_EXP_ADMIN_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_ADMIN_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_ADMIN_CY <-  paste0( '{', SD_05_ENDOW_EXP_ADMIN_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYEFBYBALANC, SD_05_PC_CUYEBEOFYEBA and SD_05_PC_CUYEBEOFYEBA are the same variables

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/BeginningYearBalanceAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/BeginningOfYearBalance'
V_ENDOW_BALANCE_BOY_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY ) )
if( length( SD_05_ENDOW_BALANCE_BOY_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_BOY_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_BOY_CY <-  paste0( '{', SD_05_ENDOW_BALANCE_BOY_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY
## DESCRIPTION:  Current Year - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYEENFUCOON, SD_05_PC_CURRYEARCONT and SD_05_PC_CURRYEARCONT are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/ContributionsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/Contributions'
V_ENDOW_CONTR_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_CONTR_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_CONTR_CY ) )
if( length( SD_05_ENDOW_CONTR_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_CONTR_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_CONTR_CY <-  paste0( '{', SD_05_ENDOW_CONTR_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:   SD_05_PC_CYEFEYBALANC, SD_05_PC_CUYEENOFYEBA and SD_05_PC_CUYEENOFYEBA are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/EndYearBalanceAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/EndOfYearBalance'
V_ENDOW_BALANCE_EOY_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY ) )
if( length( SD_05_ENDOW_BALANCE_EOY_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_EOY_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_EOY_CY <-  paste0( '{', SD_05_ENDOW_BALANCE_EOY_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYEFGOSCHOLA, SD_05_PC_CUYEGRORSCCH and SD_05_PC_CUYEGRORSCCH are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/GrantsOrScholarshipsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/GrantsOrScholarships'
V_ENDOW_GRANT_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_GRANT_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_GRANT_CY ) )
if( length( SD_05_ENDOW_GRANT_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_GRANT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_GRANT_CY <-  paste0( '{', SD_05_ENDOW_GRANT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYEFIEOLOSSE, SD_05_PC_CUYEINEAORLO and SD_05_PC_CUYEINEAORLO are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/InvestmentEarningsOrLosses'
V_ENDOW_INVEST_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_INVEST_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_INVEST_CY ) )
if( length( SD_05_ENDOW_INVEST_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_INVEST_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_INVEST_CY <-  paste0( '{', SD_05_ENDOW_INVEST_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYEENFUOTEX, SD_05_PC_CURYEAOTHEXP and SD_05_PC_CURYEAOTHEXP are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYear/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYEndwmtFundGrp/OtherExpendituresAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/CurrentYear/OtherExpenditures'
V_ENDOW_EXP_OTH_CY <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_OTH_CY ) )
if( length( SD_05_ENDOW_EXP_OTH_CY ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_OTH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_OTH_CY <-  paste0( '{', SD_05_ENDOW_EXP_OTH_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M1
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS1 and SD_05_PC_CUYEMIYEADEX1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M1 ) )
if( length( SD_05_ENDOW_EXP_ADMIN_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_ADMIN_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_ADMIN_CY_M1 <-  paste0( '{', SD_05_ENDOW_EXP_ADMIN_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M1
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN1 and SD_05_PC_CYMYBOYBALAN1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M1 ) )
if( length( SD_05_ENDOW_BALANCE_BOY_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_BOY_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_BOY_CY_M1 <-  paste0( '{', SD_05_ENDOW_BALANCE_BOY_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M1
## DESCRIPTION:  Current Year Minus1 Year - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO1 and SD_05_PC_CUYEMIYECOON1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_CONTR_CY_M1 ) )
if( length( SD_05_ENDOW_CONTR_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_CONTR_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_CONTR_CY_M1 <-  paste0( '{', SD_05_ENDOW_CONTR_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M1
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN1 and SD_05_PC_CYMYEOYBALAN1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M1 ) )
if( length( SD_05_ENDOW_BALANCE_EOY_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_EOY_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_EOY_CY_M1 <-  paste0( '{', SD_05_ENDOW_BALANCE_EOY_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M1
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL1 and SD_05_PC_CYMYGOSCHOLA1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_GRANT_CY_M1 ) )
if( length( SD_05_ENDOW_GRANT_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_GRANT_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_GRANT_CY_M1 <-  paste0( '{', SD_05_ENDOW_GRANT_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M1
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS1 and SD_05_PC_CYMYIEOLOSSE1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_INVEST_CY_M1 ) )
if( length( SD_05_ENDOW_INVEST_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_INVEST_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_INVEST_CY_M1 <-  paste0( '{', SD_05_ENDOW_INVEST_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M1
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND1 and SD_05_PC_CUYEMIYEOTEX1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M1 ) )
if( length( SD_05_ENDOW_EXP_OTH_CY_M1 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_OTH_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_OTH_CY_M1 <-  paste0( '{', SD_05_ENDOW_EXP_OTH_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M2
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS2 and SD_05_PC_CUYEMIYEADEX2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M2 ) )
if( length( SD_05_ENDOW_EXP_ADMIN_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_ADMIN_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_ADMIN_CY_M2 <-  paste0( '{', SD_05_ENDOW_EXP_ADMIN_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M2
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN2 and SD_05_PC_CYMYBOYBALAN2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M2 ) )
if( length( SD_05_ENDOW_BALANCE_BOY_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_BOY_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_BOY_CY_M2 <-  paste0( '{', SD_05_ENDOW_BALANCE_BOY_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M2
## DESCRIPTION:  Current Year Minus2 Years - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO2 and SD_05_PC_CUYEMIYECOON2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_CONTR_CY_M2 ) )
if( length( SD_05_ENDOW_CONTR_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_CONTR_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_CONTR_CY_M2 <-  paste0( '{', SD_05_ENDOW_CONTR_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M2
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN2 and SD_05_PC_CYMYEOYBALAN2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M2 ) )
if( length( SD_05_ENDOW_BALANCE_EOY_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_EOY_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_EOY_CY_M2 <-  paste0( '{', SD_05_ENDOW_BALANCE_EOY_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M2
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL2 and SD_05_PC_CYMYGOSCHOLA2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_GRANT_CY_M2 ) )
if( length( SD_05_ENDOW_GRANT_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_GRANT_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_GRANT_CY_M2 <-  paste0( '{', SD_05_ENDOW_GRANT_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M2
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS2 and SD_05_PC_CYMYIEOLOSSE2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_INVEST_CY_M2 ) )
if( length( SD_05_ENDOW_INVEST_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_INVEST_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_INVEST_CY_M2 <-  paste0( '{', SD_05_ENDOW_INVEST_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M2
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND2 and SD_05_PC_CUYEMIYEOTEX2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M2 ) )
if( length( SD_05_ENDOW_EXP_OTH_CY_M2 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_OTH_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_OTH_CY_M2 <-  paste0( '{', SD_05_ENDOW_EXP_OTH_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M3
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS3 and SD_05_PC_CUYEMIYEADEX3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M3 ) )
if( length( SD_05_ENDOW_EXP_ADMIN_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_ADMIN_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_ADMIN_CY_M3 <-  paste0( '{', SD_05_ENDOW_EXP_ADMIN_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M3
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN3 and SD_05_PC_CYMYBOYBALAN3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M3 ) )
if( length( SD_05_ENDOW_BALANCE_BOY_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_BOY_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_BOY_CY_M3 <-  paste0( '{', SD_05_ENDOW_BALANCE_BOY_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M3
## DESCRIPTION:  Current Year Minus3 Years - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO3 and SD_05_PC_CUYEMIYECOON3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_CONTR_CY_M3 ) )
if( length( SD_05_ENDOW_CONTR_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_CONTR_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_CONTR_CY_M3 <-  paste0( '{', SD_05_ENDOW_CONTR_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M3
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN3 and SD_05_PC_CYMYEOYBALAN3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M3 ) )
if( length( SD_05_ENDOW_BALANCE_EOY_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_EOY_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_EOY_CY_M3 <-  paste0( '{', SD_05_ENDOW_BALANCE_EOY_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M3
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL3 and SD_05_PC_CYMYGOSCHOLA3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_GRANT_CY_M3 ) )
if( length( SD_05_ENDOW_GRANT_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_GRANT_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_GRANT_CY_M3 <-  paste0( '{', SD_05_ENDOW_GRANT_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M3
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS3 and SD_05_PC_CYMYIEOLOSSE3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_INVEST_CY_M3 ) )
if( length( SD_05_ENDOW_INVEST_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_INVEST_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_INVEST_CY_M3 <-  paste0( '{', SD_05_ENDOW_INVEST_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M3
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND3 and SD_05_PC_CUYEMIYEOTEX3 are the same varibales.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M3 ) )
if( length( SD_05_ENDOW_EXP_OTH_CY_M3 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_OTH_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_OTH_CY_M3 <-  paste0( '{', SD_05_ENDOW_EXP_OTH_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M4
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS4 and SD_05_PC_CUYEMIYEADEX4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M4 ) )
if( length( SD_05_ENDOW_EXP_ADMIN_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_ADMIN_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_ADMIN_CY_M4 <-  paste0( '{', SD_05_ENDOW_EXP_ADMIN_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M4
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN4 and SD_05_PC_CYMYBOYBALAN4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M4 ) )
if( length( SD_05_ENDOW_BALANCE_BOY_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_BOY_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_BOY_CY_M4 <-  paste0( '{', SD_05_ENDOW_BALANCE_BOY_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M4
## DESCRIPTION:  Current Year Minus4 Years - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO4 and SD_05_PC_CUYEMIYECOON4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_CONTR_CY_M4 ) )
if( length( SD_05_ENDOW_CONTR_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_CONTR_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_CONTR_CY_M4 <-  paste0( '{', SD_05_ENDOW_CONTR_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M4
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN4 and SD_05_PC_CYMYEOYBALAN4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M4 ) )
if( length( SD_05_ENDOW_BALANCE_EOY_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_BALANCE_EOY_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_BALANCE_EOY_CY_M4 <-  paste0( '{', SD_05_ENDOW_BALANCE_EOY_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M4
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL4 and SD_05_PC_CYMYGOSCHOLA4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_GRANT_CY_M4 ) )
if( length( SD_05_ENDOW_GRANT_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_GRANT_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_GRANT_CY_M4 <-  paste0( '{', SD_05_ENDOW_GRANT_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M4
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS4 and SD_05_PC_CYMYIEOLOSSE4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_INVEST_CY_M4 ) )
if( length( SD_05_ENDOW_INVEST_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_INVEST_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_INVEST_CY_M4 <-  paste0( '{', SD_05_ENDOW_INVEST_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M4
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND4 and SD_05_PC_CUYEMIYEOTEX4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M4 ) )
if( length( SD_05_ENDOW_EXP_OTH_CY_M4 ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_EXP_OTH_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_EXP_OTH_CY_M4 <-  paste0( '{', SD_05_ENDOW_EXP_OTH_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_HELD_ORG_RLTD_X
## DESCRIPTION:  Endowments held by related organizations?
## LOCATION:  SCHED-D-PART-05-LINE-03A(ii)
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  SD_05_PC_ENDHELRELORG,SD_05_PC_ENHEBYREORRG and SD_05_PC_ENHEBYREORRG are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/EndowmentsHeldByRelatedOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EndowmentsHeldRelatedOrgInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/EndowmentsHeldByRelatedOrgs'
V_ENDOW_HELD_ORG_RLTD_X <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_HELD_ORG_RLTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_HELD_ORG_RLTD_X ) )
if( length( SD_05_ENDOW_HELD_ORG_RLTD_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_HELD_ORG_RLTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_HELD_ORG_RLTD_X <-  paste0( '{', SD_05_ENDOW_HELD_ORG_RLTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_ENDOW_HELD_ORG_UNRLTD_X
## DESCRIPTION:  Endowments held by unrelated organizations?
## LOCATION:  SCHED-D-PART-05-LINE-03A(i)
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  SD_05_PC_ENDHELUNRORG, SD_05_PC_ENHEBYUNORRG and SD_05_PC_ENHEBYUNORRG are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/EndowmentsHeldByUnrelatedOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EndowmentsHeldUnrelatedOrgInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/EndowmentsHeldByUnrelatedOrgs'
V_ENDOW_HELD_ORG_UNRLTD_X <- paste( V1, V2, V3 , sep='|' )
SD_05_ENDOW_HELD_ORG_UNRLTD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ENDOW_HELD_ORG_UNRLTD_X ) )
if( length( SD_05_ENDOW_HELD_ORG_UNRLTD_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_ENDOW_HELD_ORG_UNRLTD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_ENDOW_HELD_ORG_UNRLTD_X <-  paste0( '{', SD_05_ENDOW_HELD_ORG_UNRLTD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_PCT_L1G_PERMANENT_ENDOW
## DESCRIPTION:  Permanent endowment EOY balance
## LOCATION:  SCHED-D-PART-05-LINE-02B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_PEENEOOYYBBA, SD_05_PC_PEBEOYPCT and SD_05_PC_PEENEOOYYBBA are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/PermanentEndowmentEOYBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/PermanentEndowmentEOYBalance'
V3 <- '//Return/ReturnData/IRS990ScheduleD/PrmnntEndowmentBalanceEOYPct'
V_PCT_L1G_PERMANENT_ENDOW <- paste( V1, V2, V3 , sep='|' )
SD_05_PCT_L1G_PERMANENT_ENDOW <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_L1G_PERMANENT_ENDOW ) )
if( length( SD_05_PCT_L1G_PERMANENT_ENDOW ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_PCT_L1G_PERMANENT_ENDOW, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_PCT_L1G_PERMANENT_ENDOW <-  paste0( '{', SD_05_PCT_L1G_PERMANENT_ENDOW, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_05_PCT_L1G_TERM_ENDOW
## DESCRIPTION:  Term endowment EOY balance
## LOCATION:  SCHED-D-PART-05-LINE-02C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_TEENEOOYYBBA, SD_05_PC_TEENEOOYYBBA and SD_05_PC_TEBEOYPCT are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/TermEndowmentEOYBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TermEndowmentBalanceEOYPct'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TermEndowmentEOYBalance'
V_PCT_L1G_TERM_ENDOW <- paste( V1, V2, V3 , sep='|' )
SD_05_PCT_L1G_TERM_ENDOW <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_L1G_TERM_ENDOW ) )
if( length( SD_05_PCT_L1G_TERM_ENDOW ) > 1 )
{ 
  log_collapsed_record( varname=SD_05_PCT_L1G_TERM_ENDOW, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_05_PCT_L1G_TERM_ENDOW <-  paste0( '{', SD_05_PCT_L1G_TERM_ENDOW, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_05_RLTD_ORG_LISTED_SCHED_R_X,SD_05_PCT_L1G_BOARD_DESIGNATED,SD_05_ENDOW_EXP_ADMIN_CY,SD_05_ENDOW_BALANCE_BOY_CY,SD_05_ENDOW_CONTR_CY,SD_05_ENDOW_BALANCE_EOY_CY,SD_05_ENDOW_GRANT_CY,SD_05_ENDOW_INVEST_CY,SD_05_ENDOW_EXP_OTH_CY,SD_05_ENDOW_EXP_ADMIN_CY_M1,SD_05_ENDOW_BALANCE_BOY_CY_M1,SD_05_ENDOW_CONTR_CY_M1,SD_05_ENDOW_BALANCE_EOY_CY_M1,SD_05_ENDOW_GRANT_CY_M1,SD_05_ENDOW_INVEST_CY_M1,SD_05_ENDOW_EXP_OTH_CY_M1,SD_05_ENDOW_EXP_ADMIN_CY_M2,SD_05_ENDOW_BALANCE_BOY_CY_M2,SD_05_ENDOW_CONTR_CY_M2,SD_05_ENDOW_BALANCE_EOY_CY_M2,SD_05_ENDOW_GRANT_CY_M2,SD_05_ENDOW_INVEST_CY_M2,SD_05_ENDOW_EXP_OTH_CY_M2,SD_05_ENDOW_EXP_ADMIN_CY_M3,SD_05_ENDOW_BALANCE_BOY_CY_M3,SD_05_ENDOW_CONTR_CY_M3,SD_05_ENDOW_BALANCE_EOY_CY_M3,SD_05_ENDOW_GRANT_CY_M3,SD_05_ENDOW_INVEST_CY_M3,SD_05_ENDOW_EXP_OTH_CY_M3,SD_05_ENDOW_EXP_ADMIN_CY_M4,SD_05_ENDOW_BALANCE_BOY_CY_M4,SD_05_ENDOW_CONTR_CY_M4,SD_05_ENDOW_BALANCE_EOY_CY_M4,SD_05_ENDOW_GRANT_CY_M4,SD_05_ENDOW_INVEST_CY_M4,SD_05_ENDOW_EXP_OTH_CY_M4,SD_05_ENDOW_HELD_ORG_RLTD_X,SD_05_ENDOW_HELD_ORG_UNRLTD_X,SD_05_PCT_L1G_PERMANENT_ENDOW,SD_05_PCT_L1G_TERM_ENDOW)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


