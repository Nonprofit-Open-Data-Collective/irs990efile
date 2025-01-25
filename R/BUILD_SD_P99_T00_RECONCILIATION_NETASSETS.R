#' @title 
#'   Build table SD-P99-T00-RECONCILIATION-NETASSETS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P99_T00_RECONCILIATION_NETASSETS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


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




var.list <- 
namedList(SD_99_RECO_NETASSET_DONATED_SVC,SD_99_RECO_NETASSET_EXCESS,SD_99_RECO_NETASSET_EXCESS_AFS,SD_99_RECO_NETASSET_INVEST_EXP,SD_99_RECO_NETASSET_NUGAINS,SD_99_RECO_NETASSET_OTH,SD_99_RECO_NETASSET_PRIOR_ADJ,SD_99_RECO_NETASSET_TOT_ADJ,SD_99_RECO_NETASSET_EXP_TOT,SD_99_RECO_NETASSET_REV_TOT)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


