#' @title 
#'   Build table SG-P03-T00-GAMING
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SG_P03_T00_GAMING <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SG_03_GRK_ADDR_L1
## DESCRIPTION:  Address Of Gaming Rec Keeper Frgn - AddressLine1
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/AddressLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/AddressLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/AddressLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/AddressLine1'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine1'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine1Txt'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine1'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine1Txt'
V_GRK_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_ADDR_L1 ) )
if( length( SG_03_GRK_ADDR_L1 ) > 1 )
{ 
  create_record( varname=SG_03_GRK_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_ADDR_L1 <-  paste0( '{', SG_03_GRK_ADDR_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_ADDR_L2
## DESCRIPTION:  Address Of Gaming Rec Keeper Frgn - AddressLine2
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/AddressLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/AddressLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/AddressLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/AddressLine2'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine2'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/AddressLine2Txt'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine2'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/AddressLine2Txt'
V_GRK_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_ADDR_L2 ) )
if( length( SG_03_GRK_ADDR_L2 ) > 1 )
{ 
  create_record( varname=SG_03_GRK_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_ADDR_L2 <-  paste0( '{', SG_03_GRK_ADDR_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_ADDR_CITY
## DESCRIPTION:  Address Of Gaming Rec Keeper Frgn - City
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/City'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/City'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/City'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/City'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/City'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/CityNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/City'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/CityNm'
V_GRK_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_ADDR_CITY ) )
if( length( SG_03_GRK_ADDR_CITY ) > 1 )
{ 
  create_record( varname=SG_03_GRK_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_ADDR_CITY <-  paste0( '{', SG_03_GRK_ADDR_CITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_ADDR_CNTR
## DESCRIPTION:  Address Of Gaming Rec Keeper Frgn - Country
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/Country'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/Country'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/Country'
V4 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/CountryCd'
V_GRK_ADDR_CNTR <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_GRK_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_ADDR_CNTR ) )
if( length( SG_03_GRK_ADDR_CNTR ) > 1 )
{ 
  create_record( varname=SG_03_GRK_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_ADDR_CNTR <-  paste0( '{', SG_03_GRK_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_ADDR_ZIP
## DESCRIPTION:  Address Of Gaming Rec Keeper Frgn - Postal code
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/PostalCode'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/ZIPCode'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/PostalCode'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/ZIPCode'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/ForeignPostalCd'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/PostalCode'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/ZIPCd'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/ZIPCode'
V_GRK_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_ZIP <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_ADDR_ZIP ) )
if( length( SG_03_GRK_ADDR_ZIP ) > 1 )
{ 
  create_record( varname=SG_03_GRK_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_ADDR_ZIP <-  paste0( '{', SG_03_GRK_ADDR_ZIP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_ADDR_STATE
## DESCRIPTION:  Province or state
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperFrgn/ProvinceOrState'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfGamingRecKeeperUS/State'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressForeign/ProvinceOrState'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfGamingRecordsKeeper/AddressUS/State'
V5 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/ProvinceOrState'
V6 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksForeignAddress/ProvinceOrStateNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/State'
V8 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksUSAddress/StateAbbreviationCd'
V_GRK_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_GRK_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_ADDR_STATE ) )
if( length( SG_03_GRK_ADDR_STATE ) > 1 )
{ 
  create_record( varname=SG_03_GRK_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_ADDR_STATE <-  paste0( '{', SG_03_GRK_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_L1
## DESCRIPTION:  Address Of Third Party Foreign - AddressLine1
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/AddressLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/AddressLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/AddressLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/AddressLine1'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine1'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine1Txt'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine1'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine1Txt'
V_THIRD_PARTY_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_ADDR_L1 ) )
if( length( SG_03_THIRD_PARTY_ADDR_L1 ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_ADDR_L1 <-  paste0( '{', SG_03_THIRD_PARTY_ADDR_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_L2
## DESCRIPTION:  Address Of Third Party Foreign - AddressLine2
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/AddressLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/AddressLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/AddressLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/AddressLine2'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine2'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/AddressLine2Txt'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine2'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/AddressLine2Txt'
V_THIRD_PARTY_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_ADDR_L2 ) )
if( length( SG_03_THIRD_PARTY_ADDR_L2 ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_ADDR_L2 <-  paste0( '{', SG_03_THIRD_PARTY_ADDR_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_CITY
## DESCRIPTION:  Address Of Third Party Foreign - City
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/City'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/City'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/City'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/City'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/City'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/CityNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/City'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/CityNm'
V_THIRD_PARTY_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_ADDR_CITY ) )
if( length( SG_03_THIRD_PARTY_ADDR_CITY ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_ADDR_CITY <-  paste0( '{', SG_03_THIRD_PARTY_ADDR_CITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_CNTR
## DESCRIPTION:  Address Of Third Party Foreign - Country
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/Country'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/Country'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/Country'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/CountryCd'
V_THIRD_PARTY_ADDR_CNTR <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_THIRD_PARTY_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_ADDR_CNTR ) )
if( length( SG_03_THIRD_PARTY_ADDR_CNTR ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_ADDR_CNTR <-  paste0( '{', SG_03_THIRD_PARTY_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_ZIP
## DESCRIPTION:  Address Of Third Party Foreign - Postal code
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/PostalCode'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/ZIPCode'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/PostalCode'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/ZIPCode'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/ForeignPostalCd'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/PostalCode'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/ZIPCd'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/ZIPCode'
V_THIRD_PARTY_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_ZIP <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_ADDR_ZIP ) )
if( length( SG_03_THIRD_PARTY_ADDR_ZIP ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_ADDR_ZIP <-  paste0( '{', SG_03_THIRD_PARTY_ADDR_ZIP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_ADDR_STATE
## DESCRIPTION:  Province or state
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyForeign/ProvinceOrState'
V2 <- '//Return/ReturnData/IRS990ScheduleG/AddressOfThirdPartyUS/State'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressForeign/ProvinceOrState'
V4 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AddressOfThirdParty/AddressUS/State'
V5 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/ProvinceOrState'
V6 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyForeignAddress/ProvinceOrStateNm'
V7 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/State'
V8 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyUSAddress/StateAbbreviationCd'
V_THIRD_PARTY_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6, V7, V8 , sep='|' )
SG_03_THIRD_PARTY_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_ADDR_STATE ) )
if( length( SG_03_THIRD_PARTY_ADDR_STATE ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_ADDR_STATE <-  paste0( '{', SG_03_THIRD_PARTY_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_AMT_DIST
## DESCRIPTION:  Amount distributed
## LOCATION:  SCHED-G-PART-03-LINE-17B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AmountDistributed'
V2 <- '//Return/ReturnData/IRS990ScheduleG/DistributedAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AmountDistributed'
V_AMT_DIST <- paste( V1, V2, V3 , sep='|' )
SG_03_AMT_DIST <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_DIST ) )
if( length( SG_03_AMT_DIST ) > 1 )
{ 
  create_record( varname=SG_03_AMT_DIST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_AMT_DIST <-  paste0( '{', SG_03_AMT_DIST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_AMT_GAMING_REV_ORG
## DESCRIPTION:  Amount of gaming revenue received by organization
## LOCATION:  SCHED-G-PART-03-LINE-15B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AmtOfGamingRevenueRecvdByOrg'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AmtOfGamingRevenueRecvdByOrg'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingRevenueReceivedByOrgAmt'
V_AMT_GAMING_REV_ORG <- paste( V1, V2, V3 , sep='|' )
SG_03_AMT_GAMING_REV_ORG <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_GAMING_REV_ORG ) )
if( length( SG_03_AMT_GAMING_REV_ORG ) > 1 )
{ 
  create_record( varname=SG_03_AMT_GAMING_REV_ORG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_AMT_GAMING_REV_ORG <-  paste0( '{', SG_03_AMT_GAMING_REV_ORG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_AMT_GAMING_REV_3RD_PARTY
## DESCRIPTION:  Amount of gaming revenue retained by 3rd party
## LOCATION:  SCHED-G-PART-03-LINE-15B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/AmtOfGamingRevenueRetndBy3Prty'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/AmtOfGamingRevenueRetndBy3Prty'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingRevenueRtnBy3PrtyAmt'
V_AMT_GAMING_REV_3RD_PARTY <- paste( V1, V2, V3 , sep='|' )
SG_03_AMT_GAMING_REV_3RD_PARTY <- xml2::xml_text( xml2::xml_find_all( doc, V_AMT_GAMING_REV_3RD_PARTY ) )
if( length( SG_03_AMT_GAMING_REV_3RD_PARTY ) > 1 )
{ 
  create_record( varname=SG_03_AMT_GAMING_REV_3RD_PARTY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_AMT_GAMING_REV_3RD_PARTY <-  paste0( '{', SG_03_AMT_GAMING_REV_3RD_PARTY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_CHARIT_DIST_REQ_X
## DESCRIPTION:  Charitable distributions required?
## LOCATION:  SCHED-G-PART-03-LINE-17A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/CharitableDistribRequired'
V2 <- '//Return/ReturnData/IRS990ScheduleG/CharitableDistributionRqrInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/CharitableDistribRequired'
V_CHARIT_DIST_REQ_X <- paste( V1, V2, V3 , sep='|' )
SG_03_CHARIT_DIST_REQ_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CHARIT_DIST_REQ_X ) )
if( length( SG_03_CHARIT_DIST_REQ_X ) > 1 )
{ 
  create_record( varname=SG_03_CHARIT_DIST_REQ_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_CHARIT_DIST_REQ_X <-  paste0( '{', SG_03_CHARIT_DIST_REQ_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_KONTR_3RD_PARTY_X
## DESCRIPTION:  Is there a third party contract for gaming revenue?
## LOCATION:  SCHED-G-PART-03-LINE-15A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/CntrctWith3rdPrtyForGameRevInd'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ContractWith3rdPartyForGamRev'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/ContractWith3rdPartyForGamRev'
V_KONTR_3RD_PARTY_X <- paste( V1, V2, V3 , sep='|' )
SG_03_KONTR_3RD_PARTY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_KONTR_3RD_PARTY_X ) )
if( length( SG_03_KONTR_3RD_PARTY_X ) > 1 )
{ 
  create_record( varname=SG_03_KONTR_3RD_PARTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_KONTR_3RD_PARTY_X <-  paste0( '{', SG_03_KONTR_3RD_PARTY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_NO_LIC_EXPLANATION
## DESCRIPTION:  Explanation if no license
## LOCATION:  SCHED-G-PART-03-LINE-09B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfNo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfNoTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/ExplanationIfNo'
V_GAMING_NO_LIC_EXPLANATION <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_NO_LIC_EXPLANATION <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_NO_LIC_EXPLANATION ) )
if( length( SG_03_GAMING_NO_LIC_EXPLANATION ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_NO_LIC_EXPLANATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_NO_LIC_EXPLANATION <-  paste0( '{', SG_03_GAMING_NO_LIC_EXPLANATION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_LIC_SUSPENDED_EXPLANATION
## DESCRIPTION:  Explanation if license revoked; suspended; or termination
## LOCATION:  SCHED-G-PART-03-LINE-10B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfYes'
V2 <- '//Return/ReturnData/IRS990ScheduleG/ExplanationIfYesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/ExplanationIfYes'
V_LIC_SUSPENDED_EXPLANATION <- paste( V1, V2, V3 , sep='|' )
SG_03_LIC_SUSPENDED_EXPLANATION <- xml2::xml_text( xml2::xml_find_all( doc, V_LIC_SUSPENDED_EXPLANATION ) )
if( length( SG_03_LIC_SUSPENDED_EXPLANATION ) > 1 )
{ 
  create_record( varname=SG_03_LIC_SUSPENDED_EXPLANATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_LIC_SUSPENDED_EXPLANATION <-  paste0( '{', SG_03_LIC_SUSPENDED_EXPLANATION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_BINGO
## DESCRIPTION:  Cash prizes; bingo
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesBingoAmt'
V_GAMING_EXP_CASH_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_BINGO <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_CASH_BINGO ) )
if( length( SG_03_GAMING_EXP_CASH_BINGO ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_CASH_BINGO, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_CASH_BINGO <-  paste0( '{', SG_03_GAMING_EXP_CASH_BINGO, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_OTH
## DESCRIPTION:  Cash prizes; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesOtherGamingAmt'
V_GAMING_EXP_CASH_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_CASH_OTH ) )
if( length( SG_03_GAMING_EXP_CASH_OTH ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_CASH_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_CASH_OTH <-  paste0( '{', SG_03_GAMING_EXP_CASH_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_PTAP
## DESCRIPTION:  Cash prizes; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesPullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesPullTabsAmt'
V_GAMING_EXP_CASH_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_PTAP <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_CASH_PTAP ) )
if( length( SG_03_GAMING_EXP_CASH_PTAP ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_CASH_PTAP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_CASH_PTAP <-  paste0( '{', SG_03_GAMING_EXP_CASH_PTAP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_CASH_TOT
## DESCRIPTION:  Cash prizes; total
## LOCATION:  SCHED-G-PART-03-LINE-02-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/CashPrizesTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/CashPrizesTotalGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/CashPrizesTotalGamingAmt'
V_GAMING_EXP_CASH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_CASH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_CASH_TOT ) )
if( length( SG_03_GAMING_EXP_CASH_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_CASH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_CASH_TOT <-  paste0( '{', SG_03_GAMING_EXP_CASH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_SUMMARY_TOT
## DESCRIPTION:  Direct expense summary
## LOCATION:  SCHED-G-PART-03-LINE-07-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/DirectExpenseSummaryGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/DirectExpenseSummaryGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/DirectExpenseSummaryGamingAmt'
V_GAMING_EXP_SUMMARY_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_SUMMARY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_SUMMARY_TOT ) )
if( length( SG_03_GAMING_EXP_SUMMARY_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_SUMMARY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_SUMMARY_TOT <-  paste0( '{', SG_03_GAMING_EXP_SUMMARY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_BINGO
## DESCRIPTION:  Gross revenue; bingo
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenueBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenueBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenueBingoAmt'
V_GAMING_REV_GRO_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_BINGO <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_REV_GRO_BINGO ) )
if( length( SG_03_GAMING_REV_GRO_BINGO ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_REV_GRO_BINGO, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_REV_GRO_BINGO <-  paste0( '{', SG_03_GAMING_REV_GRO_BINGO, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_OTH
## DESCRIPTION:  Gross revenue; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenueOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenueOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenueOtherGamingAmt'
V_GAMING_REV_GRO_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_REV_GRO_OTH ) )
if( length( SG_03_GAMING_REV_GRO_OTH ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_REV_GRO_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_REV_GRO_OTH <-  paste0( '{', SG_03_GAMING_REV_GRO_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_PTAB
## DESCRIPTION:  Gross revenue; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenuePullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenuePullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenuePullTabsAmt'
V_GAMING_REV_GRO_PTAB <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_PTAB <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_REV_GRO_PTAB ) )
if( length( SG_03_GAMING_REV_GRO_PTAB ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_REV_GRO_PTAB, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_REV_GRO_PTAB <-  paste0( '{', SG_03_GAMING_REV_GRO_PTAB, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_REV_GRO_TOT
## DESCRIPTION:  Gross revenue; total
## LOCATION:  SCHED-G-PART-03-LINE-01-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/GrossRevenueTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/GrossRevenueTotalGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/GrossRevenueTotalGamingAmt'
V_GAMING_REV_GRO_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_REV_GRO_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_REV_GRO_TOT ) )
if( length( SG_03_GAMING_REV_GRO_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_REV_GRO_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_REV_GRO_TOT <-  paste0( '{', SG_03_GAMING_REV_GRO_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_NET_INCOME_TOT
## DESCRIPTION:  Net gaming income summary
## LOCATION:  SCHED-G-PART-03-LINE-08-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NetGamingIncomeSummary'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NetGamingIncomeSummary'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NetGamingIncomeSummaryAmt'
V_GAMING_NET_INCOME_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_NET_INCOME_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_NET_INCOME_TOT ) )
if( length( SG_03_GAMING_NET_INCOME_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_NET_INCOME_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_NET_INCOME_TOT <-  paste0( '{', SG_03_GAMING_NET_INCOME_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_BINGO
## DESCRIPTION:  Non-cash prizes; bingo
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesBingoAmt'
V_GAMING_EXP_NONCSH_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_BINGO <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_NONCSH_BINGO ) )
if( length( SG_03_GAMING_EXP_NONCSH_BINGO ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_NONCSH_BINGO, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_NONCSH_BINGO <-  paste0( '{', SG_03_GAMING_EXP_NONCSH_BINGO, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_OTH
## DESCRIPTION:  Non-cash prizes; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesOtherGamingAmt'
V_GAMING_EXP_NONCSH_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_NONCSH_OTH ) )
if( length( SG_03_GAMING_EXP_NONCSH_OTH ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_NONCSH_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_NONCSH_OTH <-  paste0( '{', SG_03_GAMING_EXP_NONCSH_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_PTAP
## DESCRIPTION:  Non-cash prizes; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesPullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesPullTabsAmt'
V_GAMING_EXP_NONCSH_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_PTAP <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_NONCSH_PTAP ) )
if( length( SG_03_GAMING_EXP_NONCSH_PTAP ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_NONCSH_PTAP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_NONCSH_PTAP <-  paste0( '{', SG_03_GAMING_EXP_NONCSH_PTAP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_NONCSH_TOT
## DESCRIPTION:  Non-cash prizes; total
## LOCATION:  SCHED-G-PART-03-LINE-03-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/NonCashPrizesTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/NonCashPrizesTotalGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/NonCashPrizesTotalGamingAmt'
V_GAMING_EXP_NONCSH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_NONCSH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_NONCSH_TOT ) )
if( length( SG_03_GAMING_EXP_NONCSH_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_NONCSH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_NONCSH_TOT <-  paste0( '{', SG_03_GAMING_EXP_NONCSH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_BINGO
## DESCRIPTION:  Other direct expenses; bingo
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OtherDirectExpensesBingoAmt'
V_GAMING_EXP_OTH_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_BINGO <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_OTH_BINGO ) )
if( length( SG_03_GAMING_EXP_OTH_BINGO ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_OTH_BINGO, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_OTH_BINGO <-  paste0( '{', SG_03_GAMING_EXP_OTH_BINGO, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_OTH
## DESCRIPTION:  Other direct expenses; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OthDirectExpnssOtherGamingAmt'
V_GAMING_EXP_OTH_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_OTH_OTH ) )
if( length( SG_03_GAMING_EXP_OTH_OTH ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_OTH_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_OTH_OTH <-  paste0( '{', SG_03_GAMING_EXP_OTH_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_PTAP
## DESCRIPTION:  Other direct expenses; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesPullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OtherDirectExpensesPullTabsAmt'
V_GAMING_EXP_OTH_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_PTAP <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_OTH_PTAP ) )
if( length( SG_03_GAMING_EXP_OTH_PTAP ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_OTH_PTAP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_OTH_PTAP <-  paste0( '{', SG_03_GAMING_EXP_OTH_PTAP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_OTH_TOT
## DESCRIPTION:  Other direct expenses; total
## LOCATION:  SCHED-G-PART-03-LINE-05-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/OtherDirectExpensesTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/OtherDirectExpensesTotalGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/OthDirectExpnssTotalGamingAmt'
V_GAMING_EXP_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_OTH_TOT ) )
if( length( SG_03_GAMING_EXP_OTH_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_OTH_TOT <-  paste0( '{', SG_03_GAMING_EXP_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_BINGO
## DESCRIPTION:  Rent/facility costs; bingo
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFacilityCostsBingoAmt'
V_GAMING_EXP_RENT_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_BINGO <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_RENT_BINGO ) )
if( length( SG_03_GAMING_EXP_RENT_BINGO ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_RENT_BINGO, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_RENT_BINGO <-  paste0( '{', SG_03_GAMING_EXP_RENT_BINGO, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_OTH
## DESCRIPTION:  Rent/facility costs; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFcltyCostsOtherGamingAmt'
V_GAMING_EXP_RENT_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_RENT_OTH ) )
if( length( SG_03_GAMING_EXP_RENT_OTH ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_RENT_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_RENT_OTH <-  paste0( '{', SG_03_GAMING_EXP_RENT_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_PTAP
## DESCRIPTION:  Rent/facility costs; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsPullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFacilityCostsPullTabsAmt'
V_GAMING_EXP_RENT_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_PTAP <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_RENT_PTAP ) )
if( length( SG_03_GAMING_EXP_RENT_PTAP ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_RENT_PTAP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_RENT_PTAP <-  paste0( '{', SG_03_GAMING_EXP_RENT_PTAP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_EXP_RENT_TOT
## DESCRIPTION:  Rent/facility costs; total
## LOCATION:  SCHED-G-PART-03-LINE-04-COL-D
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/RentFacilityCostsTotalGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/RentFacilityCostsTotalGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/RentFcltyCostsTotalGamingAmt'
V_GAMING_EXP_RENT_TOT <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_EXP_RENT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_EXP_RENT_TOT ) )
if( length( SG_03_GAMING_EXP_RENT_TOT ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_EXP_RENT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_EXP_RENT_TOT <-  paste0( '{', SG_03_GAMING_EXP_RENT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_VOL_BINGO_X
## DESCRIPTION:  volunteer labor; bingo
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborBingoInd'
V_GAMING_VOL_BINGO_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_BINGO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_VOL_BINGO_X ) )
if( length( SG_03_GAMING_VOL_BINGO_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_VOL_BINGO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_VOL_BINGO_X <-  paste0( '{', SG_03_GAMING_VOL_BINGO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_VOL_OTH_X
## DESCRIPTION:  volunteer labor; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborOtherGamingInd'
V_GAMING_VOL_OTH_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_VOL_OTH_X ) )
if( length( SG_03_GAMING_VOL_OTH_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_VOL_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_VOL_OTH_X <-  paste0( '{', SG_03_GAMING_VOL_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_VOL_PCT_BINGO
## DESCRIPTION:  volunteer labor percentage; bingo
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPercentageBingo'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPercentageBingo'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborBingoPct'
V_GAMING_VOL_PCT_BINGO <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PCT_BINGO <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_VOL_PCT_BINGO ) )
if( length( SG_03_GAMING_VOL_PCT_BINGO ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_VOL_PCT_BINGO, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_VOL_PCT_BINGO <-  paste0( '{', SG_03_GAMING_VOL_PCT_BINGO, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_VOL_PCT_PTAP
## DESCRIPTION:  volunteer labor percentage; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPrcntagePullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPrcntagePullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborPullTabsPct'
V_GAMING_VOL_PCT_PTAP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PCT_PTAP <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_VOL_PCT_PTAP ) )
if( length( SG_03_GAMING_VOL_PCT_PTAP ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_VOL_PCT_PTAP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_VOL_PCT_PTAP <-  paste0( '{', SG_03_GAMING_VOL_PCT_PTAP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_VOL_PCT_OTH
## DESCRIPTION:  volunteer labor percentage; other gaming
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPrcntOtherGaming'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPrcntOtherGaming'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborOtherGamingPct'
V_GAMING_VOL_PCT_OTH <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PCT_OTH <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_VOL_PCT_OTH ) )
if( length( SG_03_GAMING_VOL_PCT_OTH ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_VOL_PCT_OTH, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_VOL_PCT_OTH <-  paste0( '{', SG_03_GAMING_VOL_PCT_OTH, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_VOL_PTAP_X
## DESCRIPTION:  volunteer labor; pull tabs
## LOCATION:  SCHED-G-PART-03-LINE-06-COL-B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingInformation/VolunteerLaborPullTabs'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformation/VolunteerLaborPullTabs'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingInformationGrp/VolunteerLaborPullTabsInd'
V_GAMING_VOL_PTAP_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_VOL_PTAP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_VOL_PTAP_X ) )
if( length( SG_03_GAMING_VOL_PTAP_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_VOL_PTAP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_VOL_PTAP_X <-  paste0( '{', SG_03_GAMING_VOL_PTAP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_COMP
## DESCRIPTION:  Gaming manager compensation
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerCompensation'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerCompensation'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerCompensationAmt'
V_GAMING_MGR_COMP <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_COMP <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_COMP ) )
if( length( SG_03_GAMING_MGR_COMP ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_COMP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_COMP <-  paste0( '{', SG_03_GAMING_MGR_COMP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_DIR_OFF_X
## DESCRIPTION:  Gaming manager is a director/officer
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerIsDirectorOfficer'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsDirectorOfcrInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsDirectorOfficer'
V_GAMING_MGR_DIR_OFF_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_DIR_OFF_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_DIR_OFF_X ) )
if( length( SG_03_GAMING_MGR_DIR_OFF_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_DIR_OFF_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_DIR_OFF_X <-  paste0( '{', SG_03_GAMING_MGR_DIR_OFF_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_EMPL_X
## DESCRIPTION:  Gaming manager is an employee
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerIsEmployee'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsEmployee'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsEmployeeInd'
V_GAMING_MGR_EMPL_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_EMPL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_EMPL_X ) )
if( length( SG_03_GAMING_MGR_EMPL_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_EMPL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_EMPL_X <-  paste0( '{', SG_03_GAMING_MGR_EMPL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_KONTR_X
## DESCRIPTION:  Gaming manager is an independent contractor
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerIsIndContractor'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsIndCntrctInd'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerIsIndContractor'
V_GAMING_MGR_KONTR_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_KONTR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_KONTR_X ) )
if( length( SG_03_GAMING_MGR_KONTR_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_KONTR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_KONTR_X <-  paste0( '{', SG_03_GAMING_MGR_KONTR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_NAME_ORG_L1
## DESCRIPTION:  Business Name - BusinessNameLine1
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerName/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfGamingRecordsKeeper/BusinessName/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine1Txt'
V5 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerNameBusiness/BusinessNameLine1'
V_GAMING_MGR_NAME_ORG_L1 <- paste( V1, V2, V3, V4, V5 , sep='|' )
SG_03_GAMING_MGR_NAME_ORG_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_NAME_ORG_L1 ) )
if( length( SG_03_GAMING_MGR_NAME_ORG_L1 ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_NAME_ORG_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_NAME_ORG_L1 <-  paste0( '{', SG_03_GAMING_MGR_NAME_ORG_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_NAME_ORG_L2
## DESCRIPTION:  Business Name - BusinessNameLine2
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerName/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfGamingRecordsKeeper/BusinessName/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerBusinessName/BusinessNameLine2Txt'
V5 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerNameBusiness/BusinessNameLine2'
V_GAMING_MGR_NAME_ORG_L2 <- paste( V1, V2, V3, V4, V5 , sep='|' )
SG_03_GAMING_MGR_NAME_ORG_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_NAME_ORG_L2 ) )
if( length( SG_03_GAMING_MGR_NAME_ORG_L2 ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_NAME_ORG_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_NAME_ORG_L2 <-  paste0( '{', SG_03_GAMING_MGR_NAME_ORG_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_NAME_PERS
## DESCRIPTION:  Gaming manager person name
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerName/PersonName'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerNamePerson'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerPersonNm'
V_GAMING_MGR_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_NAME_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_NAME_PERS ) )
if( length( SG_03_GAMING_MGR_NAME_PERS ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_NAME_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_NAME_PERS <-  paste0( '{', SG_03_GAMING_MGR_NAME_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MGR_SVC_PROV
## DESCRIPTION:  Gamaing manager services provided
## LOCATION:  SCHED-G-PART-03-LINE-16
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingManagerServicesProvided'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerServicesProvided'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingManagerServicesProvTxt'
V_GAMING_MGR_SVC_PROV <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MGR_SVC_PROV <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MGR_SVC_PROV ) )
if( length( SG_03_GAMING_MGR_SVC_PROV ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MGR_SVC_PROV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MGR_SVC_PROV <-  paste0( '{', SG_03_GAMING_MGR_SVC_PROV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_NONMEMB_X
## DESCRIPTION:  Does organization operate gaming activities with nonmembers?
## LOCATION:  SCHED-G-PART-03-LINE-11
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/GamingWithNonmembers'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingWithNonmembers'
V3 <- '//Return/ReturnData/IRS990ScheduleG/GamingWithNonmembersInd'
V_GAMING_NONMEMB_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_NONMEMB_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_NONMEMB_X ) )
if( length( SG_03_GAMING_NONMEMB_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_NONMEMB_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_NONMEMB_X <-  paste0( '{', SG_03_GAMING_NONMEMB_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_LIC_X
## DESCRIPTION:  Is organization licensed in each state?
## LOCATION:  SCHED-G-PART-03-LINE-09A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/Licensed'
V2 <- '//Return/ReturnData/IRS990ScheduleG/Licensed'
V3 <- '//Return/ReturnData/IRS990ScheduleG/LicensedInd'
V_GAMING_LIC_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_LIC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_LIC_X ) )
if( length( SG_03_GAMING_LIC_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_LIC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_LIC_X <-  paste0( '{', SG_03_GAMING_LIC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_LIC_SUSPENDED_X
## DESCRIPTION:  Were any gaming licenses revoked; suspended; or terminated during the tax year?
## LOCATION:  SCHED-G-PART-03-LINE-10A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/LicenseSuspendedEtc'
V2 <- '//Return/ReturnData/IRS990ScheduleG/LicenseSuspendedEtc'
V3 <- '//Return/ReturnData/IRS990ScheduleG/LicenseSuspendedEtcInd'
V_GAMING_LIC_SUSPENDED_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_LIC_SUSPENDED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_LIC_SUSPENDED_X ) )
if( length( SG_03_GAMING_LIC_SUSPENDED_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_LIC_SUSPENDED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_LIC_SUSPENDED_X <-  paste0( '{', SG_03_GAMING_LIC_SUSPENDED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GAMING_MEMB_OTH_ENTITY_X
## DESCRIPTION:  Is organization formed to administer charitable gaming?
## LOCATION:  SCHED-G-PART-03-LINE-12
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/MemberOfOtherEntity'
V2 <- '//Return/ReturnData/IRS990ScheduleG/MemberOfOtherEntity'
V3 <- '//Return/ReturnData/IRS990ScheduleG/MemberOfOtherEntityInd'
V_GAMING_MEMB_OTH_ENTITY_X <- paste( V1, V2, V3 , sep='|' )
SG_03_GAMING_MEMB_OTH_ENTITY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GAMING_MEMB_OTH_ENTITY_X ) )
if( length( SG_03_GAMING_MEMB_OTH_ENTITY_X ) > 1 )
{ 
  create_record( varname=SG_03_GAMING_MEMB_OTH_ENTITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GAMING_MEMB_OTH_ENTITY_X <-  paste0( '{', SG_03_GAMING_MEMB_OTH_ENTITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_NAME_PERS
## DESCRIPTION:  Person name of gaming records keeper
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfGamingRecordsKeeper/PersonName'
V2 <- '//Return/ReturnData/IRS990ScheduleG/IndividualWithBooksNm'
V3 <- '//Return/ReturnData/IRS990ScheduleG/NameOfGamingRecKeeperPerson'
V_GRK_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
SG_03_GRK_NAME_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_NAME_PERS ) )
if( length( SG_03_GRK_NAME_PERS ) > 1 )
{ 
  create_record( varname=SG_03_GRK_NAME_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_NAME_PERS <-  paste0( '{', SG_03_GRK_NAME_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_NAME_ORG_L1
## DESCRIPTION:  Business Name - BusinessNameLine1
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfThirdParty/BusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfThirdPartyBusiness/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine1'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine1Txt'
V_THIRD_PARTY_NAME_ORG_L1 <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_THIRD_PARTY_NAME_ORG_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_NAME_ORG_L1 ) )
if( length( SG_03_THIRD_PARTY_NAME_ORG_L1 ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_NAME_ORG_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_NAME_ORG_L1 <-  paste0( '{', SG_03_THIRD_PARTY_NAME_ORG_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_NAME_ORG_L2
## DESCRIPTION:  Business Name - BusinessNameLine2
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfThirdParty/BusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfThirdPartyBusiness/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine2'
V4 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyBusinessName/BusinessNameLine2Txt'
V_THIRD_PARTY_NAME_ORG_L2 <- paste( V1, V2, V3, V4 , sep='|' )
SG_03_THIRD_PARTY_NAME_ORG_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_NAME_ORG_L2 ) )
if( length( SG_03_THIRD_PARTY_NAME_ORG_L2 ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_NAME_ORG_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_NAME_ORG_L2 <-  paste0( '{', SG_03_THIRD_PARTY_NAME_ORG_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_THIRD_PARTY_NAME_PERS
## DESCRIPTION:  Person name of gaming records keeper
## LOCATION:  SCHED-G-PART-03-LINE-15C
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/NameOfThirdParty/PersonName'
V2 <- '//Return/ReturnData/IRS990ScheduleG/NameOfThirdPartyPerson'
V3 <- '//Return/ReturnData/IRS990ScheduleG/ThirdPartyPersonNm'
V_THIRD_PARTY_NAME_PERS <- paste( V1, V2, V3 , sep='|' )
SG_03_THIRD_PARTY_NAME_PERS <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTY_NAME_PERS ) )
if( length( SG_03_THIRD_PARTY_NAME_PERS ) > 1 )
{ 
  create_record( varname=SG_03_THIRD_PARTY_NAME_PERS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_THIRD_PARTY_NAME_PERS <-  paste0( '{', SG_03_THIRD_PARTY_NAME_PERS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_PCT_GAMING_OTH_FACILITY
## DESCRIPTION:  Percentage of gaming in other facility
## LOCATION:  SCHED-G-PART-03-LINE-13B
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/PercentageOfGamingOthrFacility'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingOtherFacilityPct'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PercentageOfGamingOthrFacility'
V_PCT_GAMING_OTH_FACILITY <- paste( V1, V2, V3 , sep='|' )
SG_03_PCT_GAMING_OTH_FACILITY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_GAMING_OTH_FACILITY ) )
if( length( SG_03_PCT_GAMING_OTH_FACILITY ) > 1 )
{ 
  create_record( varname=SG_03_PCT_GAMING_OTH_FACILITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_PCT_GAMING_OTH_FACILITY <-  paste0( '{', SG_03_PCT_GAMING_OTH_FACILITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_PCT_GAMING_OWN_FACILITY
## DESCRIPTION:  Percentage of gaming in own facility
## LOCATION:  SCHED-G-PART-03-LINE-13A
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/PercentageOfGamingOwnFacility'
V2 <- '//Return/ReturnData/IRS990ScheduleG/GamingOwnFacilityPct'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PercentageOfGamingOwnFacility'
V_PCT_GAMING_OWN_FACILITY <- paste( V1, V2, V3 , sep='|' )
SG_03_PCT_GAMING_OWN_FACILITY <- xml2::xml_text( xml2::xml_find_all( doc, V_PCT_GAMING_OWN_FACILITY ) )
if( length( SG_03_PCT_GAMING_OWN_FACILITY ) > 1 )
{ 
  create_record( varname=SG_03_PCT_GAMING_OWN_FACILITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_PCT_GAMING_OWN_FACILITY <-  paste0( '{', SG_03_PCT_GAMING_OWN_FACILITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_STATES_GAMING_CONDUCTED
## DESCRIPTION:  Enter state where organization conducts gaming activities
## LOCATION:  SCHED-G-PART-03-LINE-09
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/Form990ScheduleGPartIII/StatesWhereGamingConducted'
V2 <- '//Return/ReturnData/IRS990ScheduleG/StatesWhereGamingConducted'
V3 <- '//Return/ReturnData/IRS990ScheduleG/StatesWhereGamingConductedCd'
V_STATES_GAMING_CONDUCTED <- paste( V1, V2, V3 , sep='|' )
SG_03_STATES_GAMING_CONDUCTED <- xml2::xml_text( xml2::xml_find_all( doc, V_STATES_GAMING_CONDUCTED ) )
if( length( SG_03_STATES_GAMING_CONDUCTED ) > 1 )
{ 
  create_record( varname=SG_03_STATES_GAMING_CONDUCTED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_STATES_GAMING_CONDUCTED <-  paste0( '{', SG_03_STATES_GAMING_CONDUCTED, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_NAME_ORG_L1
## DESCRIPTION:  Name Of Gaming Rec Keeper Bus - BusinessNameLine1
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/NameOfGamingRecKeeperBus/BusinessNameLine1'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine1'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine1Txt'
V_GRK_NAME_ORG_L1 <- paste( V1, V2, V3 , sep='|' )
SG_03_GRK_NAME_ORG_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_NAME_ORG_L1 ) )
if( length( SG_03_GRK_NAME_ORG_L1 ) > 1 )
{ 
  create_record( varname=SG_03_GRK_NAME_ORG_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_NAME_ORG_L1 <-  paste0( '{', SG_03_GRK_NAME_ORG_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SG_03_GRK_NAME_ORG_L2
## DESCRIPTION:  Name Of Gaming Rec Keeper Bus - BusinessNameLine2
## LOCATION:  SCHED-G-PART-03-LINE-14
## TABLE:  SG-P03-T00-GAMING
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleG/NameOfGamingRecKeeperBus/BusinessNameLine2'
V2 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine2'
V3 <- '//Return/ReturnData/IRS990ScheduleG/PersonsWithBooksName/BusinessNameLine2Txt'
V_GRK_NAME_ORG_L2 <- paste( V1, V2, V3 , sep='|' )
SG_03_GRK_NAME_ORG_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_GRK_NAME_ORG_L2 ) )
if( length( SG_03_GRK_NAME_ORG_L2 ) > 1 )
{ 
  create_record( varname=SG_03_GRK_NAME_ORG_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SG_03_GRK_NAME_ORG_L2 <-  paste0( '{', SG_03_GRK_NAME_ORG_L2, '}', collapse=';' ) 
} 




var.list <- 
namedList(SG_03_GRK_ADDR_L1,SG_03_GRK_ADDR_L2,SG_03_GRK_ADDR_CITY,SG_03_GRK_ADDR_CNTR,SG_03_GRK_ADDR_ZIP,SG_03_GRK_ADDR_STATE,SG_03_THIRD_PARTY_ADDR_L1,SG_03_THIRD_PARTY_ADDR_L2,SG_03_THIRD_PARTY_ADDR_CITY,SG_03_THIRD_PARTY_ADDR_CNTR,SG_03_THIRD_PARTY_ADDR_ZIP,SG_03_THIRD_PARTY_ADDR_STATE,SG_03_AMT_DIST,SG_03_AMT_GAMING_REV_ORG,SG_03_AMT_GAMING_REV_3RD_PARTY,SG_03_CHARIT_DIST_REQ_X,SG_03_KONTR_3RD_PARTY_X,SG_03_GAMING_NO_LIC_EXPLANATION,SG_03_LIC_SUSPENDED_EXPLANATION,SG_03_GAMING_EXP_CASH_BINGO,SG_03_GAMING_EXP_CASH_OTH,SG_03_GAMING_EXP_CASH_PTAP,SG_03_GAMING_EXP_CASH_TOT,SG_03_GAMING_EXP_SUMMARY_TOT,SG_03_GAMING_REV_GRO_BINGO,SG_03_GAMING_REV_GRO_OTH,SG_03_GAMING_REV_GRO_PTAB,SG_03_GAMING_REV_GRO_TOT,SG_03_GAMING_NET_INCOME_TOT,SG_03_GAMING_EXP_NONCSH_BINGO,SG_03_GAMING_EXP_NONCSH_OTH,SG_03_GAMING_EXP_NONCSH_PTAP,SG_03_GAMING_EXP_NONCSH_TOT,SG_03_GAMING_EXP_OTH_BINGO,SG_03_GAMING_EXP_OTH_OTH,SG_03_GAMING_EXP_OTH_PTAP,SG_03_GAMING_EXP_OTH_TOT,SG_03_GAMING_EXP_RENT_BINGO,SG_03_GAMING_EXP_RENT_OTH,SG_03_GAMING_EXP_RENT_PTAP,SG_03_GAMING_EXP_RENT_TOT,SG_03_GAMING_VOL_BINGO_X,SG_03_GAMING_VOL_OTH_X,SG_03_GAMING_VOL_PCT_BINGO,SG_03_GAMING_VOL_PCT_PTAP,SG_03_GAMING_VOL_PCT_OTH,SG_03_GAMING_VOL_PTAP_X,SG_03_GAMING_MGR_COMP,SG_03_GAMING_MGR_DIR_OFF_X,SG_03_GAMING_MGR_EMPL_X,SG_03_GAMING_MGR_KONTR_X,SG_03_GAMING_MGR_NAME_ORG_L1,SG_03_GAMING_MGR_NAME_ORG_L2,SG_03_GAMING_MGR_NAME_PERS,SG_03_GAMING_MGR_SVC_PROV,SG_03_GAMING_NONMEMB_X,SG_03_GAMING_LIC_X,SG_03_GAMING_LIC_SUSPENDED_X,SG_03_GAMING_MEMB_OTH_ENTITY_X,SG_03_GRK_NAME_PERS,SG_03_THIRD_PARTY_NAME_ORG_L1,SG_03_THIRD_PARTY_NAME_ORG_L2,SG_03_THIRD_PARTY_NAME_PERS,SG_03_PCT_GAMING_OTH_FACILITY,SG_03_PCT_GAMING_OWN_FACILITY,SG_03_STATES_GAMING_CONDUCTED,SG_03_GRK_NAME_ORG_L1,SG_03_GRK_NAME_ORG_L2)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


