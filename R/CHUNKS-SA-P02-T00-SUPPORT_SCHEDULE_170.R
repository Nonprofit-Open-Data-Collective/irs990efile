#' @title 
#'   Build table SA-P02-T00-SUPPORT_SCHEDULE_170
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P02_T00_SUPPORT_SCHEDULE_170 <- function( doc, url )
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


## VARIABLE NAME:  SA_02_PUB_GIFT_GRANT_CONTR_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-01-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GiftsGrantsContribReceived/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived170/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus4YearsAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_GIFT_GRANT_CONTR_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M4 ) )
if( length( SA_02_PUB_GIFT_GRANT_CONTR_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_GIFT_GRANT_CONTR_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_GIFT_GRANT_CONTR_CY_M4 <-  paste0( '{', SA_02_PUB_GIFT_GRANT_CONTR_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_GIFT_GRANT_CONTR_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-01-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GiftsGrantsContribReceived/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived170/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus3YearsAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_GIFT_GRANT_CONTR_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M3 ) )
if( length( SA_02_PUB_GIFT_GRANT_CONTR_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_GIFT_GRANT_CONTR_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_GIFT_GRANT_CONTR_CY_M3 <-  paste0( '{', SA_02_PUB_GIFT_GRANT_CONTR_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_GIFT_GRANT_CONTR_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-01-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GiftsGrantsContribReceived/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived170/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus2YearsAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_GIFT_GRANT_CONTR_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M2 ) )
if( length( SA_02_PUB_GIFT_GRANT_CONTR_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_GIFT_GRANT_CONTR_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_GIFT_GRANT_CONTR_CY_M2 <-  paste0( '{', SA_02_PUB_GIFT_GRANT_CONTR_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_GIFT_GRANT_CONTR_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-01-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GiftsGrantsContribReceived/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived170/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContriRcvd170Grp/CurrentTaxYearMinus1YearAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_GIFT_GRANT_CONTR_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M1 ) )
if( length( SA_02_PUB_GIFT_GRANT_CONTR_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_GIFT_GRANT_CONTR_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_GIFT_GRANT_CONTR_CY_M1 <-  paste0( '{', SA_02_PUB_GIFT_GRANT_CONTR_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_GIFT_GRANT_CONTR_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-01-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GiftsGrantsContribReceived/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived170/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContriRcvd170Grp/CurrentTaxYearAmt'
V_PUB_GIFT_GRANT_CONTR_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_GIFT_GRANT_CONTR_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY ) )
if( length( SA_02_PUB_GIFT_GRANT_CONTR_CY ) > 1 )
{ 
  create_record( varname=SA_02_PUB_GIFT_GRANT_CONTR_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_GIFT_GRANT_CONTR_CY <-  paste0( '{', SA_02_PUB_GIFT_GRANT_CONTR_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_GIFT_GRANT_CONTR_TOT
## DESCRIPTION:  Gifts Grants Contri Rcvd170 Grp - Total
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-01-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContriRcvd170Grp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GiftsGrantsContribReceived/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived170/Total'
V_PUB_GIFT_GRANT_CONTR_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_GIFT_GRANT_CONTR_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_TOT ) )
if( length( SA_02_PUB_GIFT_GRANT_CONTR_TOT ) > 1 )
{ 
  create_record( varname=SA_02_PUB_GIFT_GRANT_CONTR_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_GIFT_GRANT_CONTR_TOT <-  paste0( '{', SA_02_PUB_GIFT_GRANT_CONTR_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TAXREV_LEVIED_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-02-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus4YearsAmt'
V_PUB_TAXREV_LEVIED_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TAXREV_LEVIED_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M4 ) )
if( length( SA_02_PUB_TAXREV_LEVIED_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TAXREV_LEVIED_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TAXREV_LEVIED_CY_M4 <-  paste0( '{', SA_02_PUB_TAXREV_LEVIED_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TAXREV_LEVIED_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-02-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus3YearsAmt'
V_PUB_TAXREV_LEVIED_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TAXREV_LEVIED_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M3 ) )
if( length( SA_02_PUB_TAXREV_LEVIED_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TAXREV_LEVIED_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TAXREV_LEVIED_CY_M3 <-  paste0( '{', SA_02_PUB_TAXREV_LEVIED_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TAXREV_LEVIED_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-02-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus2YearsAmt'
V_PUB_TAXREV_LEVIED_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TAXREV_LEVIED_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M2 ) )
if( length( SA_02_PUB_TAXREV_LEVIED_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TAXREV_LEVIED_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TAXREV_LEVIED_CY_M2 <-  paste0( '{', SA_02_PUB_TAXREV_LEVIED_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TAXREV_LEVIED_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-02-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit170/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearMinus1YearAmt'
V_PUB_TAXREV_LEVIED_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TAXREV_LEVIED_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M1 ) )
if( length( SA_02_PUB_TAXREV_LEVIED_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TAXREV_LEVIED_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TAXREV_LEVIED_CY_M1 <-  paste0( '{', SA_02_PUB_TAXREV_LEVIED_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TAXREV_LEVIED_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-02-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit170/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft170Grp/CurrentTaxYearAmt'
V_PUB_TAXREV_LEVIED_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TAXREV_LEVIED_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY ) )
if( length( SA_02_PUB_TAXREV_LEVIED_CY ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TAXREV_LEVIED_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TAXREV_LEVIED_CY <-  paste0( '{', SA_02_PUB_TAXREV_LEVIED_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TAXREV_LEVIED_TOT
## DESCRIPTION:  Tax Rev Levied For Org Benefit170 - Total
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-02-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit170/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft170Grp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TaxRevenuesLeviedForOrgBenefit/Total'
V_PUB_TAXREV_LEVIED_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TAXREV_LEVIED_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_TOT ) )
if( length( SA_02_PUB_TAXREV_LEVIED_TOT ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TAXREV_LEVIED_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TAXREV_LEVIED_TOT <-  paste0( '{', SA_02_PUB_TAXREV_LEVIED_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_VALUE_SVC_GOVT_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-03-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus4Years'
V_PUB_VALUE_SVC_GOVT_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_VALUE_SVC_GOVT_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M4 ) )
if( length( SA_02_PUB_VALUE_SVC_GOVT_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_VALUE_SVC_GOVT_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_VALUE_SVC_GOVT_CY_M4 <-  paste0( '{', SA_02_PUB_VALUE_SVC_GOVT_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_VALUE_SVC_GOVT_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-03-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus3Years'
V_PUB_VALUE_SVC_GOVT_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_VALUE_SVC_GOVT_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M3 ) )
if( length( SA_02_PUB_VALUE_SVC_GOVT_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_VALUE_SVC_GOVT_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_VALUE_SVC_GOVT_CY_M3 <-  paste0( '{', SA_02_PUB_VALUE_SVC_GOVT_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_VALUE_SVC_GOVT_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-03-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus2Years'
V_PUB_VALUE_SVC_GOVT_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_VALUE_SVC_GOVT_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M2 ) )
if( length( SA_02_PUB_VALUE_SVC_GOVT_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_VALUE_SVC_GOVT_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_VALUE_SVC_GOVT_CY_M2 <-  paste0( '{', SA_02_PUB_VALUE_SVC_GOVT_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_VALUE_SVC_GOVT_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-03-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYearMinus1Year'
V_PUB_VALUE_SVC_GOVT_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_VALUE_SVC_GOVT_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M1 ) )
if( length( SA_02_PUB_VALUE_SVC_GOVT_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_VALUE_SVC_GOVT_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_VALUE_SVC_GOVT_CY_M1 <-  paste0( '{', SA_02_PUB_VALUE_SVC_GOVT_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_VALUE_SVC_GOVT_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-03-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl170Grp/CurrentTaxYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueSrvcFcltsFurnishedByGovt/CurrentTaxYear'
V_PUB_VALUE_SVC_GOVT_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_VALUE_SVC_GOVT_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY ) )
if( length( SA_02_PUB_VALUE_SVC_GOVT_CY ) > 1 )
{ 
  create_record( varname=SA_02_PUB_VALUE_SVC_GOVT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_VALUE_SVC_GOVT_CY <-  paste0( '{', SA_02_PUB_VALUE_SVC_GOVT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_VALUE_SVC_GOVT_TOT
## DESCRIPTION:  Govt Furn Srvc Fclts Vl170 Grp - Total
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-03-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl170Grp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ValueSrvcFcltsFurnishedByGovt/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueSrvcFcltsFurnishedByGovt/Total'
V_PUB_VALUE_SVC_GOVT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_VALUE_SVC_GOVT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_TOT ) )
if( length( SA_02_PUB_VALUE_SVC_GOVT_TOT ) > 1 )
{ 
  create_record( varname=SA_02_PUB_VALUE_SVC_GOVT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_VALUE_SVC_GOVT_TOT <-  paste0( '{', SA_02_PUB_VALUE_SVC_GOVT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TOT_L123_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-04-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalCalendarYear170Grp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/Total/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total170/CurrentTaxYearMinus4Years'
V_PUB_TOT_L123_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TOT_L123_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L123_CY_M4 ) )
if( length( SA_02_PUB_TOT_L123_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TOT_L123_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TOT_L123_CY_M4 <-  paste0( '{', SA_02_PUB_TOT_L123_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TOT_L123_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-04-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalCalendarYear170Grp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/Total/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total170/CurrentTaxYearMinus3Years'
V_PUB_TOT_L123_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TOT_L123_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L123_CY_M3 ) )
if( length( SA_02_PUB_TOT_L123_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TOT_L123_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TOT_L123_CY_M3 <-  paste0( '{', SA_02_PUB_TOT_L123_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TOT_L123_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-04-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalCalendarYear170Grp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/Total/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total170/CurrentTaxYearMinus2Years'
V_PUB_TOT_L123_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TOT_L123_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L123_CY_M2 ) )
if( length( SA_02_PUB_TOT_L123_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TOT_L123_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TOT_L123_CY_M2 <-  paste0( '{', SA_02_PUB_TOT_L123_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TOT_L123_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-04-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalCalendarYear170Grp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/Total/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total170/CurrentTaxYearMinus1Year'
V_PUB_TOT_L123_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TOT_L123_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L123_CY_M1 ) )
if( length( SA_02_PUB_TOT_L123_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TOT_L123_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TOT_L123_CY_M1 <-  paste0( '{', SA_02_PUB_TOT_L123_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TOT_L123_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-04-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalCalendarYear170Grp/CurrentTaxYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/Total/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total170/CurrentTaxYear'
V_PUB_TOT_L123_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TOT_L123_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L123_CY ) )
if( length( SA_02_PUB_TOT_L123_CY ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TOT_L123_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TOT_L123_CY <-  paste0( '{', SA_02_PUB_TOT_L123_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_TOT_L123_TOT
## DESCRIPTION:  Total - Total - Total
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-04-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/Total/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalCalendarYear170Grp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total170/Total'
V_PUB_TOT_L123_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_TOT_L123_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L123_TOT ) )
if( length( SA_02_PUB_TOT_L123_TOT ) > 1 )
{ 
  create_record( varname=SA_02_PUB_TOT_L123_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_TOT_L123_TOT <-  paste0( '{', SA_02_PUB_TOT_L123_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_CONTR_SBST_TOT
## DESCRIPTION:  Amounts from substantial contributors total
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-05-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsSubstContributorsTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsSubstContributorsTotal'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsTotAmt'
V_PUB_CONTR_SBST_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_CONTR_SBST_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_CONTR_SBST_TOT ) )
if( length( SA_02_PUB_CONTR_SBST_TOT ) > 1 )
{ 
  create_record( varname=SA_02_PUB_CONTR_SBST_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_CONTR_SBST_TOT <-  paste0( '{', SA_02_PUB_CONTR_SBST_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PUB_SUPPORT_TOT
## DESCRIPTION:  Public Support Total
## LOCATION:  SCHED-A-PART-02-SECTION-A-LINE-06-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/PublicSupportTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportTotal170'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportTotal170Amt'
V_PUB_SUPPORT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_PUB_SUPPORT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_SUPPORT_TOT ) )
if( length( SA_02_PUB_SUPPORT_TOT ) > 1 )
{ 
  create_record( varname=SA_02_PUB_SUPPORT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PUB_SUPPORT_TOT <-  paste0( '{', SA_02_PUB_SUPPORT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_AMT_L4_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-07-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_02_TOT_AMT_L4_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsFromLine4/CurrentTaxYearMinus4Years' ) )
if( length( SA_02_TOT_AMT_L4_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_AMT_L4_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_AMT_L4_CY_M4 <-  paste0( '{', SA_02_TOT_AMT_L4_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_AMT_L4_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-07-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_02_TOT_AMT_L4_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsFromLine4/CurrentTaxYearMinus3Years' ) )
if( length( SA_02_TOT_AMT_L4_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_AMT_L4_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_AMT_L4_CY_M3 <-  paste0( '{', SA_02_TOT_AMT_L4_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_AMT_L4_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-07-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_02_TOT_AMT_L4_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsFromLine4/CurrentTaxYearMinus2Years' ) )
if( length( SA_02_TOT_AMT_L4_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_AMT_L4_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_AMT_L4_CY_M2 <-  paste0( '{', SA_02_TOT_AMT_L4_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_AMT_L4_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-07-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_02_TOT_AMT_L4_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsFromLine4/CurrentTaxYearMinus1Year' ) )
if( length( SA_02_TOT_AMT_L4_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_AMT_L4_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_AMT_L4_CY_M1 <-  paste0( '{', SA_02_TOT_AMT_L4_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_AMT_L4_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-07-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_02_TOT_AMT_L4_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsFromLine4/CurrentTaxYear' ) )
if( length( SA_02_TOT_AMT_L4_CY ) > 1 )
{ 
  create_record( varname=SA_02_TOT_AMT_L4_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_AMT_L4_CY <-  paste0( '{', SA_02_TOT_AMT_L4_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_AMT_L4_CY_TOT
## DESCRIPTION:  Amounts From Line4 - Total
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-07-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_02_TOT_AMT_L4_CY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/AmountsFromLine4/Total' ) )
if( length( SA_02_TOT_AMT_L4_CY_TOT ) > 1 )
{ 
  create_record( varname=SA_02_TOT_AMT_L4_CY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_AMT_L4_CY_TOT <-  paste0( '{', SA_02_TOT_AMT_L4_CY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_GRO_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-08-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossInvestmentIncome/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170Grp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_GRO_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_GRO_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M4 ) )
if( length( SA_02_TOT_INCOME_GRO_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_GRO_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_GRO_CY_M4 <-  paste0( '{', SA_02_TOT_INCOME_GRO_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_GRO_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-08-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossInvestmentIncome/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170Grp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_GRO_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_GRO_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M3 ) )
if( length( SA_02_TOT_INCOME_GRO_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_GRO_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_GRO_CY_M3 <-  paste0( '{', SA_02_TOT_INCOME_GRO_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_GRO_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-08-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossInvestmentIncome/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170Grp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_GRO_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_GRO_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M2 ) )
if( length( SA_02_TOT_INCOME_GRO_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_GRO_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_GRO_CY_M2 <-  paste0( '{', SA_02_TOT_INCOME_GRO_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_GRO_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-08-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossInvestmentIncome/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170Grp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_GRO_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_GRO_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M1 ) )
if( length( SA_02_TOT_INCOME_GRO_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_GRO_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_GRO_CY_M1 <-  paste0( '{', SA_02_TOT_INCOME_GRO_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_GRO_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-08-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossInvestmentIncome/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170Grp/CurrentTaxYearAmt'
V_TOT_INCOME_GRO_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_GRO_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY ) )
if( length( SA_02_TOT_INCOME_GRO_CY ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_GRO_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_GRO_CY <-  paste0( '{', SA_02_TOT_INCOME_GRO_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_GRO_TOT
## DESCRIPTION:  Gross Investment Income - Total
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-08-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossInvestmentIncome/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome170Grp/TotalAmt'
V_TOT_INCOME_GRO_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_GRO_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_TOT ) )
if( length( SA_02_TOT_INCOME_GRO_TOT ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_GRO_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_GRO_TOT <-  paste0( '{', SA_02_TOT_INCOME_GRO_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_NET_UBIZ_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-09-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/NetUBI/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetUBI/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_NET_UBIZ_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_NET_UBIZ_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M4 ) )
if( length( SA_02_TOT_INCOME_NET_UBIZ_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_NET_UBIZ_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_NET_UBIZ_CY_M4 <-  paste0( '{', SA_02_TOT_INCOME_NET_UBIZ_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_NET_UBIZ_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-09-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/NetUBI/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetUBI/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_NET_UBIZ_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_NET_UBIZ_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M3 ) )
if( length( SA_02_TOT_INCOME_NET_UBIZ_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_NET_UBIZ_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_NET_UBIZ_CY_M3 <-  paste0( '{', SA_02_TOT_INCOME_NET_UBIZ_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_NET_UBIZ_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-09-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/NetUBI/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetUBI/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_NET_UBIZ_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_NET_UBIZ_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M2 ) )
if( length( SA_02_TOT_INCOME_NET_UBIZ_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_NET_UBIZ_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_NET_UBIZ_CY_M2 <-  paste0( '{', SA_02_TOT_INCOME_NET_UBIZ_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_NET_UBIZ_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-09-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/NetUBI/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetUBI/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_NET_UBIZ_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_NET_UBIZ_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M1 ) )
if( length( SA_02_TOT_INCOME_NET_UBIZ_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_NET_UBIZ_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_NET_UBIZ_CY_M1 <-  paste0( '{', SA_02_TOT_INCOME_NET_UBIZ_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_NET_UBIZ_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-09-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/NetUBI/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetUBI/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/UnrelatedBusinessNetIncm170Grp/CurrentTaxYearAmt'
V_TOT_INCOME_NET_UBIZ_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_NET_UBIZ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY ) )
if( length( SA_02_TOT_INCOME_NET_UBIZ_CY ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_NET_UBIZ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_NET_UBIZ_CY <-  paste0( '{', SA_02_TOT_INCOME_NET_UBIZ_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_NET_UBIZ_TOT
## DESCRIPTION:  Net UBI - Total
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-09-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/NetUBI/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetUBI/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/UnrelatedBusinessNetIncm170Grp/TotalAmt'
V_TOT_INCOME_NET_UBIZ_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_NET_UBIZ_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_TOT ) )
if( length( SA_02_TOT_INCOME_NET_UBIZ_TOT ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_NET_UBIZ_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_NET_UBIZ_TOT <-  paste0( '{', SA_02_TOT_INCOME_NET_UBIZ_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_OTH_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-10-COL-A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/OtherIncome/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170Grp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_OTH_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_OTH_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M4 ) )
if( length( SA_02_TOT_INCOME_OTH_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_OTH_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_OTH_CY_M4 <-  paste0( '{', SA_02_TOT_INCOME_OTH_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_OTH_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-10-COL-B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/OtherIncome/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170Grp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_OTH_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_OTH_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M3 ) )
if( length( SA_02_TOT_INCOME_OTH_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_OTH_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_OTH_CY_M3 <-  paste0( '{', SA_02_TOT_INCOME_OTH_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_OTH_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-10-COL-C
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/OtherIncome/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170Grp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_OTH_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_OTH_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M2 ) )
if( length( SA_02_TOT_INCOME_OTH_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_OTH_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_OTH_CY_M2 <-  paste0( '{', SA_02_TOT_INCOME_OTH_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_OTH_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-10-COL-D
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/OtherIncome/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170Grp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_OTH_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_OTH_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M1 ) )
if( length( SA_02_TOT_INCOME_OTH_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_OTH_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_OTH_CY_M1 <-  paste0( '{', SA_02_TOT_INCOME_OTH_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_OTH_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-10-COL-E
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/OtherIncome/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170Grp/CurrentTaxYearAmt'
V_TOT_INCOME_OTH_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_OTH_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY ) )
if( length( SA_02_TOT_INCOME_OTH_CY ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_OTH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_OTH_CY <-  paste0( '{', SA_02_TOT_INCOME_OTH_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_INCOME_OTH_TOT
## DESCRIPTION:  Other Income - Total
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-10-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/OtherIncome/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome170Grp/TotalAmt'
V_TOT_INCOME_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_INCOME_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_TOT ) )
if( length( SA_02_TOT_INCOME_OTH_TOT ) > 1 )
{ 
  create_record( varname=SA_02_TOT_INCOME_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_INCOME_OTH_TOT <-  paste0( '{', SA_02_TOT_INCOME_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_SUPPORT_TOT
## DESCRIPTION:  Form990 Schedule APart II - Total support
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-11-COL-F
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TotalSupport'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupport'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportAmt'
V_TOT_SUPPORT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_SUPPORT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_TOT ) )
if( length( SA_02_TOT_SUPPORT_TOT ) > 1 )
{ 
  create_record( varname=SA_02_TOT_SUPPORT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_SUPPORT_TOT <-  paste0( '{', SA_02_TOT_SUPPORT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_GRO_RCPT_RLTD_ACTS
## DESCRIPTION:  Gross receipts from admissions; merchandise sold or services performed; or furnishing of facilities in any activity that is related to the organization's tax-exempt purpose
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-12
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsRltdActivitiesAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/GrossReceiptsFromAdmissionsEtc'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissionsEtc'
V_TOT_GRO_RCPT_RLTD_ACTS <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_GRO_RCPT_RLTD_ACTS <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_GRO_RCPT_RLTD_ACTS ) )
if( length( SA_02_TOT_GRO_RCPT_RLTD_ACTS ) > 1 )
{ 
  create_record( varname=SA_02_TOT_GRO_RCPT_RLTD_ACTS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_GRO_RCPT_RLTD_ACTS <-  paste0( '{', SA_02_TOT_GRO_RCPT_RLTD_ACTS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_TOT_FIRST_5Y_X
## DESCRIPTION:  First five years
## LOCATION:  SCHED-A-PART-02-SECTION-B-LINE-13
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/First5Years170'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/First5Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/First5Years170Ind'
V_TOT_FIRST_5Y_X <- paste( V1, V2, V3 , sep='|' )
SA_02_TOT_FIRST_5Y_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_FIRST_5Y_X ) )
if( length( SA_02_TOT_FIRST_5Y_X ) > 1 )
{ 
  create_record( varname=SA_02_TOT_FIRST_5Y_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_TOT_FIRST_5Y_X <-  paste0( '{', SA_02_TOT_FIRST_5Y_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_PUB_SUPPORT_CY
## DESCRIPTION:  Public support percentage (line 6 column (f) divided by line 12 column (f)
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-14
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/PublicSupportPertcentage'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportPertcentage170'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportCY170Pct'
V_PCT_PUB_SUPPORT_CY <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_PUB_SUPPORT_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_PUB_SUPPORT_CY ) )
if( length( SA_02_PCT_PUB_SUPPORT_CY ) > 1 )
{ 
  create_record( varname=SA_02_PCT_PUB_SUPPORT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_PUB_SUPPORT_CY <-  paste0( '{', SA_02_PCT_PUB_SUPPORT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_PUB_SUPPORT_PY
## DESCRIPTION:  Public support percentage from prior year's Schedule A; Part II; line 14
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-15
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/PublicSupportPertcentPriorYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportPertcentPriorYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportPY170Pct'
V_PCT_PUB_SUPPORT_PY <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_PUB_SUPPORT_PY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_PUB_SUPPORT_PY ) )
if( length( SA_02_PCT_PUB_SUPPORT_PY ) > 1 )
{ 
  create_record( varname=SA_02_PCT_PUB_SUPPORT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_PUB_SUPPORT_PY <-  paste0( '{', SA_02_PCT_PUB_SUPPORT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_33_SUPPORT_TEST_CY_X
## DESCRIPTION:  Thirty three and one third test for the current year
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-16A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ThirtyThreePercntTestsCurrent'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThreePercntTestsCY170'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThrPctSuprtTestsCY170Ind'
V_PCT_33_SUPPORT_TEST_CY_X <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_33_SUPPORT_TEST_CY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_33_SUPPORT_TEST_CY_X ) )
if( length( SA_02_PCT_33_SUPPORT_TEST_CY_X ) > 1 )
{ 
  create_record( varname=SA_02_PCT_33_SUPPORT_TEST_CY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_33_SUPPORT_TEST_CY_X <-  paste0( '{', SA_02_PCT_33_SUPPORT_TEST_CY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_33_SUPPORT_TEST_PY_X
## DESCRIPTION:  Thirty three and one third test for the prior year
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-16B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/ThirtyThreePercntTestsPrior'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThreePercntTestsPY170'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThrPctSuprtTestsPY170Ind'
V_PCT_33_SUPPORT_TEST_PY_X <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_33_SUPPORT_TEST_PY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_33_SUPPORT_TEST_PY_X ) )
if( length( SA_02_PCT_33_SUPPORT_TEST_PY_X ) > 1 )
{ 
  create_record( varname=SA_02_PCT_33_SUPPORT_TEST_PY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_33_SUPPORT_TEST_PY_X <-  paste0( '{', SA_02_PCT_33_SUPPORT_TEST_PY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_10_SUPPORT_TEST_CY_X
## DESCRIPTION:  Ten percent facts and circumstances test for the current year
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-17A
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TenPercentTestCurrentYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TenPercentTestCurrentYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TenPctFactsCrcmstncsTestCYInd'
V_PCT_10_SUPPORT_TEST_CY_X <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_10_SUPPORT_TEST_CY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_10_SUPPORT_TEST_CY_X ) )
if( length( SA_02_PCT_10_SUPPORT_TEST_CY_X ) > 1 )
{ 
  create_record( varname=SA_02_PCT_10_SUPPORT_TEST_CY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_10_SUPPORT_TEST_CY_X <-  paste0( '{', SA_02_PCT_10_SUPPORT_TEST_CY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_10_SUPPORT_TEST_PY_X
## DESCRIPTION:  Ten percent facts and circumstances test for the prior year
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-17B
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/TenPercentTestPriorYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TenPercentTestPriorYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TenPctFactsCrcmstncsTestPYInd'
V_PCT_10_SUPPORT_TEST_PY_X <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_10_SUPPORT_TEST_PY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_10_SUPPORT_TEST_PY_X ) )
if( length( SA_02_PCT_10_SUPPORT_TEST_PY_X ) > 1 )
{ 
  create_record( varname=SA_02_PCT_10_SUPPORT_TEST_PY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_10_SUPPORT_TEST_PY_X <-  paste0( '{', SA_02_PCT_10_SUPPORT_TEST_PY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_02_PCT_PRIVATE_FOUNDATION_X
## DESCRIPTION:  If the organization did not check a box on line 13; 16a; 16b; 17a or 17b; check this box and see instructions
## LOCATION:  SCHED-A-PART-02-SECTION-C-LINE-18
## TABLE:  SA-P02-T00-SUPPORT_SCHEDULE_170
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartII/PrivateFoundation'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PrivateFoundation170'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PrivateFoundation170Ind'
V_PCT_PRIVATE_FOUNDATION_X <- paste( V1, V2, V3 , sep='|' )
SA_02_PCT_PRIVATE_FOUNDATION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_PRIVATE_FOUNDATION_X ) )
if( length( SA_02_PCT_PRIVATE_FOUNDATION_X ) > 1 )
{ 
  create_record( varname=SA_02_PCT_PRIVATE_FOUNDATION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_02_PCT_PRIVATE_FOUNDATION_X <-  paste0( '{', SA_02_PCT_PRIVATE_FOUNDATION_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SA_02_PUB_GIFT_GRANT_CONTR_CY_M4,SA_02_PUB_GIFT_GRANT_CONTR_CY_M3,SA_02_PUB_GIFT_GRANT_CONTR_CY_M2,SA_02_PUB_GIFT_GRANT_CONTR_CY_M1,SA_02_PUB_GIFT_GRANT_CONTR_CY,SA_02_PUB_GIFT_GRANT_CONTR_TOT,SA_02_PUB_TAXREV_LEVIED_CY_M4,SA_02_PUB_TAXREV_LEVIED_CY_M3,SA_02_PUB_TAXREV_LEVIED_CY_M2,SA_02_PUB_TAXREV_LEVIED_CY_M1,SA_02_PUB_TAXREV_LEVIED_CY,SA_02_PUB_TAXREV_LEVIED_TOT,SA_02_PUB_VALUE_SVC_GOVT_CY_M4,SA_02_PUB_VALUE_SVC_GOVT_CY_M3,SA_02_PUB_VALUE_SVC_GOVT_CY_M2,SA_02_PUB_VALUE_SVC_GOVT_CY_M1,SA_02_PUB_VALUE_SVC_GOVT_CY,SA_02_PUB_VALUE_SVC_GOVT_TOT,SA_02_PUB_TOT_L123_CY_M4,SA_02_PUB_TOT_L123_CY_M3,SA_02_PUB_TOT_L123_CY_M2,SA_02_PUB_TOT_L123_CY_M1,SA_02_PUB_TOT_L123_CY,SA_02_PUB_TOT_L123_TOT,SA_02_PUB_CONTR_SBST_TOT,SA_02_PUB_SUPPORT_TOT,SA_02_TOT_AMT_L4_CY_M4,SA_02_TOT_AMT_L4_CY_M3,SA_02_TOT_AMT_L4_CY_M2,SA_02_TOT_AMT_L4_CY_M1,SA_02_TOT_AMT_L4_CY,SA_02_TOT_AMT_L4_CY_TOT,SA_02_TOT_INCOME_GRO_CY_M4,SA_02_TOT_INCOME_GRO_CY_M3,SA_02_TOT_INCOME_GRO_CY_M2,SA_02_TOT_INCOME_GRO_CY_M1,SA_02_TOT_INCOME_GRO_CY,SA_02_TOT_INCOME_GRO_TOT,SA_02_TOT_INCOME_NET_UBIZ_CY_M4,SA_02_TOT_INCOME_NET_UBIZ_CY_M3,SA_02_TOT_INCOME_NET_UBIZ_CY_M2,SA_02_TOT_INCOME_NET_UBIZ_CY_M1,SA_02_TOT_INCOME_NET_UBIZ_CY,SA_02_TOT_INCOME_NET_UBIZ_TOT,SA_02_TOT_INCOME_OTH_CY_M4,SA_02_TOT_INCOME_OTH_CY_M3,SA_02_TOT_INCOME_OTH_CY_M2,SA_02_TOT_INCOME_OTH_CY_M1,SA_02_TOT_INCOME_OTH_CY,SA_02_TOT_INCOME_OTH_TOT,SA_02_TOT_SUPPORT_TOT,SA_02_TOT_GRO_RCPT_RLTD_ACTS,SA_02_TOT_FIRST_5Y_X,SA_02_PCT_PUB_SUPPORT_CY,SA_02_PCT_PUB_SUPPORT_PY,SA_02_PCT_33_SUPPORT_TEST_CY_X,SA_02_PCT_33_SUPPORT_TEST_PY_X,SA_02_PCT_10_SUPPORT_TEST_CY_X,SA_02_PCT_10_SUPPORT_TEST_PY_X,SA_02_PCT_PRIVATE_FOUNDATION_X)
df <- as.data.frame( var.list )


return( df )


}


