#' @title 
#'   Build table SI-P01-T00-GRANTS-INFO
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SI_P01_T00_GRANTS_INFO <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SI_01_GRANT_RECORD_MAINT_X
## DESCRIPTION:  Does the organization maintain records to substantiate the amount of the grants or assistance; the grantees' eligibility for the grants or assistance; and the selection criteria used to award the grants or assistance?
## LOCATION:  SCHED-I-PART-01-LINE-01
## TABLE:  SI-P01-T00-GRANTS-INFO
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleI/Form990ScheduleIPartI/RecordsMaintained'
V2 <- '//Return/ReturnData/IRS990ScheduleI/GrantRecordsMaintainedInd'
V3 <- '//Return/ReturnData/IRS990ScheduleI/RecordsMaintained'
V_GRANT_RECORD_MAINT_X <- paste( V1, V2, V3 , sep='|' )
SI_01_GRANT_RECORD_MAINT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_RECORD_MAINT_X ) )
if( length( SI_01_GRANT_RECORD_MAINT_X ) > 1 )
{ 
  create_record( varname=SI_01_GRANT_RECORD_MAINT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SI_01_GRANT_RECORD_MAINT_X <-  paste0( '{', SI_01_GRANT_RECORD_MAINT_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SI_01_GRANT_RECORD_MAINT_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


