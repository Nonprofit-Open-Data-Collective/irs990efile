#' @title 
#'   Build table SF-P99-T00-FRGN-ORG-GRANTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P99_T00_FRGN_ORG_GRANTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SF_99_FRGN_ORG_GRANT_LT_5K_X
## DESCRIPTION:  Check this box if no one recipient received more than $5;000 (see SF-FORM-VERSION-2011-PART-02)
## LOCATION:  SCHED-F-PART-99-LINE-00
## TABLE:  SF-P99-T00-FRGN-ORG-GRANTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/Form990ScheduleFPartII/GrantRecordsMaintained'
V2 <- '//Return/ReturnData/IRS990ScheduleF/NoRecipientOver5K'
V_FRGN_ORG_GRANT_LT_5K_X <- paste( V1, V2 , sep='|' )
SF_99_FRGN_ORG_GRANT_LT_5K_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_ORG_GRANT_LT_5K_X ) )
if( length( SF_99_FRGN_ORG_GRANT_LT_5K_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_99_FRGN_ORG_GRANT_LT_5K_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_99_FRGN_ORG_GRANT_LT_5K_X <-  paste0( '{', SF_99_FRGN_ORG_GRANT_LT_5K_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SF_99_FRGN_ORG_GRANT_LT_5K_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


