#' @title 
#'   Build table SA-P03-T00-SUPPORT_SCHEDULE_509
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P03_T00_SUPPORT_SCHEDULE_509 <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


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
SA_03_PUB_AMT_PERS_DSQ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY ) )
if( length( SA_03_PUB_AMT_PERS_DSQ_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_PERS_DSQ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_PERS_DSQ_CY <-  paste0( '{', SA_03_PUB_AMT_PERS_DSQ_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_PERS_DSQ_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M1 ) )
if( length( SA_03_PUB_AMT_PERS_DSQ_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_PERS_DSQ_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_PERS_DSQ_CY_M1 <-  paste0( '{', SA_03_PUB_AMT_PERS_DSQ_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_PERS_DSQ_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M2 ) )
if( length( SA_03_PUB_AMT_PERS_DSQ_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_PERS_DSQ_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_PERS_DSQ_CY_M2 <-  paste0( '{', SA_03_PUB_AMT_PERS_DSQ_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_PERS_DSQ_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M3 ) )
if( length( SA_03_PUB_AMT_PERS_DSQ_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_PERS_DSQ_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_PERS_DSQ_CY_M3 <-  paste0( '{', SA_03_PUB_AMT_PERS_DSQ_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_PERS_DSQ_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_PERS_DSQ_CY_M4 ) )
if( length( SA_03_PUB_AMT_PERS_DSQ_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_PERS_DSQ_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_PERS_DSQ_CY_M4 <-  paste0( '{', SA_03_PUB_AMT_PERS_DSQ_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_PERS_DSQ_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_PERS_DSQ_TOT ) )
if( length( SA_03_PUB_AMT_PERS_DSQ_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_PERS_DSQ_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_PERS_DSQ_TOT <-  paste0( '{', SA_03_PUB_AMT_PERS_DSQ_TOT, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_CONTR_SBST_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY ) )
if( length( SA_03_PUB_AMT_CONTR_SBST_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_CONTR_SBST_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_CONTR_SBST_CY <-  paste0( '{', SA_03_PUB_AMT_CONTR_SBST_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_CONTR_SBST_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M1 ) )
if( length( SA_03_PUB_AMT_CONTR_SBST_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_CONTR_SBST_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_CONTR_SBST_CY_M1 <-  paste0( '{', SA_03_PUB_AMT_CONTR_SBST_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_CONTR_SBST_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M2 ) )
if( length( SA_03_PUB_AMT_CONTR_SBST_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_CONTR_SBST_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_CONTR_SBST_CY_M2 <-  paste0( '{', SA_03_PUB_AMT_CONTR_SBST_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_CONTR_SBST_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M3 ) )
if( length( SA_03_PUB_AMT_CONTR_SBST_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_CONTR_SBST_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_CONTR_SBST_CY_M3 <-  paste0( '{', SA_03_PUB_AMT_CONTR_SBST_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_CONTR_SBST_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_CONTR_SBST_CY_M4 ) )
if( length( SA_03_PUB_AMT_CONTR_SBST_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_CONTR_SBST_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_CONTR_SBST_CY_M4 <-  paste0( '{', SA_03_PUB_AMT_CONTR_SBST_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_PUB_AMT_CONTR_SBST_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_AMT_CONTR_SBST_TOT ) )
if( length( SA_03_PUB_AMT_CONTR_SBST_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_AMT_CONTR_SBST_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_AMT_CONTR_SBST_TOT <-  paste0( '{', SA_03_PUB_AMT_CONTR_SBST_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_FIRST_5Y_X
## DESCRIPTION:  First five years?
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-14
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/First5Years509'
V2 <- '//Return/ReturnData/IRS990ScheduleA/First5Years509Ind'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/First5Years'
V_TOT_FIRST_5Y_X <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_FIRST_5Y_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_FIRST_5Y_X ) )
if( length( SA_03_TOT_FIRST_5Y_X ) > 1 )
{ 
  create_record( varname=SA_03_TOT_FIRST_5Y_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_FIRST_5Y_X <-  paste0( '{', SA_03_TOT_FIRST_5Y_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYear' ) )
if( length( SA_03_TOT_AMT_L6_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_AMT_L6_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_AMT_L6_CY <-  paste0( '{', SA_03_TOT_AMT_L6_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus1Year' ) )
if( length( SA_03_TOT_AMT_L6_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_AMT_L6_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_AMT_L6_CY_M1 <-  paste0( '{', SA_03_TOT_AMT_L6_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus2Years' ) )
if( length( SA_03_TOT_AMT_L6_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_AMT_L6_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_AMT_L6_CY_M2 <-  paste0( '{', SA_03_TOT_AMT_L6_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus3Years' ) )
if( length( SA_03_TOT_AMT_L6_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_AMT_L6_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_AMT_L6_CY_M3 <-  paste0( '{', SA_03_TOT_AMT_L6_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_AMT_L6_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/CurrentTaxYearMinus4Years' ) )
if( length( SA_03_TOT_AMT_L6_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_AMT_L6_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_AMT_L6_CY_M4 <-  paste0( '{', SA_03_TOT_AMT_L6_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_AMT_L6_TOT
## DESCRIPTION:  Amts From Line6 - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-09-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

SA_03_TOT_AMT_L6_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/AmtsFromLine6/Total' ) )
if( length( SA_03_TOT_AMT_L6_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_AMT_L6_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_AMT_L6_TOT <-  paste0( '{', SA_03_TOT_AMT_L6_TOT, '}', collapse=';' ) 
} 




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
SA_03_PUB_GIFT_GRANT_CONTR_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY ) )
if( length( SA_03_PUB_GIFT_GRANT_CONTR_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GIFT_GRANT_CONTR_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GIFT_GRANT_CONTR_CY <-  paste0( '{', SA_03_PUB_GIFT_GRANT_CONTR_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_GIFT_GRANT_CONTR_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M1 ) )
if( length( SA_03_PUB_GIFT_GRANT_CONTR_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GIFT_GRANT_CONTR_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GIFT_GRANT_CONTR_CY_M1 <-  paste0( '{', SA_03_PUB_GIFT_GRANT_CONTR_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_PUB_GIFT_GRANT_CONTR_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M2 ) )
if( length( SA_03_PUB_GIFT_GRANT_CONTR_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GIFT_GRANT_CONTR_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GIFT_GRANT_CONTR_CY_M2 <-  paste0( '{', SA_03_PUB_GIFT_GRANT_CONTR_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_PUB_GIFT_GRANT_CONTR_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M3 ) )
if( length( SA_03_PUB_GIFT_GRANT_CONTR_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GIFT_GRANT_CONTR_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GIFT_GRANT_CONTR_CY_M3 <-  paste0( '{', SA_03_PUB_GIFT_GRANT_CONTR_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_PUB_GIFT_GRANT_CONTR_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_CY_M4 ) )
if( length( SA_03_PUB_GIFT_GRANT_CONTR_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GIFT_GRANT_CONTR_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GIFT_GRANT_CONTR_CY_M4 <-  paste0( '{', SA_03_PUB_GIFT_GRANT_CONTR_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_PUB_GIFT_GRANT_CONTR_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GIFT_GRANT_CONTR_TOT ) )
if( length( SA_03_PUB_GIFT_GRANT_CONTR_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GIFT_GRANT_CONTR_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GIFT_GRANT_CONTR_TOT <-  paste0( '{', SA_03_PUB_GIFT_GRANT_CONTR_TOT, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_GRO_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY ) )
if( length( SA_03_TOT_INCOME_GRO_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_GRO_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_GRO_CY <-  paste0( '{', SA_03_TOT_INCOME_GRO_CY, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_GRO_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M1 ) )
if( length( SA_03_TOT_INCOME_GRO_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_GRO_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_GRO_CY_M1 <-  paste0( '{', SA_03_TOT_INCOME_GRO_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_GRO_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M2 ) )
if( length( SA_03_TOT_INCOME_GRO_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_GRO_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_GRO_CY_M2 <-  paste0( '{', SA_03_TOT_INCOME_GRO_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_GRO_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M3 ) )
if( length( SA_03_TOT_INCOME_GRO_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_GRO_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_GRO_CY_M3 <-  paste0( '{', SA_03_TOT_INCOME_GRO_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_GRO_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_CY_M4 ) )
if( length( SA_03_TOT_INCOME_GRO_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_GRO_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_GRO_CY_M4 <-  paste0( '{', SA_03_TOT_INCOME_GRO_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_GRO_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_GRO_TOT ) )
if( length( SA_03_TOT_INCOME_GRO_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_GRO_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_GRO_TOT <-  paste0( '{', SA_03_TOT_INCOME_GRO_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYear'
V_PUB_GRO_RCPT_ADM_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY ) )
if( length( SA_03_PUB_GRO_RCPT_ADM_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_ADM_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_ADM_CY <-  paste0( '{', SA_03_PUB_GRO_RCPT_ADM_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus1YearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus1Year'
V_PUB_GRO_RCPT_ADM_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M1 ) )
if( length( SA_03_PUB_GRO_RCPT_ADM_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_ADM_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_ADM_CY_M1 <-  paste0( '{', SA_03_PUB_GRO_RCPT_ADM_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus2YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus2Years'
V_PUB_GRO_RCPT_ADM_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M2 ) )
if( length( SA_03_PUB_GRO_RCPT_ADM_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_ADM_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_ADM_CY_M2 <-  paste0( '{', SA_03_PUB_GRO_RCPT_ADM_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus3YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus3Years'
V_PUB_GRO_RCPT_ADM_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M3 ) )
if( length( SA_03_PUB_GRO_RCPT_ADM_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_ADM_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_ADM_CY_M3 <-  paste0( '{', SA_03_PUB_GRO_RCPT_ADM_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/CurrentTaxYearMinus4YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/CurrentTaxYearMinus4Years'
V_PUB_GRO_RCPT_ADM_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_ADM_CY_M4 ) )
if( length( SA_03_PUB_GRO_RCPT_ADM_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_ADM_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_ADM_CY_M4 <-  paste0( '{', SA_03_PUB_GRO_RCPT_ADM_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_GRO_RCPT_ADM_TOT
## DESCRIPTION:  Gross Receipts From Admissions - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-02-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/GrossReceiptsFromAdmissions/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsAdmissionsGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/GrossReceiptsFromAdmissions/Total'
V_PUB_GRO_RCPT_ADM_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_GRO_RCPT_ADM_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_ADM_TOT ) )
if( length( SA_03_PUB_GRO_RCPT_ADM_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_ADM_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_ADM_TOT <-  paste0( '{', SA_03_PUB_GRO_RCPT_ADM_TOT, '}', collapse=';' ) 
} 




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
SA_03_PUB_GRO_RCPT_NONUBIZ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY ) )
if( length( SA_03_PUB_GRO_RCPT_NONUBIZ_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_NONUBIZ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_NONUBIZ_CY <-  paste0( '{', SA_03_PUB_GRO_RCPT_NONUBIZ_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M1 ) )
if( length( SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1 <-  paste0( '{', SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M2 ) )
if( length( SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2 <-  paste0( '{', SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M3 ) )
if( length( SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3 <-  paste0( '{', SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_CY_M4 ) )
if( length( SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4 <-  paste0( '{', SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_PUB_GRO_RCPT_NONUBIZ_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_GRO_RCPT_NONUBIZ_TOT ) )
if( length( SA_03_PUB_GRO_RCPT_NONUBIZ_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_GRO_RCPT_NONUBIZ_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_GRO_RCPT_NONUBIZ_TOT <-  paste0( '{', SA_03_PUB_GRO_RCPT_NONUBIZ_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PCT_INVEST_INCOME_CY
## DESCRIPTION:  Investment income percentage (line 10c column (f) divided by line 13 column(f))
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-17
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/InvestmentIncomePercentage'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeCYPct'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomePercentage'
V_PCT_INVEST_INCOME_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_INVEST_INCOME_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_INVEST_INCOME_CY ) )
if( length( SA_03_PCT_INVEST_INCOME_CY ) > 1 )
{ 
  create_record( varname=SA_03_PCT_INVEST_INCOME_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_INVEST_INCOME_CY <-  paste0( '{', SA_03_PCT_INVEST_INCOME_CY, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_NET_UBIZ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY ) )
if( length( SA_03_TOT_INCOME_NET_UBIZ_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_NET_UBIZ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_NET_UBIZ_CY <-  paste0( '{', SA_03_TOT_INCOME_NET_UBIZ_CY, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_NET_UBIZ_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M1 ) )
if( length( SA_03_TOT_INCOME_NET_UBIZ_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_NET_UBIZ_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_NET_UBIZ_CY_M1 <-  paste0( '{', SA_03_TOT_INCOME_NET_UBIZ_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_NET_UBIZ_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M2 ) )
if( length( SA_03_TOT_INCOME_NET_UBIZ_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_NET_UBIZ_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_NET_UBIZ_CY_M2 <-  paste0( '{', SA_03_TOT_INCOME_NET_UBIZ_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_NET_UBIZ_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M3 ) )
if( length( SA_03_TOT_INCOME_NET_UBIZ_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_NET_UBIZ_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_NET_UBIZ_CY_M3 <-  paste0( '{', SA_03_TOT_INCOME_NET_UBIZ_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_NET_UBIZ_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_CY_M4 ) )
if( length( SA_03_TOT_INCOME_NET_UBIZ_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_NET_UBIZ_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_NET_UBIZ_CY_M4 <-  paste0( '{', SA_03_TOT_INCOME_NET_UBIZ_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_NET_UBIZ_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_NET_UBIZ_TOT ) )
if( length( SA_03_TOT_INCOME_NET_UBIZ_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_NET_UBIZ_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_NET_UBIZ_TOT <-  paste0( '{', SA_03_TOT_INCOME_NET_UBIZ_TOT, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_OTH_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY ) )
if( length( SA_03_TOT_INCOME_OTH_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_OTH_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_OTH_CY <-  paste0( '{', SA_03_TOT_INCOME_OTH_CY, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_OTH_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M1 ) )
if( length( SA_03_TOT_INCOME_OTH_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_OTH_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_OTH_CY_M1 <-  paste0( '{', SA_03_TOT_INCOME_OTH_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_OTH_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M2 ) )
if( length( SA_03_TOT_INCOME_OTH_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_OTH_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_OTH_CY_M2 <-  paste0( '{', SA_03_TOT_INCOME_OTH_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_OTH_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M3 ) )
if( length( SA_03_TOT_INCOME_OTH_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_OTH_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_OTH_CY_M3 <-  paste0( '{', SA_03_TOT_INCOME_OTH_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_OTH_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_CY_M4 ) )
if( length( SA_03_TOT_INCOME_OTH_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_OTH_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_OTH_CY_M4 <-  paste0( '{', SA_03_TOT_INCOME_OTH_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_OTH_TOT ) )
if( length( SA_03_TOT_INCOME_OTH_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_OTH_TOT <-  paste0( '{', SA_03_TOT_INCOME_OTH_TOT, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_UBIZ_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_UBIZ_CY ) )
if( length( SA_03_TOT_INCOME_UBIZ_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_UBIZ_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_UBIZ_CY <-  paste0( '{', SA_03_TOT_INCOME_UBIZ_CY, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_UBIZ_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M1 ) )
if( length( SA_03_TOT_INCOME_UBIZ_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_UBIZ_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_UBIZ_CY_M1 <-  paste0( '{', SA_03_TOT_INCOME_UBIZ_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_UBIZ_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M2 ) )
if( length( SA_03_TOT_INCOME_UBIZ_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_UBIZ_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_UBIZ_CY_M2 <-  paste0( '{', SA_03_TOT_INCOME_UBIZ_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_UBIZ_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M3 ) )
if( length( SA_03_TOT_INCOME_UBIZ_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_UBIZ_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_UBIZ_CY_M3 <-  paste0( '{', SA_03_TOT_INCOME_UBIZ_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_UBIZ_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_UBIZ_CY_M4 ) )
if( length( SA_03_TOT_INCOME_UBIZ_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_UBIZ_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_UBIZ_CY_M4 <-  paste0( '{', SA_03_TOT_INCOME_UBIZ_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_TOT_INCOME_UBIZ_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_INCOME_UBIZ_TOT ) )
if( length( SA_03_TOT_INCOME_UBIZ_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_INCOME_UBIZ_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_INCOME_UBIZ_TOT <-  paste0( '{', SA_03_TOT_INCOME_UBIZ_TOT, '}', collapse=';' ) 
} 




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
SA_03_PCT_PUB_SUPPORT_PY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_PUB_SUPPORT_PY ) )
if( length( SA_03_PCT_PUB_SUPPORT_PY ) > 1 )
{ 
  create_record( varname=SA_03_PCT_PUB_SUPPORT_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_PUB_SUPPORT_PY <-  paste0( '{', SA_03_PCT_PUB_SUPPORT_PY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PCT_INVEST_INCOME_PY
## DESCRIPTION:  Investment income percentage from prior year's Schedule A; Part III; line 15a
## LOCATION:  SCHED-A-PART-03-SECTION-D-LINE-18
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PriorYrInvestIncomePercentage'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomePYPct'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PriorYrInvestIncomePercentage'
V_PCT_INVEST_INCOME_PY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_INVEST_INCOME_PY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_INVEST_INCOME_PY ) )
if( length( SA_03_PCT_INVEST_INCOME_PY ) > 1 )
{ 
  create_record( varname=SA_03_PCT_INVEST_INCOME_PY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_INVEST_INCOME_PY <-  paste0( '{', SA_03_PCT_INVEST_INCOME_PY, '}', collapse=';' ) 
} 




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
SA_03_PCT_PRIVATE_FOUNDATION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_PRIVATE_FOUNDATION_X ) )
if( length( SA_03_PCT_PRIVATE_FOUNDATION_X ) > 1 )
{ 
  create_record( varname=SA_03_PCT_PRIVATE_FOUNDATION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_PRIVATE_FOUNDATION_X <-  paste0( '{', SA_03_PCT_PRIVATE_FOUNDATION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PCT_PUB_SUPPORT_CY
## DESCRIPTION:  Public support percentage (line 8 column(f) divided by line 13 column(f))
## LOCATION:  SCHED-A-PART-03-SECTION-C-LINE-15
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/PublicSupportPercentage'
V2 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportCY509Pct'
V3 <- '//Return/ReturnData/IRS990ScheduleA/PublicSupportPercentage509'
V_PCT_PUB_SUPPORT_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PCT_PUB_SUPPORT_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_PUB_SUPPORT_CY ) )
if( length( SA_03_PCT_PUB_SUPPORT_CY ) > 1 )
{ 
  create_record( varname=SA_03_PCT_PUB_SUPPORT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_PUB_SUPPORT_CY <-  paste0( '{', SA_03_PCT_PUB_SUPPORT_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_SUPPORT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_SUPPORT_TOT ) )
if( length( SA_03_PUB_SUPPORT_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_SUPPORT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_SUPPORT_TOT <-  paste0( '{', SA_03_PUB_SUPPORT_TOT, '}', collapse=';' ) 
} 




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
SA_03_PUB_TAXREV_LEVIED_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY ) )
if( length( SA_03_PUB_TAXREV_LEVIED_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TAXREV_LEVIED_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TAXREV_LEVIED_CY <-  paste0( '{', SA_03_PUB_TAXREV_LEVIED_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_TAXREV_LEVIED_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M1 ) )
if( length( SA_03_PUB_TAXREV_LEVIED_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TAXREV_LEVIED_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TAXREV_LEVIED_CY_M1 <-  paste0( '{', SA_03_PUB_TAXREV_LEVIED_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_PUB_TAXREV_LEVIED_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M2 ) )
if( length( SA_03_PUB_TAXREV_LEVIED_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TAXREV_LEVIED_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TAXREV_LEVIED_CY_M2 <-  paste0( '{', SA_03_PUB_TAXREV_LEVIED_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_PUB_TAXREV_LEVIED_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M3 ) )
if( length( SA_03_PUB_TAXREV_LEVIED_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TAXREV_LEVIED_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TAXREV_LEVIED_CY_M3 <-  paste0( '{', SA_03_PUB_TAXREV_LEVIED_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_PUB_TAXREV_LEVIED_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_CY_M4 ) )
if( length( SA_03_PUB_TAXREV_LEVIED_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TAXREV_LEVIED_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TAXREV_LEVIED_CY_M4 <-  paste0( '{', SA_03_PUB_TAXREV_LEVIED_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_TAXREV_LEVIED_TOT
## DESCRIPTION:  Tax Revenues Levied For Org Benefit - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-04-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TaxRevenuesLeviedForOrgBenefit/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedForOrgBenefit509/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TaxRevLeviedOrgnztnlBnft509Grp/TotalAmt'
V_PUB_TAXREV_LEVIED_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_TAXREV_LEVIED_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TAXREV_LEVIED_TOT ) )
if( length( SA_03_PUB_TAXREV_LEVIED_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TAXREV_LEVIED_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TAXREV_LEVIED_TOT <-  paste0( '{', SA_03_PUB_TAXREV_LEVIED_TOT, '}', collapse=';' ) 
} 




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
SA_03_PCT_33_SUPPORT_TEST_CY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_33_SUPPORT_TEST_CY_X ) )
if( length( SA_03_PCT_33_SUPPORT_TEST_CY_X ) > 1 )
{ 
  create_record( varname=SA_03_PCT_33_SUPPORT_TEST_CY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_33_SUPPORT_TEST_CY_X <-  paste0( '{', SA_03_PCT_33_SUPPORT_TEST_CY_X, '}', collapse=';' ) 
} 




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
SA_03_PCT_33_SUPPORT_TEST_PY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_33_SUPPORT_TEST_PY_X ) )
if( length( SA_03_PCT_33_SUPPORT_TEST_PY_X ) > 1 )
{ 
  create_record( varname=SA_03_PCT_33_SUPPORT_TEST_PY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PCT_33_SUPPORT_TEST_PY_X <-  paste0( '{', SA_03_PCT_33_SUPPORT_TEST_PY_X, '}', collapse=';' ) 
} 




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
SA_03_PUB_TOT_L1_5_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L1_5_CY ) )
if( length( SA_03_PUB_TOT_L1_5_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TOT_L1_5_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TOT_L1_5_CY <-  paste0( '{', SA_03_PUB_TOT_L1_5_CY, '}', collapse=';' ) 
} 




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
SA_03_PUB_TOT_L1_5_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L1_5_CY_M1 ) )
if( length( SA_03_PUB_TOT_L1_5_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TOT_L1_5_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TOT_L1_5_CY_M1 <-  paste0( '{', SA_03_PUB_TOT_L1_5_CY_M1, '}', collapse=';' ) 
} 




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
SA_03_PUB_TOT_L1_5_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L1_5_CY_M2 ) )
if( length( SA_03_PUB_TOT_L1_5_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TOT_L1_5_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TOT_L1_5_CY_M2 <-  paste0( '{', SA_03_PUB_TOT_L1_5_CY_M2, '}', collapse=';' ) 
} 




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
SA_03_PUB_TOT_L1_5_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L1_5_CY_M3 ) )
if( length( SA_03_PUB_TOT_L1_5_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TOT_L1_5_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TOT_L1_5_CY_M3 <-  paste0( '{', SA_03_PUB_TOT_L1_5_CY_M3, '}', collapse=';' ) 
} 




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
SA_03_PUB_TOT_L1_5_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L1_5_CY_M4 ) )
if( length( SA_03_PUB_TOT_L1_5_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TOT_L1_5_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TOT_L1_5_CY_M4 <-  paste0( '{', SA_03_PUB_TOT_L1_5_CY_M4, '}', collapse=';' ) 
} 




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
SA_03_PUB_TOT_L1_5_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_TOT_L1_5_TOT ) )
if( length( SA_03_PUB_TOT_L1_5_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_TOT_L1_5_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_TOT_L1_5_TOT <-  paste0( '{', SA_03_PUB_TOT_L1_5_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYear'
V_PUB_ADD_L7AB_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_ADD_L7AB_CY ) )
if( length( SA_03_PUB_ADD_L7AB_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_ADD_L7AB_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_ADD_L7AB_CY <-  paste0( '{', SA_03_PUB_ADD_L7AB_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus1YearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus1Year'
V_PUB_ADD_L7AB_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_ADD_L7AB_CY_M1 ) )
if( length( SA_03_PUB_ADD_L7AB_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_ADD_L7AB_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_ADD_L7AB_CY_M1 <-  paste0( '{', SA_03_PUB_ADD_L7AB_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus2YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus2Years'
V_PUB_ADD_L7AB_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_ADD_L7AB_CY_M2 ) )
if( length( SA_03_PUB_ADD_L7AB_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_ADD_L7AB_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_ADD_L7AB_CY_M2 <-  paste0( '{', SA_03_PUB_ADD_L7AB_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus3YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus3Years'
V_PUB_ADD_L7AB_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_ADD_L7AB_CY_M3 ) )
if( length( SA_03_PUB_ADD_L7AB_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_ADD_L7AB_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_ADD_L7AB_CY_M3 <-  paste0( '{', SA_03_PUB_ADD_L7AB_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/CurrentTaxYearMinus4YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/CurrentTaxYearMinus4Years'
V_PUB_ADD_L7AB_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_ADD_L7AB_CY_M4 ) )
if( length( SA_03_PUB_ADD_L7AB_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_ADD_L7AB_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_ADD_L7AB_CY_M4 <-  paste0( '{', SA_03_PUB_ADD_L7AB_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_ADD_L7AB_TOT
## DESCRIPTION:  Total Of7a And7b - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-07C-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOf7aAnd7b/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/SubstAndDsqlfyPrsnsTotGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/SupportFromDQPsEtc/Total'
V_PUB_ADD_L7AB_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_ADD_L7AB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_ADD_L7AB_TOT ) )
if( length( SA_03_PUB_ADD_L7AB_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_ADD_L7AB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_ADD_L7AB_TOT <-  paste0( '{', SA_03_PUB_ADD_L7AB_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYear'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearAmt'
V_TOT_ADD_L10AB_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_ADD_L10AB_CY ) )
if( length( SA_03_TOT_ADD_L10AB_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_ADD_L10AB_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_ADD_L10AB_CY <-  paste0( '{', SA_03_TOT_ADD_L10AB_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus1Year'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus1YearAmt'
V_TOT_ADD_L10AB_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_ADD_L10AB_CY_M1 ) )
if( length( SA_03_TOT_ADD_L10AB_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_ADD_L10AB_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_ADD_L10AB_CY_M1 <-  paste0( '{', SA_03_TOT_ADD_L10AB_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus2Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus2YearsAmt'
V_TOT_ADD_L10AB_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_ADD_L10AB_CY_M2 ) )
if( length( SA_03_TOT_ADD_L10AB_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_ADD_L10AB_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_ADD_L10AB_CY_M2 <-  paste0( '{', SA_03_TOT_ADD_L10AB_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus3Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus3YearsAmt'
V_TOT_ADD_L10AB_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_ADD_L10AB_CY_M3 ) )
if( length( SA_03_TOT_ADD_L10AB_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_ADD_L10AB_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_ADD_L10AB_CY_M3 <-  paste0( '{', SA_03_TOT_ADD_L10AB_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/CurrentTaxYearMinus4Years'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/CurrentTaxYearMinus4YearsAmt'
V_TOT_ADD_L10AB_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_ADD_L10AB_CY_M4 ) )
if( length( SA_03_TOT_ADD_L10AB_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_ADD_L10AB_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_ADD_L10AB_CY_M4 <-  paste0( '{', SA_03_TOT_ADD_L10AB_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_ADD_L10AB_TOT
## DESCRIPTION:  Total Of Lines10a And10b - Total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-10C-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalOfLines10aAnd10b/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTI/Total'
V3 <- '//Return/ReturnData/IRS990ScheduleA/InvestmentIncomeAndUBTIGrp/TotalAmt'
V_TOT_ADD_L10AB_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_TOT_ADD_L10AB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_ADD_L10AB_TOT ) )
if( length( SA_03_TOT_ADD_L10AB_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_ADD_L10AB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_ADD_L10AB_TOT <-  paste0( '{', SA_03_TOT_ADD_L10AB_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_SUPPORT_TOT
## DESCRIPTION:  Total support total
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/TotalSupportTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal'
V4 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/Total'
V_TOT_SUPPORT_TOT <- paste( V1, V2, V3, V4 , sep='|' )
SA_03_TOT_SUPPORT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_TOT ) )
if( length( SA_03_TOT_SUPPORT_TOT ) > 1 )
{ 
  create_record( varname=SA_03_TOT_SUPPORT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_SUPPORT_TOT <-  paste0( '{', SA_03_TOT_SUPPORT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYear'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYear'
V_PUB_VALUE_SVC_GOVT_CY <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY ) )
if( length( SA_03_PUB_VALUE_SVC_GOVT_CY ) > 1 )
{ 
  create_record( varname=SA_03_PUB_VALUE_SVC_GOVT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_VALUE_SVC_GOVT_CY <-  paste0( '{', SA_03_PUB_VALUE_SVC_GOVT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus1Year'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus1YearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus1Year'
V_PUB_VALUE_SVC_GOVT_CY_M1 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M1 ) )
if( length( SA_03_PUB_VALUE_SVC_GOVT_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_VALUE_SVC_GOVT_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_VALUE_SVC_GOVT_CY_M1 <-  paste0( '{', SA_03_PUB_VALUE_SVC_GOVT_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus2Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus2YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus2Years'
V_PUB_VALUE_SVC_GOVT_CY_M2 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M2 ) )
if( length( SA_03_PUB_VALUE_SVC_GOVT_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_VALUE_SVC_GOVT_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_VALUE_SVC_GOVT_CY_M2 <-  paste0( '{', SA_03_PUB_VALUE_SVC_GOVT_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus3Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus3YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus3Years'
V_PUB_VALUE_SVC_GOVT_CY_M3 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M3 ) )
if( length( SA_03_PUB_VALUE_SVC_GOVT_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_VALUE_SVC_GOVT_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_VALUE_SVC_GOVT_CY_M3 <-  paste0( '{', SA_03_PUB_VALUE_SVC_GOVT_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus4Years'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/CurrentTaxYearMinus4YearsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/CurrentTaxYearMinus4Years'
V_PUB_VALUE_SVC_GOVT_CY_M4 <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_CY_M4 ) )
if( length( SA_03_PUB_VALUE_SVC_GOVT_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_PUB_VALUE_SVC_GOVT_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_VALUE_SVC_GOVT_CY_M4 <-  paste0( '{', SA_03_PUB_VALUE_SVC_GOVT_CY_M4, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_PUB_VALUE_SVC_GOVT_TOT
## DESCRIPTION:  Value Of Svcs Fclts Furnishd By Govt - Total
## LOCATION:  SCHED-A-PART-03-SECTION-A-LINE-05-COL-F
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartIII/ValueOfSvcsFcltsFurnishdByGovt/Total'
V2 <- '//Return/ReturnData/IRS990ScheduleA/GovtFurnSrvcFcltsVl509Grp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleA/ValueOfSvcsFcltsFurnishdByGovt/Total'
V_PUB_VALUE_SVC_GOVT_TOT <- paste( V1, V2, V3 , sep='|' )
SA_03_PUB_VALUE_SVC_GOVT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PUB_VALUE_SVC_GOVT_TOT ) )
if( length( SA_03_PUB_VALUE_SVC_GOVT_TOT ) > 1 )
{ 
  create_record( varname=SA_03_PUB_VALUE_SVC_GOVT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_PUB_VALUE_SVC_GOVT_TOT <-  paste0( '{', SA_03_PUB_VALUE_SVC_GOVT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY
## DESCRIPTION:  Current tax year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-E
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYear'
V_TOT_SUPPORT_CY <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_CY ) )
if( length( SA_03_TOT_SUPPORT_CY ) > 1 )
{ 
  create_record( varname=SA_03_TOT_SUPPORT_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_SUPPORT_CY <-  paste0( '{', SA_03_TOT_SUPPORT_CY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M1
## DESCRIPTION:  Current tax year minus one year
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-D
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus1YearAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus1Year'
V_TOT_SUPPORT_CY_M1 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M1 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_CY_M1 ) )
if( length( SA_03_TOT_SUPPORT_CY_M1 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_SUPPORT_CY_M1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_SUPPORT_CY_M1 <-  paste0( '{', SA_03_TOT_SUPPORT_CY_M1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M2
## DESCRIPTION:  Current tax year minus two years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-C
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus2YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus2Years'
V_TOT_SUPPORT_CY_M2 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M2 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_CY_M2 ) )
if( length( SA_03_TOT_SUPPORT_CY_M2 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_SUPPORT_CY_M2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_SUPPORT_CY_M2 <-  paste0( '{', SA_03_TOT_SUPPORT_CY_M2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M3
## DESCRIPTION:  Current tax year minus three years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-B
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus3YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus3Years'
V_TOT_SUPPORT_CY_M3 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M3 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_CY_M3 ) )
if( length( SA_03_TOT_SUPPORT_CY_M3 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_SUPPORT_CY_M3, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_SUPPORT_CY_M3 <-  paste0( '{', SA_03_TOT_SUPPORT_CY_M3, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_03_TOT_SUPPORT_CY_M4
## DESCRIPTION:  Current tax year minus four years
## LOCATION:  SCHED-A-PART-03-SECTION-B-LINE-13-COL-A
## TABLE:  SA-P03-T00-SUPPORT_SCHEDULE_509
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportCalendarYearGrp/CurrentTaxYearMinus4YearsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleA/TotalSupportTotal/CurrentTaxYearMinus4Years'
V_TOT_SUPPORT_CY_M4 <- paste( V1, V2 , sep='|' )
SA_03_TOT_SUPPORT_CY_M4 <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_SUPPORT_CY_M4 ) )
if( length( SA_03_TOT_SUPPORT_CY_M4 ) > 1 )
{ 
  create_record( varname=SA_03_TOT_SUPPORT_CY_M4, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_03_TOT_SUPPORT_CY_M4 <-  paste0( '{', SA_03_TOT_SUPPORT_CY_M4, '}', collapse=';' ) 
} 




var.list <- 
namedList(SA_03_PUB_AMT_PERS_DSQ_CY,SA_03_PUB_AMT_PERS_DSQ_CY_M1,SA_03_PUB_AMT_PERS_DSQ_CY_M2,SA_03_PUB_AMT_PERS_DSQ_CY_M3,SA_03_PUB_AMT_PERS_DSQ_CY_M4,SA_03_PUB_AMT_PERS_DSQ_TOT,SA_03_PUB_AMT_CONTR_SBST_CY,SA_03_PUB_AMT_CONTR_SBST_CY_M1,SA_03_PUB_AMT_CONTR_SBST_CY_M2,SA_03_PUB_AMT_CONTR_SBST_CY_M3,SA_03_PUB_AMT_CONTR_SBST_CY_M4,SA_03_PUB_AMT_CONTR_SBST_TOT,SA_03_TOT_FIRST_5Y_X,SA_03_TOT_AMT_L6_CY,SA_03_TOT_AMT_L6_CY_M1,SA_03_TOT_AMT_L6_CY_M2,SA_03_TOT_AMT_L6_CY_M3,SA_03_TOT_AMT_L6_CY_M4,SA_03_TOT_AMT_L6_TOT,SA_03_PUB_GIFT_GRANT_CONTR_CY,SA_03_PUB_GIFT_GRANT_CONTR_CY_M1,SA_03_PUB_GIFT_GRANT_CONTR_CY_M2,SA_03_PUB_GIFT_GRANT_CONTR_CY_M3,SA_03_PUB_GIFT_GRANT_CONTR_CY_M4,SA_03_PUB_GIFT_GRANT_CONTR_TOT,SA_03_TOT_INCOME_GRO_CY,SA_03_TOT_INCOME_GRO_CY_M1,SA_03_TOT_INCOME_GRO_CY_M2,SA_03_TOT_INCOME_GRO_CY_M3,SA_03_TOT_INCOME_GRO_CY_M4,SA_03_TOT_INCOME_GRO_TOT,SA_03_PUB_GRO_RCPT_ADM_CY,SA_03_PUB_GRO_RCPT_ADM_CY_M1,SA_03_PUB_GRO_RCPT_ADM_CY_M2,SA_03_PUB_GRO_RCPT_ADM_CY_M3,SA_03_PUB_GRO_RCPT_ADM_CY_M4,SA_03_PUB_GRO_RCPT_ADM_TOT,SA_03_PUB_GRO_RCPT_NONUBIZ_CY,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M1,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M2,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M3,SA_03_PUB_GRO_RCPT_NONUBIZ_CY_M4,SA_03_PUB_GRO_RCPT_NONUBIZ_TOT,SA_03_PCT_INVEST_INCOME_CY,SA_03_TOT_INCOME_NET_UBIZ_CY,SA_03_TOT_INCOME_NET_UBIZ_CY_M1,SA_03_TOT_INCOME_NET_UBIZ_CY_M2,SA_03_TOT_INCOME_NET_UBIZ_CY_M3,SA_03_TOT_INCOME_NET_UBIZ_CY_M4,SA_03_TOT_INCOME_NET_UBIZ_TOT,SA_03_TOT_INCOME_OTH_CY,SA_03_TOT_INCOME_OTH_CY_M1,SA_03_TOT_INCOME_OTH_CY_M2,SA_03_TOT_INCOME_OTH_CY_M3,SA_03_TOT_INCOME_OTH_CY_M4,SA_03_TOT_INCOME_OTH_TOT,SA_03_TOT_INCOME_UBIZ_CY,SA_03_TOT_INCOME_UBIZ_CY_M1,SA_03_TOT_INCOME_UBIZ_CY_M2,SA_03_TOT_INCOME_UBIZ_CY_M3,SA_03_TOT_INCOME_UBIZ_CY_M4,SA_03_TOT_INCOME_UBIZ_TOT,SA_03_PCT_PUB_SUPPORT_PY,SA_03_PCT_INVEST_INCOME_PY,SA_03_PCT_PRIVATE_FOUNDATION_X,SA_03_PCT_PUB_SUPPORT_CY,SA_03_PUB_SUPPORT_TOT,SA_03_PUB_TAXREV_LEVIED_CY,SA_03_PUB_TAXREV_LEVIED_CY_M1,SA_03_PUB_TAXREV_LEVIED_CY_M2,SA_03_PUB_TAXREV_LEVIED_CY_M3,SA_03_PUB_TAXREV_LEVIED_CY_M4,SA_03_PUB_TAXREV_LEVIED_TOT,SA_03_PCT_33_SUPPORT_TEST_CY_X,SA_03_PCT_33_SUPPORT_TEST_PY_X,SA_03_PUB_TOT_L1_5_CY,SA_03_PUB_TOT_L1_5_CY_M1,SA_03_PUB_TOT_L1_5_CY_M2,SA_03_PUB_TOT_L1_5_CY_M3,SA_03_PUB_TOT_L1_5_CY_M4,SA_03_PUB_TOT_L1_5_TOT,SA_03_PUB_ADD_L7AB_CY,SA_03_PUB_ADD_L7AB_CY_M1,SA_03_PUB_ADD_L7AB_CY_M2,SA_03_PUB_ADD_L7AB_CY_M3,SA_03_PUB_ADD_L7AB_CY_M4,SA_03_PUB_ADD_L7AB_TOT,SA_03_TOT_ADD_L10AB_CY,SA_03_TOT_ADD_L10AB_CY_M1,SA_03_TOT_ADD_L10AB_CY_M2,SA_03_TOT_ADD_L10AB_CY_M3,SA_03_TOT_ADD_L10AB_CY_M4,SA_03_TOT_ADD_L10AB_TOT,SA_03_TOT_SUPPORT_TOT,SA_03_PUB_VALUE_SVC_GOVT_CY,SA_03_PUB_VALUE_SVC_GOVT_CY_M1,SA_03_PUB_VALUE_SVC_GOVT_CY_M2,SA_03_PUB_VALUE_SVC_GOVT_CY_M3,SA_03_PUB_VALUE_SVC_GOVT_CY_M4,SA_03_PUB_VALUE_SVC_GOVT_TOT,SA_03_TOT_SUPPORT_CY,SA_03_TOT_SUPPORT_CY_M1,SA_03_TOT_SUPPORT_CY_M2,SA_03_TOT_SUPPORT_CY_M3,SA_03_TOT_SUPPORT_CY_M4)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


