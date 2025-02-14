#' @title 
#'   Build table SF-P04-T00-FRGN-INTERESTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SF_P04_T00_FRGN_INTERESTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SF_04_BOYCOTTING_CNTR_ACT_X
## DESCRIPTION:  Did the organization have any operations in or related to any boycotting countries during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-06
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/BoycottCountries'
V2 <- '//Return/ReturnData/IRS990ScheduleF/BoycottCountriesInd'
V_BOYCOTTING_CNTR_ACT_X <- paste( V1, V2 , sep='|' )
SF_04_BOYCOTTING_CNTR_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BOYCOTTING_CNTR_ACT_X ) )
if( length( SF_04_BOYCOTTING_CNTR_ACT_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_04_BOYCOTTING_CNTR_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_04_BOYCOTTING_CNTR_ACT_X <-  paste0( '{', SF_04_BOYCOTTING_CNTR_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_04_FRGN_CORP_OWNERSHIP_INT_X
## DESCRIPTION:  Did the organization have an ownership interest in a foreign corporation during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-03
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ForeignCorpOwnershipInd'
V2 <- '//Return/ReturnData/IRS990ScheduleF/OwnForeignCorp'
V_FRGN_CORP_OWNERSHIP_INT_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_CORP_OWNERSHIP_INT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_CORP_OWNERSHIP_INT_X ) )
if( length( SF_04_FRGN_CORP_OWNERSHIP_INT_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_04_FRGN_CORP_OWNERSHIP_INT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_04_FRGN_CORP_OWNERSHIP_INT_X <-  paste0( '{', SF_04_FRGN_CORP_OWNERSHIP_INT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_04_FRGN_PTR_OWNERSHIP_INT_X
## DESCRIPTION:  Did the organization have an ownership interest in a foreign partnership during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-05
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/ForeignPartnership'
V2 <- '//Return/ReturnData/IRS990ScheduleF/ForeignPartnershipInd'
V_FRGN_PTR_OWNERSHIP_INT_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_PTR_OWNERSHIP_INT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_PTR_OWNERSHIP_INT_X ) )
if( length( SF_04_FRGN_PTR_OWNERSHIP_INT_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_04_FRGN_PTR_OWNERSHIP_INT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_04_FRGN_PTR_OWNERSHIP_INT_X <-  paste0( '{', SF_04_FRGN_PTR_OWNERSHIP_INT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_04_FRGN_TRUST_INT_X
## DESCRIPTION:  Did the organization have an interest in a foreign trust during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-02
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/InterestInForeignTrust'
V2 <- '//Return/ReturnData/IRS990ScheduleF/InterestInForeignTrustInd'
V_FRGN_TRUST_INT_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_TRUST_INT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_TRUST_INT_X ) )
if( length( SF_04_FRGN_TRUST_INT_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_04_FRGN_TRUST_INT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_04_FRGN_TRUST_INT_X <-  paste0( '{', SF_04_FRGN_TRUST_INT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_04_FRGN_FUND_SHAREHOLDER_X
## DESCRIPTION:  Was the organization a direct or indirect shareholder of a passive foreign investment company or a qualified electing fund during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-04
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/PassiveForeignInvestCo'
V2 <- '//Return/ReturnData/IRS990ScheduleF/PassiveForeignInvestmestCoInd'
V_FRGN_FUND_SHAREHOLDER_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_FUND_SHAREHOLDER_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_FUND_SHAREHOLDER_X ) )
if( length( SF_04_FRGN_FUND_SHAREHOLDER_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_04_FRGN_FUND_SHAREHOLDER_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_04_FRGN_FUND_SHAREHOLDER_X <-  paste0( '{', SF_04_FRGN_FUND_SHAREHOLDER_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SF_04_FRGN_CORP_TRANSFEROR_X
## DESCRIPTION:  Was the organization a U.S. transferor of property to a foreign corporation during the tax year?
## LOCATION:  SCHED-F-PART-04-LINE-01
## TABLE:  SF-P04-T00-FRGN-INTERESTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleF/TransferToForeignCorp'
V2 <- '//Return/ReturnData/IRS990ScheduleF/TransferToForeignCorpInd'
V_FRGN_CORP_TRANSFEROR_X <- paste( V1, V2 , sep='|' )
SF_04_FRGN_CORP_TRANSFEROR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FRGN_CORP_TRANSFEROR_X ) )
if( length( SF_04_FRGN_CORP_TRANSFEROR_X ) > 1 )
{ 
  log_collapsed_record( varname=SF_04_FRGN_CORP_TRANSFEROR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SF_04_FRGN_CORP_TRANSFEROR_X <-  paste0( '{', SF_04_FRGN_CORP_TRANSFEROR_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SF_04_BOYCOTTING_CNTR_ACT_X,SF_04_FRGN_CORP_OWNERSHIP_INT_X,SF_04_FRGN_PTR_OWNERSHIP_INT_X,SF_04_FRGN_TRUST_INT_X,SF_04_FRGN_FUND_SHAREHOLDER_X,SF_04_FRGN_CORP_TRANSFEROR_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


