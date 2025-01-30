#' @title 
#'   Build table SI-P02-T00-GRANTS-US-ORGS-GOVTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SI_P02_T00_GRANTS_US_ORGS_GOVTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SI_02_GRANT_US_ORG_501C3_TOT
## DESCRIPTION:  Enter total number of 501(c)(3) and government organizations
## LOCATION:  SCHED-I-PART-02-LINE-02
## TABLE:  SI-P02-T00-GRANTS-US-ORGS-GOVTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleI/Form990ScheduleIPartII/TotalNbrOf501C3AndGovtGrants'
V2 <- '//Return/ReturnData/IRS990ScheduleI/Total501c3OrgCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleI/TotalNbrOf501C3AndGovtGrants'
V_GRANT_US_ORG_501C3_TOT <- paste( V1, V2, V3 , sep='|' )
SI_02_GRANT_US_ORG_501C3_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_US_ORG_501C3_TOT ) )
if( length( SI_02_GRANT_US_ORG_501C3_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SI_02_GRANT_US_ORG_501C3_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SI_02_GRANT_US_ORG_501C3_TOT <-  paste0( '{', SI_02_GRANT_US_ORG_501C3_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SI_02_GRANT_US_ORG_OTH_TOT
## DESCRIPTION:  Enter total number of other organizations
## LOCATION:  SCHED-I-PART-02-LINE-03
## TABLE:  SI-P02-T00-GRANTS-US-ORGS-GOVTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleI/Form990ScheduleIPartII/TotalNbrOfOtherOrganizations'
V2 <- '//Return/ReturnData/IRS990ScheduleI/TotalNbrOfOtherOrganizations'
V3 <- '//Return/ReturnData/IRS990ScheduleI/TotalOtherOrgCnt'
V_GRANT_US_ORG_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
SI_02_GRANT_US_ORG_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GRANT_US_ORG_OTH_TOT ) )
if( length( SI_02_GRANT_US_ORG_OTH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SI_02_GRANT_US_ORG_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SI_02_GRANT_US_ORG_OTH_TOT <-  paste0( '{', SI_02_GRANT_US_ORG_OTH_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SI_02_GRANT_US_ORG_501C3_TOT,SI_02_GRANT_US_ORG_OTH_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


