#' @title 
#'   Build table SD-P06-T00-LAND-BLDG-EQUIP
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P06_T00_LAND_BLDG_EQUIP <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_06_ORG_BLDG_BV
## DESCRIPTION:  Buildings - Book value
## LOCATION:  SCHED-D-PART-06-LINE-01B-COL-D
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Buildings/BookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BuildingsGrp/BookValueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Buildings/BookValue'
V_ORG_BLDG_BV <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_BLDG_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BLDG_BV ) )
if( length( SD_06_ORG_BLDG_BV ) > 1 )
{ 
  create_record( varname=SD_06_ORG_BLDG_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_BLDG_BV <-  paste0( '{', SD_06_ORG_BLDG_BV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_BLDG_DEPREC
## DESCRIPTION:  Buildings - Depreciation
## LOCATION:  SCHED-D-PART-06-LINE-01B-COL-C
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Buildings/Depreciation'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BuildingsGrp/DepreciationAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Buildings/Depreciation'
V_ORG_BLDG_DEPREC <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_BLDG_DEPREC <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BLDG_DEPREC ) )
if( length( SD_06_ORG_BLDG_DEPREC ) > 1 )
{ 
  create_record( varname=SD_06_ORG_BLDG_DEPREC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_BLDG_DEPREC <-  paste0( '{', SD_06_ORG_BLDG_DEPREC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_BLDG_COST_INVEST
## DESCRIPTION:  Investment cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01B-COL-A
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Buildings/InvestmentCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BuildingsGrp/InvestmentCostOrOtherBasisAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Buildings/InvestmentCostOrOtherBasis'
V_ORG_BLDG_COST_INVEST <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_BLDG_COST_INVEST <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BLDG_COST_INVEST ) )
if( length( SD_06_ORG_BLDG_COST_INVEST ) > 1 )
{ 
  create_record( varname=SD_06_ORG_BLDG_COST_INVEST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_BLDG_COST_INVEST <-  paste0( '{', SD_06_ORG_BLDG_COST_INVEST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_BLDG_COST_OTH
## DESCRIPTION:  Other cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01B-COL-B
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Buildings/OtherCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/BuildingsGrp/OtherCostOrOtherBasisAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Buildings/OtherCostOrOtherBasis'
V_ORG_BLDG_COST_OTH <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_BLDG_COST_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_BLDG_COST_OTH ) )
if( length( SD_06_ORG_BLDG_COST_OTH ) > 1 )
{ 
  create_record( varname=SD_06_ORG_BLDG_COST_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_BLDG_COST_OTH <-  paste0( '{', SD_06_ORG_BLDG_COST_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_EQUIP_BV
## DESCRIPTION:  Equipment - Book value
## LOCATION:  SCHED-D-PART-06-LINE-01D-COL-D
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Equipment/BookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EquipmentGrp/BookValueAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Equipment/BookValue'
V_ORG_EQUIP_BV <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_EQUIP_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_EQUIP_BV ) )
if( length( SD_06_ORG_EQUIP_BV ) > 1 )
{ 
  create_record( varname=SD_06_ORG_EQUIP_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_EQUIP_BV <-  paste0( '{', SD_06_ORG_EQUIP_BV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_EQUIP_DEPREC
## DESCRIPTION:  Equipment - Depreciation
## LOCATION:  SCHED-D-PART-06-LINE-01D-COL-C
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Equipment/Depreciation'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EquipmentGrp/DepreciationAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Equipment/Depreciation'
V_ORG_EQUIP_DEPREC <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_EQUIP_DEPREC <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_EQUIP_DEPREC ) )
if( length( SD_06_ORG_EQUIP_DEPREC ) > 1 )
{ 
  create_record( varname=SD_06_ORG_EQUIP_DEPREC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_EQUIP_DEPREC <-  paste0( '{', SD_06_ORG_EQUIP_DEPREC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_EQUIP_COST_INVEST
## DESCRIPTION:  Investment cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01D-COL-A
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Equipment/InvestmentCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EquipmentGrp/InvestmentCostOrOtherBasisAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Equipment/InvestmentCostOrOtherBasis'
V_ORG_EQUIP_COST_INVEST <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_EQUIP_COST_INVEST <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_EQUIP_COST_INVEST ) )
if( length( SD_06_ORG_EQUIP_COST_INVEST ) > 1 )
{ 
  create_record( varname=SD_06_ORG_EQUIP_COST_INVEST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_EQUIP_COST_INVEST <-  paste0( '{', SD_06_ORG_EQUIP_COST_INVEST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_EQUIP_COST_OTH
## DESCRIPTION:  Other cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01D-COL-B
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Equipment/OtherCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/EquipmentGrp/OtherCostOrOtherBasisAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Equipment/OtherCostOrOtherBasis'
V_ORG_EQUIP_COST_OTH <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_EQUIP_COST_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_EQUIP_COST_OTH ) )
if( length( SD_06_ORG_EQUIP_COST_OTH ) > 1 )
{ 
  create_record( varname=SD_06_ORG_EQUIP_COST_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_EQUIP_COST_OTH <-  paste0( '{', SD_06_ORG_EQUIP_COST_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LAND_BV
## DESCRIPTION:  Land - Book value
## LOCATION:  SCHED-D-PART-06-LINE-01A-COL-D
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Land/BookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Land/BookValue'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LandGrp/BookValueAmt'
V_ORG_LAND_BV <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LAND_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LAND_BV ) )
if( length( SD_06_ORG_LAND_BV ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LAND_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LAND_BV <-  paste0( '{', SD_06_ORG_LAND_BV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LAND_COST_INVEST
## DESCRIPTION:  Investment cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01A-COL-A
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Land/InvestmentCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Land/InvestmentCostOrOtherBasis'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LandGrp/InvestmentCostOrOtherBasisAmt'
V_ORG_LAND_COST_INVEST <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LAND_COST_INVEST <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LAND_COST_INVEST ) )
if( length( SD_06_ORG_LAND_COST_INVEST ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LAND_COST_INVEST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LAND_COST_INVEST <-  paste0( '{', SD_06_ORG_LAND_COST_INVEST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LAND_COST_OTH
## DESCRIPTION:  Other cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01A-COL-B
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Land/OtherCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Land/OtherCostOrOtherBasis'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LandGrp/OtherCostOrOtherBasisAmt'
V_ORG_LAND_COST_OTH <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LAND_COST_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LAND_COST_OTH ) )
if( length( SD_06_ORG_LAND_COST_OTH ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LAND_COST_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LAND_COST_OTH <-  paste0( '{', SD_06_ORG_LAND_COST_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LEASEHOLD_BV
## DESCRIPTION:  Leasehold Improvements - Book value
## LOCATION:  SCHED-D-PART-06-LINE-01C-COL-D
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/LeaseholdImprovements/BookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovements/BookValue'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovementsGrp/BookValueAmt'
V_ORG_LEASEHOLD_BV <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LEASEHOLD_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LEASEHOLD_BV ) )
if( length( SD_06_ORG_LEASEHOLD_BV ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LEASEHOLD_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LEASEHOLD_BV <-  paste0( '{', SD_06_ORG_LEASEHOLD_BV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LEASEHOLD_DEPREC
## DESCRIPTION:  Leasehold Improvements - Depreciation
## LOCATION:  SCHED-D-PART-06-LINE-01C-COL-C
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/LeaseholdImprovements/Depreciation'
V2 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovements/Depreciation'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovementsGrp/DepreciationAmt'
V_ORG_LEASEHOLD_DEPREC <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LEASEHOLD_DEPREC <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LEASEHOLD_DEPREC ) )
if( length( SD_06_ORG_LEASEHOLD_DEPREC ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LEASEHOLD_DEPREC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LEASEHOLD_DEPREC <-  paste0( '{', SD_06_ORG_LEASEHOLD_DEPREC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LEASEHOLD_COST_INVEST
## DESCRIPTION:  Investment cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01C-COL-A
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/LeaseholdImprovements/InvestmentCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovements/InvestmentCostOrOtherBasis'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovementsGrp/InvestmentCostOrOtherBasisAmt'
V_ORG_LEASEHOLD_COST_INVEST <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LEASEHOLD_COST_INVEST <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LEASEHOLD_COST_INVEST ) )
if( length( SD_06_ORG_LEASEHOLD_COST_INVEST ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LEASEHOLD_COST_INVEST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LEASEHOLD_COST_INVEST <-  paste0( '{', SD_06_ORG_LEASEHOLD_COST_INVEST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_LEASEHOLD_COST_OTH
## DESCRIPTION:  Other cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01C-COL-B
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/LeaseholdImprovements/OtherCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovements/OtherCostOrOtherBasis'
V3 <- '//Return/ReturnData/IRS990ScheduleD/LeaseholdImprovementsGrp/OtherCostOrOtherBasisAmt'
V_ORG_LEASEHOLD_COST_OTH <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_LEASEHOLD_COST_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_LEASEHOLD_COST_OTH ) )
if( length( SD_06_ORG_LEASEHOLD_COST_OTH ) > 1 )
{ 
  create_record( varname=SD_06_ORG_LEASEHOLD_COST_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_LEASEHOLD_COST_OTH <-  paste0( '{', SD_06_ORG_LEASEHOLD_COST_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_OTH_BV
## DESCRIPTION:  Other - Book value
## LOCATION:  SCHED-D-PART-06-LINE-01E-COL-D
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Other/BookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildings/BookValue'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildingsGrp/BookValueAmt'
V_ORG_OTH_BV <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_OTH_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_OTH_BV ) )
if( length( SD_06_ORG_OTH_BV ) > 1 )
{ 
  create_record( varname=SD_06_ORG_OTH_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_OTH_BV <-  paste0( '{', SD_06_ORG_OTH_BV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_OTH_DEPREC
## DESCRIPTION:  Other - Depreciation
## LOCATION:  SCHED-D-PART-06-LINE-01E-COL-C
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Other/Depreciation'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildings/Depreciation'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildingsGrp/DepreciationAmt'
V_ORG_OTH_DEPREC <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_OTH_DEPREC <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_OTH_DEPREC ) )
if( length( SD_06_ORG_OTH_DEPREC ) > 1 )
{ 
  create_record( varname=SD_06_ORG_OTH_DEPREC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_OTH_DEPREC <-  paste0( '{', SD_06_ORG_OTH_DEPREC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_OTH_COST_INVEST
## DESCRIPTION:  Investment cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01E-COL-A
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Other/InvestmentCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildings/InvestmentCostOrOtherBasis'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildingsGrp/InvestmentCostOrOtherBasisAmt'
V_ORG_OTH_COST_INVEST <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_OTH_COST_INVEST <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_OTH_COST_INVEST ) )
if( length( SD_06_ORG_OTH_COST_INVEST ) > 1 )
{ 
  create_record( varname=SD_06_ORG_OTH_COST_INVEST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_OTH_COST_INVEST <-  paste0( '{', SD_06_ORG_OTH_COST_INVEST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_OTH_COST_OTH
## DESCRIPTION:  Other cost or other basis
## LOCATION:  SCHED-D-PART-06-LINE-01E-COL-B
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/Other/OtherCostOrOtherBasis'
V2 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildings/OtherCostOrOtherBasis'
V3 <- '//Return/ReturnData/IRS990ScheduleD/OtherLandBuildingsGrp/OtherCostOrOtherBasisAmt'
V_ORG_OTH_COST_OTH <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_OTH_COST_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_OTH_COST_OTH ) )
if( length( SD_06_ORG_OTH_COST_OTH ) > 1 )
{ 
  create_record( varname=SD_06_ORG_OTH_COST_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_OTH_COST_OTH <-  paste0( '{', SD_06_ORG_OTH_COST_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_06_ORG_TOT_BV
## DESCRIPTION:  Total of book value
## LOCATION:  SCHED-D-PART-06-LINE-999-COL-D
## TABLE:  SD-P06-T00-LAND-BLDG-EQUIP
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartVI/TotalOfBookValue'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalBookValueLandBuildingsAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalOfBookValueLandBuildings'
V_ORG_TOT_BV <- paste( V1, V2, V3 , sep='|' )
SD_06_ORG_TOT_BV <- xml2::xml_text( xml2::xml_find_all( doc, V_ORG_TOT_BV ) )
if( length( SD_06_ORG_TOT_BV ) > 1 )
{ 
  create_record( varname=SD_06_ORG_TOT_BV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_06_ORG_TOT_BV <-  paste0( '{', SD_06_ORG_TOT_BV, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_06_ORG_BLDG_BV,SD_06_ORG_BLDG_DEPREC,SD_06_ORG_BLDG_COST_INVEST,SD_06_ORG_BLDG_COST_OTH,SD_06_ORG_EQUIP_BV,SD_06_ORG_EQUIP_DEPREC,SD_06_ORG_EQUIP_COST_INVEST,SD_06_ORG_EQUIP_COST_OTH,SD_06_ORG_LAND_BV,SD_06_ORG_LAND_COST_INVEST,SD_06_ORG_LAND_COST_OTH,SD_06_ORG_LEASEHOLD_BV,SD_06_ORG_LEASEHOLD_DEPREC,SD_06_ORG_LEASEHOLD_COST_INVEST,SD_06_ORG_LEASEHOLD_COST_OTH,SD_06_ORG_OTH_BV,SD_06_ORG_OTH_DEPREC,SD_06_ORG_OTH_COST_INVEST,SD_06_ORG_OTH_COST_OTH,SD_06_ORG_TOT_BV)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


