#' @title 
#'   Build table SC-P03-T00-LOBBY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SC_P03_T00_LOBBY <- function( doc, url )
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


## VARIABLE NAME:  SC_03_DUES_NONDEDUCT_X
## DESCRIPTION:  Were substantially all (90% or more) dues received nondeductible by members?
## LOCATION:  SCHED-C-PART-03-A-LINE-01
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/SubstantiallyAllDuesNondeduct'
V2 <- '//Return/ReturnData/IRS990ScheduleC/SubstantiallyAllDuesNondedInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/SubstantiallyAllDuesNondeduct'
V_DUES_NONDEDUCT_X <- paste( V1, V2, V3 , sep='|' )
SC_03_DUES_NONDEDUCT_X <- xml_text( xml_find_all( doc, V_DUES_NONDEDUCT_X ) )




## VARIABLE NAME:  SC_03_INHOUSE_LOB_EXP_LT_2K_X
## DESCRIPTION:  Did the organization make only in-house lobbying expenditures of $2;000 or less?
## LOCATION:  SCHED-C-PART-03-A-LINE-02
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/OnlyInHouseLobbying'
V2 <- '//Return/ReturnData/IRS990ScheduleC/OnlyInHouseLobbying'
V3 <- '//Return/ReturnData/IRS990ScheduleC/OnlyInHouseLobbyingInd'
V_INHOUSE_LOB_EXP_LT_2K_X <- paste( V1, V2, V3 , sep='|' )
SC_03_INHOUSE_LOB_EXP_LT_2K_X <- xml_text( xml_find_all( doc, V_INHOUSE_LOB_EXP_LT_2K_X ) )




## VARIABLE NAME:  SC_03_AGREE_CARRYOVER_LOB_PY_X
## DESCRIPTION:  Did the organization agree to carryover lobbying and political expenditures from the prior year?
## LOCATION:  SCHED-C-PART-03-A-LINE-03
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AgreeCarryoverPriorYearInd'
V2 <- '//Return/ReturnData/IRS990ScheduleC/AgreeToCarryoverPriorYear'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/AgreeToCarryoverPriorYear'
V_AGREE_CARRYOVER_LOB_PY_X <- paste( V1, V2, V3 , sep='|' )
SC_03_AGREE_CARRYOVER_LOB_PY_X <- xml_text( xml_find_all( doc, V_AGREE_CARRYOVER_LOB_PY_X ) )




## VARIABLE NAME:  SC_03_AMT_DUE_ASSESS
## DESCRIPTION:  Dues; assessments and similar amounts from members
## LOCATION:  SCHED-C-PART-03-B-LINE-01
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/DuesAssessments'
V2 <- '//Return/ReturnData/IRS990ScheduleC/DuesAssessmentsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/DuesAssessments'
V_AMT_DUE_ASSESS <- paste( V1, V2, V3 , sep='|' )
SC_03_AMT_DUE_ASSESS <- xml_text( xml_find_all( doc, V_AMT_DUE_ASSESS ) )




## VARIABLE NAME:  SC_03_NONDEDUCT_LOB_CY
## DESCRIPTION:  Nondeductible lobbying and political expenditures - Current year
## LOCATION:  SCHED-C-PART-03-B-LINE-02A
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/NonDedLobbyPoliticalCurrent'
V2 <- '//Return/ReturnData/IRS990ScheduleC/NonDedLobbyPoliticalCurrent'
V3 <- '//Return/ReturnData/IRS990ScheduleC/NonDeductibleLbbyngPltclCYAmt'
V_NONDEDUCT_LOB_CY <- paste( V1, V2, V3 , sep='|' )
SC_03_NONDEDUCT_LOB_CY <- xml_text( xml_find_all( doc, V_NONDEDUCT_LOB_CY ) )




## VARIABLE NAME:  SC_03_NONDEDUCT_LOB_CARRYOVER
## DESCRIPTION:  Nondeductible lobbying and political expenditures - Carryover from last year
## LOCATION:  SCHED-C-PART-03-B-LINE-02B
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/NonDedLobbyPoliticalCarryover'
V2 <- '//Return/ReturnData/IRS990ScheduleC/NonDedLbbyngPltclCyovAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/NonDedLobbyPoliticalCarryover'
V_NONDEDUCT_LOB_CARRYOVER <- paste( V1, V2, V3 , sep='|' )
SC_03_NONDEDUCT_LOB_CARRYOVER <- xml_text( xml_find_all( doc, V_NONDEDUCT_LOB_CARRYOVER ) )




## VARIABLE NAME:  SC_03_NONDEDUCT_LOB_TOT
## DESCRIPTION:  Nondeductible lobbying and political expenditures - Total
## LOCATION:  SCHED-C-PART-03-B-LINE-02C
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/NonDedLobbyPoliticalTotal'
V2 <- '//Return/ReturnData/IRS990ScheduleC/NonDedLobbyPoliticalTotal'
V3 <- '//Return/ReturnData/IRS990ScheduleC/NonDeductibleLbbyngPltclTotAmt'
V_NONDEDUCT_LOB_TOT <- paste( V1, V2, V3 , sep='|' )
SC_03_NONDEDUCT_LOB_TOT <- xml_text( xml_find_all( doc, V_NONDEDUCT_LOB_TOT ) )




## VARIABLE NAME:  SC_03_AMT_AGGREGATE_REPORTED
## DESCRIPTION:  Aggregate amount reported in section 6033(e)(1)(A) notices of nondeductible section 162(e) dues
## LOCATION:  SCHED-C-PART-03-B-LINE-03
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AggrAmtReportedInDuesNotices'
V2 <- '//Return/ReturnData/IRS990ScheduleC/AggregateReportedDuesNtcAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/AggrAmtReportedInDuesNotices'
V_AMT_AGGREGATE_REPORTED <- paste( V1, V2, V3 , sep='|' )
SC_03_AMT_AGGREGATE_REPORTED <- xml_text( xml_find_all( doc, V_AMT_AGGREGATE_REPORTED ) )




## VARIABLE NAME:  SC_03_AMT_CARRYOVER_NY
## DESCRIPTION:  If notices were sent and the amount on line 2c exceeds the amount on line 3; what portion of that amount does the organization agree to carryover to the reasonable estimate of nondeductible lobbying and political expenditure next year?
## LOCATION:  SCHED-C-PART-03-B-LINE-04
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmountToBeCarriedOver'
V2 <- '//Return/ReturnData/IRS990ScheduleC/CarriedOverAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/AmountToBeCarriedOver'
V_AMT_CARRYOVER_NY <- paste( V1, V2, V3 , sep='|' )
SC_03_AMT_CARRYOVER_NY <- xml_text( xml_find_all( doc, V_AMT_CARRYOVER_NY ) )




## VARIABLE NAME:  SC_03_AMT_TAXABLE_LOB
## DESCRIPTION:  Taxable amount of lobbying and political expenditures (line 2c total minus 3 and 4)
## LOCATION:  SCHED-C-PART-03-B-LINE-05
## TABLE:  SC-P03-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartIII/TaxableAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TaxableAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TaxableAmt'
V_AMT_TAXABLE_LOB <- paste( V1, V2, V3 , sep='|' )
SC_03_AMT_TAXABLE_LOB <- xml_text( xml_find_all( doc, V_AMT_TAXABLE_LOB ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SC_03_DUES_NONDEDUCT_X,SC_03_INHOUSE_LOB_EXP_LT_2K_X,SC_03_AGREE_CARRYOVER_LOB_PY_X,SC_03_AMT_DUE_ASSESS,SC_03_NONDEDUCT_LOB_CY,SC_03_NONDEDUCT_LOB_CARRYOVER,SC_03_NONDEDUCT_LOB_TOT,SC_03_AMT_AGGREGATE_REPORTED,SC_03_AMT_CARRYOVER_NY,SC_03_AMT_TAXABLE_LOB)
df <- as.data.frame( var.list )


return( df )


}


