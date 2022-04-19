#' @title 
#'   Build table F9-P07-T00-DIR-TRUST-KEY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P07_T00_DIR_TRUST_KEY <- function( doc, url )
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


## VARIABLE NAME:  F9_07_COMP_KONTR_NUM_GT_100K
## DESCRIPTION:  Total number of independent contractors who received 100K+ from org
## LOCATION:  F990-PC-PART-07-SECTION-B-LINE-02
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CntrctRcvdGreaterThan100KCnt'
V2 <- '//Return/ReturnData/IRS990/Form990PartVIISectionB/NumberOfContractorsGT100K'
V3 <- '//Return/ReturnData/IRS990/NumberOfContractorsGT100K'
V4 <- '//Return/ReturnData/IRS990EZ/CntrctRcvdGreaterThan100KCnt'
V5 <- '//Return/ReturnData/IRS990EZ/TotNumCntrctPdOver100KProfSer'
V_COMP_KONTR_NUM_GT_100K <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_07_COMP_KONTR_NUM_GT_100K <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_KONTR_NUM_GT_100K ) )
if( length( F9_07_COMP_KONTR_NUM_GT_100K ) > 1 )
{ 
  create_record( varname=F9_07_COMP_KONTR_NUM_GT_100K, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_KONTR_NUM_GT_100K <-  paste0( '{', F9_07_COMP_KONTR_NUM_GT_100K, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_OTH_SOURCE_X
## DESCRIPTION:  Compensation from other sources? (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-05
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompensationFromOtherSources'
V2 <- '//Return/ReturnData/IRS990/CompensationFromOtherSrcsInd'
V3 <- '//Return/ReturnData/IRS990/Form990PartVIISectionA/CompensationFromOtherSources'
V_COMP_DTK_COMP_OTH_SOURCE_X <- paste( V1, V2, V3 , sep='|' )
F9_07_COMP_DTK_COMP_OTH_SOURCE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_COMP_OTH_SOURCE_X ) )
if( length( F9_07_COMP_DTK_COMP_OTH_SOURCE_X ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_OTH_SOURCE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_OTH_SOURCE_X <-  paste0( '{', F9_07_COMP_DTK_COMP_OTH_SOURCE_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_FORMER_LISTED_X
## DESCRIPTION:  Is a former officer, director, or trustee listed in the compensation table in Sectin A Line 1a? (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-03
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIISectionA/FormersListedIn1A'
V2 <- '//Return/ReturnData/IRS990/FormerOfcrEmployeesListedInd'
V3 <- '//Return/ReturnData/IRS990/FormersListed'
V_COMP_DTK_FORMER_LISTED_X <- paste( V1, V2, V3 , sep='|' )
F9_07_COMP_DTK_FORMER_LISTED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_FORMER_LISTED_X ) )
if( length( F9_07_COMP_DTK_FORMER_LISTED_X ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_FORMER_LISTED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_FORMER_LISTED_X <-  paste0( '{', F9_07_COMP_DTK_FORMER_LISTED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_GT_150K_X
## DESCRIPTION:  Line1a; total greater than $150K? (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-04
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIISectionA/Line1ATotalGT150K'
V2 <- '//Return/ReturnData/IRS990/TotalCompGreaterThan150KInd'
V3 <- '//Return/ReturnData/IRS990/TotalCompGT150K'
V_COMP_DTK_COMP_GT_150K_X <- paste( V1, V2, V3 , sep='|' )
F9_07_COMP_DTK_COMP_GT_150K_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_COMP_GT_150K_X ) )
if( length( F9_07_COMP_DTK_COMP_GT_150K_X ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_GT_150K_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_GT_150K_X <-  paste0( '{', F9_07_COMP_DTK_COMP_GT_150K_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_NO_LISTED_X
## DESCRIPTION:  No listed persons compensated (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01A
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIISectionA/NoListedPersonsCompensated'
V2 <- '//Return/ReturnData/IRS990/NoListedPersonsCompensated'
V3 <- '//Return/ReturnData/IRS990/NoListedPersonsCompensatedInd'
V_COMP_DTK_NO_LISTED_X <- paste( V1, V2, V3 , sep='|' )
F9_07_COMP_DTK_NO_LISTED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_NO_LISTED_X ) )
if( length( F9_07_COMP_DTK_NO_LISTED_X ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_NO_LISTED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_NO_LISTED_X <-  paste0( '{', F9_07_COMP_DTK_NO_LISTED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_NUM_GT_100K
## DESCRIPTION:  Number individuals greater than $100K (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-02
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartVIISectionA/NumberIndividualsGT100K'
V2 <- '//Return/ReturnData/IRS990/IndivRcvdGreaterThan100KCnt'
V3 <- '//Return/ReturnData/IRS990/NumberIndividualsGT100K'
V_COMP_DTK_NUM_GT_100K <- paste( V1, V2, V3 , sep='|' )
F9_07_COMP_DTK_NUM_GT_100K <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_NUM_GT_100K ) )
if( length( F9_07_COMP_DTK_NUM_GT_100K ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_NUM_GT_100K, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_NUM_GT_100K <-  paste0( '{', F9_07_COMP_DTK_NUM_GT_100K, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_ORG_SUBTOT
## DESCRIPTION:  Total; column D (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01B-COL-D
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

F9_07_COMP_DTK_COMP_ORG_SUBTOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990/Form990PartVIISectionA/TotalColumnD' ) )
if( length( F9_07_COMP_DTK_COMP_ORG_SUBTOT ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_ORG_SUBTOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_ORG_SUBTOT <-  paste0( '{', F9_07_COMP_DTK_COMP_ORG_SUBTOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_RLTD_SUBTOT
## DESCRIPTION:  Total; column E (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01B-COL-E
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

F9_07_COMP_DTK_COMP_RLTD_SUBTOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990/Form990PartVIISectionA/TotalColumnE' ) )
if( length( F9_07_COMP_DTK_COMP_RLTD_SUBTOT ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_RLTD_SUBTOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_RLTD_SUBTOT <-  paste0( '{', F9_07_COMP_DTK_COMP_RLTD_SUBTOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_OTH_SUBTOT
## DESCRIPTION:  Total; column F (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01B-COL-F
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

F9_07_COMP_DTK_COMP_OTH_SUBTOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990/Form990PartVIISectionA/TotalColumnF' ) )
if( length( F9_07_COMP_DTK_COMP_OTH_SUBTOT ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_OTH_SUBTOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_OTH_SUBTOT <-  paste0( '{', F9_07_COMP_DTK_COMP_OTH_SUBTOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part VII
## LOCATION:  F990-PC-PART-07-LINE-00
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVII'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartVIIInd'
V3 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIV'
V4 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartIVInd'
V5 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartVII'
V6 <- '//Return/ReturnData/IRS990EZ/InfoInScheduleOPartVIIInd'
V_INFO_SCHED_O_X <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_07_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_07_INFO_SCHED_O_X ) > 1 )
{ 
  create_record( varname=F9_07_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_INFO_SCHED_O_X <-  paste0( '{', F9_07_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_OTH_TOT
## DESCRIPTION:  Total, column F (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01D-COL-F
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/TotalOtherCompensation'
V2 <- '//Return/ReturnData/IRS990/TotalOtherCompensationAmt'
V_COMP_DTK_COMP_OTH_TOT <- paste( V1, V2 , sep='|' )
F9_07_COMP_DTK_COMP_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_COMP_OTH_TOT ) )
if( length( F9_07_COMP_DTK_COMP_OTH_TOT ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_OTH_TOT <-  paste0( '{', F9_07_COMP_DTK_COMP_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_RLTD_TOT
## DESCRIPTION:  Total, column E (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01D-COL-E
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/TotalReportableCompFrmRltdOrgs'
V2 <- '//Return/ReturnData/IRS990/TotReportableCompRltdOrgAmt'
V_COMP_DTK_COMP_RLTD_TOT <- paste( V1, V2 , sep='|' )
F9_07_COMP_DTK_COMP_RLTD_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_COMP_RLTD_TOT ) )
if( length( F9_07_COMP_DTK_COMP_RLTD_TOT ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_RLTD_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_RLTD_TOT <-  paste0( '{', F9_07_COMP_DTK_COMP_RLTD_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_COMP_ORG_TOT
## DESCRIPTION:  Total, column D (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-PC-PART-07-SECTION-A-LINE-01D-COL-D
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/TotalReportableCompFromOrg'
V2 <- '//Return/ReturnData/IRS990/TotalReportableCompFromOrgAmt'
V_COMP_DTK_COMP_ORG_TOT <- paste( V1, V2 , sep='|' )
F9_07_COMP_DTK_COMP_ORG_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_COMP_ORG_TOT ) )
if( length( F9_07_COMP_DTK_COMP_ORG_TOT ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_COMP_ORG_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_COMP_ORG_TOT <-  paste0( '{', F9_07_COMP_DTK_COMP_ORG_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_SCHED_A_FILED_X
## DESCRIPTION:  Did the organization complete Schedule A?
## LOCATION:  F990-EZ-PART-06-LINE-52
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/FiledScheduleA'
V2 <- '//Return/ReturnData/IRS990EZ/FiledScheduleAInd'
V_SCHED_A_FILED_X <- paste( V1, V2 , sep='|' )
F9_07_SCHED_A_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SCHED_A_FILED_X ) )
if( length( F9_07_SCHED_A_FILED_X ) > 1 )
{ 
  create_record( varname=F9_07_SCHED_A_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_SCHED_A_FILED_X <-  paste0( '{', F9_07_SCHED_A_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_07_COMP_DTK_NUM_GT_100K_HCE
## DESCRIPTION:  Total number of other employees paid over $100;000 (F990-PC-PART-07-SECTION-A: F990-EZ-PART-04-PART-06-LINE-50-CONBINED)
## LOCATION:  F990-EZ-PART-06-LINE-50F
## TABLE:  F9-P07-T00-DIR-TRUST-KEY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/OtherEmployeePaidOver100kCnt'
V2 <- '//Return/ReturnData/IRS990EZ/TotNumberOfOthEmplPaidOver100k'
V_COMP_DTK_NUM_GT_100K_HCE <- paste( V1, V2 , sep='|' )
F9_07_COMP_DTK_NUM_GT_100K_HCE <- xml2::xml_text( xml2::xml_find_all( doc, V_COMP_DTK_NUM_GT_100K_HCE ) )
if( length( F9_07_COMP_DTK_NUM_GT_100K_HCE ) > 1 )
{ 
  create_record( varname=F9_07_COMP_DTK_NUM_GT_100K_HCE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_07_COMP_DTK_NUM_GT_100K_HCE <-  paste0( '{', F9_07_COMP_DTK_NUM_GT_100K_HCE, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_07_COMP_KONTR_NUM_GT_100K,F9_07_COMP_DTK_COMP_OTH_SOURCE_X,F9_07_COMP_DTK_FORMER_LISTED_X,F9_07_COMP_DTK_COMP_GT_150K_X,F9_07_COMP_DTK_NO_LISTED_X,F9_07_COMP_DTK_NUM_GT_100K,F9_07_COMP_DTK_COMP_ORG_SUBTOT,F9_07_COMP_DTK_COMP_RLTD_SUBTOT,F9_07_COMP_DTK_COMP_OTH_SUBTOT,F9_07_INFO_SCHED_O_X,F9_07_COMP_DTK_COMP_OTH_TOT,F9_07_COMP_DTK_COMP_RLTD_TOT,F9_07_COMP_DTK_COMP_ORG_TOT,F9_07_SCHED_A_FILED_X,F9_07_COMP_DTK_NUM_GT_100K_HCE)
df <- as.data.frame( var.list )


return( df )


}


