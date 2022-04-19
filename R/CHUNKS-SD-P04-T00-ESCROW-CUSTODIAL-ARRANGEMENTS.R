#' @title 
#'   Build table SD-P04-T00-ESCROW-CUSTODIAL-ARRANGEMENTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P04_T00_ESCROW_CUSTODIAL_ARRANGEMENTS <- function( doc, url )
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




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_04_AGENT_TRUSTEE_OTH_X,SD_04_ESCROW_BALANCE_BEG,SD_04_ESCROW_ADDITION,SD_04_ESCROW_DIST,SD_04_ESCROW_BALANCE_END,SD_04_ESCROW_ACC_LIAB_INCL_P10_X,SD_04_EXPLANATION_P13_X)
df <- as.data.frame( var.list )


return( df )


}


