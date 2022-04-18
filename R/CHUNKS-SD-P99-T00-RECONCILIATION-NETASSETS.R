#' @title 
#'   Build table SD-P99-T00-RECONCILIATION-NETASSETS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P99_T00_RECONCILIATION_NETASSETS <- function( doc, url )
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


## VARIABLE NAME:  SD_99_RECO_NETASSET_REV_TOT
## DESCRIPTION:  IRS990 Schedule D - Total revenue (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-01
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

SD_99_RECO_NETASSET_REV_TOT <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnData/IRS990ScheduleD/TotalRevenue' ) )
if( length( SD_99_RECO_NETASSET_REV_TOT ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_REV_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_REV_TOT <-  paste0( '{', SD_99_RECO_NETASSET_REV_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_EXP_TOT
## DESCRIPTION:  Total expenses (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-02
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/TotalExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalExpenses'
V_RECO_NETASSET_EXP_TOT <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_EXP_TOT ) )
if( length( SD_99_RECO_NETASSET_EXP_TOT ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_EXP_TOT <-  paste0( '{', SD_99_RECO_NETASSET_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_EXCESS
## DESCRIPTION:  Excess or deficit (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-03
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExcessOrDeficitForYear'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/ExcessOrDeficitForYear'
V_RECO_NETASSET_EXCESS <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_EXCESS <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_EXCESS ) )
if( length( SD_99_RECO_NETASSET_EXCESS ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_EXCESS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_EXCESS <-  paste0( '{', SD_99_RECO_NETASSET_EXCESS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_NUGAINS
## DESCRIPTION:  Net Unrealized gains (losses) on investments (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-04
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/NetUnrealizedGLOnInvestments'
V2 <- '//Return/ReturnData/IRS990ScheduleD/NetUnrealizedGLOnInvestments'
V_RECO_NETASSET_NUGAINS <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_NUGAINS <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_NUGAINS ) )
if( length( SD_99_RECO_NETASSET_NUGAINS ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_NUGAINS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_NUGAINS <-  paste0( '{', SD_99_RECO_NETASSET_NUGAINS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_DONATED_SVC
## DESCRIPTION:  Donated services and use of facilities (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-05
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/DonatedServicesAndFacilities'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/DonatedServicesAndFacilities'
V_RECO_NETASSET_DONATED_SVC <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_DONATED_SVC <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_DONATED_SVC ) )
if( length( SD_99_RECO_NETASSET_DONATED_SVC ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_DONATED_SVC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_DONATED_SVC <-  paste0( '{', SD_99_RECO_NETASSET_DONATED_SVC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_INVEST_EXP
## DESCRIPTION:  Investment expenses (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-06
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/InvestmentExpenses'
V2 <- '//Return/ReturnData/IRS990ScheduleD/InvestmentExpenses'
V_RECO_NETASSET_INVEST_EXP <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_INVEST_EXP <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_INVEST_EXP ) )
if( length( SD_99_RECO_NETASSET_INVEST_EXP ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_INVEST_EXP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_INVEST_EXP <-  paste0( '{', SD_99_RECO_NETASSET_INVEST_EXP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_PRIOR_ADJ
## DESCRIPTION:  Prior period adjustments (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-07
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/PriorPeriodAdjustments'
V2 <- '//Return/ReturnData/IRS990ScheduleD/PriorPeriodAdjustments'
V_RECO_NETASSET_PRIOR_ADJ <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_PRIOR_ADJ <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_PRIOR_ADJ ) )
if( length( SD_99_RECO_NETASSET_PRIOR_ADJ ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_PRIOR_ADJ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_PRIOR_ADJ <-  paste0( '{', SD_99_RECO_NETASSET_PRIOR_ADJ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_OTH
## DESCRIPTION:  Other changes amount (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-08
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/OtherAmount'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherAmount'
V_RECO_NETASSET_OTH <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_OTH ) )
if( length( SD_99_RECO_NETASSET_OTH ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_OTH <-  paste0( '{', SD_99_RECO_NETASSET_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_TOT_ADJ
## DESCRIPTION:  Total adjustments (net) (add lines 4-8) (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-09
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/TotalAdjustments'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalAdjustments'
V_RECO_NETASSET_TOT_ADJ <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_TOT_ADJ <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_TOT_ADJ ) )
if( length( SD_99_RECO_NETASSET_TOT_ADJ ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_TOT_ADJ, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_TOT_ADJ <-  paste0( '{', SD_99_RECO_NETASSET_TOT_ADJ, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_99_RECO_NETASSET_EXCESS_AFS
## DESCRIPTION:  Excess or (deficit) for the year per financial statements (line 3 plus or minus line 9) (see SD-FORM-VERSION-2011-PART-11) 
## LOCATION:  SCHED-D-PART-99-LINE-10
## TABLE:  SD-P99-T00-RECONCILIATION-NETASSETS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExcessOrDeficitPerFS'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartXI/ExcessOrDeficitPerFS'
V_RECO_NETASSET_EXCESS_AFS <- paste( V1, V2 , sep='|' )
SD_99_RECO_NETASSET_EXCESS_AFS <- xml2::xml_text( xml2::xml_find_all( doc, V_RECO_NETASSET_EXCESS_AFS ) )
if( length( SD_99_RECO_NETASSET_EXCESS_AFS ) > 1 )
{ 
  create_record( varname=SD_99_RECO_NETASSET_EXCESS_AFS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_99_RECO_NETASSET_EXCESS_AFS <-  paste0( '{', SD_99_RECO_NETASSET_EXCESS_AFS, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_99_RECO_NETASSET_REV_TOT,SD_99_RECO_NETASSET_EXP_TOT,SD_99_RECO_NETASSET_EXCESS,SD_99_RECO_NETASSET_NUGAINS,SD_99_RECO_NETASSET_DONATED_SVC,SD_99_RECO_NETASSET_INVEST_EXP,SD_99_RECO_NETASSET_PRIOR_ADJ,SD_99_RECO_NETASSET_OTH,SD_99_RECO_NETASSET_TOT_ADJ,SD_99_RECO_NETASSET_EXCESS_AFS)
df <- as.data.frame( var.list )


return( df )


}


