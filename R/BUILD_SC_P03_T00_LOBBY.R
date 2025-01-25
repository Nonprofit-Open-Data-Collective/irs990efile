#' @title 
#'   Build table SC-P03-T00-LOBBY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SC_P03_T00_LOBBY <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


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
SC_03_AMT_AGGREGATE_REPORTED <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_AGGREGATE_REPORTED ) )
if( length( SC_03_AMT_AGGREGATE_REPORTED ) > 1 )
{ 
  create_record( varname=SC_03_AMT_AGGREGATE_REPORTED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_AMT_AGGREGATE_REPORTED <-  paste0( '{', SC_03_AMT_AGGREGATE_REPORTED, '}', collapse=';' ) 
} 




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
SC_03_AGREE_CARRYOVER_LOB_PY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_AGREE_CARRYOVER_LOB_PY_X ) )
if( length( SC_03_AGREE_CARRYOVER_LOB_PY_X ) > 1 )
{ 
  create_record( varname=SC_03_AGREE_CARRYOVER_LOB_PY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_AGREE_CARRYOVER_LOB_PY_X <-  paste0( '{', SC_03_AGREE_CARRYOVER_LOB_PY_X, '}', collapse=';' ) 
} 




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
SC_03_AMT_CARRYOVER_NY <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_CARRYOVER_NY ) )
if( length( SC_03_AMT_CARRYOVER_NY ) > 1 )
{ 
  create_record( varname=SC_03_AMT_CARRYOVER_NY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_AMT_CARRYOVER_NY <-  paste0( '{', SC_03_AMT_CARRYOVER_NY, '}', collapse=';' ) 
} 




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
SC_03_AMT_DUE_ASSESS <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_DUE_ASSESS ) )
if( length( SC_03_AMT_DUE_ASSESS ) > 1 )
{ 
  create_record( varname=SC_03_AMT_DUE_ASSESS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_AMT_DUE_ASSESS <-  paste0( '{', SC_03_AMT_DUE_ASSESS, '}', collapse=';' ) 
} 




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
SC_03_NONDEDUCT_LOB_CARRYOVER <- xml2::xml_text( xml2::xml_find_all( doc, V_NONDEDUCT_LOB_CARRYOVER ) )
if( length( SC_03_NONDEDUCT_LOB_CARRYOVER ) > 1 )
{ 
  create_record( varname=SC_03_NONDEDUCT_LOB_CARRYOVER, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_NONDEDUCT_LOB_CARRYOVER <-  paste0( '{', SC_03_NONDEDUCT_LOB_CARRYOVER, '}', collapse=';' ) 
} 




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
SC_03_NONDEDUCT_LOB_CY <- xml2::xml_text( xml2::xml_find_all( doc, V_NONDEDUCT_LOB_CY ) )
if( length( SC_03_NONDEDUCT_LOB_CY ) > 1 )
{ 
  create_record( varname=SC_03_NONDEDUCT_LOB_CY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_NONDEDUCT_LOB_CY <-  paste0( '{', SC_03_NONDEDUCT_LOB_CY, '}', collapse=';' ) 
} 




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
SC_03_NONDEDUCT_LOB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_NONDEDUCT_LOB_TOT ) )
if( length( SC_03_NONDEDUCT_LOB_TOT ) > 1 )
{ 
  create_record( varname=SC_03_NONDEDUCT_LOB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_NONDEDUCT_LOB_TOT <-  paste0( '{', SC_03_NONDEDUCT_LOB_TOT, '}', collapse=';' ) 
} 




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
SC_03_INHOUSE_LOB_EXP_LT_2K_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INHOUSE_LOB_EXP_LT_2K_X ) )
if( length( SC_03_INHOUSE_LOB_EXP_LT_2K_X ) > 1 )
{ 
  create_record( varname=SC_03_INHOUSE_LOB_EXP_LT_2K_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_INHOUSE_LOB_EXP_LT_2K_X <-  paste0( '{', SC_03_INHOUSE_LOB_EXP_LT_2K_X, '}', collapse=';' ) 
} 




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
SC_03_DUES_NONDEDUCT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DUES_NONDEDUCT_X ) )
if( length( SC_03_DUES_NONDEDUCT_X ) > 1 )
{ 
  create_record( varname=SC_03_DUES_NONDEDUCT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_DUES_NONDEDUCT_X <-  paste0( '{', SC_03_DUES_NONDEDUCT_X, '}', collapse=';' ) 
} 




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
SC_03_AMT_TAXABLE_LOB <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_TAXABLE_LOB ) )
if( length( SC_03_AMT_TAXABLE_LOB ) > 1 )
{ 
  create_record( varname=SC_03_AMT_TAXABLE_LOB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_03_AMT_TAXABLE_LOB <-  paste0( '{', SC_03_AMT_TAXABLE_LOB, '}', collapse=';' ) 
} 




var.list <- 
namedList(SC_03_AMT_AGGREGATE_REPORTED,SC_03_AGREE_CARRYOVER_LOB_PY_X,SC_03_AMT_CARRYOVER_NY,SC_03_AMT_DUE_ASSESS,SC_03_NONDEDUCT_LOB_CARRYOVER,SC_03_NONDEDUCT_LOB_CY,SC_03_NONDEDUCT_LOB_TOT,SC_03_INHOUSE_LOB_EXP_LT_2K_X,SC_03_DUES_NONDEDUCT_X,SC_03_AMT_TAXABLE_LOB)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


