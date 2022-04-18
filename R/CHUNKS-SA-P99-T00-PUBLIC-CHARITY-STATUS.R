#' @title 
#'   Build table SA-P99-T00-PUBLIC-CHARITY-STATUS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SA_P99_T00_PUBLIC_CHARITY_STATUS <- function( doc, url )
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


## VARIABLE NAME:  SA_99_PCSTAT_SUPPORT_T3_OTH_X
## DESCRIPTION:  Supporting organization 509(a)(3) - Type 3 Other (see SA-FORM-VERSION-2011-PART-01)
## LOCATION:  SCHED-A-PART-99-LINE-11D
## TABLE:  SA-P99-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/SupportingOrg509a3Type3Other'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/SupportingOrg509a3Type3Other'
V_PCSTAT_SUPPORT_T3_OTH_X <- paste( V1, V2 , sep='|' )
SA_99_PCSTAT_SUPPORT_T3_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_SUPPORT_T3_OTH_X ) )
if( length( SA_99_PCSTAT_SUPPORT_T3_OTH_X ) > 1 )
{ 
  create_record( varname=SA_99_PCSTAT_SUPPORT_T3_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_99_PCSTAT_SUPPORT_T3_OTH_X <-  paste0( '{', SA_99_PCSTAT_SUPPORT_T3_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_99_PCSTAT_CERTIFICATION_X
## DESCRIPTION:  By checking this box; I certify that the organization is not controlled directly or indirectly by one or more disqualified persons other than foundation managers and other than one or more publicly supported organizations described in section 509(a)(1) or section 509(a)(2) (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-99-LINE-11E
## TABLE:  SA-P99-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/CertificationCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/CertificationCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleA/CertificationInd'
V_PCSTAT_CERTIFICATION_X <- paste( V1, V2, V3 , sep='|' )
SA_99_PCSTAT_CERTIFICATION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CERTIFICATION_X ) )
if( length( SA_99_PCSTAT_CERTIFICATION_X ) > 1 )
{ 
  create_record( varname=SA_99_PCSTAT_CERTIFICATION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_99_PCSTAT_CERTIFICATION_X <-  paste0( '{', SA_99_PCSTAT_CERTIFICATION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_99_PCSTAT_CONTR_PERS_X
## DESCRIPTION:  A person who controls; alone or together with persons in (ii) and (iii) below; the governing body of the supported organization? Y or N (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-99-LINE-11G-i
## TABLE:  SA-P99-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/ContribByControllingIndividual'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ContributionControllerInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/ContribByControllingIndividual'
V_PCSTAT_CONTR_PERS_X <- paste( V1, V2, V3 , sep='|' )
SA_99_PCSTAT_CONTR_PERS_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CONTR_PERS_X ) )
if( length( SA_99_PCSTAT_CONTR_PERS_X ) > 1 )
{ 
  create_record( varname=SA_99_PCSTAT_CONTR_PERS_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_99_PCSTAT_CONTR_PERS_X <-  paste0( '{', SA_99_PCSTAT_CONTR_PERS_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_99_PCSTAT_CONTR_FAM_PARTY_X
## DESCRIPTION:  A family member of a party described in (i) above? Y or N (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-99-LINE-11G-ii
## TABLE:  SA-P99-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/ContributionByRelatedParty'
V2 <- '//Return/ReturnData/IRS990ScheduleA/ContributionFamilyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/ContributionByRelatedParty'
V_PCSTAT_CONTR_FAM_PARTY_X <- paste( V1, V2, V3 , sep='|' )
SA_99_PCSTAT_CONTR_FAM_PARTY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CONTR_FAM_PARTY_X ) )
if( length( SA_99_PCSTAT_CONTR_FAM_PARTY_X ) > 1 )
{ 
  create_record( varname=SA_99_PCSTAT_CONTR_FAM_PARTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_99_PCSTAT_CONTR_FAM_PARTY_X <-  paste0( '{', SA_99_PCSTAT_CONTR_FAM_PARTY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SA_99_PCSTAT_CONTR_35PCT_CE_X
## DESCRIPTION:  A 35% controlled entity of a person described in (i) or (ii) above? Y or N (see SA-FORM-VERSION-2013-PART-01)
## LOCATION:  SCHED-A-PART-99-LINE-11G-iii
## TABLE:  SA-P99-T00-PUBLIC-CHARITY-STATUS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleA/ContribBy35ControlledEntity'
V2 <- '//Return/ReturnData/IRS990ScheduleA/Contribution35ControlledInd'
V3 <- '//Return/ReturnData/IRS990ScheduleA/Form990ScheduleAPartI/ContribBy35ControlledEntity'
V_PCSTAT_CONTR_35PCT_CE_X <- paste( V1, V2, V3 , sep='|' )
SA_99_PCSTAT_CONTR_35PCT_CE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PCSTAT_CONTR_35PCT_CE_X ) )
if( length( SA_99_PCSTAT_CONTR_35PCT_CE_X ) > 1 )
{ 
  create_record( varname=SA_99_PCSTAT_CONTR_35PCT_CE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SA_99_PCSTAT_CONTR_35PCT_CE_X <-  paste0( '{', SA_99_PCSTAT_CONTR_35PCT_CE_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SA_99_PCSTAT_SUPPORT_T3_OTH_X,SA_99_PCSTAT_CERTIFICATION_X,SA_99_PCSTAT_CONTR_PERS_X,SA_99_PCSTAT_CONTR_FAM_PARTY_X,SA_99_PCSTAT_CONTR_35PCT_CE_X)
df <- as.data.frame( var.list )


return( df )


}


