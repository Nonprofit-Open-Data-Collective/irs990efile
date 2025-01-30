#' @title 
#'   Build table SL-P02-T00-LOANS-INTERESTED-PERS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SL_P02_T00_LOANS_INTERESTED_PERS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SL_02_LOAN_BALANCE_DUE_TOT
## DESCRIPTION:  Total balance due
## LOCATION:  SCHED-L-PART-02-COL-F-TOT
## TABLE:  SL-P02-T00-LOANS-INTERESTED-PERS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleL/Form990ScheduleLPartII/TotalBalanceDue'
V2 <- '//Return/ReturnData/IRS990ScheduleL/TotalBalanceDue'
V3 <- '//Return/ReturnData/IRS990ScheduleL/TotalBalanceDueAmt'
V_LOAN_BALANCE_DUE_TOT <- paste( V1, V2, V3 , sep='|' )
SL_02_LOAN_BALANCE_DUE_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOAN_BALANCE_DUE_TOT ) )
if( length( SL_02_LOAN_BALANCE_DUE_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SL_02_LOAN_BALANCE_DUE_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SL_02_LOAN_BALANCE_DUE_TOT <-  paste0( '{', SL_02_LOAN_BALANCE_DUE_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SL_02_LOAN_BALANCE_DUE_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


