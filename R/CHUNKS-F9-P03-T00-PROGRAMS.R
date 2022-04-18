#' @title 
#'   Build table F9-P03-T00-PROGRAMS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P03_T00_PROGRAMS <- function( doc, url )
{


####----------------------------------------------------
####     KEYS
####----------------------------------------------------


## OBJECT ID

OBJECTID <- get_object_id( url )


## URL

URL <- url


## RETURN VERSION

RETURN_VERSION <- xml2::xml_attr( doc, attr='returnVersion' )


## VARIABLE NAME:  ORG_EIN
## DESCRIPTION:  Orgainization Employer Identification Number (EIN)
## LOCATION:  F990-PC-PART-00-SECTION-D
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

ORG_EIN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



## VARIABLE NAME:  ORG_NAME_L1
## DESCRIPTION:  Name of Filing Organization (line 1)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine1'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1'
V3 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt'
TEMP_ORG_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
ORG_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



## VARIABLE NAME:  ORG_NAME_L2
## DESCRIPTION:  Name of Filing Organization (line 2)
## LOCATION:  F990-PC-PART-00-SECTION-C
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine2'
V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2'
V3 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2Txt'
TEMP_ORG_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
ORG_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_TAX_YEAR ) )



######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_03_INFO_SCHED_O_X
## DESCRIPTION:  Was Schedule O used to respond to any part of Part III?
## LOCATION:  F990-EZ-PART-03-LINE-00
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIII'
V2 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIIIInd'
V3 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIII'
V4 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIIIInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4 , sep='|' )
F9_03_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_03_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_03_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_INFO_SCHED_O_X <-  paste0( '{', F9_03_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_03_PROG_EXP_TOT
## DESCRIPTION:  Total Program Service Revenue (Accomplishments Summary)
## LOCATION:  F990-EZ-PART-03-LINE-32
## TABLE:  F9-P03-T00-PROGRAMS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/TotalProgramServiceExpenses'
V2 <- '//Return/ReturnData/IRS990EZ/TotalProgramServiceExpensesAmt'
V3 <- '//Return/ReturnData/IRS990/TotalProgramServiceExpense'
V4 <- '//Return/ReturnData/IRS990/TotalProgramServiceExpensesAmt'
V5 <- '//Return/ReturnData/IRS990/Form990PartIII/TotalProgramServiceExpense'
V6 <- '//Return/ReturnData/IRS990/TotalProgramServicesExpenses'
V_PROG_EXP_TOT <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_03_PROG_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PROG_EXP_TOT ) )
if( length( F9_03_PROG_EXP_TOT ) > 1 )
{ 
  create_record( varname=F9_03_PROG_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_03_PROG_EXP_TOT <-  paste0( '{', F9_03_PROG_EXP_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_03_INFO_SCHED_O_X,F9_03_PROG_EXP_TOT)
df <- as.data.frame( var.list )


return( df )


}


