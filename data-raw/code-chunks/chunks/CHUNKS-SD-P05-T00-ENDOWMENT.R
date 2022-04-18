#' @title 
#'   Build table SD-P05-T00-ENDOWMENT
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P05_T00_ENDOWMENT <- function( doc, url )
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
SD_05_ENDOW_BALANCE_BOY_CY <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M1
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN1 and SD_05_PC_CYMYBOYBALAN1 are the same variables. 

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M2
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN2 and SD_05_PC_CYMYBOYBALAN2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M3
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN3 and SD_05_PC_CYMYBOYBALAN3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_BOY_CY_M4
## DESCRIPTION:  Beginning of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01A-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFBYBALAN4 and SD_05_PC_CYMYBOYBALAN4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/BeginningOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/BeginningYearBalanceAmt'
V_ENDOW_BALANCE_BOY_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_BOY_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_BOY_CY_M4 ) )




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
SD_05_ENDOW_CONTR_CY <- xml_text( xml_find_all( doc, V_ENDOW_CONTR_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M1
## DESCRIPTION:  Current Year Minus1 Year - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO1 and SD_05_PC_CUYEMIYECOON1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_CONTR_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M2
## DESCRIPTION:  Current Year Minus2 Years - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO2 and SD_05_PC_CUYEMIYECOON2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_CONTR_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M3
## DESCRIPTION:  Current Year Minus3 Years - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO3 and SD_05_PC_CUYEMIYECOON3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_CONTR_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_CONTR_CY_M4
## DESCRIPTION:  Current Year Minus4 Years - Contributions
## LOCATION:  SCHED-D-PART-05-LINE-01B-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYYMMIENFUCO4 and SD_05_PC_CUYEMIYECOON4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/Contributions'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/ContributionsAmt'
V_ENDOW_CONTR_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_CONTR_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_CONTR_CY_M4 ) )




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
SD_05_ENDOW_INVEST_CY <- xml_text( xml_find_all( doc, V_ENDOW_INVEST_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M1
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS1 and SD_05_PC_CYMYIEOLOSSE1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_INVEST_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M2
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS2 and SD_05_PC_CYMYIEOLOSSE2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_INVEST_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M3
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFIEOLOSS3 and SD_05_PC_CYMYIEOLOSSE3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_INVEST_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_INVEST_CY_M4
## DESCRIPTION:  Investment earnings or losses
## LOCATION:  SCHED-D-PART-05-LINE-01C-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:   SD_05_PC_CYMEFIEOLOSS4 and SD_05_PC_CYMYIEOLOSSE4 are the same variables. 

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/InvestmentEarningsOrLosses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/InvestmentEarningsOrLossesAmt'
V_ENDOW_INVEST_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_INVEST_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_INVEST_CY_M4 ) )




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
SD_05_ENDOW_GRANT_CY <- xml_text( xml_find_all( doc, V_ENDOW_GRANT_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M1
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL1 and SD_05_PC_CYMYGOSCHOLA1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_GRANT_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M2
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL2 and SD_05_PC_CYMYGOSCHOLA2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_GRANT_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M3
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL3 and SD_05_PC_CYMYGOSCHOLA3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_GRANT_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_GRANT_CY_M4
## DESCRIPTION:  Grants or scholarships
## LOCATION:  SCHED-D-PART-05-LINE-01D-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFGOSCHOL4 and SD_05_PC_CYMYGOSCHOLA4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/GrantsOrScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/GrantsOrScholarshipsAmt'
V_ENDOW_GRANT_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_GRANT_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_GRANT_CY_M4 ) )




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
SD_05_ENDOW_EXP_OTH_CY <- xml_text( xml_find_all( doc, V_ENDOW_EXP_OTH_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M1
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND1 and SD_05_PC_CUYEMIYEOTEX1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M2
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND2 and SD_05_PC_CUYEMIYEOTEX2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M3
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND3 and SD_05_PC_CUYEMIYEOTEX3 are the same varibales.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_OTH_CY_M4
## DESCRIPTION:  Other expenditures
## LOCATION:  SCHED-D-PART-05-LINE-01E-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFOEXPEND4 and SD_05_PC_CUYEMIYEOTEX4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/OtherExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/OtherExpendituresAmt'
V_ENDOW_EXP_OTH_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_OTH_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_OTH_CY_M4 ) )




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
SD_05_ENDOW_EXP_ADMIN_CY <- xml_text( xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M1
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS1 and SD_05_PC_CUYEMIYEADEX1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M2
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS2 and SD_05_PC_CUYEMIYEADEX2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M3
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS3 and SD_05_PC_CUYEMIYEADEX3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_EXP_ADMIN_CY_M4
## DESCRIPTION:  Administrative expenses
## LOCATION:  SCHED-D-PART-05-LINE-01F-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFAEXPENS4 and SD_05_PC_CUYEMIYEADEX4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/AdministrativeExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/AdministrativeExpensesAmt'
V_ENDOW_EXP_ADMIN_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_EXP_ADMIN_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_EXP_ADMIN_CY_M4 ) )




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
SD_05_ENDOW_BALANCE_EOY_CY <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M1
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-B
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN1 and SD_05_PC_CYMYEOYBALAN1 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus1Year/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus1YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M1 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M1 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M1 ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M2
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-C
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN2 and SD_05_PC_CYMYEOYBALAN2 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus2Years/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus2YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M2 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M2 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M2 ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M3
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-D
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN3 and SD_05_PC_CYMYEOYBALAN3 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus3Years/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus3YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M3 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M3 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M3 ) )




## VARIABLE NAME:  SD_05_ENDOW_BALANCE_EOY_CY_M4
## DESCRIPTION:  End of year balance
## LOCATION:  SCHED-D-PART-05-LINE-01G-COL-E
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  SD_05_PC_CYMEFEYBALAN4 and SD_05_PC_CYMYEOYBALAN4 are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/CurrentYearMinus4Years/EndOfYearBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CYMinus4YrEndwmtFundGrp/EndYearBalanceAmt'
V_ENDOW_BALANCE_EOY_CY_M4 <- paste( V1, V2 , sep='|' )
SD_05_ENDOW_BALANCE_EOY_CY_M4 <- xml_text( xml_find_all( doc, V_ENDOW_BALANCE_EOY_CY_M4 ) )




## VARIABLE NAME:  SD_05_PCT_L1G_BOARD_DESIGNATED
## DESCRIPTION:  Board designated EOY balance
## LOCATION:  SCHED-D-PART-05-LINE-02A
## TABLE:  SD-P05-T00-ENDOWMENT
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:   SD_05_PC_BDBEOYPCT and SD_05_PC_BODEEOOYYBBA are the same variables.

V1 <- '//Return/ReturnData/IRS990ScheduleD/BoardDesignatedBalanceEOYPct'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BoardDesignatedEOYBalance'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartV/BoardDesignatedEOYBalance'
V_PCT_L1G_BOARD_DESIGNATED <- paste( V1, V2, V3 , sep='|' )
SD_05_PCT_L1G_BOARD_DESIGNATED <- xml_text( xml_find_all( doc, V_PCT_L1G_BOARD_DESIGNATED ) )




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
SD_05_PCT_L1G_PERMANENT_ENDOW <- xml_text( xml_find_all( doc, V_PCT_L1G_PERMANENT_ENDOW ) )




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
SD_05_PCT_L1G_TERM_ENDOW <- xml_text( xml_find_all( doc, V_PCT_L1G_TERM_ENDOW ) )




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
SD_05_ENDOW_HELD_ORG_UNRLTD_X <- xml_text( xml_find_all( doc, V_ENDOW_HELD_ORG_UNRLTD_X ) )




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
SD_05_ENDOW_HELD_ORG_RLTD_X <- xml_text( xml_find_all( doc, V_ENDOW_HELD_ORG_RLTD_X ) )




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
SD_05_RLTD_ORG_LISTED_SCHED_R_X <- xml_text( xml_find_all( doc, V_RLTD_ORG_LISTED_SCHED_R_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_05_ENDOW_BALANCE_BOY_CY,SD_05_ENDOW_BALANCE_BOY_CY_M1,SD_05_ENDOW_BALANCE_BOY_CY_M2,SD_05_ENDOW_BALANCE_BOY_CY_M3,SD_05_ENDOW_BALANCE_BOY_CY_M4,SD_05_ENDOW_CONTR_CY,SD_05_ENDOW_CONTR_CY_M1,SD_05_ENDOW_CONTR_CY_M2,SD_05_ENDOW_CONTR_CY_M3,SD_05_ENDOW_CONTR_CY_M4,SD_05_ENDOW_INVEST_CY,SD_05_ENDOW_INVEST_CY_M1,SD_05_ENDOW_INVEST_CY_M2,SD_05_ENDOW_INVEST_CY_M3,SD_05_ENDOW_INVEST_CY_M4,SD_05_ENDOW_GRANT_CY,SD_05_ENDOW_GRANT_CY_M1,SD_05_ENDOW_GRANT_CY_M2,SD_05_ENDOW_GRANT_CY_M3,SD_05_ENDOW_GRANT_CY_M4,SD_05_ENDOW_EXP_OTH_CY,SD_05_ENDOW_EXP_OTH_CY_M1,SD_05_ENDOW_EXP_OTH_CY_M2,SD_05_ENDOW_EXP_OTH_CY_M3,SD_05_ENDOW_EXP_OTH_CY_M4,SD_05_ENDOW_EXP_ADMIN_CY,SD_05_ENDOW_EXP_ADMIN_CY_M1,SD_05_ENDOW_EXP_ADMIN_CY_M2,SD_05_ENDOW_EXP_ADMIN_CY_M3,SD_05_ENDOW_EXP_ADMIN_CY_M4,SD_05_ENDOW_BALANCE_EOY_CY,SD_05_ENDOW_BALANCE_EOY_CY_M1,SD_05_ENDOW_BALANCE_EOY_CY_M2,SD_05_ENDOW_BALANCE_EOY_CY_M3,SD_05_ENDOW_BALANCE_EOY_CY_M4,SD_05_PCT_L1G_BOARD_DESIGNATED,SD_05_PCT_L1G_PERMANENT_ENDOW,SD_05_PCT_L1G_TERM_ENDOW,SD_05_ENDOW_HELD_ORG_UNRLTD_X,SD_05_ENDOW_HELD_ORG_RLTD_X,SD_05_RLTD_ORG_LISTED_SCHED_R_X)
df <- as.data.frame( var.list )


return( df )


}


