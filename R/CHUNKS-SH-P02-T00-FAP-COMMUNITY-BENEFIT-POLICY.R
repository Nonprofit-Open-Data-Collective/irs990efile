#' @title 
#'   Build table SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SH_P02_T00_FAP_COMMUNITY_BENEFIT_POLICY <- function( doc, url )
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


## VARIABLE NAME:  SH_02_PHY_IMP_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-01-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/PhysicalImprovementsAndHousing/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprvAndHousingGrp/ActivitiesOrProgramsCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprovementsAndHousing/NumberOfActivitiesOrPrograms'
V_PHY_IMP_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_PHY_IMP_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_PHY_IMP_NUM_ACT_PROG ) )
if( length( SH_02_PHY_IMP_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_PHY_IMP_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_PHY_IMP_NUM_ACT_PROG <-  paste0( '{', SH_02_PHY_IMP_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_PHY_IMP_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-01-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/PhysicalImprovementsAndHousing/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprvAndHousingGrp/PersonsServedCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprovementsAndHousing/PersonsServed'
V_PHY_IMP_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_PHY_IMP_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_PHY_IMP_PERS_SERVED ) )
if( length( SH_02_PHY_IMP_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_PHY_IMP_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_PHY_IMP_PERS_SERVED <-  paste0( '{', SH_02_PHY_IMP_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_PHY_IMP_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-01-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/PhysicalImprovementsAndHousing/TotalCommunityBuildingExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprovementsAndHousing/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprvAndHousingGrp/TotalCommunityBenefitExpnsAmt'
V_PHY_IMP_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_PHY_IMP_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_PHY_IMP_EXP_TOT_COM_BLDG ) )
if( length( SH_02_PHY_IMP_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_PHY_IMP_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_PHY_IMP_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_PHY_IMP_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_PHY_IMP_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-01-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprvAndHousingGrp/DirectOffsettingRevenueAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprovementsAndHousing/DirectOffsettingRevenue'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/PhysicalImprovementsAndHousing/DirectOffsettingRevenue'
V_PHY_IMP_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_PHY_IMP_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_PHY_IMP_REV_DIRECT_OFFSET ) )
if( length( SH_02_PHY_IMP_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_PHY_IMP_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_PHY_IMP_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_PHY_IMP_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_PHY_IMP_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-01-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/PhysicalImprovementsAndHousing/NetCommunityBuildingExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprovementsAndHousing/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprvAndHousingGrp/NetCommunityBenefitExpnsAmt'
V_PHY_IMP_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_PHY_IMP_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_PHY_IMP_EXP_NET_COM_BLDG ) )
if( length( SH_02_PHY_IMP_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_PHY_IMP_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_PHY_IMP_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_PHY_IMP_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_PHY_IMP_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-01-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprvAndHousingGrp/TotalExpensePct'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/PhysicalImprovementsAndHousing/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/PhysicalImprovementsAndHousing/PercentOfTotalExpense'
V_PHY_IMP_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_PHY_IMP_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_PHY_IMP_PCT_EXP_TOT ) )
if( length( SH_02_PHY_IMP_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_PHY_IMP_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_PHY_IMP_PCT_EXP_TOT <-  paste0( '{', SH_02_PHY_IMP_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ECON_DEV_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-02-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopmentGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopment/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EconomicDevelopment/NumberOfActivitiesOrPrograms'
V_ECON_DEV_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_ECON_DEV_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_ECON_DEV_NUM_ACT_PROG ) )
if( length( SH_02_ECON_DEV_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_ECON_DEV_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ECON_DEV_NUM_ACT_PROG <-  paste0( '{', SH_02_ECON_DEV_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ECON_DEV_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-02-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopmentGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopment/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EconomicDevelopment/PersonsServed'
V_ECON_DEV_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_ECON_DEV_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_ECON_DEV_PERS_SERVED ) )
if( length( SH_02_ECON_DEV_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_ECON_DEV_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ECON_DEV_PERS_SERVED <-  paste0( '{', SH_02_ECON_DEV_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ECON_DEV_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-02-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopmentGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopment/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EconomicDevelopment/TotalCommunityBuildingExpense'
V_ECON_DEV_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_ECON_DEV_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ECON_DEV_EXP_TOT_COM_BLDG ) )
if( length( SH_02_ECON_DEV_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_ECON_DEV_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ECON_DEV_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_ECON_DEV_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ECON_DEV_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-02-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EconomicDevelopment/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopmentGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopment/DirectOffsettingRevenue'
V_ECON_DEV_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_ECON_DEV_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_ECON_DEV_REV_DIRECT_OFFSET ) )
if( length( SH_02_ECON_DEV_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_ECON_DEV_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ECON_DEV_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_ECON_DEV_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ECON_DEV_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-02-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopmentGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopment/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EconomicDevelopment/NetCommunityBuildingExpense'
V_ECON_DEV_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_ECON_DEV_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ECON_DEV_EXP_NET_COM_BLDG ) )
if( length( SH_02_ECON_DEV_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_ECON_DEV_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ECON_DEV_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_ECON_DEV_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ECON_DEV_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-02-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopment/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EconomicDevelopment/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/EconomicDevelopmentGrp/TotalExpensePct'
V_ECON_DEV_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_ECON_DEV_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_ECON_DEV_PCT_EXP_TOT ) )
if( length( SH_02_ECON_DEV_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_ECON_DEV_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ECON_DEV_PCT_EXP_TOT <-  paste0( '{', SH_02_ECON_DEV_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COM_SUP_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-03-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupportGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupport/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CommunitySupport/NumberOfActivitiesOrPrograms'
V_COM_SUP_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_COM_SUP_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_COM_SUP_NUM_ACT_PROG ) )
if( length( SH_02_COM_SUP_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_COM_SUP_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COM_SUP_NUM_ACT_PROG <-  paste0( '{', SH_02_COM_SUP_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COM_SUP_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-03-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupport/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CommunitySupport/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupportGrp/PersonsServedCnt'
V_COM_SUP_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_COM_SUP_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_COM_SUP_PERS_SERVED ) )
if( length( SH_02_COM_SUP_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_COM_SUP_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COM_SUP_PERS_SERVED <-  paste0( '{', SH_02_COM_SUP_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COM_SUP_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-03-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupportGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupport/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CommunitySupport/TotalCommunityBuildingExpense'
V_COM_SUP_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_COM_SUP_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_COM_SUP_EXP_TOT_COM_BLDG ) )
if( length( SH_02_COM_SUP_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_COM_SUP_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COM_SUP_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_COM_SUP_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COM_SUP_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-03-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CommunitySupport/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupportGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupport/DirectOffsettingRevenue'
V_COM_SUP_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_COM_SUP_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_COM_SUP_REV_DIRECT_OFFSET ) )
if( length( SH_02_COM_SUP_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_COM_SUP_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COM_SUP_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_COM_SUP_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COM_SUP_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-03-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupportGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupport/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CommunitySupport/NetCommunityBuildingExpense'
V_COM_SUP_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_COM_SUP_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_COM_SUP_EXP_NET_COM_BLDG ) )
if( length( SH_02_COM_SUP_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_COM_SUP_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COM_SUP_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_COM_SUP_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COM_SUP_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-03-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupport/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CommunitySupport/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CommunitySupportGrp/TotalExpensePct'
V_COM_SUP_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_COM_SUP_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_COM_SUP_PCT_EXP_TOT ) )
if( length( SH_02_COM_SUP_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_COM_SUP_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COM_SUP_PCT_EXP_TOT <-  paste0( '{', SH_02_COM_SUP_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ENVIR_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-04-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovements/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EnvironmentalImprovements/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovementsGrp/ActivitiesOrProgramsCnt'
V_ENVIR_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_ENVIR_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_ENVIR_NUM_ACT_PROG ) )
if( length( SH_02_ENVIR_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_ENVIR_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ENVIR_NUM_ACT_PROG <-  paste0( '{', SH_02_ENVIR_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ENVIR_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-04-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovementsGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovements/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EnvironmentalImprovements/PersonsServed'
V_ENVIR_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_ENVIR_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_ENVIR_PERS_SERVED ) )
if( length( SH_02_ENVIR_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_ENVIR_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ENVIR_PERS_SERVED <-  paste0( '{', SH_02_ENVIR_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ENVIR_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-04-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovementsGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovements/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EnvironmentalImprovements/TotalCommunityBuildingExpense'
V_ENVIR_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_ENVIR_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ENVIR_EXP_TOT_COM_BLDG ) )
if( length( SH_02_ENVIR_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_ENVIR_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ENVIR_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_ENVIR_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ENVIR_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-04-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EnvironmentalImprovements/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovementsGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovements/DirectOffsettingRevenue'
V_ENVIR_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_ENVIR_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_ENVIR_REV_DIRECT_OFFSET ) )
if( length( SH_02_ENVIR_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_ENVIR_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ENVIR_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_ENVIR_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ENVIR_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-04-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovementsGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovements/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EnvironmentalImprovements/NetCommunityBuildingExpense'
V_ENVIR_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_ENVIR_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ENVIR_EXP_NET_COM_BLDG ) )
if( length( SH_02_ENVIR_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_ENVIR_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ENVIR_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_ENVIR_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ENVIR_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-04-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovements/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/EnvironmentalImprovements/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/EnvironmentalImprovementsGrp/TotalExpensePct'
V_ENVIR_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_ENVIR_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_ENVIR_PCT_EXP_TOT ) )
if( length( SH_02_ENVIR_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_ENVIR_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ENVIR_PCT_EXP_TOT <-  paste0( '{', SH_02_ENVIR_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_LDRSP_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-05-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopment/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/LeadershipDevelopment/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopmentGrp/ActivitiesOrProgramsCnt'
V_LDRSP_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_LDRSP_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_LDRSP_NUM_ACT_PROG ) )
if( length( SH_02_LDRSP_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_LDRSP_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_LDRSP_NUM_ACT_PROG <-  paste0( '{', SH_02_LDRSP_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_LDRSP_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-05-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopment/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/LeadershipDevelopment/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopmentGrp/PersonsServedCnt'
V_LDRSP_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_LDRSP_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_LDRSP_PERS_SERVED ) )
if( length( SH_02_LDRSP_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_LDRSP_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_LDRSP_PERS_SERVED <-  paste0( '{', SH_02_LDRSP_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_LDRSP_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-05-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopmentGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopment/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/LeadershipDevelopment/TotalCommunityBuildingExpense'
V_LDRSP_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_LDRSP_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_LDRSP_EXP_TOT_COM_BLDG ) )
if( length( SH_02_LDRSP_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_LDRSP_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_LDRSP_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_LDRSP_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_LDRSP_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-05-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/LeadershipDevelopment/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopmentGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopment/DirectOffsettingRevenue'
V_LDRSP_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_LDRSP_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_LDRSP_REV_DIRECT_OFFSET ) )
if( length( SH_02_LDRSP_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_LDRSP_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_LDRSP_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_LDRSP_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_LDRSP_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-05-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopmentGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopment/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/LeadershipDevelopment/NetCommunityBuildingExpense'
V_LDRSP_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_LDRSP_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_LDRSP_EXP_NET_COM_BLDG ) )
if( length( SH_02_LDRSP_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_LDRSP_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_LDRSP_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_LDRSP_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_LDRSP_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-05-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopment/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/LeadershipDevelopment/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/LeadershipDevelopmentGrp/TotalExpensePct'
V_LDRSP_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_LDRSP_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_LDRSP_PCT_EXP_TOT ) )
if( length( SH_02_LDRSP_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_LDRSP_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_LDRSP_PCT_EXP_TOT <-  paste0( '{', SH_02_LDRSP_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COAL_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-06-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuilding/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CoalitionBuilding/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuildingGrp/ActivitiesOrProgramsCnt'
V_COAL_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_COAL_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_COAL_NUM_ACT_PROG ) )
if( length( SH_02_COAL_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_COAL_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COAL_NUM_ACT_PROG <-  paste0( '{', SH_02_COAL_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COAL_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-06-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuilding/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CoalitionBuilding/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuildingGrp/PersonsServedCnt'
V_COAL_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_COAL_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_COAL_PERS_SERVED ) )
if( length( SH_02_COAL_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_COAL_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COAL_PERS_SERVED <-  paste0( '{', SH_02_COAL_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COAL_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-06-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuildingGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuilding/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CoalitionBuilding/TotalCommunityBuildingExpense'
V_COAL_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_COAL_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_COAL_EXP_TOT_COM_BLDG ) )
if( length( SH_02_COAL_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_COAL_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COAL_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_COAL_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COAL_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-06-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CoalitionBuilding/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuildingGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuilding/DirectOffsettingRevenue'
V_COAL_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_COAL_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_COAL_REV_DIRECT_OFFSET ) )
if( length( SH_02_COAL_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_COAL_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COAL_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_COAL_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COAL_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-06-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuildingGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuilding/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CoalitionBuilding/NetCommunityBuildingExpense'
V_COAL_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_COAL_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_COAL_EXP_NET_COM_BLDG ) )
if( length( SH_02_COAL_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_COAL_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COAL_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_COAL_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_COAL_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-06-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuilding/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/CoalitionBuilding/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/CoalitionBuildingGrp/TotalExpensePct'
V_COAL_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_COAL_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_COAL_PCT_EXP_TOT ) )
if( length( SH_02_COAL_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_COAL_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_COAL_PCT_EXP_TOT <-  paste0( '{', SH_02_COAL_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ADVOCACY_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-07-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacyGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacy/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/HealthImprovementAdvocacy/NumberOfActivitiesOrPrograms'
V_ADVOCACY_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_ADVOCACY_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_ADVOCACY_NUM_ACT_PROG ) )
if( length( SH_02_ADVOCACY_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_ADVOCACY_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ADVOCACY_NUM_ACT_PROG <-  paste0( '{', SH_02_ADVOCACY_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ADVOCACY_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-07-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacyGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacy/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/HealthImprovementAdvocacy/PersonsServed'
V_ADVOCACY_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_ADVOCACY_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_ADVOCACY_PERS_SERVED ) )
if( length( SH_02_ADVOCACY_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_ADVOCACY_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ADVOCACY_PERS_SERVED <-  paste0( '{', SH_02_ADVOCACY_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ADVOCACY_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-07-COL-C 
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacy/TotalCommunityBuildingExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/HealthImprovementAdvocacy/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacyGrp/TotalCommunityBenefitExpnsAmt'
V_ADVOCACY_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_ADVOCACY_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ADVOCACY_EXP_TOT_COM_BLDG ) )
if( length( SH_02_ADVOCACY_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_ADVOCACY_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ADVOCACY_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_ADVOCACY_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ADVOCACY_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-07-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/HealthImprovementAdvocacy/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacyGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacy/DirectOffsettingRevenue'
V_ADVOCACY_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_ADVOCACY_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_ADVOCACY_REV_DIRECT_OFFSET ) )
if( length( SH_02_ADVOCACY_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_ADVOCACY_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ADVOCACY_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_ADVOCACY_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ADVOCACY_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-07-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacy/NetCommunityBuildingExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/HealthImprovementAdvocacy/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacyGrp/NetCommunityBenefitExpnsAmt'
V_ADVOCACY_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_ADVOCACY_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_ADVOCACY_EXP_NET_COM_BLDG ) )
if( length( SH_02_ADVOCACY_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_ADVOCACY_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ADVOCACY_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_ADVOCACY_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_ADVOCACY_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-07-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacyGrp/TotalExpensePct'
V2 <- '//Return/ReturnData/IRS990ScheduleH/HealthImprovementAdvocacy/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/HealthImprovementAdvocacy/PercentOfTotalExpense'
V_ADVOCACY_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_ADVOCACY_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_ADVOCACY_PCT_EXP_TOT ) )
if( length( SH_02_ADVOCACY_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_ADVOCACY_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_ADVOCACY_PCT_EXP_TOT <-  paste0( '{', SH_02_ADVOCACY_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_WORK_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-08-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopment/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/WorkforceDevelopment/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopmentGrp/ActivitiesOrProgramsCnt'
V_WORK_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_WORK_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_WORK_NUM_ACT_PROG ) )
if( length( SH_02_WORK_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_WORK_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_WORK_NUM_ACT_PROG <-  paste0( '{', SH_02_WORK_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_WORK_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-08-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopmentGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopment/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/WorkforceDevelopment/PersonsServed'
V_WORK_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_WORK_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_WORK_PERS_SERVED ) )
if( length( SH_02_WORK_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_WORK_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_WORK_PERS_SERVED <-  paste0( '{', SH_02_WORK_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_WORK_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-08-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopmentGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopment/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/WorkforceDevelopment/TotalCommunityBuildingExpense'
V_WORK_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_WORK_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_WORK_EXP_TOT_COM_BLDG ) )
if( length( SH_02_WORK_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_WORK_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_WORK_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_WORK_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_WORK_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-08-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/WorkforceDevelopment/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopmentGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopment/DirectOffsettingRevenue'
V_WORK_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_WORK_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_WORK_REV_DIRECT_OFFSET ) )
if( length( SH_02_WORK_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_WORK_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_WORK_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_WORK_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_WORK_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-08-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopmentGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopment/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/WorkforceDevelopment/NetCommunityBuildingExpense'
V_WORK_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_WORK_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_WORK_EXP_NET_COM_BLDG ) )
if( length( SH_02_WORK_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_WORK_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_WORK_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_WORK_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_WORK_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-08-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopment/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/WorkforceDevelopment/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/WorkforceDevelopmentGrp/TotalExpensePct'
V_WORK_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_WORK_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_WORK_PCT_EXP_TOT ) )
if( length( SH_02_WORK_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_WORK_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_WORK_PCT_EXP_TOT <-  paste0( '{', SH_02_WORK_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_OTH_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-09-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/OtherCommuntityBuildingActyGrp/ActivitiesOrProgramsCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Other/NumberOfActivitiesOrPrograms'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Other/NumberOfActivitiesOrPrograms'
V_OTH_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_OTH_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_NUM_ACT_PROG ) )
if( length( SH_02_OTH_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_OTH_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_OTH_NUM_ACT_PROG <-  paste0( '{', SH_02_OTH_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_OTH_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-09-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/OtherCommuntityBuildingActyGrp/PersonsServedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Other/PersonsServed'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Other/PersonsServed'
V_OTH_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_OTH_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_PERS_SERVED ) )
if( length( SH_02_OTH_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_OTH_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_OTH_PERS_SERVED <-  paste0( '{', SH_02_OTH_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_OTH_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-09-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/OtherCommuntityBuildingActyGrp/TotalCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Other/TotalCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Other/TotalCommunityBuildingExpense'
V_OTH_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_OTH_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_EXP_TOT_COM_BLDG ) )
if( length( SH_02_OTH_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_OTH_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_OTH_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_OTH_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_OTH_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-09-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/OtherCommuntityBuildingActyGrp/DirectOffsettingRevenueAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Other/DirectOffsettingRevenue'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Other/DirectOffsettingRevenue'
V_OTH_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_OTH_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_REV_DIRECT_OFFSET ) )
if( length( SH_02_OTH_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_OTH_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_OTH_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_OTH_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_OTH_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-09-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/OtherCommuntityBuildingActyGrp/NetCommunityBenefitExpnsAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Other/NetCommunityBuildingExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Other/NetCommunityBuildingExpense'
V_OTH_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_OTH_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_EXP_NET_COM_BLDG ) )
if( length( SH_02_OTH_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_OTH_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_OTH_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_OTH_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_OTH_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-09-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/OtherCommuntityBuildingActyGrp/TotalExpensePct'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Other/PercentOfTotalExpense'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Other/PercentOfTotalExpense'
V_OTH_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_OTH_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_OTH_PCT_EXP_TOT ) )
if( length( SH_02_OTH_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_OTH_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_OTH_PCT_EXP_TOT <-  paste0( '{', SH_02_OTH_PCT_EXP_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_TOT_NUM_ACT_PROG
## DESCRIPTION:  Number of activities or programs
## LOCATION:  SCHED-H-PART-02-LINE-10-COL-A
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Total/NumberOfActivitiesOrPrograms'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommuntityBuildingActyGrp/ActivitiesOrProgramsCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Total/NumberOfActivitiesOrPrograms'
V_TOT_NUM_ACT_PROG <- paste( V1, V2, V3 , sep='|' )
SH_02_TOT_NUM_ACT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_NUM_ACT_PROG ) )
if( length( SH_02_TOT_NUM_ACT_PROG ) > 1 )
{ 
  create_record( varname=SH_02_TOT_NUM_ACT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_TOT_NUM_ACT_PROG <-  paste0( '{', SH_02_TOT_NUM_ACT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_TOT_PERS_SERVED
## DESCRIPTION:  Persons served
## LOCATION:  SCHED-H-PART-02-LINE-10-COL-B
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Total/PersonsServed'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommuntityBuildingActyGrp/PersonsServedCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Total/PersonsServed'
V_TOT_PERS_SERVED <- paste( V1, V2, V3 , sep='|' )
SH_02_TOT_PERS_SERVED <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_PERS_SERVED ) )
if( length( SH_02_TOT_PERS_SERVED ) > 1 )
{ 
  create_record( varname=SH_02_TOT_PERS_SERVED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_TOT_PERS_SERVED <-  paste0( '{', SH_02_TOT_PERS_SERVED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_TOT_EXP_TOT_COM_BLDG
## DESCRIPTION:  Total community building expense
## LOCATION:  SCHED-H-PART-02-LINE-10-COL-C
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Total/TotalCommunityBuildingExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommuntityBuildingActyGrp/TotalCommunityBenefitExpnsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Total/TotalCommunityBuildingExpense'
V_TOT_EXP_TOT_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_TOT_EXP_TOT_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_EXP_TOT_COM_BLDG ) )
if( length( SH_02_TOT_EXP_TOT_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_TOT_EXP_TOT_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_TOT_EXP_TOT_COM_BLDG <-  paste0( '{', SH_02_TOT_EXP_TOT_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_TOT_REV_DIRECT_OFFSET
## DESCRIPTION:  Direct offsetting revenue
## LOCATION:  SCHED-H-PART-02-LINE-10-COL-D
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Total/DirectOffsettingRevenue'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommuntityBuildingActyGrp/DirectOffsettingRevenueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Total/DirectOffsettingRevenue'
V_TOT_REV_DIRECT_OFFSET <- paste( V1, V2, V3 , sep='|' )
SH_02_TOT_REV_DIRECT_OFFSET <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_REV_DIRECT_OFFSET ) )
if( length( SH_02_TOT_REV_DIRECT_OFFSET ) > 1 )
{ 
  create_record( varname=SH_02_TOT_REV_DIRECT_OFFSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_TOT_REV_DIRECT_OFFSET <-  paste0( '{', SH_02_TOT_REV_DIRECT_OFFSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_TOT_EXP_NET_COM_BLDG
## DESCRIPTION:  Net community building expense
## LOCATION:  SCHED-H-PART-02-LINE-10-COL-E
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Total/NetCommunityBuildingExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommuntityBuildingActyGrp/NetCommunityBenefitExpnsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Total/NetCommunityBuildingExpense'
V_TOT_EXP_NET_COM_BLDG <- paste( V1, V2, V3 , sep='|' )
SH_02_TOT_EXP_NET_COM_BLDG <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_EXP_NET_COM_BLDG ) )
if( length( SH_02_TOT_EXP_NET_COM_BLDG ) > 1 )
{ 
  create_record( varname=SH_02_TOT_EXP_NET_COM_BLDG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_TOT_EXP_NET_COM_BLDG <-  paste0( '{', SH_02_TOT_EXP_NET_COM_BLDG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_02_TOT_PCT_EXP_TOT
## DESCRIPTION:  Percent of total expense
## LOCATION:  SCHED-H-PART-02-LINE-10-COL-F
## TABLE:  SH-P02-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Total/PercentOfTotalExpense'
V2 <- '//Return/ReturnData/IRS990ScheduleH/TotalCommuntityBuildingActyGrp/TotalExpensePct'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartII/Total/PercentOfTotalExpense'
V_TOT_PCT_EXP_TOT <- paste( V1, V2, V3 , sep='|' )
SH_02_TOT_PCT_EXP_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_TOT_PCT_EXP_TOT ) )
if( length( SH_02_TOT_PCT_EXP_TOT ) > 1 )
{ 
  create_record( varname=SH_02_TOT_PCT_EXP_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_02_TOT_PCT_EXP_TOT <-  paste0( '{', SH_02_TOT_PCT_EXP_TOT, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SH_02_PHY_IMP_NUM_ACT_PROG,SH_02_PHY_IMP_PERS_SERVED,SH_02_PHY_IMP_EXP_TOT_COM_BLDG,SH_02_PHY_IMP_REV_DIRECT_OFFSET,SH_02_PHY_IMP_EXP_NET_COM_BLDG,SH_02_PHY_IMP_PCT_EXP_TOT,SH_02_ECON_DEV_NUM_ACT_PROG,SH_02_ECON_DEV_PERS_SERVED,SH_02_ECON_DEV_EXP_TOT_COM_BLDG,SH_02_ECON_DEV_REV_DIRECT_OFFSET,SH_02_ECON_DEV_EXP_NET_COM_BLDG,SH_02_ECON_DEV_PCT_EXP_TOT,SH_02_COM_SUP_NUM_ACT_PROG,SH_02_COM_SUP_PERS_SERVED,SH_02_COM_SUP_EXP_TOT_COM_BLDG,SH_02_COM_SUP_REV_DIRECT_OFFSET,SH_02_COM_SUP_EXP_NET_COM_BLDG,SH_02_COM_SUP_PCT_EXP_TOT,SH_02_ENVIR_NUM_ACT_PROG,SH_02_ENVIR_PERS_SERVED,SH_02_ENVIR_EXP_TOT_COM_BLDG,SH_02_ENVIR_REV_DIRECT_OFFSET,SH_02_ENVIR_EXP_NET_COM_BLDG,SH_02_ENVIR_PCT_EXP_TOT,SH_02_LDRSP_NUM_ACT_PROG,SH_02_LDRSP_PERS_SERVED,SH_02_LDRSP_EXP_TOT_COM_BLDG,SH_02_LDRSP_REV_DIRECT_OFFSET,SH_02_LDRSP_EXP_NET_COM_BLDG,SH_02_LDRSP_PCT_EXP_TOT,SH_02_COAL_NUM_ACT_PROG,SH_02_COAL_PERS_SERVED,SH_02_COAL_EXP_TOT_COM_BLDG,SH_02_COAL_REV_DIRECT_OFFSET,SH_02_COAL_EXP_NET_COM_BLDG,SH_02_COAL_PCT_EXP_TOT,SH_02_ADVOCACY_NUM_ACT_PROG,SH_02_ADVOCACY_PERS_SERVED,SH_02_ADVOCACY_EXP_TOT_COM_BLDG,SH_02_ADVOCACY_REV_DIRECT_OFFSET,SH_02_ADVOCACY_EXP_NET_COM_BLDG,SH_02_ADVOCACY_PCT_EXP_TOT,SH_02_WORK_NUM_ACT_PROG,SH_02_WORK_PERS_SERVED,SH_02_WORK_EXP_TOT_COM_BLDG,SH_02_WORK_REV_DIRECT_OFFSET,SH_02_WORK_EXP_NET_COM_BLDG,SH_02_WORK_PCT_EXP_TOT,SH_02_OTH_NUM_ACT_PROG,SH_02_OTH_PERS_SERVED,SH_02_OTH_EXP_TOT_COM_BLDG,SH_02_OTH_REV_DIRECT_OFFSET,SH_02_OTH_EXP_NET_COM_BLDG,SH_02_OTH_PCT_EXP_TOT,SH_02_TOT_NUM_ACT_PROG,SH_02_TOT_PERS_SERVED,SH_02_TOT_EXP_TOT_COM_BLDG,SH_02_TOT_REV_DIRECT_OFFSET,SH_02_TOT_EXP_NET_COM_BLDG,SH_02_TOT_PCT_EXP_TOT)
df <- as.data.frame( var.list )


return( df )


}


