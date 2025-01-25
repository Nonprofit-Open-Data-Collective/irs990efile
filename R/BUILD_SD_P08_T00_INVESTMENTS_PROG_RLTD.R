#' @title 
#'   Build table SD-P08-T00-INVESTMENTS-PROG-RLTD
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P08_T00_INVESTMENTS_PROG_RLTD <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_08_INVEST_PROG_RLTD_BV_TOT
## DESCRIPTION:  Total of book value
## LOCATION:  SCHED-D-PART-08-COL-B-TOT
## TABLE:  SD-P08-T00-INVESTMENTS-PROG-RLTD
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVIII/TotalOfBookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalBookValueProgramRltdAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalOfBookValueProgramRelated'
V_INVEST_PROG_RLTD_BV_TOT <- paste( V1, V2, V3 , sep='|' )
SD_08_INVEST_PROG_RLTD_BV_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_INVEST_PROG_RLTD_BV_TOT ) )
if( length( SD_08_INVEST_PROG_RLTD_BV_TOT ) > 1 )
{ 
  create_record( varname=SD_08_INVEST_PROG_RLTD_BV_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_08_INVEST_PROG_RLTD_BV_TOT <-  paste0( '{', SD_08_INVEST_PROG_RLTD_BV_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_08_INVEST_PROG_RLTD_BV_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


