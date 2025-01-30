#' @title 
#'   Build table SF-P02-T00-FRGN-ORG-GRANTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P02_T00_FRGN_ORG_GRANTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SF_02_FRGN_ORG_GRANT_501C3_TOT
## DESCRIPTION:  Total number of organizations with some 501(c)(3) equivalency outside of the US given grants (recognized as charities by the foreign country, recognized as tax-exempt by the IRS, or an equivalency letter has been been provided)
## LOCATION:  SCHED-F-PART-02-LINE-02
## TABLE:  SF-P02-T00-FRGN-ORG-GRANTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartII/TotalNumberOf501c3Orgs'
V2 <- '//Return/ReturnData/IRS990ScheduleF/Total501c3OrgCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalNumberOf501c3Orgs'
V_FRGN_ORG_GRANT_501C3_TOT <- paste( V1, V2, V3 , sep='|' )
SF_02_FRGN_ORG_GRANT_501C3_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_ORG_GRANT_501C3_TOT ) )
if( length( SF_02_FRGN_ORG_GRANT_501C3_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SF_02_FRGN_ORG_GRANT_501C3_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_02_FRGN_ORG_GRANT_501C3_TOT <-  paste0( '{', SF_02_FRGN_ORG_GRANT_501C3_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT
## DESCRIPTION:  Total number of organizations or entities granted to outside of the US that lack some 501(c)(3) equivalency (not recognized as charities by the foreign country, not recognized as tax-exempt by the IRS, and have not provided an equivalency letter)
## LOCATION:  SCHED-F-PART-02-LINE-03
## TABLE:  SF-P02-T00-FRGN-ORG-GRANTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartII/TotalNumberOfOtherOrgs'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TotalNumberOfOtherOrgs'
V3 <- '//Return/ReturnData/IRS990ScheduleF/TotalOtherOrgCnt'
V_FRGN_ORG_GRANT_OTH_ORG_TOT <- paste( V1, V2, V3 , sep='|' )
SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_ORG_GRANT_OTH_ORG_TOT ) )
if( length( SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT ) > 1 )
{ 
  log_collapsed_record( varname=SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT <-  paste0( '{', SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(SF_02_FRGN_ORG_GRANT_501C3_TOT,SF_02_FRGN_ORG_GRANT_OTH_ORG_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


