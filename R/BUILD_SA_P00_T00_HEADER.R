#' @title 
#'   Build table SA-P00-T00-HEADER
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P00_T00_HEADER <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SA_00_NAME_ORG_L1
## DESCRIPTION:  Name Of Organization - BusinessNameLine1
## LOCATION:  SCHED-A-PART-00
## TABLE:  SA-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

SA_00_NAME_ORG_L1 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/RelationshipSchedule/NameOfOrganization/BusinessNameLine1' ) )
if( length( SA_00_NAME_ORG_L1 ) > 1 )
{ 
  log_collapsed_record( varname=SA_00_NAME_ORG_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_00_NAME_ORG_L1 <-  paste0( '{', SA_00_NAME_ORG_L1, '}', collapse=';' ) 
} 




var.list <- 
namedList(SA_00_NAME_ORG_L1)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


