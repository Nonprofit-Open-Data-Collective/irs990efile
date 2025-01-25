#' @title 
#'   Build table SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P04_T00_ESCROW_CUSTODIAL_ARRANGEMENTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_04_ESCROW_ADDITION
## DESCRIPTION:  Additions during the year
## LOCATION:  SCHED-D-PART-04-LINE-01D
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/AdditionsDuringYear'
V2 <- '//Return/ReturnData/IRS990ScheduleD/AdditionsDuringYearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIV/AdditionsDuringYear'
V_ESCROW_ADDITION <- paste( V1, V2, V3 , sep='|' )
SD_04_ESCROW_ADDITION <- xml2::xml_text( xml2::xml_find_all( doc, V_ESCROW_ADDITION ) )
if( length( SD_04_ESCROW_ADDITION ) > 1 )
{ 
  create_record( varname=SD_04_ESCROW_ADDITION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_ESCROW_ADDITION <-  paste0( '{', SD_04_ESCROW_ADDITION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_04_AGENT_TRUSTEE_OTH_X
## DESCRIPTION:  Is the organization an agent; trustee; custodian or other intermediary for contributions or other assets not included on Form 990; Part X?
## LOCATION:  SCHED-D-PART-04-LINE-01A
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/AgentTrusteeEtc'
V2 <- '//Return/ReturnData/IRS990ScheduleD/AgentTrusteeEtcInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIV/AgentTrusteeEtc'
V_AGENT_TRUSTEE_OTH_X <- paste( V1, V2, V3 , sep='|' )
SD_04_AGENT_TRUSTEE_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_AGENT_TRUSTEE_OTH_X ) )
if( length( SD_04_AGENT_TRUSTEE_OTH_X ) > 1 )
{ 
  create_record( varname=SD_04_AGENT_TRUSTEE_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_AGENT_TRUSTEE_OTH_X <-  paste0( '{', SD_04_AGENT_TRUSTEE_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_04_ESCROW_BALANCE_BEG
## DESCRIPTION:  Beginning balance
## LOCATION:  SCHED-D-PART-04-LINE-01C
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/BeginningBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BeginningBalanceAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIV/BeginningBalance'
V_ESCROW_BALANCE_BEG <- paste( V1, V2, V3 , sep='|' )
SD_04_ESCROW_BALANCE_BEG <- xml2::xml_text( xml2::xml_find_all( doc, V_ESCROW_BALANCE_BEG ) )
if( length( SD_04_ESCROW_BALANCE_BEG ) > 1 )
{ 
  create_record( varname=SD_04_ESCROW_BALANCE_BEG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_ESCROW_BALANCE_BEG <-  paste0( '{', SD_04_ESCROW_BALANCE_BEG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_04_ESCROW_DIST
## DESCRIPTION:  Distributions during the year
## LOCATION:  SCHED-D-PART-04-LINE-01E
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DistributionsDuringYear'
V2 <- '//Return/ReturnData/IRS990ScheduleD/DistributionsDuringYearAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIV/DistributionsDuringYear'
V_ESCROW_DIST <- paste( V1, V2, V3 , sep='|' )
SD_04_ESCROW_DIST <- xml2::xml_text( xml2::xml_find_all( doc, V_ESCROW_DIST ) )
if( length( SD_04_ESCROW_DIST ) > 1 )
{ 
  create_record( varname=SD_04_ESCROW_DIST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_ESCROW_DIST <-  paste0( '{', SD_04_ESCROW_DIST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_04_ESCROW_BALANCE_END
## DESCRIPTION:  Ending balance
## LOCATION:  SCHED-D-PART-04-LINE-01F
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/EndingBalance'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EndingBalanceAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIV/EndingBalance'
V_ESCROW_BALANCE_END <- paste( V1, V2, V3 , sep='|' )
SD_04_ESCROW_BALANCE_END <- xml2::xml_text( xml2::xml_find_all( doc, V_ESCROW_BALANCE_END ) )
if( length( SD_04_ESCROW_BALANCE_END ) > 1 )
{ 
  create_record( varname=SD_04_ESCROW_BALANCE_END, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_ESCROW_BALANCE_END <-  paste0( '{', SD_04_ESCROW_BALANCE_END, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_04_EXPLANATION_P13_X
## DESCRIPTION:  Part XIII contains an explanation for Part IV; Line 2b
## LOCATION:  SCHED-D-PART-04-LINE-02B
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExplanationInPartXIII'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ExplanationProvidedInd'
V_EXPLANATION_P13_X <- paste( V1, V2 , sep='|' )
SD_04_EXPLANATION_P13_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EXPLANATION_P13_X ) )
if( length( SD_04_EXPLANATION_P13_X ) > 1 )
{ 
  create_record( varname=SD_04_EXPLANATION_P13_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_EXPLANATION_P13_X <-  paste0( '{', SD_04_EXPLANATION_P13_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_04_ESCROW_ACC_LIAB_INCL_P10_X
## DESCRIPTION:  Did the organization include an amount on Form 990; Part X; line 21?
## LOCATION:  SCHED-D-PART-04-LINE-02A
## TABLE:  SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIV/IncludedOnFS'
V2 <- '//Return/ReturnData/IRS990ScheduleD/InclEscrowCustodialAcctLiabInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/IncludedOnFS'
V_ESCROW_ACC_LIAB_INCL_P10_X <- paste( V1, V2, V3 , sep='|' )
SD_04_ESCROW_ACC_LIAB_INCL_P10_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ESCROW_ACC_LIAB_INCL_P10_X ) )
if( length( SD_04_ESCROW_ACC_LIAB_INCL_P10_X ) > 1 )
{ 
  create_record( varname=SD_04_ESCROW_ACC_LIAB_INCL_P10_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_04_ESCROW_ACC_LIAB_INCL_P10_X <-  paste0( '{', SD_04_ESCROW_ACC_LIAB_INCL_P10_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_04_ESCROW_ADDITION,SD_04_AGENT_TRUSTEE_OTH_X,SD_04_ESCROW_BALANCE_BEG,SD_04_ESCROW_DIST,SD_04_ESCROW_BALANCE_END,SD_04_EXPLANATION_P13_X,SD_04_ESCROW_ACC_LIAB_INCL_P10_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


