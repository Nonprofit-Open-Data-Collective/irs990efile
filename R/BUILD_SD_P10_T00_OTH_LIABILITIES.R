#' @title 
#'   Build table SD-P10-T00-OTH-LIABILITIES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P10_T00_OTH_LIABILITIES <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_10_LIAB_FED_INCOME_TAX_BV
## DESCRIPTION:  Federal income tax liability
## LOCATION:  SCHED-D-PART-10-LINE-01-COL-B-(01)
## TABLE:  SD-P10-T00-OTH-LIABILITIES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/FederalIncomeTaxLiability'
V2 <- '//Return/ReturnData/IRS990ScheduleD/FederalIncomeTaxLiabilityAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartX/FederalIncomeTaxLiability'
V_LIAB_FED_INCOME_TAX_BV <- paste( V1, V2, V3 , sep='|' )
SD_10_LIAB_FED_INCOME_TAX_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_FED_INCOME_TAX_BV ) )
if( length( SD_10_LIAB_FED_INCOME_TAX_BV ) > 1 )
{ 
  create_record( varname=SD_10_LIAB_FED_INCOME_TAX_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_10_LIAB_FED_INCOME_TAX_BV <-  paste0( '{', SD_10_LIAB_FED_INCOME_TAX_BV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_10_LIAB_FOOTNOTE_PART_08_X
## DESCRIPTION:  Part XIII contains the text of the footnote for Part X; Line 2
## LOCATION:  SCHED-D-PART-10-LINE-02
## TABLE:  SD-P10-T00-OTH-LIABILITIES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/FootnoteInPartXIII'
V2 <- '//Return/ReturnData/IRS990ScheduleD/FootnoteTextInd'
V_LIAB_FOOTNOTE_PART_08_X <- paste( V1, V2 , sep='|' )
SD_10_LIAB_FOOTNOTE_PART_08_X <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_FOOTNOTE_PART_08_X ) )
if( length( SD_10_LIAB_FOOTNOTE_PART_08_X ) > 1 )
{ 
  create_record( varname=SD_10_LIAB_FOOTNOTE_PART_08_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_10_LIAB_FOOTNOTE_PART_08_X <-  paste0( '{', SD_10_LIAB_FOOTNOTE_PART_08_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_10_LIAB_TOT_BV
## DESCRIPTION:  Total of liability amounts
## LOCATION:  SCHED-D-PART-10-LINE-01-COL-B-TOT
## TABLE:  SD-P10-T00-OTH-LIABILITIES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartX/TotalOfAmounts'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalLiabilityAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalOfAmounts'
V_LIAB_TOT_BV <- paste( V1, V2, V3 , sep='|' )
SD_10_LIAB_TOT_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_LIAB_TOT_BV ) )
if( length( SD_10_LIAB_TOT_BV ) > 1 )
{ 
  create_record( varname=SD_10_LIAB_TOT_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_10_LIAB_TOT_BV <-  paste0( '{', SD_10_LIAB_TOT_BV, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_10_LIAB_FED_INCOME_TAX_BV,SD_10_LIAB_FOOTNOTE_PART_08_X,SD_10_LIAB_TOT_BV)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


