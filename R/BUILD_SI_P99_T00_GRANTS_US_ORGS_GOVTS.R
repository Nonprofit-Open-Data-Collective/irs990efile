#' @title 
#'   Build table SI-P99-T00-GRANTS-US-ORGS-GOVTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SI_P99_T00_GRANTS_US_ORGS_GOVTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SI_99_GRANT_US_ORG_LT_5K_X
## DESCRIPTION:  Check this box if no one recipient received more than $5;000 (see SI-FORM-VERSION-2011-PART-02)
## LOCATION:  SCHED-I-PART-99-LINE-00
## TABLE:  SI-P99-T00-GRANTS-US-ORGS-GOVTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleI/Form990ScheduleIPartII/NoGrantMoreThan5000'
V2 <- '//Return/ReturnData/IRS990ScheduleI/NoGrantMoreThan5000'
V_GRANT_US_ORG_LT_5K_X <- paste( V1, V2 , sep='|' )
SI_99_GRANT_US_ORG_LT_5K_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_US_ORG_LT_5K_X ) )
if( length( SI_99_GRANT_US_ORG_LT_5K_X ) > 1 )
{ 
  create_record( varname=SI_99_GRANT_US_ORG_LT_5K_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SI_99_GRANT_US_ORG_LT_5K_X <-  paste0( '{', SI_99_GRANT_US_ORG_LT_5K_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SI_99_GRANT_US_ORG_LT_5K_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


