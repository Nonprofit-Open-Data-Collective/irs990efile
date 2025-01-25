#' @title 
#'   Build table F9-P03-T00-PROGRAMS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P03_T00_PROGRAMS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_03_PROG_EXP_OTH_TOT
## DESCRIPTION:  Total of other program service expense
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/TotalOfOtherProgramServiceExp'
V2 <- '//Return/ReturnData/IRS990/TotalOfOtherProgramServiceExp'
V3 <- '//Return/ReturnData/IRS990/TotalOtherProgSrvcExpenseAmt'
V_PROG_EXP_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_EXP_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_EXP_OTH_TOT ) )
if( length( F9_03_PROG_EXP_OTH_TOT ) > 1 )
{ 
  create_record( varname=F9_03_PROG_EXP_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_EXP_OTH_TOT <-  paste0( '{', F9_03_PROG_EXP_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_GRANT_OTH_TOT
## DESCRIPTION:  Total of other program service grants
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/TotalOfOtherProgramServiceGrnt'
V2 <- '//Return/ReturnData/IRS990/TotalOfOtherProgramServiceGrnt'
V3 <- '//Return/ReturnData/IRS990/TotalOtherProgSrvcGrantAmt'
V_PROG_GRANT_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_GRANT_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_GRANT_OTH_TOT ) )
if( length( F9_03_PROG_GRANT_OTH_TOT ) > 1 )
{ 
  create_record( varname=F9_03_PROG_GRANT_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_GRANT_OTH_TOT <-  paste0( '{', F9_03_PROG_GRANT_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_REV_OTH_TOT
## DESCRIPTION:  Total of other program service revenue
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/TotalOfOtherProgramServiceRev'
V2 <- '//Return/ReturnData/IRS990/TotalOfOtherProgramServiceRev'
V3 <- '//Return/ReturnData/IRS990/TotalOtherProgSrvcRevenueAmt'
V_PROG_REV_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_REV_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_REV_OTH_TOT ) )
if( length( F9_03_PROG_REV_OTH_TOT ) > 1 )
{ 
  create_record( varname=F9_03_PROG_REV_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_REV_OTH_TOT <-  paste0( '{', F9_03_PROG_REV_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_EXP_TOT
## DESCRIPTION:  Total program service expense
## LOCATION:  F990-PC-PART-03-LINE-04E
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/TotalProgramServiceExpense'
V2 <- '//Return/ReturnData/IRS990/TotalProgramServiceExpense'
V3 <- '//Return/ReturnData/IRS990/TotalProgramServiceExpensesAmt'
V4 <- '//Return/ReturnData/IRS990/TotalProgramServicesExpenses'
V5 <- '//Return/ReturnData/IRS990EZ/TotalProgramServiceExpenses'
V6 <- '//Return/ReturnData/IRS990EZ/TotalProgramServiceExpensesAmt'
V_PROG_EXP_TOT <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_03_PROG_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_EXP_TOT ) )
if( length( F9_03_PROG_EXP_TOT ) > 1 )
{ 
  create_record( varname=F9_03_PROG_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_EXP_TOT <-  paste0( '{', F9_03_PROG_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_INFO_SCHED_O_X
## DESCRIPTION:  Was Schedule O used to respond to any part of Part III?
## LOCATION:  F990-PC-PART-03-LINE-00
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIII'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIIIInd'
V3 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIII'
V4 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIIIInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_03_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_03_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_03_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_INFO_SCHED_O_X <-  paste0( '{', F9_03_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_03_PROG_EXP_OTH_TOT,F9_03_PROG_GRANT_OTH_TOT,F9_03_PROG_REV_OTH_TOT,F9_03_PROG_EXP_TOT,F9_03_INFO_SCHED_O_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


