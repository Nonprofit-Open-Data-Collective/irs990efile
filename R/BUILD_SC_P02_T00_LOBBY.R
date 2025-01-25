#' @title 
#'   Build table SC-P02-T00-LOBBY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SC_P02_T00_LOBBY <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SC_02_LOB_ACT_4912TAX_ORG
## DESCRIPTION:  If ""Yes;"" enter the amount of any tax incurred under section 4912
## LOCATION:  SCHED-C-PART-02-B-LINE-02B-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmountOf4912Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/AmountOf4912Tax'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Tax4912Amt'
V_LOB_ACT_4912TAX_ORG <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_4912TAX_ORG <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_4912TAX_ORG ) )
if( length( SC_02_LOB_ACT_4912TAX_ORG ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_4912TAX_ORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_4912TAX_ORG <-  paste0( '{', SC_02_LOB_ACT_4912TAX_ORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_4912TAX_MGR
## DESCRIPTION:  If ""Yes;"" enter the amount of any tax incurred by organization managers under section 4912
## LOCATION:  SCHED-C-PART-02-B-LINE-02C-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmountOfManagers4912Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/AmountOfManagers4912Tax'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Managers4912TaxAmt'
V_LOB_ACT_4912TAX_MGR <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_4912TAX_MGR <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_4912TAX_MGR ) )
if( length( SC_02_LOB_ACT_4912TAX_MGR ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_4912TAX_MGR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_4912TAX_MGR <-  paste0( '{', SC_02_LOB_ACT_4912TAX_MGR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_LOB_CY
## DESCRIPTION:  Grassroots Lobbying Expenditures - Current year
## LOCATION:  SCHED-C-PART-02-A-LINE-02F-COL-D
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsLobbyingExpendGrp/CurrentYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsLobbyingExpenditures/CurrentYear'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsLobbyingExpenditures/CurrentYear'
V_AVE_EXP_GRASS_LOB_CY <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_LOB_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_LOB_CY ) )
if( length( SC_02_AVE_EXP_GRASS_LOB_CY ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_LOB_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_LOB_CY <-  paste0( '{', SC_02_AVE_EXP_GRASS_LOB_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_LOB_CY_M1
## DESCRIPTION:  Grassroots Lobbying Expenditures - Current year minus 1
## LOCATION:  SCHED-C-PART-02-A-LINE-02F-COL-C
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsLobbyingExpendGrp/CurrentYearMinus1Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsLobbyingExpenditures/CurrentYearMinus1'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsLobbyingExpenditures/CurrentYearMinus1'
V_AVE_EXP_GRASS_LOB_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_LOB_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_LOB_CY_M1 ) )
if( length( SC_02_AVE_EXP_GRASS_LOB_CY_M1 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_LOB_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_LOB_CY_M1 <-  paste0( '{', SC_02_AVE_EXP_GRASS_LOB_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_LOB_CY_M2
## DESCRIPTION:  Grassroots Lobbying Expenditures - Current year minus 2
## LOCATION:  SCHED-C-PART-02-A-LINE-02F-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsLobbyingExpendGrp/CurrentYearMinus2Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsLobbyingExpenditures/CurrentYearMinus2'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsLobbyingExpenditures/CurrentYearMinus2'
V_AVE_EXP_GRASS_LOB_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_LOB_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_LOB_CY_M2 ) )
if( length( SC_02_AVE_EXP_GRASS_LOB_CY_M2 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_LOB_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_LOB_CY_M2 <-  paste0( '{', SC_02_AVE_EXP_GRASS_LOB_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_LOB_CY_M3
## DESCRIPTION:  Grassroots Lobbying Expenditures - Current year minus 3
## LOCATION:  SCHED-C-PART-02-A-LINE-02F-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsLobbyingExpendGrp/CurrentYearMinus3Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsLobbyingExpenditures/CurrentYearMinus3'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsLobbyingExpenditures/CurrentYearMinus3'
V_AVE_EXP_GRASS_LOB_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_LOB_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_LOB_CY_M3 ) )
if( length( SC_02_AVE_EXP_GRASS_LOB_CY_M3 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_LOB_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_LOB_CY_M3 <-  paste0( '{', SC_02_AVE_EXP_GRASS_LOB_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_LOB_TOT
## DESCRIPTION:  Grassroots Lobbying Expenditures - Total
## LOCATION:  SCHED-C-PART-02-A-LINE-02F-COL-E
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsLobbyingExpendGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsLobbyingExpenditures/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsLobbyingExpenditures/Total'
V_AVE_EXP_GRASS_LOB_TOT <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_LOB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_LOB_TOT ) )
if( length( SC_02_AVE_EXP_GRASS_LOB_TOT ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_LOB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_LOB_TOT <-  paste0( '{', SC_02_AVE_EXP_GRASS_LOB_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_NONTAX_CY
## DESCRIPTION:  Grassroots Nontaxable Amount2 - Current year
## LOCATION:  SCHED-C-PART-02-A-LINE-02D-COL-D
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsNontaxableGrp/CurrentYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount2/CurrentYear'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount2/CurrentYear'
V_AVE_EXP_GRASS_NONTAX_CY <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_NONTAX_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_NONTAX_CY ) )
if( length( SC_02_AVE_EXP_GRASS_NONTAX_CY ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_NONTAX_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_NONTAX_CY <-  paste0( '{', SC_02_AVE_EXP_GRASS_NONTAX_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_NONTAX_CY_M1
## DESCRIPTION:  Grassroots Nontaxable Amount2 - Current year minus 1
## LOCATION:  SCHED-C-PART-02-A-LINE-02D-COL-C
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsNontaxableGrp/CurrentYearMinus1Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount2/CurrentYearMinus1'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount2/CurrentYearMinus1'
V_AVE_EXP_GRASS_NONTAX_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_NONTAX_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_NONTAX_CY_M1 ) )
if( length( SC_02_AVE_EXP_GRASS_NONTAX_CY_M1 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_NONTAX_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_NONTAX_CY_M1 <-  paste0( '{', SC_02_AVE_EXP_GRASS_NONTAX_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_NONTAX_CY_M2
## DESCRIPTION:  Grassroots Nontaxable Amount2 - Current year minus 2
## LOCATION:  SCHED-C-PART-02-A-LINE-02D-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsNontaxableGrp/CurrentYearMinus2Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount2/CurrentYearMinus2'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount2/CurrentYearMinus2'
V_AVE_EXP_GRASS_NONTAX_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_NONTAX_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_NONTAX_CY_M2 ) )
if( length( SC_02_AVE_EXP_GRASS_NONTAX_CY_M2 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_NONTAX_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_NONTAX_CY_M2 <-  paste0( '{', SC_02_AVE_EXP_GRASS_NONTAX_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_NONTAX_CY_M3
## DESCRIPTION:  Grassroots Nontaxable Amount2 - Current year minus 3
## LOCATION:  SCHED-C-PART-02-A-LINE-02D-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsNontaxableGrp/CurrentYearMinus3Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount2/CurrentYearMinus3'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount2/CurrentYearMinus3'
V_AVE_EXP_GRASS_NONTAX_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_NONTAX_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_NONTAX_CY_M3 ) )
if( length( SC_02_AVE_EXP_GRASS_NONTAX_CY_M3 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_NONTAX_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_NONTAX_CY_M3 <-  paste0( '{', SC_02_AVE_EXP_GRASS_NONTAX_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_NONTAX_TOT
## DESCRIPTION:  Grassroots Nontaxable Amount2 - Total
## LOCATION:  SCHED-C-PART-02-A-LINE-02D-COL-E
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgGrassrootsNontaxableGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount2/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount2/Total'
V_AVE_EXP_GRASS_NONTAX_TOT <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_NONTAX_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_NONTAX_TOT ) )
if( length( SC_02_AVE_EXP_GRASS_NONTAX_TOT ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_NONTAX_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_NONTAX_TOT <-  paste0( '{', SC_02_AVE_EXP_GRASS_NONTAX_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_LOB_NONTAX_CY
## DESCRIPTION:  Lobbying Nontaxable Amount2 - Current year
## LOCATION:  SCHED-C-PART-02-A-LINE-02A-COL-D
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgLobbyingNontaxableAmountGrp/CurrentYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount2/CurrentYear'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount2/CurrentYear'
V_AVE_EXP_LOB_NONTAX_CY <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_LOB_NONTAX_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_LOB_NONTAX_CY ) )
if( length( SC_02_AVE_EXP_LOB_NONTAX_CY ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_LOB_NONTAX_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_LOB_NONTAX_CY <-  paste0( '{', SC_02_AVE_EXP_LOB_NONTAX_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_LOB_NONTAX_CY_M1
## DESCRIPTION:  Lobbying Nontaxable Amount2 - Current year minus 1
## LOCATION:  SCHED-C-PART-02-A-LINE-02A-COL-C
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgLobbyingNontaxableAmountGrp/CurrentYearMinus1Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount2/CurrentYearMinus1'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount2/CurrentYearMinus1'
V_AVE_EXP_LOB_NONTAX_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_LOB_NONTAX_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_LOB_NONTAX_CY_M1 ) )
if( length( SC_02_AVE_EXP_LOB_NONTAX_CY_M1 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_LOB_NONTAX_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_LOB_NONTAX_CY_M1 <-  paste0( '{', SC_02_AVE_EXP_LOB_NONTAX_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_LOB_NONTAX_CY_M2
## DESCRIPTION:  Lobbying Nontaxable Amount2 - Current year minus 2
## LOCATION:  SCHED-C-PART-02-A-LINE-02A-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgLobbyingNontaxableAmountGrp/CurrentYearMinus2Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount2/CurrentYearMinus2'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount2/CurrentYearMinus2'
V_AVE_EXP_LOB_NONTAX_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_LOB_NONTAX_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_LOB_NONTAX_CY_M2 ) )
if( length( SC_02_AVE_EXP_LOB_NONTAX_CY_M2 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_LOB_NONTAX_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_LOB_NONTAX_CY_M2 <-  paste0( '{', SC_02_AVE_EXP_LOB_NONTAX_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_LOB_NONTAX_CY_M3
## DESCRIPTION:  Lobbying Nontaxable Amount2 - Current year minus 3
## LOCATION:  SCHED-C-PART-02-A-LINE-02A-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgLobbyingNontaxableAmountGrp/CurrentYearMinus3Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount2/CurrentYearMinus3'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount2/CurrentYearMinus3'
V_AVE_EXP_LOB_NONTAX_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_LOB_NONTAX_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_LOB_NONTAX_CY_M3 ) )
if( length( SC_02_AVE_EXP_LOB_NONTAX_CY_M3 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_LOB_NONTAX_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_LOB_NONTAX_CY_M3 <-  paste0( '{', SC_02_AVE_EXP_LOB_NONTAX_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_LOB_NONTAX_TOT
## DESCRIPTION:  Lobbying Nontaxable Amount2 - Total
## LOCATION:  SCHED-C-PART-02-A-LINE-02A-COL-E
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgLobbyingNontaxableAmountGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount2/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount2/Total'
V_AVE_EXP_LOB_NONTAX_TOT <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_LOB_NONTAX_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_LOB_NONTAX_TOT ) )
if( length( SC_02_AVE_EXP_LOB_NONTAX_TOT ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_LOB_NONTAX_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_LOB_NONTAX_TOT <-  paste0( '{', SC_02_AVE_EXP_LOB_NONTAX_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_TOT_LOB_CY
## DESCRIPTION:  Total Lobbying Expenditures2 - Current year
## LOCATION:  SCHED-C-PART-02-A-LINE-02C-COL-D
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgTotalLobbyingExpendGrp/CurrentYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures2/CurrentYear'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures2/CurrentYear'
V_AVE_EXP_TOT_LOB_CY <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_TOT_LOB_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_TOT_LOB_CY ) )
if( length( SC_02_AVE_EXP_TOT_LOB_CY ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_TOT_LOB_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_TOT_LOB_CY <-  paste0( '{', SC_02_AVE_EXP_TOT_LOB_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_TOT_LOB_CY_M1
## DESCRIPTION:  Total Lobbying Expenditures2 - Current year minus 1
## LOCATION:  SCHED-C-PART-02-A-LINE-02C-COL-C
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgTotalLobbyingExpendGrp/CurrentYearMinus1Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures2/CurrentYearMinus1'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures2/CurrentYearMinus1'
V_AVE_EXP_TOT_LOB_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_TOT_LOB_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_TOT_LOB_CY_M1 ) )
if( length( SC_02_AVE_EXP_TOT_LOB_CY_M1 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_TOT_LOB_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_TOT_LOB_CY_M1 <-  paste0( '{', SC_02_AVE_EXP_TOT_LOB_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_TOT_LOB_CY_M2
## DESCRIPTION:  Total Lobbying Expenditures2 - Current year minus 2
## LOCATION:  SCHED-C-PART-02-A-LINE-02C-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgTotalLobbyingExpendGrp/CurrentYearMinus2Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures2/CurrentYearMinus2'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures2/CurrentYearMinus2'
V_AVE_EXP_TOT_LOB_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_TOT_LOB_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_TOT_LOB_CY_M2 ) )
if( length( SC_02_AVE_EXP_TOT_LOB_CY_M2 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_TOT_LOB_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_TOT_LOB_CY_M2 <-  paste0( '{', SC_02_AVE_EXP_TOT_LOB_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_TOT_LOB_CY_M3
## DESCRIPTION:  Total Lobbying Expenditures2 - Current year minus 3
## LOCATION:  SCHED-C-PART-02-A-LINE-02C-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgTotalLobbyingExpendGrp/CurrentYearMinus3Amt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures2/CurrentYearMinus3'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures2/CurrentYearMinus3'
V_AVE_EXP_TOT_LOB_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_TOT_LOB_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_TOT_LOB_CY_M3 ) )
if( length( SC_02_AVE_EXP_TOT_LOB_CY_M3 ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_TOT_LOB_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_TOT_LOB_CY_M3 <-  paste0( '{', SC_02_AVE_EXP_TOT_LOB_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_TOT_LOB_TOT
## DESCRIPTION:  Total Lobbying Expenditures2 - Total
## LOCATION:  SCHED-C-PART-02-A-LINE-02C-COL-E
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AvgTotalLobbyingExpendGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures2/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures2/Total'
V_AVE_EXP_TOT_LOB_TOT <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_TOT_LOB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_TOT_LOB_TOT ) )
if( length( SC_02_AVE_EXP_TOT_LOB_TOT ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_TOT_LOB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_TOT_LOB_TOT <-  paste0( '{', SC_02_AVE_EXP_TOT_LOB_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_CONTACT_LEGIS_X
## DESCRIPTION:  Direct contact with legislators; their staffs; government officials; or a legislative body?
## LOCATION:  SCHED-C-PART-02-B-LINE-01G-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/DirectContactLegislators'
V2 <- '//Return/ReturnData/IRS990ScheduleC/DirectContactLegislatorsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/DirectContactLegislators'
V_LOB_ACT_CONTACT_LEGIS_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_CONTACT_LEGIS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_CONTACT_LEGIS_X ) )
if( length( SC_02_LOB_ACT_CONTACT_LEGIS_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_CONTACT_LEGIS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_CONTACT_LEGIS_X <-  paste0( '{', SC_02_LOB_ACT_CONTACT_LEGIS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_CONTACT_LEGIS_AMT
## DESCRIPTION:  Direct contact with legislators; their staffs; government officials; or a legislative body (only for section 501(c)(3))(Amount)
## LOCATION:  SCHED-C-PART-02-B-LINE-01G-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/DirectContactLegislatorsAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/DirectContactLegislatorsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/DirectContactLegislatorsAmount'
V_LOB_ACT_CONTACT_LEGIS_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_CONTACT_LEGIS_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_CONTACT_LEGIS_AMT ) )
if( length( SC_02_LOB_ACT_CONTACT_LEGIS_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_CONTACT_LEGIS_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_CONTACT_LEGIS_AMT <-  paste0( '{', SC_02_LOB_ACT_CONTACT_LEGIS_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_4911TAX_FORM4720_FILED_X
## DESCRIPTION:  If there is an amount other than zero on either line h or line i; did the organization file Form 4720 reporting section 4911 tax for this year?
## LOCATION:  SCHED-C-PART-02-A-LINE-01J
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form4720Filed'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form4720FiledInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/Form4720Filed'
V_4911TAX_FORM4720_FILED_X <- paste( V1, V2, V3 , sep='|' )
SC_02_4911TAX_FORM4720_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_4911TAX_FORM4720_FILED_X ) )
if( length( SC_02_4911TAX_FORM4720_FILED_X ) > 1 )
{ 
  create_record( varname=SC_02_4911TAX_FORM4720_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_4911TAX_FORM4720_FILED_X <-  paste0( '{', SC_02_4911TAX_FORM4720_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_4912_FILE_4720_X
## DESCRIPTION:  If the filing organization incurred a section 4912 tax; did it file Form 4720 for this year?
## LOCATION:  SCHED-C-PART-02-B-LINE-02D-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form4720Filed4912Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form4720Filed4912TaxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/Form4720Filed4912Tax'
V_LOB_ACT_4912_FILE_4720_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_4912_FILE_4720_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_4912_FILE_4720_X ) )
if( length( SC_02_LOB_ACT_4912_FILE_4720_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_4912_FILE_4720_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_4912_FILE_4720_X <-  paste0( '{', SC_02_LOB_ACT_4912_FILE_4720_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_GRANT_OTH_ORG_X
## DESCRIPTION:  Grants to other organizations for lobbying purposes?
## LOCATION:  SCHED-C-PART-02-B-LINE-01F-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrantsOtherOrganizations'
V2 <- '//Return/ReturnData/IRS990ScheduleC/GrantsOtherOrganizations'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrantsOtherOrganizationsInd'
V_LOB_ACT_GRANT_OTH_ORG_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_GRANT_OTH_ORG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_GRANT_OTH_ORG_X ) )
if( length( SC_02_LOB_ACT_GRANT_OTH_ORG_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_GRANT_OTH_ORG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_GRANT_OTH_ORG_X <-  paste0( '{', SC_02_LOB_ACT_GRANT_OTH_ORG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_GRANT_OTH_ORG_AMT
## DESCRIPTION:  Grants to other organizations for lobbying purposes (only for section 501(c)(3))(Amount)
## LOCATION:  SCHED-C-PART-02-B-LINE-01F-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrantsOtherOrganizationsAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/GrantsOtherOrganizationsAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrantsOtherOrganizationsAmt'
V_LOB_ACT_GRANT_OTH_ORG_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_GRANT_OTH_ORG_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_GRANT_OTH_ORG_AMT ) )
if( length( SC_02_LOB_ACT_GRANT_OTH_ORG_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_GRANT_OTH_ORG_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_GRANT_OTH_ORG_AMT <-  paste0( '{', SC_02_LOB_ACT_GRANT_OTH_ORG_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_GRASS_CEILING_TOT
## DESCRIPTION:  Grassroots ceiling amount (150% of line 2d(e))
## LOCATION:  SCHED-C-PART-02-A-LINE-02E-COL-E
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsCeilingAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsCeilingAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsCeilingAmt'
V_AVE_EXP_GRASS_CEILING_TOT <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_GRASS_CEILING_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_GRASS_CEILING_TOT ) )
if( length( SC_02_AVE_EXP_GRASS_CEILING_TOT ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_GRASS_CEILING_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_GRASS_CEILING_TOT <-  paste0( '{', SC_02_AVE_EXP_GRASS_CEILING_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_GRASS_NONTAX_AFFGROUP
## DESCRIPTION:  Grassroots Nontaxable Amount - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01G-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount/AffiliatedGroupTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableGrp/AffiliatedGroupTotalAmt'
V_EXP_GRASS_NONTAX_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_GRASS_NONTAX_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRASS_NONTAX_AFFGROUP ) )
if( length( SC_02_EXP_GRASS_NONTAX_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_GRASS_NONTAX_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_GRASS_NONTAX_AFFGROUP <-  paste0( '{', SC_02_EXP_GRASS_NONTAX_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_GRASS_NONTAX_FILEORG
## DESCRIPTION:  Grassroots Nontaxable Amount - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01G-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/GrassrootsNontaxableAmount/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableAmount/FilingOrganizationsTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/GrassrootsNontaxableGrp/FilingOrganizationsTotalAmt'
V_EXP_GRASS_NONTAX_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_GRASS_NONTAX_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRASS_NONTAX_FILEORG ) )
if( length( SC_02_EXP_GRASS_NONTAX_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_GRASS_NONTAX_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_GRASS_NONTAX_FILEORG <-  paste0( '{', SC_02_EXP_GRASS_NONTAX_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_ORG_LIMIT_CTRL_PROV_X
## DESCRIPTION:  Check if ""A"" is checked and ""limited control"" provisions apply
## LOCATION:  SCHED-C-PART-02-A-LINE-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LimitedControlProvisionsApply'
V2 <- '//Return/ReturnData/IRS990ScheduleC/LimitedControlProvisionsAppInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LimitedControlProvisionsApply'
V_ORG_LIMIT_CTRL_PROV_X <- paste( V1, V2, V3 , sep='|' )
SC_02_ORG_LIMIT_CTRL_PROV_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LIMIT_CTRL_PROV_X ) )
if( length( SC_02_ORG_LIMIT_CTRL_PROV_X ) > 1 )
{ 
  create_record( varname=SC_02_ORG_LIMIT_CTRL_PROV_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_ORG_LIMIT_CTRL_PROV_X <-  paste0( '{', SC_02_ORG_LIMIT_CTRL_PROV_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_AVE_EXP_LOB_CEILING_TOT
## DESCRIPTION:  Lobbying ceiling amount (150% of line 2a(e))
## LOCATION:  SCHED-C-PART-02-A-LINE-02B-COL-E
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingCeilingAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingCeilingAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingCeilingAmt'
V_AVE_EXP_LOB_CEILING_TOT <- paste( V1, V2, V3 , sep='|' )
SC_02_AVE_EXP_LOB_CEILING_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_AVE_EXP_LOB_CEILING_TOT ) )
if( length( SC_02_AVE_EXP_LOB_CEILING_TOT ) > 1 )
{ 
  create_record( varname=SC_02_AVE_EXP_LOB_CEILING_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_AVE_EXP_LOB_CEILING_TOT <-  paste0( '{', SC_02_AVE_EXP_LOB_CEILING_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_LOB_NONTAX_AFFGROUP
## DESCRIPTION:  Lobbying Nontaxable Amount - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01F-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount/AffiliatedGroupTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmountGrp/AffiliatedGroupTotalAmt'
V_EXP_LOB_NONTAX_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_LOB_NONTAX_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_LOB_NONTAX_AFFGROUP ) )
if( length( SC_02_EXP_LOB_NONTAX_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_LOB_NONTAX_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_LOB_NONTAX_AFFGROUP <-  paste0( '{', SC_02_EXP_LOB_NONTAX_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_LOB_NONTAX_FILEORG
## DESCRIPTION:  Lobbying Nontaxable Amount - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01F-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/LobbyingNontaxableAmount/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmount/FilingOrganizationsTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/LobbyingNontaxableAmountGrp/FilingOrganizationsTotalAmt'
V_EXP_LOB_NONTAX_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_LOB_NONTAX_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_LOB_NONTAX_FILEORG ) )
if( length( SC_02_EXP_LOB_NONTAX_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_LOB_NONTAX_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_LOB_NONTAX_FILEORG <-  paste0( '{', SC_02_EXP_LOB_NONTAX_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_MAIL_MEMB_X
## DESCRIPTION:  Mailings to members; legislators; or to the public?
## LOCATION:  SCHED-C-PART-02-B-LINE-01D-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/MailingsMembers'
V2 <- '//Return/ReturnData/IRS990ScheduleC/MailingsMembers'
V3 <- '//Return/ReturnData/IRS990ScheduleC/MailingsMembersInd'
V_LOB_ACT_MAIL_MEMB_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_MAIL_MEMB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_MAIL_MEMB_X ) )
if( length( SC_02_LOB_ACT_MAIL_MEMB_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_MAIL_MEMB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_MAIL_MEMB_X <-  paste0( '{', SC_02_LOB_ACT_MAIL_MEMB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_MAIL_MEMB_AMT
## DESCRIPTION:  Mailings to members; legislators; or to the public?(Amount)
## LOCATION:  SCHED-C-PART-02-B-LINE-01D-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/MailingsMembersAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/MailingsMembersAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/MailingsMembersAmt'
V_LOB_ACT_MAIL_MEMB_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_MAIL_MEMB_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_MAIL_MEMB_AMT ) )
if( length( SC_02_LOB_ACT_MAIL_MEMB_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_MAIL_MEMB_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_MAIL_MEMB_AMT <-  paste0( '{', SC_02_LOB_ACT_MAIL_MEMB_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_MEDIA_AD_X
## DESCRIPTION:  Media advertisements?
## LOCATION:  SCHED-C-PART-02-B-LINE-01C-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/MediaAdvertisements'
V2 <- '//Return/ReturnData/IRS990ScheduleC/MediaAdvertisements'
V3 <- '//Return/ReturnData/IRS990ScheduleC/MediaAdvertisementsInd'
V_LOB_ACT_MEDIA_AD_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_MEDIA_AD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_MEDIA_AD_X ) )
if( length( SC_02_LOB_ACT_MEDIA_AD_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_MEDIA_AD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_MEDIA_AD_X <-  paste0( '{', SC_02_LOB_ACT_MEDIA_AD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_MEDIA_AD_AMT
## DESCRIPTION:  Media advertisements amount (only for section 501(c)(3))
## LOCATION:  SCHED-C-PART-02-B-LINE-01C-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/MediaAdvertisementsAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/MediaAdvertisementsAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/MediaAdvertisementsAmt'
V_LOB_ACT_MEDIA_AD_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_MEDIA_AD_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_MEDIA_AD_AMT ) )
if( length( SC_02_LOB_ACT_MEDIA_AD_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_MEDIA_AD_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_MEDIA_AD_AMT <-  paste0( '{', SC_02_LOB_ACT_MEDIA_AD_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_NO_DESC_501C3_X
## DESCRIPTION:  Did the activities in line 1 cause the organization to be not described in section 501(c)(3)?
## LOCATION:  SCHED-C-PART-02-B-LINE-02A-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/NotDescribedIn501c3'
V2 <- '//Return/ReturnData/IRS990ScheduleC/NotDescribedIn501c3'
V3 <- '//Return/ReturnData/IRS990ScheduleC/NotDescribedSection501c3Ind'
V_LOB_ACT_NO_DESC_501C3_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_NO_DESC_501C3_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_NO_DESC_501C3_X ) )
if( length( SC_02_LOB_ACT_NO_DESC_501C3_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_NO_DESC_501C3_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_NO_DESC_501C3_X <-  paste0( '{', SC_02_LOB_ACT_NO_DESC_501C3_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_ORG_BELONG_AFFGROUP_X
## DESCRIPTION:  Check if the organization belongs to an affiliated group
## LOCATION:  SCHED-C-PART-02-A-LINE-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/OrgBelongsToAffiliatedGroup'
V2 <- '//Return/ReturnData/IRS990ScheduleC/OrganizationBelongsAffltGrpInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/OrgBelongsToAffiliatedGroup'
V_ORG_BELONG_AFFGROUP_X <- paste( V1, V2, V3 , sep='|' )
SC_02_ORG_BELONG_AFFGROUP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BELONG_AFFGROUP_X ) )
if( length( SC_02_ORG_BELONG_AFFGROUP_X ) > 1 )
{ 
  create_record( varname=SC_02_ORG_BELONG_AFFGROUP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_ORG_BELONG_AFFGROUP_X <-  paste0( '{', SC_02_ORG_BELONG_AFFGROUP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_OTH_ACT_X
## DESCRIPTION:  Other activities?
## LOCATION:  SCHED-C-PART-02-B-LINE-01I-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/OtherActivities'
V2 <- '//Return/ReturnData/IRS990ScheduleC/OtherActivities'
V3 <- '//Return/ReturnData/IRS990ScheduleC/OtherActivitiesInd'
V_LOB_ACT_OTH_ACT_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_OTH_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_OTH_ACT_X ) )
if( length( SC_02_LOB_ACT_OTH_ACT_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_OTH_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_OTH_ACT_X <-  paste0( '{', SC_02_LOB_ACT_OTH_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_OTH_ACT_AMT
## DESCRIPTION:  Other activities amount
## LOCATION:  SCHED-C-PART-02-B-LINE-01I-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/OtherActivitiesAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/OtherActivitiesAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/OtherActivitiesAmt'
V_LOB_ACT_OTH_ACT_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_OTH_ACT_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_OTH_ACT_AMT ) )
if( length( SC_02_LOB_ACT_OTH_ACT_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_OTH_ACT_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_OTH_ACT_AMT <-  paste0( '{', SC_02_LOB_ACT_OTH_ACT_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_OTH_EXEMPT_AFFGROUP
## DESCRIPTION:  Other exempt purpose expenditures - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01D-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/OtherExemptPurposeExpenditures/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/OtherExemptPurposeExpendGrp/AffiliatedGroupTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/OtherExemptPurposeExpenditures/AffiliatedGroupTotals'
V_EXP_OTH_EXEMPT_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_OTH_EXEMPT_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_EXEMPT_AFFGROUP ) )
if( length( SC_02_EXP_OTH_EXEMPT_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_OTH_EXEMPT_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_OTH_EXEMPT_AFFGROUP <-  paste0( '{', SC_02_EXP_OTH_EXEMPT_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_OTH_EXEMPT_FILEORG
## DESCRIPTION:  Other exempt purpose expenditures - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01D-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/OtherExemptPurposeExpenditures/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/OtherExemptPurposeExpendGrp/FilingOrganizationsTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/OtherExemptPurposeExpenditures/FilingOrganizationsTotals'
V_EXP_OTH_EXEMPT_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_OTH_EXEMPT_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_EXEMPT_FILEORG ) )
if( length( SC_02_EXP_OTH_EXEMPT_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_OTH_EXEMPT_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_OTH_EXEMPT_FILEORG <-  paste0( '{', SC_02_EXP_OTH_EXEMPT_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_PAID_STAFF_X
## DESCRIPTION:  Paid staff or management (include compensation in expenses reported on Line c through i)
## LOCATION:  SCHED-C-PART-02-B-LINE-01B-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/PaidStaffOrManagement'
V2 <- '//Return/ReturnData/IRS990ScheduleC/PaidStaffOrManagement'
V3 <- '//Return/ReturnData/IRS990ScheduleC/PaidStaffOrManagementInd'
V_LOB_ACT_PAID_STAFF_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_PAID_STAFF_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_PAID_STAFF_X ) )
if( length( SC_02_LOB_ACT_PAID_STAFF_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_PAID_STAFF_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_PAID_STAFF_X <-  paste0( '{', SC_02_LOB_ACT_PAID_STAFF_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_PAID_STAFF_AMT
## DESCRIPTION:  Paid staff or management (include compensation in expenses reported on Line c through i)(Amount)
## LOCATION:  SCHED-C-PART-02-B-LINE-01B-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/PaidStaffOrManagementAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/PaidStaffOrManagementAmount'
V_LOB_ACT_PAID_STAFF_AMT <- paste( V1, V2 , sep='|' )
SC_02_LOB_ACT_PAID_STAFF_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_PAID_STAFF_AMT ) )
if( length( SC_02_LOB_ACT_PAID_STAFF_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_PAID_STAFF_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_PAID_STAFF_AMT <-  paste0( '{', SC_02_LOB_ACT_PAID_STAFF_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_PUBLICA_BCAST_X
## DESCRIPTION:  Publications; or published or broadcast statements?
## LOCATION:  SCHED-C-PART-02-B-LINE-01E-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/PublicationsOrBroadcast'
V2 <- '//Return/ReturnData/IRS990ScheduleC/PublicationsOrBroadcast'
V3 <- '//Return/ReturnData/IRS990ScheduleC/PublicationsOrBroadcastInd'
V_LOB_ACT_PUBLICA_BCAST_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_PUBLICA_BCAST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_PUBLICA_BCAST_X ) )
if( length( SC_02_LOB_ACT_PUBLICA_BCAST_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_PUBLICA_BCAST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_PUBLICA_BCAST_X <-  paste0( '{', SC_02_LOB_ACT_PUBLICA_BCAST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_PUBLICA_BCAST_AMT
## DESCRIPTION:  Publications; or published or broadcast statements (only for section 501(c)(3))(Amount)
## LOCATION:  SCHED-C-PART-02-B-LINE-01E-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/PublicationsOrBroadcastAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/PublicationsOrBroadcastAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/PublicationsOrBroadcastAmt'
V_LOB_ACT_PUBLICA_BCAST_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_PUBLICA_BCAST_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_PUBLICA_BCAST_AMT ) )
if( length( SC_02_LOB_ACT_PUBLICA_BCAST_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_PUBLICA_BCAST_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_PUBLICA_BCAST_AMT <-  paste0( '{', SC_02_LOB_ACT_PUBLICA_BCAST_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_RALLIES_X
## DESCRIPTION:  Rallies; demonstrations; seminars; conventions; speeches; lectures; or any other means?
## LOCATION:  SCHED-C-PART-02-B-LINE-01H-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/RalliesDemonstrations'
V2 <- '//Return/ReturnData/IRS990ScheduleC/RalliesDemonstrations'
V3 <- '//Return/ReturnData/IRS990ScheduleC/RalliesDemonstrationsInd'
V_LOB_ACT_RALLIES_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_RALLIES_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_RALLIES_X ) )
if( length( SC_02_LOB_ACT_RALLIES_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_RALLIES_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_RALLIES_X <-  paste0( '{', SC_02_LOB_ACT_RALLIES_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_RALLIES_AMT
## DESCRIPTION:  Rallies; demonstrations; seminars; conventions; speeches; lectures; or any other means (only for section 501(c)(3))(Amount)
## LOCATION:  SCHED-C-PART-02-B-LINE-01H-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/RalliesDemonstrationsAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/RalliesDemonstrationsAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/RalliesDemonstrationsAmt'
V_LOB_ACT_RALLIES_AMT <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_RALLIES_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_RALLIES_AMT ) )
if( length( SC_02_LOB_ACT_RALLIES_AMT ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_RALLIES_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_RALLIES_AMT <-  paste0( '{', SC_02_LOB_ACT_RALLIES_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_DIRECT_LOB_AFFGROUP
## DESCRIPTION:  Total Direct Lobbying Expenditures - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01B-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalDirectLobbying/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalDirectLobbying/AffiliatedGroupTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalDirectLobbyingGrp/AffiliatedGroupTotalAmt'
V_EXP_DIRECT_LOB_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_DIRECT_LOB_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_DIRECT_LOB_AFFGROUP ) )
if( length( SC_02_EXP_DIRECT_LOB_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_DIRECT_LOB_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_DIRECT_LOB_AFFGROUP <-  paste0( '{', SC_02_EXP_DIRECT_LOB_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_DIRECT_LOB_FILEORG
## DESCRIPTION:  Total Direct Lobbying Expenditures - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01B-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalDirectLobbying/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalDirectLobbying/FilingOrganizationsTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalDirectLobbyingGrp/FilingOrganizationsTotalAmt'
V_EXP_DIRECT_LOB_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_DIRECT_LOB_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_DIRECT_LOB_FILEORG ) )
if( length( SC_02_EXP_DIRECT_LOB_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_DIRECT_LOB_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_DIRECT_LOB_FILEORG <-  paste0( '{', SC_02_EXP_DIRECT_LOB_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_TOT_EXEMPT_AFFGROUP
## DESCRIPTION:  Total exempt purpose expenditures - Affiliated group totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01E-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalExemptPurposeExpenditures/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalExemptPurposeExpendGrp/AffiliatedGroupTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalExemptPurposeExpenditures/AffiliatedGroupTotals'
V_EXP_TOT_EXEMPT_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_TOT_EXEMPT_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_EXEMPT_AFFGROUP ) )
if( length( SC_02_EXP_TOT_EXEMPT_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_TOT_EXEMPT_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_TOT_EXEMPT_AFFGROUP <-  paste0( '{', SC_02_EXP_TOT_EXEMPT_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_TOT_EXEMPT_FILEORG
## DESCRIPTION:  Total exempt purpose expenditures - Filing organization's totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01E-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalExemptPurposeExpenditures/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalExemptPurposeExpendGrp/FilingOrganizationsTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalExemptPurposeExpenditures/FilingOrganizationsTotals'
V_EXP_TOT_EXEMPT_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_TOT_EXEMPT_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_EXEMPT_FILEORG ) )
if( length( SC_02_EXP_TOT_EXEMPT_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_TOT_EXEMPT_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_TOT_EXEMPT_FILEORG <-  paste0( '{', SC_02_EXP_TOT_EXEMPT_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_GRASS_LOB_AFFGROUP
## DESCRIPTION:  Total Grassroots Lobbying Expenditures - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01A-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalGrassrootsLobbying/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalGrassrootsLobbying/AffiliatedGroupTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalGrassrootsLobbyingGrp/AffiliatedGroupTotalAmt'
V_EXP_GRASS_LOB_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_GRASS_LOB_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRASS_LOB_AFFGROUP ) )
if( length( SC_02_EXP_GRASS_LOB_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_GRASS_LOB_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_GRASS_LOB_AFFGROUP <-  paste0( '{', SC_02_EXP_GRASS_LOB_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_GRASS_LOB_FILEORG
## DESCRIPTION:  Total Grassroots Lobbying Expenditures - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01A-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalGrassrootsLobbying/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalGrassrootsLobbying/FilingOrganizationsTotals'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalGrassrootsLobbyingGrp/FilingOrganizationsTotalAmt'
V_EXP_GRASS_LOB_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_GRASS_LOB_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRASS_LOB_FILEORG ) )
if( length( SC_02_EXP_GRASS_LOB_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_GRASS_LOB_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_GRASS_LOB_FILEORG <-  paste0( '{', SC_02_EXP_GRASS_LOB_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_TOT_LOB_AFFGROUP
## DESCRIPTION:  Total lobbying expenditures - Affiliated group totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01C-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpendGrp/AffiliatedGroupTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures/AffiliatedGroupTotals'
V_EXP_TOT_LOB_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_TOT_LOB_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_LOB_AFFGROUP ) )
if( length( SC_02_EXP_TOT_LOB_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_TOT_LOB_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_TOT_LOB_AFFGROUP <-  paste0( '{', SC_02_EXP_TOT_LOB_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_TOT_LOB_FILEORG
## DESCRIPTION:  Total lobbying expenditures - Filing organization's totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01C-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpenditures/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpendGrp/FilingOrganizationsTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpenditures/FilingOrganizationsTotals'
V_EXP_TOT_LOB_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_TOT_LOB_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_LOB_FILEORG ) )
if( length( SC_02_EXP_TOT_LOB_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_TOT_LOB_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_TOT_LOB_FILEORG <-  paste0( '{', SC_02_EXP_TOT_LOB_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_TOT_L1C_1I
## DESCRIPTION:  Total Line 1c through 1i (only for section 501(c)(3))
## LOCATION:  SCHED-C-PART-02-B-LINE-01J-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotalLobbyingExpendituresIIB'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpendituresAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalLobbyingExpendituresIIB'
V_LOB_ACT_TOT_L1C_1I <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_TOT_L1C_1I <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_TOT_L1C_1I ) )
if( length( SC_02_LOB_ACT_TOT_L1C_1I ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_TOT_L1C_1I, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_TOT_L1C_1I <-  paste0( '{', SC_02_LOB_ACT_TOT_L1C_1I, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_LOB_M_NONTAX_AFFGROUP
## DESCRIPTION:  Total Lobbying Minus Nontaxable - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01I-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotLobbyExpendMnsLobbyingNontx/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotLbbyExpendMnsLbbyngNonTxGrp/AffiliatedGroupTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotLobbyExpendMnsLobbyingNontx/AffiliatedGroupTotals'
V_EXP_LOB_M_NONTAX_AFFGROUP <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_LOB_M_NONTAX_AFFGROUP <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_LOB_M_NONTAX_AFFGROUP ) )
if( length( SC_02_EXP_LOB_M_NONTAX_AFFGROUP ) > 1 )
{ 
  create_record( varname=SC_02_EXP_LOB_M_NONTAX_AFFGROUP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_LOB_M_NONTAX_AFFGROUP <-  paste0( '{', SC_02_EXP_LOB_M_NONTAX_AFFGROUP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_LOB_M_NONTAX_FILEORG
## DESCRIPTION:  Total Lobbying Minus Nontaxable - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01I-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotLobbyExpendMnsLobbyingNontx/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotLbbyExpendMnsLbbyngNonTxGrp/FilingOrganizationsTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotLobbyExpendMnsLobbyingNontx/FilingOrganizationsTotals'
V_EXP_LOB_M_NONTAX_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_LOB_M_NONTAX_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_LOB_M_NONTAX_FILEORG ) )
if( length( SC_02_EXP_LOB_M_NONTAX_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_LOB_M_NONTAX_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_LOB_M_NONTAX_FILEORG <-  paste0( '{', SC_02_EXP_LOB_M_NONTAX_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_GRASS_M_NONTAX_AFFGROU
## DESCRIPTION:  Total Grassroot Lobbying Minus Nontaxable - Affiliated Group Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01H-COL-B
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotLobbyingGrassrootMinusNonTx/AffiliatedGroupTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotLbbyngGrassrootMnsNonTxGrp/AffiliatedGroupTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotLobbyingGrassrootMinusNonTx/AffiliatedGroupTotals'
V_EXP_GRASS_M_NONTAX_AFFGROU <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_GRASS_M_NONTAX_AFFGROU <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRASS_M_NONTAX_AFFGROU ) )
if( length( SC_02_EXP_GRASS_M_NONTAX_AFFGROU ) > 1 )
{ 
  create_record( varname=SC_02_EXP_GRASS_M_NONTAX_AFFGROU, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_GRASS_M_NONTAX_AFFGROU <-  paste0( '{', SC_02_EXP_GRASS_M_NONTAX_AFFGROU, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_EXP_GRASS_M_NONTAX_FILEORG
## DESCRIPTION:  Total Grassroot Lobbying Minus Nontaxable - Filing Organization's Totals
## LOCATION:  SCHED-C-PART-02-A-LINE-01H-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/TotLobbyingGrassrootMinusNonTx/FilingOrganizationsTotals'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotLbbyngGrassrootMnsNonTxGrp/FilingOrganizationsTotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotLobbyingGrassrootMinusNonTx/FilingOrganizationsTotals'
V_EXP_GRASS_M_NONTAX_FILEORG <- paste( V1, V2, V3 , sep='|' )
SC_02_EXP_GRASS_M_NONTAX_FILEORG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRASS_M_NONTAX_FILEORG ) )
if( length( SC_02_EXP_GRASS_M_NONTAX_FILEORG ) > 1 )
{ 
  create_record( varname=SC_02_EXP_GRASS_M_NONTAX_FILEORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_EXP_GRASS_M_NONTAX_FILEORG <-  paste0( '{', SC_02_EXP_GRASS_M_NONTAX_FILEORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_02_LOB_ACT_VOL_X
## DESCRIPTION:  IRS990 Schedule C - Volunteers?
## LOCATION:  SCHED-C-PART-02-B-LINE-01A-COL-A
## TABLE:  SC-P02-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartII/Volunteers'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Volunteers'
V3 <- '//Return/ReturnData/IRS990ScheduleC/VolunteersInd'
V_LOB_ACT_VOL_X <- paste( V1, V2, V3 , sep='|' )
SC_02_LOB_ACT_VOL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LOB_ACT_VOL_X ) )
if( length( SC_02_LOB_ACT_VOL_X ) > 1 )
{ 
  create_record( varname=SC_02_LOB_ACT_VOL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_02_LOB_ACT_VOL_X <-  paste0( '{', SC_02_LOB_ACT_VOL_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SC_02_LOB_ACT_4912TAX_ORG,SC_02_LOB_ACT_4912TAX_MGR,SC_02_AVE_EXP_GRASS_LOB_CY,SC_02_AVE_EXP_GRASS_LOB_CY_M1,SC_02_AVE_EXP_GRASS_LOB_CY_M2,SC_02_AVE_EXP_GRASS_LOB_CY_M3,SC_02_AVE_EXP_GRASS_LOB_TOT,SC_02_AVE_EXP_GRASS_NONTAX_CY,SC_02_AVE_EXP_GRASS_NONTAX_CY_M1,SC_02_AVE_EXP_GRASS_NONTAX_CY_M2,SC_02_AVE_EXP_GRASS_NONTAX_CY_M3,SC_02_AVE_EXP_GRASS_NONTAX_TOT,SC_02_AVE_EXP_LOB_NONTAX_CY,SC_02_AVE_EXP_LOB_NONTAX_CY_M1,SC_02_AVE_EXP_LOB_NONTAX_CY_M2,SC_02_AVE_EXP_LOB_NONTAX_CY_M3,SC_02_AVE_EXP_LOB_NONTAX_TOT,SC_02_AVE_EXP_TOT_LOB_CY,SC_02_AVE_EXP_TOT_LOB_CY_M1,SC_02_AVE_EXP_TOT_LOB_CY_M2,SC_02_AVE_EXP_TOT_LOB_CY_M3,SC_02_AVE_EXP_TOT_LOB_TOT,SC_02_LOB_ACT_CONTACT_LEGIS_X,SC_02_LOB_ACT_CONTACT_LEGIS_AMT,SC_02_4911TAX_FORM4720_FILED_X,SC_02_LOB_ACT_4912_FILE_4720_X,SC_02_LOB_ACT_GRANT_OTH_ORG_X,SC_02_LOB_ACT_GRANT_OTH_ORG_AMT,SC_02_AVE_EXP_GRASS_CEILING_TOT,SC_02_EXP_GRASS_NONTAX_AFFGROUP,SC_02_EXP_GRASS_NONTAX_FILEORG,SC_02_ORG_LIMIT_CTRL_PROV_X,SC_02_AVE_EXP_LOB_CEILING_TOT,SC_02_EXP_LOB_NONTAX_AFFGROUP,SC_02_EXP_LOB_NONTAX_FILEORG,SC_02_LOB_ACT_MAIL_MEMB_X,SC_02_LOB_ACT_MAIL_MEMB_AMT,SC_02_LOB_ACT_MEDIA_AD_X,SC_02_LOB_ACT_MEDIA_AD_AMT,SC_02_LOB_ACT_NO_DESC_501C3_X,SC_02_ORG_BELONG_AFFGROUP_X,SC_02_LOB_ACT_OTH_ACT_X,SC_02_LOB_ACT_OTH_ACT_AMT,SC_02_EXP_OTH_EXEMPT_AFFGROUP,SC_02_EXP_OTH_EXEMPT_FILEORG,SC_02_LOB_ACT_PAID_STAFF_X,SC_02_LOB_ACT_PAID_STAFF_AMT,SC_02_LOB_ACT_PUBLICA_BCAST_X,SC_02_LOB_ACT_PUBLICA_BCAST_AMT,SC_02_LOB_ACT_RALLIES_X,SC_02_LOB_ACT_RALLIES_AMT,SC_02_EXP_DIRECT_LOB_AFFGROUP,SC_02_EXP_DIRECT_LOB_FILEORG,SC_02_EXP_TOT_EXEMPT_AFFGROUP,SC_02_EXP_TOT_EXEMPT_FILEORG,SC_02_EXP_GRASS_LOB_AFFGROUP,SC_02_EXP_GRASS_LOB_FILEORG,SC_02_EXP_TOT_LOB_AFFGROUP,SC_02_EXP_TOT_LOB_FILEORG,SC_02_LOB_ACT_TOT_L1C_1I,SC_02_EXP_LOB_M_NONTAX_AFFGROUP,SC_02_EXP_LOB_M_NONTAX_FILEORG,SC_02_EXP_GRASS_M_NONTAX_AFFGROU,SC_02_EXP_GRASS_M_NONTAX_FILEORG,SC_02_LOB_ACT_VOL_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


