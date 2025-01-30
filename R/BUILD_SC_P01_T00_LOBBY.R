#' @title 
#'   Build table SC-P01-T00-LOBBY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SC_P01_T00_LOBBY <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SC_01_ORG_AMT_EXPENDED_527_ACT
## DESCRIPTION:  Enter the amount directly expended by the filing organization for section 527 exempt function activities
## LOCATION:  SCHED-C-PART-01-C-LINE-01
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtExpendedFor527Activities'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Expended527ActivitiesAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtExpendedFor527Activities'
V_ORG_AMT_EXPENDED_527_ACT <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_AMT_EXPENDED_527_ACT <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_AMT_EXPENDED_527_ACT ) )
if( length( SC_01_ORG_AMT_EXPENDED_527_ACT ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_ORG_AMT_EXPENDED_527_ACT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_ORG_AMT_EXPENDED_527_ACT <-  paste0( '{', SC_01_ORG_AMT_EXPENDED_527_ACT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_AMT_EXCISE_TAX_4955_ORG
## DESCRIPTION:  Enter the amount of any excise tax incurred under section 4955
## LOCATION:  SCHED-C-PART-01-B-LINE-01
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtOf4955Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtOf4955Tax'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Section4955OrganizationTaxAmt'
V_AMT_EXCISE_TAX_4955_ORG <- paste( V1, V2, V3 , sep='|' )
SC_01_AMT_EXCISE_TAX_4955_ORG <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_EXCISE_TAX_4955_ORG ) )
if( length( SC_01_AMT_EXCISE_TAX_4955_ORG ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_AMT_EXCISE_TAX_4955_ORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_AMT_EXCISE_TAX_4955_ORG <-  paste0( '{', SC_01_AMT_EXCISE_TAX_4955_ORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_AMT_EXCISE_TAX_4955_MGR
## DESCRIPTION:  Enter the amount of any excise tax incurred by organization managers under section 4955
## LOCATION:  SCHED-C-PART-01-B-LINE-02
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtOf4955TaxOnManagers'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtOf4955TaxOnManagers'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Section4955ManagersTaxAmt'
V_AMT_EXCISE_TAX_4955_MGR <- paste( V1, V2, V3 , sep='|' )
SC_01_AMT_EXCISE_TAX_4955_MGR <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_EXCISE_TAX_4955_MGR ) )
if( length( SC_01_AMT_EXCISE_TAX_4955_MGR ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_AMT_EXCISE_TAX_4955_MGR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_AMT_EXCISE_TAX_4955_MGR <-  paste0( '{', SC_01_AMT_EXCISE_TAX_4955_MGR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_ORG_AMT_FUND_CONTR_527_ACT
## DESCRIPTION:  Enter the amount of the filing organization's own internal funds contributed to other organizations for section 527 exempt function activities
## LOCATION:  SCHED-C-PART-01-C-LINE-02
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtOfInternalFundsContributed'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtOfInternalFundsContributed'
V3 <- '//Return/ReturnData/IRS990ScheduleC/InternalFundsContributedAmt'
V_ORG_AMT_FUND_CONTR_527_ACT <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_AMT_FUND_CONTR_527_ACT <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_AMT_FUND_CONTR_527_ACT ) )
if( length( SC_01_ORG_AMT_FUND_CONTR_527_ACT ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_ORG_AMT_FUND_CONTR_527_ACT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_ORG_AMT_FUND_CONTR_527_ACT <-  paste0( '{', SC_01_ORG_AMT_FUND_CONTR_527_ACT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_4955_FORM4720_CORRECTED_X
## DESCRIPTION:  Was a correction made?
## LOCATION:  SCHED-C-PART-01-B-LINE-04A
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/CorrectionMade'
V2 <- '//Return/ReturnData/IRS990ScheduleC/CorrectionMadeInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/CorrectionMade'
V_4955_FORM4720_CORRECTED_X <- paste( V1, V2, V3 , sep='|' )
SC_01_4955_FORM4720_CORRECTED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_4955_FORM4720_CORRECTED_X ) )
if( length( SC_01_4955_FORM4720_CORRECTED_X ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_4955_FORM4720_CORRECTED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_4955_FORM4720_CORRECTED_X <-  paste0( '{', SC_01_4955_FORM4720_CORRECTED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_ORG_FORM1120_FILED_X
## DESCRIPTION:  Did the filing organization file Form 1120-POL for this year?
## LOCATION:  SCHED-C-PART-01-C-LINE-04
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form1120PolFiled'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form1120POLFiledInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/Form1120PolFiled'
V_ORG_FORM1120_FILED_X <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_FORM1120_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_FORM1120_FILED_X ) )
if( length( SC_01_ORG_FORM1120_FILED_X ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_ORG_FORM1120_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_ORG_FORM1120_FILED_X <-  paste0( '{', SC_01_ORG_FORM1120_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_4955_FORM4720_FILED_X
## DESCRIPTION:  If the filing organization incurred in a section 4955 tax; did it file Form 4720 for this year?
## LOCATION:  SCHED-C-PART-01-B-LINE-03
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form4720Filed4955Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form4720FiledSection4955TaxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/Form4720Filed4955Tax'
V_4955_FORM4720_FILED_X <- paste( V1, V2, V3 , sep='|' )
SC_01_4955_FORM4720_FILED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_4955_FORM4720_FILED_X ) )
if( length( SC_01_4955_FORM4720_FILED_X ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_4955_FORM4720_FILED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_4955_FORM4720_FILED_X <-  paste0( '{', SC_01_4955_FORM4720_FILED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_POLI_EXP
## DESCRIPTION:  Political expenditures
## LOCATION:  SCHED-C-PART-01-A-LINE-02
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/PoliticalExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleC/PoliticalExpenditures'
V3 <- '//Return/ReturnData/IRS990ScheduleC/PoliticalExpendituresAmt'
V_POLI_EXP <- paste( V1, V2, V3 , sep='|' )
SC_01_POLI_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_POLI_EXP ) )
if( length( SC_01_POLI_EXP ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_POLI_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_POLI_EXP <-  paste0( '{', SC_01_POLI_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_ORG_TOT_EXEMPT_FUNC_EXP
## DESCRIPTION:  Total of direct and indirect exempt function expenditures. Add lines 1 and 2
## LOCATION:  SCHED-C-PART-01-C-LINE-03
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/TotalExmptFunctionExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalExemptFunctionExpendAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalExmptFunctionExpenditures'
V_ORG_TOT_EXEMPT_FUNC_EXP <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_TOT_EXEMPT_FUNC_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_TOT_EXEMPT_FUNC_EXP ) )
if( length( SC_01_ORG_TOT_EXEMPT_FUNC_EXP ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_ORG_TOT_EXEMPT_FUNC_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_ORG_TOT_EXEMPT_FUNC_EXP <-  paste0( '{', SC_01_ORG_TOT_EXEMPT_FUNC_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SC_01_POLI_VOL_HOURS
## DESCRIPTION:  Volunteer hours
## LOCATION:  SCHED-C-PART-01-A-LINE-03
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/VolunteerHours'
V2 <- '//Return/ReturnData/IRS990ScheduleC/VolunteerHours'
V3 <- '//Return/ReturnData/IRS990ScheduleC/VolunteerHoursCnt'
V_POLI_VOL_HOURS <- paste( V1, V2, V3 , sep='|' )
SC_01_POLI_VOL_HOURS <- xml2::xml_text( xml2::xml_find_all( doc, V_POLI_VOL_HOURS ) )
if( length( SC_01_POLI_VOL_HOURS ) > 1 )
{ 
  log_collapsed_record( varname=SC_01_POLI_VOL_HOURS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SC_01_POLI_VOL_HOURS <-  paste0( '{', SC_01_POLI_VOL_HOURS, '}', collapse=';' ) 
} 




var.list <- 
namedList(SC_01_ORG_AMT_EXPENDED_527_ACT,SC_01_AMT_EXCISE_TAX_4955_ORG,SC_01_AMT_EXCISE_TAX_4955_MGR,SC_01_ORG_AMT_FUND_CONTR_527_ACT,SC_01_4955_FORM4720_CORRECTED_X,SC_01_ORG_FORM1120_FILED_X,SC_01_4955_FORM4720_FILED_X,SC_01_POLI_EXP,SC_01_ORG_TOT_EXEMPT_FUNC_EXP,SC_01_POLI_VOL_HOURS)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


