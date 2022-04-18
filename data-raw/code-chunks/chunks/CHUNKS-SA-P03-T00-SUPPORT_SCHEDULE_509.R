#' @title 
#'   Build table SA-P03-T00-SUPPORT_SCHEDULE_509
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P03_T00_SUPPORT_SCHEDULE_509 <- function( doc, url )
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

ORG_EIN <- xml_text( xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



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
ORG_NAME_L1 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



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
ORG_NAME_L2 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml_text( xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml_text( xml_find_all( doc, TEMP_TAX_YEAR ) )



######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SA_03_PUB_GIFT_GRANT_CONTR_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-01-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GiftsGrantsContribReceived/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived509/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus4YearsAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GIFT_GRANT_CONTR_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_GIFT_GRANT_CONTR_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-01-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GiftsGrantsContribReceived/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived509/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus3YearsAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GIFT_GRANT_CONTR_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_GIFT_GRANT_CONTR_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-01-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GiftsGrantsContribReceived/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived509/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus2YearsAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GIFT_GRANT_CONTR_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_GIFT_GRANT_CONTR_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-01-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GiftsGrantsContribReceived/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived509/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearMinus1YearAmt'
V_PUB_GIFT_GRANT_CONTR_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GIFT_GRANT_CONTR_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_GIFT_GRANT_CONTR_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-01-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GiftsGrantsContribReceived/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived509/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContrisRcvd509Grp/CurrentTaxYearAmt'
V_PUB_GIFT_GRANT_CONTR_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GIFT_GRANT_CONTR_CY <- xml_text( xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY ) )




## VARIABLE NAME:  SA_03_PUB_GIFT_GRANT_CONTR_TOT
## DESCRIPTION:  Gifts Grants Contrib Received - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-01-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GiftsGrantsContribReceived/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContribReceived509/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GiftsGrantsContrisRcvd509Grp/TotalAmt'
V_PUB_GIFT_GRANT_CONTR_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GIFT_GRANT_CONTR_TOT <- xml_text( xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_TOT ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus4Years'
V_PUB_GRO_RCPT_ADM_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus3Years'
V_PUB_GRO_RCPT_ADM_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus2Years'
V_PUB_GRO_RCPT_ADM_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus1Year'
V_PUB_GRO_RCPT_ADM_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearAmt'
V_PUB_GRO_RCPT_ADM_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_TOT
## DESCRIPTION:  Gross Receipts Admissions Grp - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/Total'
V_PUB_GRO_RCPT_ADM_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_TOT <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_ADM_TOT ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-03-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromNonUBI/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromNonUBI/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus4YearsAmt'
V_PUB_GRO_RCPT_NONUBIZ_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-03-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromNonUBI/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromNonUBI/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus3YearsAmt'
V_PUB_GRO_RCPT_NONUBIZ_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-03-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromNonUBI/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromNonUBI/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus2YearsAmt'
V_PUB_GRO_RCPT_NONUBIZ_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-03-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromNonUBI/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromNonUBI/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearMinus1YearAmt'
V_PUB_GRO_RCPT_NONUBIZ_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_NONUBIZ_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-03-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromNonUBI/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromNonUBI/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsNonUnrltBusGrp/CurrentTaxYearAmt'
V_PUB_GRO_RCPT_NONUBIZ_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_NONUBIZ_CY <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY ) )




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_NONUBIZ_TOT
## DESCRIPTION:  Gross Receipts From Non UBI - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-03-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromNonUBI/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromNonUBI/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsNonUnrltBusGrp/TotalAmt'
V_PUB_GRO_RCPT_NONUBIZ_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_NONUBIZ_TOT <- xml_text( xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_TOT ) )




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus4YearsAmt'
V_PUB_TAXREV_LEVIED_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus3YearsAmt'
V_PUB_TAXREV_LEVIED_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus2YearsAmt'
V_PUB_TAXREV_LEVIED_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearMinus1YearAmt'
V_PUB_TAXREV_LEVIED_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/CurrentTaxYearAmt'
V_PUB_TAXREV_LEVIED_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_CY <- xml_text( xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY ) )




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_TOT
## DESCRIPTION:  Tax Rev Levied For Org Benefit509 - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/Total'
V_PUB_TAXREV_LEVIED_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_TOT <- xml_text( xml_find_all( doc, V_PUB_TAXREV_LEVIED_TOT ) )




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus4Years'
V_PUB_VALUE_SVC_GOVT_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus3Years'
V_PUB_VALUE_SVC_GOVT_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus2Years'
V_PUB_VALUE_SVC_GOVT_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus1Year'
V_PUB_VALUE_SVC_GOVT_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYear'
V_PUB_VALUE_SVC_GOVT_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY <- xml_text( xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY ) )




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_TOT
## DESCRIPTION:  Govt Furn Srvc Fclts Vl509 Grp - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/Total'
V_PUB_VALUE_SVC_GOVT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_TOT <- xml_text( xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_TOT ) )




## VARIABLE NAME:  SA_03_PUB_TOT_L1_5_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-06-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Total/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Total509/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total509Grp/CurrentTaxYearMinus4YearsAmt'
V_PUB_TOT_L1_5_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TOT_L1_5_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_TOT_L1_5_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_TOT_L1_5_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-06-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Total/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Total509/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total509Grp/CurrentTaxYearMinus3YearsAmt'
V_PUB_TOT_L1_5_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TOT_L1_5_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_TOT_L1_5_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_TOT_L1_5_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-06-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Total/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Total509/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total509Grp/CurrentTaxYearMinus2YearsAmt'
V_PUB_TOT_L1_5_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TOT_L1_5_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_TOT_L1_5_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_TOT_L1_5_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-06-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Total/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Total509/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total509Grp/CurrentTaxYearMinus1YearAmt'
V_PUB_TOT_L1_5_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TOT_L1_5_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_TOT_L1_5_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_TOT_L1_5_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-06-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Total/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Total509/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total509Grp/CurrentTaxYearAmt'
V_PUB_TOT_L1_5_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TOT_L1_5_CY <- xml_text( xml_find_all( doc, V_PUB_TOT_L1_5_CY ) )




## VARIABLE NAME:  SA_03_PUB_TOT_L1_5_TOT
## DESCRIPTION:  Total - Total - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-06-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Total/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Total509/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Total509Grp/TotalAmt'
V_PUB_TOT_L1_5_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TOT_L1_5_TOT <- xml_text( xml_find_all( doc, V_PUB_TOT_L1_5_TOT ) )




## VARIABLE NAME:  SA_03_PUB_AMT_PERS_DSQ_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07A-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus4Years'
V_PUB_AMT_PERS_DSQ_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_PERS_DSQ_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_PERS_DSQ_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07A-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus3Years'
V_PUB_AMT_PERS_DSQ_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_PERS_DSQ_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_PERS_DSQ_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07A-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus2Years'
V_PUB_AMT_PERS_DSQ_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_PERS_DSQ_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_PERS_DSQ_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07A-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsRecdFromDisqualPersons/CurrentTaxYearMinus1Year'
V_PUB_AMT_PERS_DSQ_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_PERS_DSQ_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_PERS_DSQ_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07A-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsRcvdDsqlfyPersonGrp/CurrentTaxYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/AmtsRecdFromDisqualPersons/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsRecdFromDisqualPersons/CurrentTaxYear'
V_PUB_AMT_PERS_DSQ_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_PERS_DSQ_CY <- xml_text( xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY ) )




## VARIABLE NAME:  SA_03_PUB_AMT_PERS_DSQ_TOT
## DESCRIPTION:  Amounts Rcvd Dsqlfy Person Grp - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07A-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmountsRcvdDsqlfyPersonGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/AmtsRecdFromDisqualPersons/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsRecdFromDisqualPersons/Total'
V_PUB_AMT_PERS_DSQ_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_PERS_DSQ_TOT <- xml_text( xml_find_all( doc, V_PUB_AMT_PERS_DSQ_TOT ) )




## VARIABLE NAME:  SA_03_PUB_AMT_CONTR_SBST_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07B-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmtsFromSubstContributors/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromSubstContributors/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsAmtGrp/CurrentTaxYearMinus4YearsAmt'
V_PUB_AMT_CONTR_SBST_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_CONTR_SBST_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_CONTR_SBST_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07B-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmtsFromSubstContributors/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromSubstContributors/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsAmtGrp/CurrentTaxYearMinus3YearsAmt'
V_PUB_AMT_CONTR_SBST_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_CONTR_SBST_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_CONTR_SBST_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07B-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmtsFromSubstContributors/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromSubstContributors/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsAmtGrp/CurrentTaxYearMinus2YearsAmt'
V_PUB_AMT_CONTR_SBST_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_CONTR_SBST_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_CONTR_SBST_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07B-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmtsFromSubstContributors/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromSubstContributors/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsAmtGrp/CurrentTaxYearMinus1YearAmt'
V_PUB_AMT_CONTR_SBST_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_CONTR_SBST_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_AMT_CONTR_SBST_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07B-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmtsFromSubstContributors/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromSubstContributors/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsAmtGrp/CurrentTaxYearAmt'
V_PUB_AMT_CONTR_SBST_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_CONTR_SBST_CY <- xml_text( xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY ) )




## VARIABLE NAME:  SA_03_PUB_AMT_CONTR_SBST_TOT
## DESCRIPTION:  Amts From Subst Contributors - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07B-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/AmtsFromSubstContributors/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromSubstContributors/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SubstantialContributorsAmtGrp/TotalAmt'
V_PUB_AMT_CONTR_SBST_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_AMT_CONTR_SBST_TOT <- xml_text( xml_find_all( doc, V_PUB_AMT_CONTR_SBST_TOT ) )




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus4Years'
V_PUB_ADD_L7AB_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M4 <- xml_text( xml_find_all( doc, V_PUB_ADD_L7AB_CY_M4 ) )




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus3Years'
V_PUB_ADD_L7AB_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M3 <- xml_text( xml_find_all( doc, V_PUB_ADD_L7AB_CY_M3 ) )




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus2Years'
V_PUB_ADD_L7AB_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M2 <- xml_text( xml_find_all( doc, V_PUB_ADD_L7AB_CY_M2 ) )




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus1Year'
V_PUB_ADD_L7AB_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M1 <- xml_text( xml_find_all( doc, V_PUB_ADD_L7AB_CY_M1 ) )




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYear'
V_PUB_ADD_L7AB_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY <- xml_text( xml_find_all( doc, V_PUB_ADD_L7AB_CY ) )




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_TOT
## DESCRIPTION:  Subst And Dsqlfy Prsns Tot Grp - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/Total'
V_PUB_ADD_L7AB_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_TOT <- xml_text( xml_find_all( doc, V_PUB_ADD_L7AB_TOT ) )




## VARIABLE NAME:  SA_03_PUB_SUPPORT_TOT
## DESCRIPTION:  Public support total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-08-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PublicSupportTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportTotal509'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportTotal509Amt'
V_PUB_SUPPORT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_SUPPORT_TOT <- xml_text( xml_find_all( doc, V_PUB_SUPPORT_TOT ) )




## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M4 <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus4Years' ) )





## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M3 <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus3Years' ) )





## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M2 <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus2Years' ) )





## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M1 <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus1Year' ) )





## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYear' ) )





## VARIABLE NAME:  SA_03_TOT_AMT_L6_TOT
## DESCRIPTION:  Amts From Line6 - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_TOT <- xml_text( xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/Total' ) )





## VARIABLE NAME:  SA_03_TOT_INCOME_GRO_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10A-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossInvestmentIncome/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509Grp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_GRO_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_GRO_CY_M4 <- xml_text( xml_find_all( doc, V_TOT_INCOME_GRO_CY_M4 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_GRO_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10A-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossInvestmentIncome/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509Grp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_GRO_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_GRO_CY_M3 <- xml_text( xml_find_all( doc, V_TOT_INCOME_GRO_CY_M3 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_GRO_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10A-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossInvestmentIncome/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509Grp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_GRO_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_GRO_CY_M2 <- xml_text( xml_find_all( doc, V_TOT_INCOME_GRO_CY_M2 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_GRO_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10A-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossInvestmentIncome/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509Grp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_GRO_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_GRO_CY_M1 <- xml_text( xml_find_all( doc, V_TOT_INCOME_GRO_CY_M1 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_GRO_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10A-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossInvestmentIncome/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509Grp/CurrentTaxYearAmt'
V_TOT_INCOME_GRO_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_GRO_CY <- xml_text( xml_find_all( doc, V_TOT_INCOME_GRO_CY ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_GRO_TOT
## DESCRIPTION:  Gross Investment Income - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10A-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossInvestmentIncome/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossInvestmentIncome509Grp/TotalAmt'
V_TOT_INCOME_GRO_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_GRO_TOT <- xml_text( xml_find_all( doc, V_TOT_INCOME_GRO_TOT ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_UBIZ_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10B-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Post1975UBTI/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTI/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTIGrp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_UBIZ_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_UBIZ_CY_M4 <- xml_text( xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M4 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_UBIZ_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10B-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Post1975UBTI/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTI/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTIGrp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_UBIZ_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_UBIZ_CY_M3 <- xml_text( xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M3 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_UBIZ_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10B-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Post1975UBTI/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTI/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTIGrp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_UBIZ_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_UBIZ_CY_M2 <- xml_text( xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M2 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_UBIZ_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10B-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Post1975UBTI/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTI/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTIGrp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_UBIZ_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_UBIZ_CY_M1 <- xml_text( xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M1 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_UBIZ_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10B-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Post1975UBTI/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTI/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTIGrp/CurrentTaxYearAmt'
V_TOT_INCOME_UBIZ_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_UBIZ_CY <- xml_text( xml_find_all( doc, V_TOT_INCOME_UBIZ_CY ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_UBIZ_TOT
## DESCRIPTION:  Post1975 UBTI - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10B-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/Post1975UBTI/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTI/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Post1975UBTIGrp/TotalAmt'
V_TOT_INCOME_UBIZ_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_UBIZ_TOT <- xml_text( xml_find_all( doc, V_TOT_INCOME_UBIZ_TOT ) )




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus4YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus4Years'
V_TOT_ADD_L10AB_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M4 <- xml_text( xml_find_all( doc, V_TOT_ADD_L10AB_CY_M4 ) )




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus3YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus3Years'
V_TOT_ADD_L10AB_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M3 <- xml_text( xml_find_all( doc, V_TOT_ADD_L10AB_CY_M3 ) )




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus2YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus2Years'
V_TOT_ADD_L10AB_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M2 <- xml_text( xml_find_all( doc, V_TOT_ADD_L10AB_CY_M2 ) )




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus1YearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus1Year'
V_TOT_ADD_L10AB_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M1 <- xml_text( xml_find_all( doc, V_TOT_ADD_L10AB_CY_M1 ) )




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYear'
V_TOT_ADD_L10AB_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY <- xml_text( xml_find_all( doc, V_TOT_ADD_L10AB_CY ) )




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_TOT
## DESCRIPTION:  Investment Income And UBTI - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/Total'
V_TOT_ADD_L10AB_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_TOT <- xml_text( xml_find_all( doc, V_TOT_ADD_L10AB_TOT ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_NET_UBIZ_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-11-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/NetIncomeFromOtherUBI/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBI/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_NET_UBIZ_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_NET_UBIZ_CY_M4 <- xml_text( xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M4 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_NET_UBIZ_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-11-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/NetIncomeFromOtherUBI/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBI/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_NET_UBIZ_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_NET_UBIZ_CY_M3 <- xml_text( xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M3 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_NET_UBIZ_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-11-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/NetIncomeFromOtherUBI/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBI/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_NET_UBIZ_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_NET_UBIZ_CY_M2 <- xml_text( xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M2 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_NET_UBIZ_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-11-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/NetIncomeFromOtherUBI/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBI/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBIGrp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_NET_UBIZ_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_NET_UBIZ_CY_M1 <- xml_text( xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M1 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_NET_UBIZ_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-11-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/NetIncomeFromOtherUBI/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBI/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBIGrp/CurrentTaxYearAmt'
V_TOT_INCOME_NET_UBIZ_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_NET_UBIZ_CY <- xml_text( xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_NET_UBIZ_TOT
## DESCRIPTION:  Net Income From Other UBI - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-11-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/NetIncomeFromOtherUBI/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBI/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/NetIncomeFromOtherUBIGrp/TotalAmt'
V_TOT_INCOME_NET_UBIZ_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_NET_UBIZ_TOT <- xml_text( xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_TOT ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_OTH_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-12-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/OtherIncome/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509Grp/CurrentTaxYearMinus4YearsAmt'
V_TOT_INCOME_OTH_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_OTH_CY_M4 <- xml_text( xml_find_all( doc, V_TOT_INCOME_OTH_CY_M4 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_OTH_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-12-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/OtherIncome/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509Grp/CurrentTaxYearMinus3YearsAmt'
V_TOT_INCOME_OTH_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_OTH_CY_M3 <- xml_text( xml_find_all( doc, V_TOT_INCOME_OTH_CY_M3 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_OTH_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-12-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/OtherIncome/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509Grp/CurrentTaxYearMinus2YearsAmt'
V_TOT_INCOME_OTH_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_OTH_CY_M2 <- xml_text( xml_find_all( doc, V_TOT_INCOME_OTH_CY_M2 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_OTH_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-12-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/OtherIncome/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509Grp/CurrentTaxYearMinus1YearAmt'
V_TOT_INCOME_OTH_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_OTH_CY_M1 <- xml_text( xml_find_all( doc, V_TOT_INCOME_OTH_CY_M1 ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_OTH_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-12-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/OtherIncome/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509Grp/CurrentTaxYearAmt'
V_TOT_INCOME_OTH_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_OTH_CY <- xml_text( xml_find_all( doc, V_TOT_INCOME_OTH_CY ) )




## VARIABLE NAME:  SA_03_TOT_INCOME_OTH_TOT
## DESCRIPTION:  Other Income - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-12-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/OtherIncome/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/OtherIncome509Grp/TotalAmt'
V_TOT_INCOME_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_INCOME_OTH_TOT <- xml_text( xml_find_all( doc, V_TOT_INCOME_OTH_TOT ) )




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus4Years'
V_TOT_SUPPORT_CY_M4 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M4 <- xml_text( xml_find_all( doc, V_TOT_SUPPORT_CY_M4 ) )




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus3Years'
V_TOT_SUPPORT_CY_M3 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M3 <- xml_text( xml_find_all( doc, V_TOT_SUPPORT_CY_M3 ) )




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus2Years'
V_TOT_SUPPORT_CY_M2 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M2 <- xml_text( xml_find_all( doc, V_TOT_SUPPORT_CY_M2 ) )




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus1Year'
V_TOT_SUPPORT_CY_M1 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M1 <- xml_text( xml_find_all( doc, V_TOT_SUPPORT_CY_M1 ) )




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearAmt'
V_TOT_SUPPORT_CY <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY <- xml_text( xml_find_all( doc, V_TOT_SUPPORT_CY ) )




## VARIABLE NAME:  SA_03_TOT_SUPPORT_TOT
## DESCRIPTION:  Total Support Calendar Year Grp - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalSupportTotal'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal'
V4 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/Total'
V_TOT_SUPPORT_TOT <- paste( V1, V2, V3, V4 , sep='|' )
SA_03_TOT_SUPPORT_TOT <- xml_text( xml_find_all( doc, V_TOT_SUPPORT_TOT ) )




## VARIABLE NAME:  SA_03_TOT_FIRST_5Y_X
## DESCRIPTION:  First five years?
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-14
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/First5Years509'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/First5Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/First5Years509Ind'
V_TOT_FIRST_5Y_X <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_FIRST_5Y_X <- xml_text( xml_find_all( doc, V_TOT_FIRST_5Y_X ) )




## VARIABLE NAME:  SA_03_PCT_PUB_SUPPORT_CY
## DESCRIPTION:  Public support percentage (line 8 column(f) divided by line 13 column(f))
## LOCATION:  SCHED-A-PART-03-SECTION-C-LINE-15
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PublicSupportPercentage'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportPercentage509'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportCY509Pct'
V_PCT_PUB_SUPPORT_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_PUB_SUPPORT_CY <- xml_text( xml_find_all( doc, V_PCT_PUB_SUPPORT_CY ) )




## VARIABLE NAME:  SA_03_PCT_PUB_SUPPORT_PY
## DESCRIPTION:  Public support percentage from prior year's Schedule A; Part III; line 14a
## LOCATION:  SCHED-A-PART-03-SECTION-C-LINE-16
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PriorYearSupportPercentage'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PriorYearSupportPercentage'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportPY509Pct'
V_PCT_PUB_SUPPORT_PY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_PUB_SUPPORT_PY <- xml_text( xml_find_all( doc, V_PCT_PUB_SUPPORT_PY ) )




## VARIABLE NAME:  SA_03_PCT_INVEST_INCOME_CY
## DESCRIPTION:  Investment income percentage (line 10c column (f) divided by line 13 column(f))
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-17
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeCYPct'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/InvestmentIncomePercentage'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomePercentage'
V_PCT_INVEST_INCOME_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_INVEST_INCOME_CY <- xml_text( xml_find_all( doc, V_PCT_INVEST_INCOME_CY ) )




## VARIABLE NAME:  SA_03_PCT_INVEST_INCOME_PY
## DESCRIPTION:  Investment income percentage from prior year's Schedule A; Part III; line 15a
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-18
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomePYPct'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PriorYrInvestIncomePercentage'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PriorYrInvestIncomePercentage'
V_PCT_INVEST_INCOME_PY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_INVEST_INCOME_PY <- xml_text( xml_find_all( doc, V_PCT_INVEST_INCOME_PY ) )




## VARIABLE NAME:  SA_03_PCT_33_SUPPORT_TEST_CY_X
## DESCRIPTION:  33.33 % Tests - Current Year. If the organization did not check the box on line17; and line 14a is more than 33.33% and line 15a is less than 33.33%; check this box and stop here
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-19A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ThirtyThreePercnt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThreePercntTestsCY509'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThrPctSuprtTestsCY509Ind'
V_PCT_33_SUPPORT_TEST_CY_X <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_33_SUPPORT_TEST_CY_X <- xml_text( xml_find_all( doc, V_PCT_33_SUPPORT_TEST_CY_X ) )




## VARIABLE NAME:  SA_03_PCT_33_SUPPORT_TEST_PY_X
## DESCRIPTION:  33.33 % Tests - Prior Year. If the organization did not check the boxes on line 17 and line 18; and line 14b is more than 33.33% and line 15a is less than 33.33%; check this box and stop here
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-19B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ThirtyThreePercntTestsPrior'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThreePercntTestsPY509'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ThirtyThrPctSuprtTestsPY509Ind'
V_PCT_33_SUPPORT_TEST_PY_X <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_33_SUPPORT_TEST_PY_X <- xml_text( xml_find_all( doc, V_PCT_33_SUPPORT_TEST_PY_X ) )




## VARIABLE NAME:  SA_03_PCT_PRIVATE_FOUNDATION_X
## DESCRIPTION:  Private Foundation. If the organization did not check the box on either line 14; 19a or 19b; check this box and see instructions
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-20
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PrivateFoundation'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PrivateFoundation509'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PrivateFoundation509Ind'
V_PCT_PRIVATE_FOUNDATION_X <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_PRIVATE_FOUNDATION_X <- xml_text( xml_find_all( doc, V_PCT_PRIVATE_FOUNDATION_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SA_03_PUB_GIFT_GRANT_CONTR_CY_M4,SA_03_PUB_GIFT_GRANT_CONTR_CY_M3,SA_03_PUB_GIFT_GRANT_CONTR_CY_M2,SA_03_PUB_GIFT_GRANT_CONTR_CY_M1,SA_03_PUB_GIFT_GRANT_CONTR_CY,SA_03_PUB_GIFT_GRANT_CONTR_TOT,SA_03_PUB_GRO_RCPT_ADM_CY_M4,SA_03_PUB_GRO_RCPT_ADM_CY_M3,SA_03_PUB_GRO_RCPT_ADM_CY_M2,SA_03_PUB_GRO_RCPT_ADM_CY_M1,SA_03_PUB_GRO_RCPT_ADM_CY,SA_03_PUB_GRO_RCPT_ADM_TOT,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1,SA_03_PUB_GRO_RCPT_NONUBIZ_CY,SA_03_PUB_GRO_RCPT_NONUBIZ_TOT,SA_03_PUB_TAXREV_LEVIED_CY_M4,SA_03_PUB_TAXREV_LEVIED_CY_M3,SA_03_PUB_TAXREV_LEVIED_CY_M2,SA_03_PUB_TAXREV_LEVIED_CY_M1,SA_03_PUB_TAXREV_LEVIED_CY,SA_03_PUB_TAXREV_LEVIED_TOT,SA_03_PUB_VALUE_SVC_GOVT_CY_M4,SA_03_PUB_VALUE_SVC_GOVT_CY_M3,SA_03_PUB_VALUE_SVC_GOVT_CY_M2,SA_03_PUB_VALUE_SVC_GOVT_CY_M1,SA_03_PUB_VALUE_SVC_GOVT_CY,SA_03_PUB_VALUE_SVC_GOVT_TOT,SA_03_PUB_TOT_L1_5_CY_M4,SA_03_PUB_TOT_L1_5_CY_M3,SA_03_PUB_TOT_L1_5_CY_M2,SA_03_PUB_TOT_L1_5_CY_M1,SA_03_PUB_TOT_L1_5_CY,SA_03_PUB_TOT_L1_5_TOT,SA_03_PUB_AMT_PERS_DSQ_CY_M4,SA_03_PUB_AMT_PERS_DSQ_CY_M3,SA_03_PUB_AMT_PERS_DSQ_CY_M2,SA_03_PUB_AMT_PERS_DSQ_CY_M1,SA_03_PUB_AMT_PERS_DSQ_CY,SA_03_PUB_AMT_PERS_DSQ_TOT,SA_03_PUB_AMT_CONTR_SBST_CY_M4,SA_03_PUB_AMT_CONTR_SBST_CY_M3,SA_03_PUB_AMT_CONTR_SBST_CY_M2,SA_03_PUB_AMT_CONTR_SBST_CY_M1,SA_03_PUB_AMT_CONTR_SBST_CY,SA_03_PUB_AMT_CONTR_SBST_TOT,SA_03_PUB_ADD_L7AB_CY_M4,SA_03_PUB_ADD_L7AB_CY_M3,SA_03_PUB_ADD_L7AB_CY_M2,SA_03_PUB_ADD_L7AB_CY_M1,SA_03_PUB_ADD_L7AB_CY,SA_03_PUB_ADD_L7AB_TOT,SA_03_PUB_SUPPORT_TOT,SA_03_TOT_AMT_L6_CY_M4,SA_03_TOT_AMT_L6_CY_M3,SA_03_TOT_AMT_L6_CY_M2,SA_03_TOT_AMT_L6_CY_M1,SA_03_TOT_AMT_L6_CY,SA_03_TOT_AMT_L6_TOT,SA_03_TOT_INCOME_GRO_CY_M4,SA_03_TOT_INCOME_GRO_CY_M3,SA_03_TOT_INCOME_GRO_CY_M2,SA_03_TOT_INCOME_GRO_CY_M1,SA_03_TOT_INCOME_GRO_CY,SA_03_TOT_INCOME_GRO_TOT,SA_03_TOT_INCOME_UBIZ_CY_M4,SA_03_TOT_INCOME_UBIZ_CY_M3,SA_03_TOT_INCOME_UBIZ_CY_M2,SA_03_TOT_INCOME_UBIZ_CY_M1,SA_03_TOT_INCOME_UBIZ_CY,SA_03_TOT_INCOME_UBIZ_TOT,SA_03_TOT_ADD_L10AB_CY_M4,SA_03_TOT_ADD_L10AB_CY_M3,SA_03_TOT_ADD_L10AB_CY_M2,SA_03_TOT_ADD_L10AB_CY_M1,SA_03_TOT_ADD_L10AB_CY,SA_03_TOT_ADD_L10AB_TOT,SA_03_TOT_INCOME_NET_UBIZ_CY_M4,SA_03_TOT_INCOME_NET_UBIZ_CY_M3,SA_03_TOT_INCOME_NET_UBIZ_CY_M2,SA_03_TOT_INCOME_NET_UBIZ_CY_M1,SA_03_TOT_INCOME_NET_UBIZ_CY,SA_03_TOT_INCOME_NET_UBIZ_TOT,SA_03_TOT_INCOME_OTH_CY_M4,SA_03_TOT_INCOME_OTH_CY_M3,SA_03_TOT_INCOME_OTH_CY_M2,SA_03_TOT_INCOME_OTH_CY_M1,SA_03_TOT_INCOME_OTH_CY,SA_03_TOT_INCOME_OTH_TOT,SA_03_TOT_SUPPORT_CY_M4,SA_03_TOT_SUPPORT_CY_M3,SA_03_TOT_SUPPORT_CY_M2,SA_03_TOT_SUPPORT_CY_M1,SA_03_TOT_SUPPORT_CY,SA_03_TOT_SUPPORT_TOT,SA_03_TOT_FIRST_5Y_X,SA_03_PCT_PUB_SUPPORT_CY,SA_03_PCT_PUB_SUPPORT_PY,SA_03_PCT_INVEST_INCOME_CY,SA_03_PCT_INVEST_INCOME_PY,SA_03_PCT_33_SUPPORT_TEST_CY_X,SA_03_PCT_33_SUPPORT_TEST_PY_X,SA_03_PCT_PRIVATE_FOUNDATION_X)
df <- as.data.frame( var.list )


return( df )


}


