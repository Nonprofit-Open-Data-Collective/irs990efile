#' @title 
#'   Build table F9-P02-T00-SIGNATURE
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P02_T00_SIGNATURE <- function( doc, url )
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


## VARIABLE NAME:  F9_02_DISC_PREP_THIRD_PARTY_X
## DESCRIPTION:  Indicates whether IRS may discuss return with preparer
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/BusinessOfficerGrp/DiscussWithPaidPreparerInd'
V2 <- '//Return/ReturnHeader/Officer/AuthorizeThirdParty'
V_DISC_PREP_THIRD_PARTY_X <- paste( V1, V2 , sep='|' )
F9_02_DISC_PREP_THIRD_PARTY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISC_PREP_THIRD_PARTY_X ) )
if( length( F9_02_DISC_PREP_THIRD_PARTY_X ) > 1 )
{ 
  create_record( varname=F9_02_DISC_PREP_THIRD_PARTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_DISC_PREP_THIRD_PARTY_X <-  paste0( '{', F9_02_DISC_PREP_THIRD_PARTY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_ADDR_CITY
## DESCRIPTION:  Foreign Address of Preparer Firm (City)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmForeignAddress/City'
V2 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmUSAddress/City'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/City'
V4 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/CityNm'
V5 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/City'
V6 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/CityNm'
V_PREP_FIRM_ADDR_CITY <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_02_PREP_FIRM_ADDR_CITY <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_ADDR_CITY ) )
if( length( F9_02_PREP_FIRM_ADDR_CITY ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_CITY <-  paste0( '{', F9_02_PREP_FIRM_ADDR_CITY, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_ADDR_CNTR
## DESCRIPTION:  Foreign Address of Preparer Firm (Country)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmForeignAddress/Country'
V2 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/Country'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/CountryCd'
V_PREP_FIRM_ADDR_CNTR <- paste( V1, V2, V3 , sep='|' )
F9_02_PREP_FIRM_ADDR_CNTR <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_ADDR_CNTR ) )
if( length( F9_02_PREP_FIRM_ADDR_CNTR ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_CNTR <-  paste0( '{', F9_02_PREP_FIRM_ADDR_CNTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_ADDR_L1
## DESCRIPTION:  Foreign Address of Preparer FIrm (Line 1)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmForeignAddress/AddressLine1'
V2 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmUSAddress/AddressLine1'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/AddressLine1'
V4 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/AddressLine1Txt'
V5 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/AddressLine1'
V6 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/AddressLine1Txt'
V_PREP_FIRM_ADDR_L1 <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_02_PREP_FIRM_ADDR_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_ADDR_L1 ) )
if( length( F9_02_PREP_FIRM_ADDR_L1 ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_L1 <-  paste0( '{', F9_02_PREP_FIRM_ADDR_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_ADDR_L2
## DESCRIPTION:  Foreign Address of Preparer Firm (Line 2)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmForeignAddress/AddressLine2'
V2 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmUSAddress/AddressLine2'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/AddressLine2'
V4 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/AddressLine2Txt'
V5 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/AddressLine2'
V6 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/AddressLine2Txt'
V_PREP_FIRM_ADDR_L2 <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_02_PREP_FIRM_ADDR_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_ADDR_L2 ) )
if( length( F9_02_PREP_FIRM_ADDR_L2 ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_L2 <-  paste0( '{', F9_02_PREP_FIRM_ADDR_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_ADDR_STATE
## DESCRIPTION:  Foreign Address of Preparer Firm (Province or State)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmForeignAddress/ProvinceOrState'
V2 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmUSAddress/State'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/ProvinceOrState'
V4 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/ProvinceOrStateNm'
V5 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/State'
V6 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/StateAbbreviationCd'
V_PREP_FIRM_ADDR_STATE <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_02_PREP_FIRM_ADDR_STATE <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_ADDR_STATE ) )
if( length( F9_02_PREP_FIRM_ADDR_STATE ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_STATE <-  paste0( '{', F9_02_PREP_FIRM_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_ADDR_ZIP
## DESCRIPTION:  Foreign Address of Preparer Firm (Postal Code)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmForeignAddress/PostalCode'
V2 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmUSAddress/ZIPCode'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/ForeignPostalCd'
V4 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerForeignAddress/PostalCode'
V5 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/ZIPCd'
V6 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerUSAddress/ZIPCode'
V_PREP_FIRM_ADDR_ZIP <- paste( V1, V2, V3, V4, V5, V6 , sep='|' )
F9_02_PREP_FIRM_ADDR_ZIP <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_ADDR_ZIP ) )
if( length( F9_02_PREP_FIRM_ADDR_ZIP ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_ZIP <-  paste0( '{', F9_02_PREP_FIRM_ADDR_ZIP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_EIN
## DESCRIPTION:  Employer Identification Number of Preparer Firm
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/EIN'
V2 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerFirmEIN'
V_PREP_FIRM_EIN <- paste( V1, V2 , sep='|' )
F9_02_PREP_FIRM_EIN <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_EIN ) )
if( length( F9_02_PREP_FIRM_EIN ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_EIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_EIN <-  paste0( '{', F9_02_PREP_FIRM_EIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_NAME_L1
## DESCRIPTION:  Paid Preparer Firm Name (Line 1)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmBusinessName/BusinessNameLine1'
V2 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerFirmName/BusinessNameLine1'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerFirmName/BusinessNameLine1Txt'
V_PREP_FIRM_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
F9_02_PREP_FIRM_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_NAME_L1 ) )
if( length( F9_02_PREP_FIRM_NAME_L1 ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_NAME_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_NAME_L1 <-  paste0( '{', F9_02_PREP_FIRM_NAME_L1, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_FIRM_NAME_L2
## DESCRIPTION:  Paid Preparer Firm Name (Line 2)
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/PreparerFirm/PreparerFirmBusinessName/BusinessNameLine2'
V2 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerFirmName/BusinessNameLine2'
V3 <- '//Return/ReturnHeader/PreparerFirmGrp/PreparerFirmName/BusinessNameLine2Txt'
V_PREP_FIRM_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
F9_02_PREP_FIRM_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_FIRM_NAME_L2 ) )
if( length( F9_02_PREP_FIRM_NAME_L2 ) > 1 )
{ 
  create_record( varname=F9_02_PREP_FIRM_NAME_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_NAME_L2 <-  paste0( '{', F9_02_PREP_FIRM_NAME_L2, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_NAME
## DESCRIPTION:  Paid Preparer Name
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/Name'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PreparerPersonNm'
V_PREP_NAME <- paste( V1, V2 , sep='|' )
F9_02_PREP_NAME <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_NAME ) )
if( length( F9_02_PREP_NAME ) > 1 )
{ 
  create_record( varname=F9_02_PREP_NAME, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_NAME <-  paste0( '{', F9_02_PREP_NAME, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PHONE
## DESCRIPTION:  Paid Preparer Phone
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/Phone'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PhoneNum'
V_PREP_PHONE <- paste( V1, V2 , sep='|' )
F9_02_PREP_PHONE <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_PHONE ) )
if( length( F9_02_PREP_PHONE ) > 1 )
{ 
  create_record( varname=F9_02_PREP_PHONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PHONE <-  paste0( '{', F9_02_PREP_PHONE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PTIN
## DESCRIPTION:  Paid Preparer PTIN
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/PTIN'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PTIN'
V_PREP_PTIN <- paste( V1, V2 , sep='|' )
F9_02_PREP_PTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_PTIN ) )
if( length( F9_02_PREP_PTIN ) > 1 )
{ 
  create_record( varname=F9_02_PREP_PTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PTIN <-  paste0( '{', F9_02_PREP_PTIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_SELF_EMPL_X
## DESCRIPTION:  Indicates that Paid Preparer is Self-Employed
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/SelfEmployed'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/SelfEmployedInd'
V_PREP_SELF_EMPL_X <- paste( V1, V2 , sep='|' )
F9_02_PREP_SELF_EMPL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_SELF_EMPL_X ) )
if( length( F9_02_PREP_SELF_EMPL_X ) > 1 )
{ 
  create_record( varname=F9_02_PREP_SELF_EMPL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_SELF_EMPL_X <-  paste0( '{', F9_02_PREP_SELF_EMPL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_SIGNTR_DATE
## DESCRIPTION:  Date of Paid Preparer's Signature
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/DatePrepared'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PreparationDt'
V_PREP_SIGNTR_DATE <- paste( V1, V2 , sep='|' )
F9_02_PREP_SIGNTR_DATE <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_SIGNTR_DATE ) )
if( length( F9_02_PREP_SIGNTR_DATE ) > 1 )
{ 
  create_record( varname=F9_02_PREP_SIGNTR_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_SIGNTR_DATE <-  paste0( '{', F9_02_PREP_SIGNTR_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_SIGNING_OFF_NAME
## DESCRIPTION:  Signing Officer Name
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/BusinessOfficerGrp/PersonNm'
V2 <- '//Return/ReturnHeader/Officer/Name'
V_SIGNING_OFF_NAME <- paste( V1, V2 , sep='|' )
F9_02_SIGNING_OFF_NAME <- xml2::xml_text( xml2::xml_find_all( doc, V_SIGNING_OFF_NAME ) )
if( length( F9_02_SIGNING_OFF_NAME ) > 1 )
{ 
  create_record( varname=F9_02_SIGNING_OFF_NAME, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_NAME <-  paste0( '{', F9_02_SIGNING_OFF_NAME, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_SIGNING_OFF_PHONE
## DESCRIPTION:  Signing Officer Phone Number
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/BusinessOfficerGrp/PhoneNum'
V2 <- '//Return/ReturnHeader/Officer/Phone'
V_SIGNING_OFF_PHONE <- paste( V1, V2 , sep='|' )
F9_02_SIGNING_OFF_PHONE <- xml2::xml_text( xml2::xml_find_all( doc, V_SIGNING_OFF_PHONE ) )
if( length( F9_02_SIGNING_OFF_PHONE ) > 1 )
{ 
  create_record( varname=F9_02_SIGNING_OFF_PHONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_PHONE <-  paste0( '{', F9_02_SIGNING_OFF_PHONE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_SIGNING_OFF_SIGNTR_DATE
## DESCRIPTION:  Date of Signing Officer's Signature
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/BusinessOfficerGrp/SignatureDt'
V2 <- '//Return/ReturnHeader/Officer/DateSigned'
V_SIGNING_OFF_SIGNTR_DATE <- paste( V1, V2 , sep='|' )
F9_02_SIGNING_OFF_SIGNTR_DATE <- xml2::xml_text( xml2::xml_find_all( doc, V_SIGNING_OFF_SIGNTR_DATE ) )
if( length( F9_02_SIGNING_OFF_SIGNTR_DATE ) > 1 )
{ 
  create_record( varname=F9_02_SIGNING_OFF_SIGNTR_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_SIGNTR_DATE <-  paste0( '{', F9_02_SIGNING_OFF_SIGNTR_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_SIGNING_OFF_TITLE
## DESCRIPTION:  Signing Officer Title
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/BusinessOfficerGrp/PersonTitleTxt'
V2 <- '//Return/ReturnHeader/Officer/Title'
V_SIGNING_OFF_TITLE <- paste( V1, V2 , sep='|' )
F9_02_SIGNING_OFF_TITLE <- xml2::xml_text( xml2::xml_find_all( doc, V_SIGNING_OFF_TITLE ) )
if( length( F9_02_SIGNING_OFF_TITLE ) > 1 )
{ 
  create_record( varname=F9_02_SIGNING_OFF_TITLE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_TITLE <-  paste0( '{', F9_02_SIGNING_OFF_TITLE, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_02_DISC_PREP_THIRD_PARTY_X,F9_02_PREP_FIRM_ADDR_CITY,F9_02_PREP_FIRM_ADDR_CNTR,F9_02_PREP_FIRM_ADDR_L1,F9_02_PREP_FIRM_ADDR_L2,F9_02_PREP_FIRM_ADDR_STATE,F9_02_PREP_FIRM_ADDR_ZIP,F9_02_PREP_FIRM_EIN,F9_02_PREP_FIRM_NAME_L1,F9_02_PREP_FIRM_NAME_L2,F9_02_PREP_NAME,F9_02_PREP_PHONE,F9_02_PREP_PTIN,F9_02_PREP_SELF_EMPL_X,F9_02_PREP_SIGNTR_DATE,F9_02_SIGNING_OFF_NAME,F9_02_SIGNING_OFF_PHONE,F9_02_SIGNING_OFF_SIGNTR_DATE,F9_02_SIGNING_OFF_TITLE)
df <- as.data.frame( var.list )


return( df )


}


