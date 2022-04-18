#' @title 
#'   Build table SG-P03-T00-GAMING
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SG_P03_T00_GAMING <- function( doc, url )
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


## VARIABLE NAME:  SG_03_GAMING_REV_GRO_BINGO
## DESCRIPTION:  Gross revenue; bingo
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenueBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenueBingoAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenueBingo'
V_GAMING_REV_GRO_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_BINGO <- xml_text( xml_find_all( doc, V_GAMING_REV_GRO_BINGO ) )




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_PTAB
## DESCRIPTION:  Gross revenue; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenuePullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenuePullTabsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenuePullTabs'
V_GAMING_REV_GRO_PTAB <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_PTAB <- xml_text( xml_find_all( doc, V_GAMING_REV_GRO_PTAB ) )




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_OTH
## DESCRIPTION:  Gross revenue; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenueOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenueOtherGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenueOtherGaming'
V_GAMING_REV_GRO_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_OTH <- xml_text( xml_find_all( doc, V_GAMING_REV_GRO_OTH ) )




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_TOT
## DESCRIPTION:  Gross revenue; total
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenueTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenueTotalGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenueTotalGaming'
V_GAMING_REV_GRO_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_TOT <- xml_text( xml_find_all( doc, V_GAMING_REV_GRO_TOT ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_BINGO
## DESCRIPTION:  Cash prizes; bingo
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesBingoAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesBingo'
V_GAMING_EXP_CASH_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_BINGO <- xml_text( xml_find_all( doc, V_GAMING_EXP_CASH_BINGO ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_PTAP
## DESCRIPTION:  Cash prizes; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesPullTabsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesPullTabs'
V_GAMING_EXP_CASH_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_PTAP <- xml_text( xml_find_all( doc, V_GAMING_EXP_CASH_PTAP ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_OTH
## DESCRIPTION:  Cash prizes; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesOtherGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesOtherGaming'
V_GAMING_EXP_CASH_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_OTH <- xml_text( xml_find_all( doc, V_GAMING_EXP_CASH_OTH ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_TOT
## DESCRIPTION:  Cash prizes; total
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesTotalGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesTotalGaming'
V_GAMING_EXP_CASH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_TOT <- xml_text( xml_find_all( doc, V_GAMING_EXP_CASH_TOT ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_BINGO
## DESCRIPTION:  Non-cash prizes; bingo
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesBingoAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesBingo'
V_GAMING_EXP_NONCSH_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_BINGO <- xml_text( xml_find_all( doc, V_GAMING_EXP_NONCSH_BINGO ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_PTAP
## DESCRIPTION:  Non-cash prizes; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesPullTabsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesPullTabs'
V_GAMING_EXP_NONCSH_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_PTAP <- xml_text( xml_find_all( doc, V_GAMING_EXP_NONCSH_PTAP ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_OTH
## DESCRIPTION:  Non-cash prizes; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesOtherGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesOtherGaming'
V_GAMING_EXP_NONCSH_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_OTH <- xml_text( xml_find_all( doc, V_GAMING_EXP_NONCSH_OTH ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_TOT
## DESCRIPTION:  Non-cash prizes; total
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesTotalGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesTotalGaming'
V_GAMING_EXP_NONCSH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_TOT <- xml_text( xml_find_all( doc, V_GAMING_EXP_NONCSH_TOT ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_BINGO
## DESCRIPTION:  Rent/facility costs; bingo
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFacilityCostsBingoAmt'
V_GAMING_EXP_RENT_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_BINGO <- xml_text( xml_find_all( doc, V_GAMING_EXP_RENT_BINGO ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_PTAP
## DESCRIPTION:  Rent/facility costs; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsPullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFacilityCostsPullTabsAmt'
V_GAMING_EXP_RENT_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_PTAP <- xml_text( xml_find_all( doc, V_GAMING_EXP_RENT_PTAP ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_OTH
## DESCRIPTION:  Rent or facility costs; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFcltyCostsOtherGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsOtherGaming'
V_GAMING_EXP_RENT_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_OTH <- xml_text( xml_find_all( doc, V_GAMING_EXP_RENT_OTH ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_TOT
## DESCRIPTION:  Rent/facility costs; total
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsTotalGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFcltyCostsTotalGamingAmt'
V_GAMING_EXP_RENT_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_TOT <- xml_text( xml_find_all( doc, V_GAMING_EXP_RENT_TOT ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_BINGO
## DESCRIPTION:  Other direct expenses; bingo
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OtherDirectExpensesBingoAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesBingo'
V_GAMING_EXP_OTH_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_BINGO <- xml_text( xml_find_all( doc, V_GAMING_EXP_OTH_BINGO ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_PTAP
## DESCRIPTION:  Other direct expenses; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OtherDirectExpensesPullTabsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesPullTabs'
V_GAMING_EXP_OTH_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_PTAP <- xml_text( xml_find_all( doc, V_GAMING_EXP_OTH_PTAP ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_OTH
## DESCRIPTION:  Other direct expenses; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OthDirectExpnssOtherGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesOtherGaming'
V_GAMING_EXP_OTH_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_OTH <- xml_text( xml_find_all( doc, V_GAMING_EXP_OTH_OTH ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_TOT
## DESCRIPTION:  Other direct expenses; total
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OthDirectExpnssTotalGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesTotalGaming'
V_GAMING_EXP_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_TOT <- xml_text( xml_find_all( doc, V_GAMING_EXP_OTH_TOT ) )




## VARIABLE NAME:  SG_03_GAMING_VOL_BINGO_X
## DESCRIPTION:  volunteer labor; bingo
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborBingoInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborBingo'
V_GAMING_VOL_BINGO_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_BINGO_X <- xml_text( xml_find_all( doc, V_GAMING_VOL_BINGO_X ) )




## VARIABLE NAME:  SG_03_GAMING_VOL_PCT_BINGO
## DESCRIPTION:  volunteer labor percentage; bingo
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPercentageBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborBingoPct'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPercentageBingo'
V_GAMING_VOL_PCT_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PCT_BINGO <- xml_text( xml_find_all( doc, V_GAMING_VOL_PCT_BINGO ) )




## VARIABLE NAME:  SG_03_GAMING_VOL_PCT_PTAP
## DESCRIPTION:  volunteer labor percentage; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPrcntagePullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborPullTabsPct'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPrcntagePullTabs'
V_GAMING_VOL_PCT_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PCT_PTAP <- xml_text( xml_find_all( doc, V_GAMING_VOL_PCT_PTAP ) )




## VARIABLE NAME:  SG_03_GAMING_VOL_PTAP_X
## DESCRIPTION:  volunteer labor; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborPullTabsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPullTabs'
V_GAMING_VOL_PTAP_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PTAP_X <- xml_text( xml_find_all( doc, V_GAMING_VOL_PTAP_X ) )




## VARIABLE NAME:  SG_03_GAMING_VOL_OTH_X
## DESCRIPTION:  volunteer labor; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborOtherGamingInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborOtherGaming'
V_GAMING_VOL_OTH_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_OTH_X <- xml_text( xml_find_all( doc, V_GAMING_VOL_OTH_X ) )




## VARIABLE NAME:  SG_03_GAMING_VOL_PCT_OTH
## DESCRIPTION:  volunteer labor percentage; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPrcntOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborOtherGamingPct'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPrcntOtherGaming'
V_GAMING_VOL_PCT_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PCT_OTH <- xml_text( xml_find_all( doc, V_GAMING_VOL_PCT_OTH ) )




## VARIABLE NAME:  SG_03_GAMING_EXP_SUMMARY_TOT
## DESCRIPTION:  Direct expense summary
## LOCATION:  SCHED-G-PART-03-LINE-07-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/DirectExpenseSummaryGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/DirectExpenseSummaryGamingAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/DirectExpenseSummaryGaming'
V_GAMING_EXP_SUMMARY_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_SUMMARY_TOT <- xml_text( xml_find_all( doc, V_GAMING_EXP_SUMMARY_TOT ) )




## VARIABLE NAME:  SG_03_GAMING_NET_INCOME_TOT
## DESCRIPTION:  Net gaming income summary
## LOCATION:  SCHED-G-PART-03-LINE-08-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NetGamingIncomeSummary'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NetGamingIncomeSummaryAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NetGamingIncomeSummary'
V_GAMING_NET_INCOME_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_NET_INCOME_TOT <- xml_text( xml_find_all( doc, V_GAMING_NET_INCOME_TOT ) )




## VARIABLE NAME:  SG_03_STATES_GAMING_CONDUCTED
## DESCRIPTION:  Enter state where organization conducts gaming activities
## LOCATION:  SCHED-G-PART-03-LINE-09
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/StatesWhereGamingConducted'
V2 <- '//Return/ReturnData/IRS990ScheduleG/StatesWhereGamingConductedCd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/StatesWhereGamingConducted'
V_STATES_GAMING_CONDUCTED <- paste( V1, V2, V3 , sep='|' )
SG_03_STATES_GAMING_CONDUCTED <- xml_text( xml_find_all( doc, V_STATES_GAMING_CONDUCTED ) )




## VARIABLE NAME:  SG_03_GAMING_LIC_X
## DESCRIPTION:  Is organization licensed in each state?
## LOCATION:  SCHED-G-PART-03-LINE-09A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Licensed'
V2 <- '//Return/ReturnData/IRS990ScheduleG/LicensedInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/Licensed'
V_GAMING_LIC_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_LIC_X <- xml_text( xml_find_all( doc, V_GAMING_LIC_X ) )




## VARIABLE NAME:  SG_03_GAMING_NO_LIC_EXPLANATION
## DESCRIPTION:  Explanation if no license
## LOCATION:  SCHED-G-PART-03-LINE-09B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfNo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfNoTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/ExplanationIfNo'
V_GAMING_NO_LIC_EXPLANATION <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_NO_LIC_EXPLANATION <- xml_text( xml_find_all( doc, V_GAMING_NO_LIC_EXPLANATION ) )




## VARIABLE NAME:  SG_03_GAMING_LIC_SUSPENDED_X
## DESCRIPTION:  Were any gaming licenses revoked; suspended; or terminated during the tax year?
## LOCATION:  SCHED-G-PART-03-LINE-10A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/LicenseSuspendedEtc'
V2 <- '//Return/ReturnData/IRS990ScheduleG/LicenseSuspendedEtcInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/LicenseSuspendedEtc'
V_GAMING_LIC_SUSPENDED_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_LIC_SUSPENDED_X <- xml_text( xml_find_all( doc, V_GAMING_LIC_SUSPENDED_X ) )




## VARIABLE NAME:  SG_03_LIC_SUSPENDED_EXPLANATION
## DESCRIPTION:  Explanation if license revoked; suspended; or termination
## LOCATION:  SCHED-G-PART-03-LINE-10B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfYes'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfYesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/ExplanationIfYes'
V_LIC_SUSPENDED_EXPLANATION <- paste( V1, V2, V3 , sep='|' )
SG_03_LIC_SUSPENDED_EXPLANATION <- xml_text( xml_find_all( doc, V_LIC_SUSPENDED_EXPLANATION ) )




## VARIABLE NAME:  SG_03_GAMING_NONMEMB_X
## DESCRIPTION:  Does organization operate gaming activities with nonmembers?
## LOCATION:  SCHED-G-PART-03-LINE-11
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingWithNonmembers'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingWithNonmembersInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingWithNonmembers'
V_GAMING_NONMEMB_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_NONMEMB_X <- xml_text( xml_find_all( doc, V_GAMING_NONMEMB_X ) )




## VARIABLE NAME:  SG_03_GAMING_MEMB_OTH_ENTITY_X
## DESCRIPTION:  Is organization formed to administer charitable gaming?
## LOCATION:  SCHED-G-PART-03-LINE-12
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/MemberOfOtherEntity'
V2 <- '//Return/ReturnData/IRS990ScheduleG/MemberOfOtherEntityInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/MemberOfOtherEntity'
V_GAMING_MEMB_OTH_ENTITY_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MEMB_OTH_ENTITY_X <- xml_text( xml_find_all( doc, V_GAMING_MEMB_OTH_ENTITY_X ) )




## VARIABLE NAME:  SG_03_PCT_GAMING_OWN_FACILITY
## DESCRIPTION:  Percentage of gaming in own facility
## LOCATION:  SCHED-G-PART-03-LINE-13A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingOwnFacilityPct'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PercentageOfGamingOwnFacility'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/PercentageOfGamingOwnFacility'
V_PCT_GAMING_OWN_FACILITY <- paste( V1, V2, V3 , sep='|' )
SG_03_PCT_GAMING_OWN_FACILITY <- xml_text( xml_find_all( doc, V_PCT_GAMING_OWN_FACILITY ) )




## VARIABLE NAME:  SG_03_PCT_GAMING_OTH_FACILITY
## DESCRIPTION:  Percentage of gaming in other facility
## LOCATION:  SCHED-G-PART-03-LINE-13B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingOtherFacilityPct'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PercentageOfGamingOthrFacility'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/PercentageOfGamingOthrFacility'
V_PCT_GAMING_OTH_FACILITY <- paste( V1, V2, V3 , sep='|' )
SG_03_PCT_GAMING_OTH_FACILITY <- xml_text( xml_find_all( doc, V_PCT_GAMING_OTH_FACILITY ) )




## VARIABLE NAME:  SG_03_GRK_ADDR_CITY
## DESCRIPTION:  Address Foreign - City
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/City'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/City'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/City'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/City'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/City'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/CityNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/City'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/CityNm'
V_GRK_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_CITY <- xml_text( xml_find_all( doc, V_GRK_ADDR_CITY ) )




## VARIABLE NAME:  SG_03_GRK_ADDR_CNTR
## DESCRIPTION:  Address Foreign - Country
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/Country'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/Country'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/Country'
V4 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/CountryCd'
V_GRK_ADDR_CNTR <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_GRK_ADDR_CNTR <- xml_text( xml_find_all( doc, V_GRK_ADDR_CNTR ) )




## VARIABLE NAME:  SG_03_GRK_ADDR_L1
## DESCRIPTION:  Address Foreign - AddressLine1
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/AddressLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/AddressLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/AddressLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/AddressLine1'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine1'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine1Txt'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine1'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine1Txt'
V_GRK_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_L1 <- xml_text( xml_find_all( doc, V_GRK_ADDR_L1 ) )




## VARIABLE NAME:  SG_03_GRK_ADDR_L2
## DESCRIPTION:  Address Foreign - AddressLine2
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/AddressLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/AddressLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/AddressLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine2Txt'
V5 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/AddressLine2'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine2'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine2'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine2Txt'
V_GRK_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_L2 <- xml_text( xml_find_all( doc, V_GRK_ADDR_L2 ) )




## VARIABLE NAME:  SG_03_GRK_ADDR_STATE
## DESCRIPTION:  Address US - State
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/State'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/ProvinceOrState'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/State'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/ProvinceOrState'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/State'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/StateAbbreviationCd'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/ProvinceOrState'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/ProvinceOrStateNm'
V_GRK_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_STATE <- xml_text( xml_find_all( doc, V_GRK_ADDR_STATE ) )




## VARIABLE NAME:  SG_03_GRK_ADDR_ZIP
## DESCRIPTION:  Address Foreign - Postal code
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/PostalCode'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/ZIPCode'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/PostalCode'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/ZIPCode'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/ForeignPostalCd'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/PostalCode'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/ZIPCd'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/ZIPCode'
V_GRK_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_ZIP <- xml_text( xml_find_all( doc, V_GRK_ADDR_ZIP ) )




## VARIABLE NAME:  SG_03_GRK_NAME_ORG_L1
## DESCRIPTION:  Name Of Gaming Rec Keeper Bus - BusinessNameLine1
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/NameOfGamingRecKeeperBus/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine1Txt'
V_GRK_NAME_ORG_L1 <- paste( V1, V2, V3 , sep='|' )
SG_03_GRK_NAME_ORG_L1 <- xml_text( xml_find_all( doc, V_GRK_NAME_ORG_L1 ) )




## VARIABLE NAME:  SG_03_GRK_NAME_ORG_L2
## DESCRIPTION:  Name Of Gaming Rec Keeper Bus - BusinessNameLine2
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/NameOfGamingRecKeeperBus/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine2Txt'
V_GRK_NAME_ORG_L2 <- paste( V1, V2, V3 , sep='|' )
SG_03_GRK_NAME_ORG_L2 <- xml_text( xml_find_all( doc, V_GRK_NAME_ORG_L2 ) )




## VARIABLE NAME:  SG_03_GRK_NAME_PERS
## DESCRIPTION:  Person name of gaming records keeper
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/IndividualWithBooksNm'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfGamingRecKeeperPerson'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfGamingRecordsKeeper/PersonName'
V_GRK_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
SG_03_GRK_NAME_PERS <- xml_text( xml_find_all( doc, V_GRK_NAME_PERS ) )




## VARIABLE NAME:  SG_03_KONTR_3RD_PARTY_X
## DESCRIPTION:  Is there a third party contract for gaming revenue?
## LOCATION:  SCHED-G-PART-03-LINE-15A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/CntrctWith3rdPrtyForGameRevInd'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ContractWith3rdPartyForGamRev'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/ContractWith3rdPartyForGamRev'
V_KONTR_3RD_PARTY_X <- paste( V1, V2, V3 , sep='|' )
SG_03_KONTR_3RD_PARTY_X <- xml_text( xml_find_all( doc, V_KONTR_3RD_PARTY_X ) )




## VARIABLE NAME:  SG_03_AMT_GAMING_REV_3RD_PARTY
## DESCRIPTION:  Amount of gaming revenue retained by 3rd party
## LOCATION:  SCHED-G-PART-03-LINE-15B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AmtOfGamingRevenueRetndBy3Prty'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingRevenueRtnBy3PrtyAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AmtOfGamingRevenueRetndBy3Prty'
V_AMT_GAMING_REV_3RD_PARTY <- paste( V1, V2, V3 , sep='|' )
SG_03_AMT_GAMING_REV_3RD_PARTY <- xml_text( xml_find_all( doc, V_AMT_GAMING_REV_3RD_PARTY ) )




## VARIABLE NAME:  SG_03_AMT_GAMING_REV_ORG
## DESCRIPTION:  Amount of gaming revenue received by organization
## LOCATION:  SCHED-G-PART-03-LINE-15B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AmtOfGamingRevenueRecvdByOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingRevenueReceivedByOrgAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AmtOfGamingRevenueRecvdByOrg'
V_AMT_GAMING_REV_ORG <- paste( V1, V2, V3 , sep='|' )
SG_03_AMT_GAMING_REV_ORG <- xml_text( xml_find_all( doc, V_AMT_GAMING_REV_ORG ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_CITY
## DESCRIPTION:  Address Foreign - City
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/City'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/City'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/City'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/City'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/City'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/CityNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/City'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/CityNm'
V_THIRD_PARTY_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_CITY <- xml_text( xml_find_all( doc, V_THIRD_PARTY_ADDR_CITY ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_CNTR
## DESCRIPTION:  Address Foreign - Country
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/Country'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/Country'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/Country'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/CountryCd'
V_THIRD_PARTY_ADDR_CNTR <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_THIRD_PARTY_ADDR_CNTR <- xml_text( xml_find_all( doc, V_THIRD_PARTY_ADDR_CNTR ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_L1
## DESCRIPTION:  Address Foreign - AddressLine1
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/AddressLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/AddressLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/AddressLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/AddressLine1'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine1'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine1Txt'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine1'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine1Txt'
V_THIRD_PARTY_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_L1 <- xml_text( xml_find_all( doc, V_THIRD_PARTY_ADDR_L1 ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_L2
## DESCRIPTION:  Address Foreign - AddressLine2
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/AddressLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/AddressLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/AddressLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine2'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine2Txt'
V6 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/AddressLine2'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine2Txt'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine2'
V_THIRD_PARTY_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_L2 <- xml_text( xml_find_all( doc, V_THIRD_PARTY_ADDR_L2 ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_STATE
## DESCRIPTION:  Address US - State
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/State'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/ProvinceOrState'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/ProvinceOrState'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/State'
V5 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/ProvinceOrState'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/ProvinceOrStateNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/State'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/StateAbbreviationCd'
V_THIRD_PARTY_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_STATE <- xml_text( xml_find_all( doc, V_THIRD_PARTY_ADDR_STATE ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_ZIP
## DESCRIPTION:  Address Foreign - Postal code
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/PostalCode'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/ZIPCode'
V3 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/PostalCode'
V4 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/ZIPCode'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/ForeignPostalCd'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/PostalCode'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/ZIPCd'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/ZIPCode'
V_THIRD_PARTY_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_ZIP <- xml_text( xml_find_all( doc, V_THIRD_PARTY_ADDR_ZIP ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_NAME_ORG_L1
## DESCRIPTION:  Business Name - BusinessNameLine1
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfThirdParty/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfThirdPartyBusiness/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine1Txt'
V_THIRD_PARTY_NAME_ORG_L1 <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_THIRD_PARTY_NAME_ORG_L1 <- xml_text( xml_find_all( doc, V_THIRD_PARTY_NAME_ORG_L1 ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_NAME_ORG_L2
## DESCRIPTION:  Business Name - BusinessNameLine2
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfThirdParty/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfThirdPartyBusiness/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine2Txt'
V_THIRD_PARTY_NAME_ORG_L2 <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_THIRD_PARTY_NAME_ORG_L2 <- xml_text( xml_find_all( doc, V_THIRD_PARTY_NAME_ORG_L2 ) )




## VARIABLE NAME:  SG_03_THIRD_PARTY_NAME_PERS
## DESCRIPTION:  Person name of gaming records keeper
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfThirdParty/PersonName'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfThirdPartyPerson'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyPersonNm'
V_THIRD_PARTY_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
SG_03_THIRD_PARTY_NAME_PERS <- xml_text( xml_find_all( doc, V_THIRD_PARTY_NAME_PERS ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_COMP
## DESCRIPTION:  Gaming manager compensation
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerCompensation'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerCompensationAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerCompensation'
V_GAMING_MGR_COMP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_COMP <- xml_text( xml_find_all( doc, V_GAMING_MGR_COMP ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_KONTR_X
## DESCRIPTION:  Gaming manager is an independent contractor
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsIndCntrctInd'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsIndContractor'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerIsIndContractor'
V_GAMING_MGR_KONTR_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_KONTR_X <- xml_text( xml_find_all( doc, V_GAMING_MGR_KONTR_X ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_SVC_PROV
## DESCRIPTION:  Gamaing manager services provided
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerServicesProvided'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerServicesProvTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerServicesProvided'
V_GAMING_MGR_SVC_PROV <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_SVC_PROV <- xml_text( xml_find_all( doc, V_GAMING_MGR_SVC_PROV ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_DIR_OFF_X
## DESCRIPTION:  Gaming manager is a director or officer
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsDirectorOfcrInd'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsDirectorOfficer'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerIsDirectorOfficer'
V_GAMING_MGR_DIR_OFF_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_DIR_OFF_X <- xml_text( xml_find_all( doc, V_GAMING_MGR_DIR_OFF_X ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_EMPL_X
## DESCRIPTION:  Gaming manager is an employee
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsEmployee'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsEmployeeInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerIsEmployee'
V_GAMING_MGR_EMPL_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_EMPL_X <- xml_text( xml_find_all( doc, V_GAMING_MGR_EMPL_X ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_NAME_ORG_L1
## DESCRIPTION:  Business Name - BusinessNameLine1
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerName/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfGamingRecordsKeeper/BusinessName/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine1Txt'
V5 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerNameBusiness/BusinessNameLine1'
V_GAMING_MGR_NAME_ORG_L1 <- paste( V1, V2, V3, V4, V5 , sep='|' )
SG_03_GAMING_MGR_NAME_ORG_L1 <- xml_text( xml_find_all( doc, V_GAMING_MGR_NAME_ORG_L1 ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_NAME_ORG_L2
## DESCRIPTION:  Business Name - BusinessNameLine2
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerName/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfGamingRecordsKeeper/BusinessName/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine2Txt'
V5 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerNameBusiness/BusinessNameLine2'
V_GAMING_MGR_NAME_ORG_L2 <- paste( V1, V2, V3, V4, V5 , sep='|' )
SG_03_GAMING_MGR_NAME_ORG_L2 <- xml_text( xml_find_all( doc, V_GAMING_MGR_NAME_ORG_L2 ) )




## VARIABLE NAME:  SG_03_GAMING_MGR_NAME_PERS
## DESCRIPTION:  Gaming manager person name
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerNamePerson'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerPersonNm'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerName/PersonName'
V_GAMING_MGR_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_NAME_PERS <- xml_text( xml_find_all( doc, V_GAMING_MGR_NAME_PERS ) )




## VARIABLE NAME:  SG_03_CHARIT_DIST_REQ_X
## DESCRIPTION:  Charitable distributions required?
## LOCATION:  SCHED-G-PART-03-LINE-17A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/CharitableDistribRequired'
V2 <- '//Return/ReturnData/IRS990ScheduleG/CharitableDistributionRqrInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/CharitableDistribRequired'
V_CHARIT_DIST_REQ_X <- paste( V1, V2, V3 , sep='|' )
SG_03_CHARIT_DIST_REQ_X <- xml_text( xml_find_all( doc, V_CHARIT_DIST_REQ_X ) )




## VARIABLE NAME:  SG_03_AMT_DIST
## DESCRIPTION:  Amount distributed
## LOCATION:  SCHED-G-PART-03-LINE-17B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AmountDistributed'
V2 <- '//Return/ReturnData/IRS990ScheduleG/DistributedAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AmountDistributed'
V_AMT_DIST <- paste( V1, V2, V3 , sep='|' )
SG_03_AMT_DIST <- xml_text( xml_find_all( doc, V_AMT_DIST ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SG_03_GAMING_REV_GRO_BINGO,SG_03_GAMING_REV_GRO_PTAB,SG_03_GAMING_REV_GRO_OTH,SG_03_GAMING_REV_GRO_TOT,SG_03_GAMING_EXP_CASH_BINGO,SG_03_GAMING_EXP_CASH_PTAP,SG_03_GAMING_EXP_CASH_OTH,SG_03_GAMING_EXP_CASH_TOT,SG_03_GAMING_EXP_NONCSH_BINGO,SG_03_GAMING_EXP_NONCSH_PTAP,SG_03_GAMING_EXP_NONCSH_OTH,SG_03_GAMING_EXP_NONCSH_TOT,SG_03_GAMING_EXP_RENT_BINGO,SG_03_GAMING_EXP_RENT_PTAP,SG_03_GAMING_EXP_RENT_OTH,SG_03_GAMING_EXP_RENT_TOT,SG_03_GAMING_EXP_OTH_BINGO,SG_03_GAMING_EXP_OTH_PTAP,SG_03_GAMING_EXP_OTH_OTH,SG_03_GAMING_EXP_OTH_TOT,SG_03_GAMING_VOL_BINGO_X,SG_03_GAMING_VOL_PCT_BINGO,SG_03_GAMING_VOL_PCT_PTAP,SG_03_GAMING_VOL_PTAP_X,SG_03_GAMING_VOL_OTH_X,SG_03_GAMING_VOL_PCT_OTH,SG_03_GAMING_EXP_SUMMARY_TOT,SG_03_GAMING_NET_INCOME_TOT,SG_03_STATES_GAMING_CONDUCTED,SG_03_GAMING_LIC_X,SG_03_GAMING_NO_LIC_EXPLANATION,SG_03_GAMING_LIC_SUSPENDED_X,SG_03_LIC_SUSPENDED_EXPLANATION,SG_03_GAMING_NONMEMB_X,SG_03_GAMING_MEMB_OTH_ENTITY_X,SG_03_PCT_GAMING_OWN_FACILITY,SG_03_PCT_GAMING_OTH_FACILITY,SG_03_GRK_ADDR_CITY,SG_03_GRK_ADDR_CNTR,SG_03_GRK_ADDR_L1,SG_03_GRK_ADDR_L2,SG_03_GRK_ADDR_STATE,SG_03_GRK_ADDR_ZIP,SG_03_GRK_NAME_ORG_L1,SG_03_GRK_NAME_ORG_L2,SG_03_GRK_NAME_PERS,SG_03_KONTR_3RD_PARTY_X,SG_03_AMT_GAMING_REV_3RD_PARTY,SG_03_AMT_GAMING_REV_ORG,SG_03_THIRD_PARTY_ADDR_CITY,SG_03_THIRD_PARTY_ADDR_CNTR,SG_03_THIRD_PARTY_ADDR_L1,SG_03_THIRD_PARTY_ADDR_L2,SG_03_THIRD_PARTY_ADDR_STATE,SG_03_THIRD_PARTY_ADDR_ZIP,SG_03_THIRD_PARTY_NAME_ORG_L1,SG_03_THIRD_PARTY_NAME_ORG_L2,SG_03_THIRD_PARTY_NAME_PERS,SG_03_GAMING_MGR_COMP,SG_03_GAMING_MGR_KONTR_X,SG_03_GAMING_MGR_SVC_PROV,SG_03_GAMING_MGR_DIR_OFF_X,SG_03_GAMING_MGR_EMPL_X,SG_03_GAMING_MGR_NAME_ORG_L1,SG_03_GAMING_MGR_NAME_ORG_L2,SG_03_GAMING_MGR_NAME_PERS,SG_03_CHARIT_DIST_REQ_X,SG_03_AMT_DIST)
df <- as.data.frame( var.list )


return( df )


}


