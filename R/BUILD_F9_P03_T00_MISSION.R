#' @title 
#'   Build table F9-P03-T00-MISSION
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P03_T00_MISSION <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_03_ORG_MISSION_PURPOSE
## DESCRIPTION:  Mission description
## LOCATION:  F990-PC-PART-03-LINE-01
## TABLE:  F9-P03-T00-MISSION
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/MissionDescription'
V2 <- '//Return/ReturnData/IRS990/MissionDesc'
V3 <- '//Return/ReturnData/IRS990/MissionDescription'
V4 <- '//Return/ReturnData/IRS990/PrimaryExemptPurpose'
V5 <- '//Return/ReturnData/IRS990EZ/MissionDesc'
V6 <- '//Return/ReturnData/IRS990EZ/MissionDescription'
V7 <- '//Return/ReturnData/IRS990EZ/PrimaryExemptPurpose'
V8 <- '//Return/ReturnData/IRS990EZ/PrimaryExemptPurposeTxt'
V_ORG_MISSION_PURPOSE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
F9_03_ORG_MISSION_PURPOSE <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_MISSION_PURPOSE ) )
if( length( F9_03_ORG_MISSION_PURPOSE ) > 1 )
{ 
  log_collapsed_record( varname=F9_03_ORG_MISSION_PURPOSE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_ORG_MISSION_PURPOSE <-  paste0( '{', F9_03_ORG_MISSION_PURPOSE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_CHANGE_X
## DESCRIPTION:  Significant change?
## LOCATION:  F990-PC-PART-03-LINE-03
## TABLE:  F9-P03-T00-MISSION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/SignificantChange'
V2 <- '//Return/ReturnData/IRS990/SignificantChange'
V3 <- '//Return/ReturnData/IRS990/SignificantChangeInd'
V_PROG_CHANGE_X <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_CHANGE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_CHANGE_X ) )
if( length( F9_03_PROG_CHANGE_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_03_PROG_CHANGE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_CHANGE_X <-  paste0( '{', F9_03_PROG_CHANGE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_NEW_X
## DESCRIPTION:  Significant new program services?
## LOCATION:  F990-PC-PART-03-LINE-02
## TABLE:  F9-P03-T00-MISSION
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIII/SignificantNewProgramServices'
V2 <- '//Return/ReturnData/IRS990/SignificantNewProgramServices'
V3 <- '//Return/ReturnData/IRS990/SignificantNewProgramSrvcInd'
V_PROG_NEW_X <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_NEW_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_NEW_X ) )
if( length( F9_03_PROG_NEW_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_03_PROG_NEW_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_NEW_X <-  paste0( '{', F9_03_PROG_NEW_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_03_ORG_MISSION_PURPOSE,F9_03_PROG_CHANGE_X,F9_03_PROG_NEW_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


