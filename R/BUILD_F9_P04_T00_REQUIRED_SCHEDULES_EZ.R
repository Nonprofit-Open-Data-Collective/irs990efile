#' @title 
#'   Build table F9-P04-T00-REQUIRED-SCHEDULES-EZ
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P04_T00_REQUIRED_SCHEDULES_EZ <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_04_FRGN_OFFICE_CNTR
## DESCRIPTION:  Name of foreign country
## LOCATION:  F990-EZ-PART-05-LINE-42C
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES-EZ
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/ForeignOfficeCountry'
V2 <- '//Return/ReturnData/IRS990EZ/ForeignOfficeCountryCd'
V_FRGN_OFFICE_CNTR <- paste( V1, V2 , sep='|' )
F9_04_FRGN_OFFICE_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_OFFICE_CNTR ) )
if( length( F9_04_FRGN_OFFICE_CNTR ) > 1 )
{ 
  log_collapsed_record( varname=F9_04_FRGN_OFFICE_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_FRGN_OFFICE_CNTR <-  paste0( '{', F9_04_FRGN_OFFICE_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_LOAN_DTK_AMT
## DESCRIPTION:  Did the organization file Form 1120-POL for this year?
## LOCATION:  F990-EZ-PART-05-LINE-38B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES-EZ
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/LoansToFromOfficers'
V2 <- '//Return/ReturnData/IRS990EZ/LoansToFromOfficersAmt'
V_LOAN_DTK_AMT <- paste( V1, V2 , sep='|' )
F9_04_LOAN_DTK_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_LOAN_DTK_AMT ) )
if( length( F9_04_LOAN_DTK_AMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_04_LOAN_DTK_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_LOAN_DTK_AMT <-  paste0( '{', F9_04_LOAN_DTK_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_04_RLTD_ORG_527_X
## DESCRIPTION:  If ""Yes;"" was the related organization(s) a section 527 organization?
## LOCATION:  F990-EZ-PART-06-LINE-49B
## TABLE:  F9-P04-T00-REQUIRED-SCHEDULES-EZ
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/RelatedOrgSect527OrgInd'
V2 <- '//Return/ReturnData/IRS990EZ/RelatedOrgSection527Org'
V_RLTD_ORG_527_X <- paste( V1, V2 , sep='|' )
F9_04_RLTD_ORG_527_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RLTD_ORG_527_X ) )
if( length( F9_04_RLTD_ORG_527_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_04_RLTD_ORG_527_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_04_RLTD_ORG_527_X <-  paste0( '{', F9_04_RLTD_ORG_527_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_04_FRGN_OFFICE_CNTR,F9_04_LOAN_DTK_AMT,F9_04_RLTD_ORG_527_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


