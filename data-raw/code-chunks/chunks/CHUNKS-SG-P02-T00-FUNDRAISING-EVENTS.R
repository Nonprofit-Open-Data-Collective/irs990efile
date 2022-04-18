#' @title 
#'   Build table SG-P02-T00-FUNDRAISING-EVENTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SG_P02_T00_FUNDRAISING_EVENTS <- function( doc, url )
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


## VARIABLE NAME:  SG_02_FUNDR_EVNT_REV_GRORCPT_TOT
## DESCRIPTION:  Gross receipts; total
## LOCATION:  SCHED-G-PART-02-LINE-01-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/GrossReceiptsTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/GrossReceiptsTotal'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/GrossReceiptsTotalAmt'
V_FUNDR_EVNT_REV_GRORCPT_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_REV_GRORCPT_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_REV_GRORCPT_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_REV_CONTR_TOT
## DESCRIPTION:  Charitable contributions; total
## LOCATION:  SCHED-G-PART-02-LINE-02-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/CharitableContributionsTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/CharitableContributionsTotal'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/CharitableContributionsTotAmt'
V_FUNDR_EVNT_REV_CONTR_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_REV_CONTR_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_REV_CONTR_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_REV_GRO_TOT
## DESCRIPTION:  Gross revenue; total
## LOCATION:  SCHED-G-PART-02-LINE-03-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/GrossRevenueTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/GrossRevenueTotalEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/GrossRevenueTotalEventsAmt'
V_FUNDR_EVNT_REV_GRO_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_REV_GRO_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_REV_GRO_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_CASH_TOT
## DESCRIPTION:  Cash prizes; total
## LOCATION:  SCHED-G-PART-02-LINE-04-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/CashPrizesTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/CashPrizesTotalEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/CashPrizesTotalEventsAmt'
V_FUNDR_EVNT_EXP_CASH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_EXP_CASH_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_CASH_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_NONCSH_TOT
## DESCRIPTION:  Non-cash prizes; total
## LOCATION:  SCHED-G-PART-02-LINE-05-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/NonCashPrizesTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/NonCashPrizesTotalEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/NonCashPrizesTotalEventsAmt'
V_FUNDR_EVNT_EXP_NONCSH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_EXP_NONCSH_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_NONCSH_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_RENT_TOT
## DESCRIPTION:  Rent/facility costs; total
## LOCATION:  SCHED-G-PART-02-LINE-06-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/RentFacilityCostsTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/RentFacilityCostsTotalEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/RentFcltyCostsTotalEventsAmt'
V_FUNDR_EVNT_EXP_RENT_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_EXP_RENT_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_RENT_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_FOOD_TOT
## DESCRIPTION:  Food and beverage costs; total
## LOCATION:  SCHED-G-PART-02-LINE-07-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/FoodAndBeverageTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/FoodAndBeverageTotalEventsAmt'
V_FUNDR_EVNT_EXP_FOOD_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_EXP_FOOD_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_FOOD_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_ENTMT_TOT
## DESCRIPTION:  Entertainment costs; total
## LOCATION:  SCHED-G-PART-02-LINE-08-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/EntertainmentTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/EntertainmentTotalEventsAmt'
V_FUNDR_EVNT_EXP_ENTMT_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_EXP_ENTMT_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_ENTMT_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_OTH_TOT
## DESCRIPTION:  Other direct expenses; total
## LOCATION:  SCHED-G-PART-02-LINE-09-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/OtherDirectExpensesTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/OtherDirectExpensesTotalEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/OthDirectExpnssTotalEventsAmt'
V_FUNDR_EVNT_EXP_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_EXP_OTH_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_OTH_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT
## DESCRIPTION:  Direct expense summary
## LOCATION:  SCHED-G-PART-02-LINE-10-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/DirectExpenseSummaryEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/DirectExpenseSummaryEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/DirectExpenseSummaryEventsAmt'
V_FUNDR_EVNT_EXP_SUMMARY_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_EXP_SUMMARY_TOT ) )




## VARIABLE NAME:  SG_02_FUNDR_EVNT_NET_INCOME_TOT
## DESCRIPTION:  Net income summary
## LOCATION:  SCHED-G-PART-02-LINE-11-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/NetIncomeSummary'
V2 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/NetIncomeSummary'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/NetIncomeSummaryAmt'
V_FUNDR_EVNT_NET_INCOME_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_NET_INCOME_TOT <- xml_text( xml_find_all( doc, V_FUNDR_EVNT_NET_INCOME_TOT ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SG_02_FUNDR_EVNT_REV_GRORCPT_TOT,SG_02_FUNDR_EVNT_REV_CONTR_TOT,SG_02_FUNDR_EVNT_REV_GRO_TOT,SG_02_FUNDR_EVNT_EXP_CASH_TOT,SG_02_FUNDR_EVNT_EXP_NONCSH_TOT,SG_02_FUNDR_EVNT_EXP_RENT_TOT,SG_02_FUNDR_EVNT_EXP_FOOD_TOT,SG_02_FUNDR_EVNT_EXP_ENTMT_TOT,SG_02_FUNDR_EVNT_EXP_OTH_TOT,SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT,SG_02_FUNDR_EVNT_NET_INCOME_TOT)
df <- as.data.frame( var.list )


return( df )


}


