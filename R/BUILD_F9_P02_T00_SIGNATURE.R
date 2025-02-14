#' @title 
#'   Build table F9-P02-T00-SIGNATURE
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P02_T00_SIGNATURE <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_02_SIGNING_OFF_NAME_FIRST
## DESCRIPTION:  Signing Officer Name
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  

F9_02_SIGNING_OFF_NAME_FIRST <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/SigningOfficerGrp/PersonFullName/PersonFirstNm' ) )
if( length( F9_02_SIGNING_OFF_NAME_FIRST ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_SIGNING_OFF_NAME_FIRST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_NAME_FIRST <-  paste0( '{', F9_02_SIGNING_OFF_NAME_FIRST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_SIGNING_OFF_NAME_LAST
## DESCRIPTION:  Signing Officer Name
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  

F9_02_SIGNING_OFF_NAME_LAST <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/SigningOfficerGrp/PersonFullName/PersonLastNm' ) )
if( length( F9_02_SIGNING_OFF_NAME_LAST ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_SIGNING_OFF_NAME_LAST, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_NAME_LAST <-  paste0( '{', F9_02_SIGNING_OFF_NAME_LAST, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PERS_PHONE
## DESCRIPTION:  Paid Preparer Phone
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnHeader/PreparerPersonGrp/ForeignPhoneNum'
V2 <- '//Return/ReturnHeader/Preparer/Phone'
V3 <- '//Return/ReturnHeader/PreparerPersonGrp/PhoneNum'
V_PREP_PERS_PHONE <- paste( V1, V2, V3 , sep='|' )
F9_02_PREP_PERS_PHONE <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_PERS_PHONE ) )
if( length( F9_02_PREP_PERS_PHONE ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_PREP_PERS_PHONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PERS_PHONE <-  paste0( '{', F9_02_PREP_PERS_PHONE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_SIGNING_OFF_PHONE
## DESCRIPTION:  Signing Officer Phone Number
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnHeader/BusinessOfficerGrp/ForeignPhoneNum'
V2 <- '//Return/ReturnHeader/BusinessOfficerGrp/PhoneNum'
V3 <- '//Return/ReturnHeader/Officer/Phone'
V_SIGNING_OFF_PHONE <- paste( V1, V2, V3 , sep='|' )
F9_02_SIGNING_OFF_PHONE <- xml2::xml_text( xml2::xml_find_all( doc, V_SIGNING_OFF_PHONE ) )
if( length( F9_02_SIGNING_OFF_PHONE ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_SIGNING_OFF_PHONE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_PHONE <-  paste0( '{', F9_02_SIGNING_OFF_PHONE, '}', collapse=';' ) 
} 




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
  log_collapsed_record( varname=F9_02_DISC_PREP_THIRD_PARTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_DISC_PREP_THIRD_PARTY_X <-  paste0( '{', F9_02_DISC_PREP_THIRD_PARTY_X, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_SIGNING_OFF_NAME, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_NAME <-  paste0( '{', F9_02_SIGNING_OFF_NAME, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_SIGNING_OFF_TITLE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_TITLE <-  paste0( '{', F9_02_SIGNING_OFF_TITLE, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_SIGNING_OFF_SIGNTR_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_SIGNING_OFF_SIGNTR_DATE <-  paste0( '{', F9_02_SIGNING_OFF_SIGNTR_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PERS_SIGNTR_DATE
## DESCRIPTION:  Date of Paid Preparer's Signature
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/DatePrepared'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PreparationDt'
V_PREP_PERS_SIGNTR_DATE <- paste( V1, V2 , sep='|' )
F9_02_PREP_PERS_SIGNTR_DATE <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_PERS_SIGNTR_DATE ) )
if( length( F9_02_PREP_PERS_SIGNTR_DATE ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_PREP_PERS_SIGNTR_DATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PERS_SIGNTR_DATE <-  paste0( '{', F9_02_PREP_PERS_SIGNTR_DATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PERS_NAME
## DESCRIPTION:  Paid Preparer Name
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/Name'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PreparerPersonNm'
V_PREP_PERS_NAME <- paste( V1, V2 , sep='|' )
F9_02_PREP_PERS_NAME <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_PERS_NAME ) )
if( length( F9_02_PREP_PERS_NAME ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_PREP_PERS_NAME, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PERS_NAME <-  paste0( '{', F9_02_PREP_PERS_NAME, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PERS_PTIN
## DESCRIPTION:  Paid Preparer PTIN
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/Preparer/PTIN'
V2 <- '//Return/ReturnHeader/PreparerPersonGrp/PTIN'
V_PREP_PERS_PTIN <- paste( V1, V2 , sep='|' )
F9_02_PREP_PERS_PTIN <- xml2::xml_text( xml2::xml_find_all( doc, V_PREP_PERS_PTIN ) )
if( length( F9_02_PREP_PERS_PTIN ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_PREP_PERS_PTIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PERS_PTIN <-  paste0( '{', F9_02_PREP_PERS_PTIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_SELF_EMPL_X
## DESCRIPTION:  Indicates that Paid Preparer is Self-Employed
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

F9_02_PREP_SELF_EMPL_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/Preparer/SelfEmployed' ) )
if( length( F9_02_PREP_SELF_EMPL_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_PREP_SELF_EMPL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_SELF_EMPL_X <-  paste0( '{', F9_02_PREP_SELF_EMPL_X, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_EIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_NAME_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_NAME_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_NAME_L2 <-  paste0( '{', F9_02_PREP_FIRM_NAME_L2, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_ADDR_L1, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_ADDR_L2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_L2 <-  paste0( '{', F9_02_PREP_FIRM_ADDR_L2, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_ADDR_CITY, ein=ORG_EIN, year=TAX_YEAR, url=URL )
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_ADDR_CNTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_CNTR <-  paste0( '{', F9_02_PREP_FIRM_ADDR_CNTR, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_ADDR_ZIP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_ZIP <-  paste0( '{', F9_02_PREP_FIRM_ADDR_ZIP, '}', collapse=';' ) 
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
  log_collapsed_record( varname=F9_02_PREP_FIRM_ADDR_STATE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_FIRM_ADDR_STATE <-  paste0( '{', F9_02_PREP_FIRM_ADDR_STATE, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_02_PREP_PERS_SELF_EMPL_X
## DESCRIPTION:  Indicates that Paid Preparer is Self-Employed
## LOCATION:  F990-PC-PART-02
## TABLE:  F9-P02-T00-SIGNATURE
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

F9_02_PREP_PERS_SELF_EMPL_X <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/PreparerPersonGrp/SelfEmployedInd' ) )
if( length( F9_02_PREP_PERS_SELF_EMPL_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_02_PREP_PERS_SELF_EMPL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_02_PREP_PERS_SELF_EMPL_X <-  paste0( '{', F9_02_PREP_PERS_SELF_EMPL_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_02_SIGNING_OFF_NAME_FIRST,F9_02_SIGNING_OFF_NAME_LAST,F9_02_PREP_PERS_PHONE,F9_02_SIGNING_OFF_PHONE,F9_02_DISC_PREP_THIRD_PARTY_X,F9_02_SIGNING_OFF_NAME,F9_02_SIGNING_OFF_TITLE,F9_02_SIGNING_OFF_SIGNTR_DATE,F9_02_PREP_PERS_SIGNTR_DATE,F9_02_PREP_PERS_NAME,F9_02_PREP_PERS_PTIN,F9_02_PREP_SELF_EMPL_X,F9_02_PREP_FIRM_EIN,F9_02_PREP_FIRM_NAME_L1,F9_02_PREP_FIRM_NAME_L2,F9_02_PREP_FIRM_ADDR_L1,F9_02_PREP_FIRM_ADDR_L2,F9_02_PREP_FIRM_ADDR_CITY,F9_02_PREP_FIRM_ADDR_CNTR,F9_02_PREP_FIRM_ADDR_ZIP,F9_02_PREP_FIRM_ADDR_STATE,F9_02_PREP_PERS_SELF_EMPL_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


