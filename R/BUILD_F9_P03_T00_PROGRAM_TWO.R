#' @title 
#'   Build table F9-P03-T00-PROGRAM-TWO
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P03_T00_PROGRAM_TWO <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_03_PROG_CODE
## DESCRIPTION:  Activity2 - Activity code
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAM-TWO
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Activity2/ActivityCode'
V2 <- '//Return/ReturnData/IRS990/Form990PartIII/Activity2/ActivityCode'
V3 <- '//Return/ReturnData/IRS990/ProgSrvcAccomActy2Grp/ActivityCd'
V_PROG_CODE <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_CODE <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_CODE ) )
if( length( F9_03_PROG_CODE ) > 1 )
{ 
  create_record( varname=F9_03_PROG_CODE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_CODE <-  paste0( '{', F9_03_PROG_CODE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_DESC
## DESCRIPTION:  Program Accomplishment Description
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAM-TWO
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Activity2/Description'
V2 <- '//Return/ReturnData/IRS990/Form990PartIII/Activity2/Description'
V3 <- '//Return/ReturnData/IRS990/ProgSrvcAccomActy2Grp/Desc'
V4 <- '//Return/ReturnData/IRS990EZ/ProgSrvcAccomActy2Grp/Desc'
V_PROG_DESC <- paste( V1, V2, V3, V4 , sep='|' )
F9_03_PROG_DESC <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_DESC ) )
if( length( F9_03_PROG_DESC ) > 1 )
{ 
  create_record( varname=F9_03_PROG_DESC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_DESC <-  paste0( '{', F9_03_PROG_DESC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_EXP
## DESCRIPTION:  Program Accomplishment Expenses
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAM-TWO
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Activity2/Expense'
V2 <- '//Return/ReturnData/IRS990/Form990PartIII/Activity2/Expense'
V3 <- '//Return/ReturnData/IRS990/ProgSrvcAccomActy2Grp/ExpenseAmt'
V_PROG_EXP <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_EXP ) )
if( length( F9_03_PROG_EXP ) > 1 )
{ 
  create_record( varname=F9_03_PROG_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_EXP <-  paste0( '{', F9_03_PROG_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_GRANT
## DESCRIPTION:  Program Accomplishment Grants
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAM-TWO
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Activity2/Grants'
V2 <- '//Return/ReturnData/IRS990/Form990PartIII/Activity2/Grants'
V3 <- '//Return/ReturnData/IRS990/ProgSrvcAccomActy2Grp/GrantAmt'
V4 <- '//Return/ReturnData/IRS990EZ/ProgSrvcAccomActy2Grp/GrantAmt'
V_PROG_GRANT <- paste( V1, V2, V3, V4 , sep='|' )
F9_03_PROG_GRANT <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_GRANT ) )
if( length( F9_03_PROG_GRANT ) > 1 )
{ 
  create_record( varname=F9_03_PROG_GRANT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_GRANT <-  paste0( '{', F9_03_PROG_GRANT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_REV
## DESCRIPTION:  Program Accomplishment Revenue
## LOCATION:  F990-PC-PART-03-LINE-04-ABCD
## TABLE:  F9-P03-T00-PROGRAM-TWO
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Activity2/Revenue'
V2 <- '//Return/ReturnData/IRS990/Form990PartIII/Activity2/Revenue'
V3 <- '//Return/ReturnData/IRS990/ProgSrvcAccomActy2Grp/RevenueAmt'
V_PROG_REV <- paste( V1, V2, V3 , sep='|' )
F9_03_PROG_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_REV ) )
if( length( F9_03_PROG_REV ) > 1 )
{ 
  create_record( varname=F9_03_PROG_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_REV <-  paste0( '{', F9_03_PROG_REV, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_03_PROG_CODE,F9_03_PROG_DESC,F9_03_PROG_EXP,F9_03_PROG_GRANT,F9_03_PROG_REV)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


