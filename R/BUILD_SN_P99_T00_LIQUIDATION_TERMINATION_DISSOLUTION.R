#' @title 
#'   Build table SN-P99-T00-LIQUIDATION-TERMINATION-DISSOLUTION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SN_P99_T00_LIQUIDATION_TERMINATION_DISSOLUTION <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SN_99_ORG_DATE_LETTER
## DESCRIPTION:  Date of letter (see SN-FORM-VERSION-2009-PART-01)
## LOCATION:  SCHED-N-PART-99-LINE-04B
## TABLE:  SN-P99-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/DateOfLetter'
V2 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/DateOfLetter'
V_ORG_DATE_LETTER <- paste( V1, V2 , sep='|' )
SN_99_ORG_DATE_LETTER <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DATE_LETTER ) )
if( length( SN_99_ORG_DATE_LETTER ) > 1 )
{ 
  log_collapsed_record( varname=SN_99_ORG_DATE_LETTER, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_99_ORG_DATE_LETTER <-  paste0( '{', SN_99_ORG_DATE_LETTER, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SN_99_ORG_DETERMIN_LETTER_X
## DESCRIPTION:  Did the organization request or receive a determination letter from EO Determinations that the organization's exempt status was terminated? (see SN-FORM-VERSION-2009-PART-01)
## LOCATION:  SCHED-N-PART-99-LINE-04A
## TABLE:  SN-P99-T00-LIQUIDATION-TERMINATION-DISSOLUTION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleN/DeterminationLetter'
V2 <- '//Return/ReturnData/IRS990ScheduleN/Form990ScheduleNPartI/DeterminationLetter'
V_ORG_DETERMIN_LETTER_X <- paste( V1, V2 , sep='|' )
SN_99_ORG_DETERMIN_LETTER_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_DETERMIN_LETTER_X ) )
if( length( SN_99_ORG_DETERMIN_LETTER_X ) > 1 )
{ 
  log_collapsed_record( varname=SN_99_ORG_DETERMIN_LETTER_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SN_99_ORG_DETERMIN_LETTER_X <-  paste0( '{', SN_99_ORG_DETERMIN_LETTER_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SN_99_ORG_DATE_LETTER,SN_99_ORG_DETERMIN_LETTER_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


