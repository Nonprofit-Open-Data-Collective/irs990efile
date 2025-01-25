#' @title 
#'   Build table SG-P02-T00-FUNDRAISING-EVENTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SG_P02_T00_FUNDRAISING_EVENTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_CASH_TOT
## DESCRIPTION:  Cash prizes; total
## LOCATION:  SCHED-G-PART-02-LINE-04-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/CashPrizesTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/CashPrizesTotalEvents'
V3 <- '//Return/ReturnData/IRS990ScheduleG/FundraisingEventInformationGrp/CashPrizesTotalEventsAmt'
V_FUNDR_EVNT_EXP_CASH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_02_FUNDR_EVNT_EXP_CASH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_EXP_CASH_TOT ) )
if( length( SG_02_FUNDR_EVNT_EXP_CASH_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_CASH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_CASH_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_CASH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_REV_CONTR_TOT
## DESCRIPTION:  Charitable contributions; total
## LOCATION:  SCHED-G-PART-02-LINE-02-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/CharitableContributionsTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/CharitableContributionsTotal'
V_FUNDR_EVNT_REV_CONTR_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_REV_CONTR_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_REV_CONTR_TOT ) )
if( length( SG_02_FUNDR_EVNT_REV_CONTR_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_REV_CONTR_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_REV_CONTR_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_REV_CONTR_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT
## DESCRIPTION:  Direct expense summary
## LOCATION:  SCHED-G-PART-02-LINE-10-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/DirectExpenseSummaryEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/DirectExpenseSummaryEvents'
V_FUNDR_EVNT_EXP_SUMMARY_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_EXP_SUMMARY_TOT ) )
if( length( SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_ENTMT_TOT
## DESCRIPTION:  Entertainment costs; total
## LOCATION:  SCHED-G-PART-02-LINE-08-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SG_02_FUNDR_EVNT_EXP_ENTMT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleG/EventsInformation/EntertainmentTotalEvents' ) )
if( length( SG_02_FUNDR_EVNT_EXP_ENTMT_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_ENTMT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_ENTMT_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_ENTMT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_FOOD_TOT
## DESCRIPTION:  Food and beverage costs; total
## LOCATION:  SCHED-G-PART-02-LINE-07-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SG_02_FUNDR_EVNT_EXP_FOOD_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleG/EventsInformation/FoodAndBeverageTotalEvents' ) )
if( length( SG_02_FUNDR_EVNT_EXP_FOOD_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_FOOD_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_FOOD_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_FOOD_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_REV_GRORCPT_TOT
## DESCRIPTION:  Gross receipts; total
## LOCATION:  SCHED-G-PART-02-LINE-01-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/GrossReceiptsTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/GrossReceiptsTotal'
V_FUNDR_EVNT_REV_GRORCPT_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_REV_GRORCPT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_REV_GRORCPT_TOT ) )
if( length( SG_02_FUNDR_EVNT_REV_GRORCPT_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_REV_GRORCPT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_REV_GRORCPT_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_REV_GRORCPT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_REV_GRO_TOT
## DESCRIPTION:  Gross revenue; total
## LOCATION:  SCHED-G-PART-02-LINE-03-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/GrossRevenueTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/GrossRevenueTotalEvents'
V_FUNDR_EVNT_REV_GRO_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_REV_GRO_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_REV_GRO_TOT ) )
if( length( SG_02_FUNDR_EVNT_REV_GRO_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_REV_GRO_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_REV_GRO_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_REV_GRO_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_NET_INCOME_TOT
## DESCRIPTION:  Net income summary
## LOCATION:  SCHED-G-PART-02-LINE-11-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/NetIncomeSummary'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/NetIncomeSummary'
V_FUNDR_EVNT_NET_INCOME_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_NET_INCOME_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_NET_INCOME_TOT ) )
if( length( SG_02_FUNDR_EVNT_NET_INCOME_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_NET_INCOME_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_NET_INCOME_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_NET_INCOME_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_NONCSH_TOT
## DESCRIPTION:  Non-cash prizes; total
## LOCATION:  SCHED-G-PART-02-LINE-05-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/NonCashPrizesTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/NonCashPrizesTotalEvents'
V_FUNDR_EVNT_EXP_NONCSH_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_EXP_NONCSH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_EXP_NONCSH_TOT ) )
if( length( SG_02_FUNDR_EVNT_EXP_NONCSH_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_NONCSH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_NONCSH_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_NONCSH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_OTH_TOT
## DESCRIPTION:  Other direct expenses; total
## LOCATION:  SCHED-G-PART-02-LINE-09-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/OtherDirectExpensesTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/OtherDirectExpensesTotalEvents'
V_FUNDR_EVNT_EXP_OTH_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_EXP_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_EXP_OTH_TOT ) )
if( length( SG_02_FUNDR_EVNT_EXP_OTH_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_OTH_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_02_FUNDR_EVNT_EXP_RENT_TOT
## DESCRIPTION:  Rent or facility costs; total
## LOCATION:  SCHED-G-PART-02-LINE-06-COL-D
## TABLE:  SG-P02-T00-FUNDRAISING-EVENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/EventsInformation/RentFacilityCostsTotalEvents'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartII/EventsInformation/RentFacilityCostsTotalEvents'
V_FUNDR_EVNT_EXP_RENT_TOT <- paste( V1, V2 , sep='|' )
SG_02_FUNDR_EVNT_EXP_RENT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FUNDR_EVNT_EXP_RENT_TOT ) )
if( length( SG_02_FUNDR_EVNT_EXP_RENT_TOT ) > 1 )
{ 
  create_record( varname=SG_02_FUNDR_EVNT_EXP_RENT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_02_FUNDR_EVNT_EXP_RENT_TOT <-  paste0( '{', SG_02_FUNDR_EVNT_EXP_RENT_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SG_02_FUNDR_EVNT_EXP_CASH_TOT,SG_02_FUNDR_EVNT_REV_CONTR_TOT,SG_02_FUNDR_EVNT_EXP_SUMMARY_TOT,SG_02_FUNDR_EVNT_EXP_ENTMT_TOT,SG_02_FUNDR_EVNT_EXP_FOOD_TOT,SG_02_FUNDR_EVNT_REV_GRORCPT_TOT,SG_02_FUNDR_EVNT_REV_GRO_TOT,SG_02_FUNDR_EVNT_NET_INCOME_TOT,SG_02_FUNDR_EVNT_EXP_NONCSH_TOT,SG_02_FUNDR_EVNT_EXP_OTH_TOT,SG_02_FUNDR_EVNT_EXP_RENT_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


