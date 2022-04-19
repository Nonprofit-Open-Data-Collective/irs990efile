#' @title 
#'   Build table SE-P01-T00-SCHOOLS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SE_P01_T00_SCHOOLS <- function( doc, url )
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


## VARIABLE NAME:  SE_01_POLICY_STMT_NONDISCR_X
## DESCRIPTION:  Does the organization have a racially nondiscriminatory policy statement?
## LOCATION:  SCHED-E-PART-01-LINE-01
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/NondiscriminatoryPolicyStmt'
V2 <- '//Return/ReturnData/IRS990ScheduleE/NondiscriminatoryPolicyStmt'
V3 <- '//Return/ReturnData/IRS990ScheduleE/NondiscriminatoryPolicyStmtInd'
V_POLICY_STMT_NONDISCR_X <- paste( V1, V2, V3 , sep='|' )
SE_01_POLICY_STMT_NONDISCR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_STMT_NONDISCR_X ) )
if( length( SE_01_POLICY_STMT_NONDISCR_X ) > 1 )
{ 
  create_record( varname=SE_01_POLICY_STMT_NONDISCR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_POLICY_STMT_NONDISCR_X <-  paste0( '{', SE_01_POLICY_STMT_NONDISCR_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_POLICY_STMT_BROCHURES_X
## DESCRIPTION:  Does the organization have policy statement in brochures; etc?
## LOCATION:  SCHED-E-PART-01-LINE-02
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/PolicyStatementInBrochuresEtc'
V2 <- '//Return/ReturnData/IRS990ScheduleE/PolicyStatementInBrochuresEtc'
V3 <- '//Return/ReturnData/IRS990ScheduleE/PolicyStmtInBrochuresEtcInd'
V_POLICY_STMT_BROCHURES_X <- paste( V1, V2, V3 , sep='|' )
SE_01_POLICY_STMT_BROCHURES_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_STMT_BROCHURES_X ) )
if( length( SE_01_POLICY_STMT_BROCHURES_X ) > 1 )
{ 
  create_record( varname=SE_01_POLICY_STMT_BROCHURES_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_POLICY_STMT_BROCHURES_X <-  paste0( '{', SE_01_POLICY_STMT_BROCHURES_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_POLICY_BCAST_MEDIA_X
## DESCRIPTION:  Has the organization publicized the policy through broadcast media?
## LOCATION:  SCHED-E-PART-01-LINE-03
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/PolicyPublViaBroadcastMedia'
V2 <- '//Return/ReturnData/IRS990ScheduleE/PlcyPblczdViaBroadcastMediaInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/PolicyPublViaBroadcastMedia'
V_POLICY_BCAST_MEDIA_X <- paste( V1, V2, V3 , sep='|' )
SE_01_POLICY_BCAST_MEDIA_X <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_BCAST_MEDIA_X ) )
if( length( SE_01_POLICY_BCAST_MEDIA_X ) > 1 )
{ 
  create_record( varname=SE_01_POLICY_BCAST_MEDIA_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_POLICY_BCAST_MEDIA_X <-  paste0( '{', SE_01_POLICY_BCAST_MEDIA_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_POLICY_BCAST_MEDIA_EXPLAIN
## DESCRIPTION:  If answered "Has the Organization Publicized the Policy through Broadcast Media?"; explain
## LOCATION:  SCHED-E-PART-01-LINE-03
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/PubViaBroadcastMediaExpln'
V2 <- '//Return/ReturnData/IRS990ScheduleE/PubViaBroadcastMediaExpln'
V_POLICY_BCAST_MEDIA_EXPLAIN <- paste( V1, V2 , sep='|' )
SE_01_POLICY_BCAST_MEDIA_EXPLAIN <- xml2::xml_text( xml2::xml_find_all( doc, V_POLICY_BCAST_MEDIA_EXPLAIN ) )
if( length( SE_01_POLICY_BCAST_MEDIA_EXPLAIN ) > 1 )
{ 
  create_record( varname=SE_01_POLICY_BCAST_MEDIA_EXPLAIN, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_POLICY_BCAST_MEDIA_EXPLAIN <-  paste0( '{', SE_01_POLICY_BCAST_MEDIA_EXPLAIN, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_MAINT_RACIAL_RECORD_X
## DESCRIPTION:  Does the organization maintain racial composition records?
## LOCATION:  SCHED-E-PART-01-LINE-04A
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/MaintRacialCompositionRecords'
V2 <- '//Return/ReturnData/IRS990ScheduleE/MaintainRacialCompRecsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/MaintRacialCompositionRecords'
V_MAINT_RACIAL_RECORD_X <- paste( V1, V2, V3 , sep='|' )
SE_01_MAINT_RACIAL_RECORD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MAINT_RACIAL_RECORD_X ) )
if( length( SE_01_MAINT_RACIAL_RECORD_X ) > 1 )
{ 
  create_record( varname=SE_01_MAINT_RACIAL_RECORD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_MAINT_RACIAL_RECORD_X <-  paste0( '{', SE_01_MAINT_RACIAL_RECORD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_MAINT_SCHOLARSHIP_RECORD_X
## DESCRIPTION:  Does the organization maintain scholarships records?
## LOCATION:  SCHED-E-PART-01-LINE-04B
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/MaintScholarshipsRecords'
V2 <- '//Return/ReturnData/IRS990ScheduleE/MaintainScholarshipsRecsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/MaintScholarshipsRecords'
V_MAINT_SCHOLARSHIP_RECORD_X <- paste( V1, V2, V3 , sep='|' )
SE_01_MAINT_SCHOLARSHIP_RECORD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MAINT_SCHOLARSHIP_RECORD_X ) )
if( length( SE_01_MAINT_SCHOLARSHIP_RECORD_X ) > 1 )
{ 
  create_record( varname=SE_01_MAINT_SCHOLARSHIP_RECORD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_MAINT_SCHOLARSHIP_RECORD_X <-  paste0( '{', SE_01_MAINT_SCHOLARSHIP_RECORD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_MAINT_COPY_BROCHURES_X
## DESCRIPTION:  Does the organization maintain copies of brochures; etc?
## LOCATION:  SCHED-E-PART-01-LINE-04C
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/MaintCopiesOfBrochuresEtc'
V2 <- '//Return/ReturnData/IRS990ScheduleE/MaintainCpyOfBrochuresEtcInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/MaintCopiesOfBrochuresEtc'
V_MAINT_COPY_BROCHURES_X <- paste( V1, V2, V3 , sep='|' )
SE_01_MAINT_COPY_BROCHURES_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MAINT_COPY_BROCHURES_X ) )
if( length( SE_01_MAINT_COPY_BROCHURES_X ) > 1 )
{ 
  create_record( varname=SE_01_MAINT_COPY_BROCHURES_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_MAINT_COPY_BROCHURES_X <-  paste0( '{', SE_01_MAINT_COPY_BROCHURES_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_MAINT_COPY_SOL_X
## DESCRIPTION:  Does the organization maintain copies of all solicitations?
## LOCATION:  SCHED-E-PART-01-LINE-04D
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/MaintCopiesOfAllSolicitations'
V2 <- '//Return/ReturnData/IRS990ScheduleE/MaintainCpyOfAllSolInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/MaintCopiesOfAllSolicitations'
V_MAINT_COPY_SOL_X <- paste( V1, V2, V3 , sep='|' )
SE_01_MAINT_COPY_SOL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MAINT_COPY_SOL_X ) )
if( length( SE_01_MAINT_COPY_SOL_X ) > 1 )
{ 
  create_record( varname=SE_01_MAINT_COPY_SOL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_MAINT_COPY_SOL_X <-  paste0( '{', SE_01_MAINT_COPY_SOL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_MAINT_EXPLANATION
## DESCRIPTION:  If answered "no" to any of 4a-4d; explain
## LOCATION:  SCHED-E-PART-01-LINE-04D
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/OrgDoesNotMaintainExplanation'
V2 <- '//Return/ReturnData/IRS990ScheduleE/OrgDoesNotMaintainExplanation'
V_MAINT_EXPLANATION <- paste( V1, V2 , sep='|' )
SE_01_MAINT_EXPLANATION <- xml2::xml_text( xml2::xml_find_all( doc, V_MAINT_EXPLANATION ) )
if( length( SE_01_MAINT_EXPLANATION ) > 1 )
{ 
  create_record( varname=SE_01_MAINT_EXPLANATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_MAINT_EXPLANATION <-  paste0( '{', SE_01_MAINT_EXPLANATION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_STUDENT_RIGHT_X
## DESCRIPTION:  Does the organization discriminate by race in any way students' rights or privileges?
## LOCATION:  SCHED-E-PART-01-LINE-05A
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceStudentsRights'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceStdntsRghtsInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceStudentsRights'
V_DISCR_RACE_STUDENT_RIGHT_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_STUDENT_RIGHT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_STUDENT_RIGHT_X ) )
if( length( SE_01_DISCR_RACE_STUDENT_RIGHT_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_STUDENT_RIGHT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_STUDENT_RIGHT_X <-  paste0( '{', SE_01_DISCR_RACE_STUDENT_RIGHT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_ADM_POLICY_X
## DESCRIPTION:  Does the organization discriminate by race in any way admissions policies?
## LOCATION:  SCHED-E-PART-01-LINE-05B
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceAdmissPolicies'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceAdmissPlcyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceAdmissPolicies'
V_DISCR_RACE_ADM_POLICY_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_ADM_POLICY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_ADM_POLICY_X ) )
if( length( SE_01_DISCR_RACE_ADM_POLICY_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_ADM_POLICY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_ADM_POLICY_X <-  paste0( '{', SE_01_DISCR_RACE_ADM_POLICY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_EMPL_FACULTY_X
## DESCRIPTION:  Does the organization discriminate by race in any way employment of faculty or administrative staff?
## LOCATION:  SCHED-E-PART-01-LINE-05C
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceEmplmnFaculty'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceEmplmFcultyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceEmplmnFaculty'
V_DISCR_RACE_EMPL_FACULTY_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_EMPL_FACULTY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_EMPL_FACULTY_X ) )
if( length( SE_01_DISCR_RACE_EMPL_FACULTY_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_EMPL_FACULTY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_EMPL_FACULTY_X <-  paste0( '{', SE_01_DISCR_RACE_EMPL_FACULTY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_SCHOLARSHIP_X
## DESCRIPTION:  Does the organization discriminate by race in any way scholarships or other financial assistance?
## LOCATION:  SCHED-E-PART-01-LINE-05D
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceScholarships'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceScholarships'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceSchsInd'
V_DISCR_RACE_SCHOLARSHIP_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_SCHOLARSHIP_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_SCHOLARSHIP_X ) )
if( length( SE_01_DISCR_RACE_SCHOLARSHIP_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_SCHOLARSHIP_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_SCHOLARSHIP_X <-  paste0( '{', SE_01_DISCR_RACE_SCHOLARSHIP_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_EDU_POLICY_X
## DESCRIPTION:  Does the organization discriminate by race in any way educational policies?
## LOCATION:  SCHED-E-PART-01-LINE-05E
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceEducPolicies'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceEducPlcyInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceEducPolicies'
V_DISCR_RACE_EDU_POLICY_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_EDU_POLICY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_EDU_POLICY_X ) )
if( length( SE_01_DISCR_RACE_EDU_POLICY_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_EDU_POLICY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_EDU_POLICY_X <-  paste0( '{', SE_01_DISCR_RACE_EDU_POLICY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_USE_FACILITY_X
## DESCRIPTION:  Does the organization discriminate by race in any way use of facilities?
## LOCATION:  SCHED-E-PART-01-LINE-05F
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceUseOfFclts'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceUseOfFclts'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceUseOfFcltsInd'
V_DISCR_RACE_USE_FACILITY_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_USE_FACILITY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_USE_FACILITY_X ) )
if( length( SE_01_DISCR_RACE_USE_FACILITY_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_USE_FACILITY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_USE_FACILITY_X <-  paste0( '{', SE_01_DISCR_RACE_USE_FACILITY_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_ATHLETIC_PROG_X
## DESCRIPTION:  Does the organization discriminate by race in any way athletic programs?
## LOCATION:  SCHED-E-PART-01-LINE-05G
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceAthleticProg'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceAthleticProg'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceAthltProgInd'
V_DISCR_RACE_ATHLETIC_PROG_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_ATHLETIC_PROG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_ATHLETIC_PROG_X ) )
if( length( SE_01_DISCR_RACE_ATHLETIC_PROG_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_ATHLETIC_PROG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_ATHLETIC_PROG_X <-  paste0( '{', SE_01_DISCR_RACE_ATHLETIC_PROG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_OTH_ACT_X
## DESCRIPTION:  Does the organization discriminate by race in any way other extracurricular activities?
## LOCATION:  SCHED-E-PART-01-LINE-05H
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceOtherActy'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceOtherActy'
V3 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceOtherActyInd'
V_DISCR_RACE_OTH_ACT_X <- paste( V1, V2, V3 , sep='|' )
SE_01_DISCR_RACE_OTH_ACT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_OTH_ACT_X ) )
if( length( SE_01_DISCR_RACE_OTH_ACT_X ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_OTH_ACT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_OTH_ACT_X <-  paste0( '{', SE_01_DISCR_RACE_OTH_ACT_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_DISCR_RACE_EXPLANATION
## DESCRIPTION:  If answered "yes" to any of 5a-5h; explain
## LOCATION:  SCHED-E-PART-01-LINE-05H
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/DiscriminateRaceExplanation'
V2 <- '//Return/ReturnData/IRS990ScheduleE/DiscriminateRaceExplanation'
V_DISCR_RACE_EXPLANATION <- paste( V1, V2 , sep='|' )
SE_01_DISCR_RACE_EXPLANATION <- xml2::xml_text( xml2::xml_find_all( doc, V_DISCR_RACE_EXPLANATION ) )
if( length( SE_01_DISCR_RACE_EXPLANATION ) > 1 )
{ 
  create_record( varname=SE_01_DISCR_RACE_EXPLANATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_DISCR_RACE_EXPLANATION <-  paste0( '{', SE_01_DISCR_RACE_EXPLANATION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_GOVT_FIN_AID_REC_X
## DESCRIPTION:  Does the organization receive any financial aid or assistance from a governmental agency?
## LOCATION:  SCHED-E-PART-01-LINE-06A
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/GovernmentFinancialAidReceived'
V2 <- '//Return/ReturnData/IRS990ScheduleE/GovernmentFinancialAidRcvdInd'
V3 <- '//Return/ReturnData/IRS990ScheduleE/GovernmentFinancialAidReceived'
V_GOVT_FIN_AID_REC_X <- paste( V1, V2, V3 , sep='|' )
SE_01_GOVT_FIN_AID_REC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GOVT_FIN_AID_REC_X ) )
if( length( SE_01_GOVT_FIN_AID_REC_X ) > 1 )
{ 
  create_record( varname=SE_01_GOVT_FIN_AID_REC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_GOVT_FIN_AID_REC_X <-  paste0( '{', SE_01_GOVT_FIN_AID_REC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_GOVT_FIN_AID_REVOKED_X
## DESCRIPTION:  Has the organization's right to such aid ever been revoked or suspended?
## LOCATION:  SCHED-E-PART-01-LINE-06B
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/GovernmentFinancialAidRevoked'
V2 <- '//Return/ReturnData/IRS990ScheduleE/GovernmentFinancialAidRevoked'
V3 <- '//Return/ReturnData/IRS990ScheduleE/GovernmentFinancialAidRvkdInd'
V_GOVT_FIN_AID_REVOKED_X <- paste( V1, V2, V3 , sep='|' )
SE_01_GOVT_FIN_AID_REVOKED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_GOVT_FIN_AID_REVOKED_X ) )
if( length( SE_01_GOVT_FIN_AID_REVOKED_X ) > 1 )
{ 
  create_record( varname=SE_01_GOVT_FIN_AID_REVOKED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_GOVT_FIN_AID_REVOKED_X <-  paste0( '{', SE_01_GOVT_FIN_AID_REVOKED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_GOVT_FIN_AID_EXPLANATION
## DESCRIPTION:  If answered "yes" to any of 6a-6b; explain
## LOCATION:  SCHED-E-PART-01-LINE-06B
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/GovtFinancialAidExplanation'
V2 <- '//Return/ReturnData/IRS990ScheduleE/GovtFinancialAidExplanation'
V_GOVT_FIN_AID_EXPLANATION <- paste( V1, V2 , sep='|' )
SE_01_GOVT_FIN_AID_EXPLANATION <- xml2::xml_text( xml2::xml_find_all( doc, V_GOVT_FIN_AID_EXPLANATION ) )
if( length( SE_01_GOVT_FIN_AID_EXPLANATION ) > 1 )
{ 
  create_record( varname=SE_01_GOVT_FIN_AID_EXPLANATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_GOVT_FIN_AID_EXPLANATION <-  paste0( '{', SE_01_GOVT_FIN_AID_EXPLANATION, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_COMPLIANCE_REV_PROC_7550_X
## DESCRIPTION:  Compliance with Rev. Proc. 75-50; 1975-2 C.B. 587?
## LOCATION:  SCHED-E-PART-01-LINE-07
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/ComplianceWithRevProc7550'
V2 <- '//Return/ReturnData/IRS990ScheduleE/ComplianceWithRevProc7550'
V3 <- '//Return/ReturnData/IRS990ScheduleE/ComplianceWithRevProc7550Ind'
V_COMPLIANCE_REV_PROC_7550_X <- paste( V1, V2, V3 , sep='|' )
SE_01_COMPLIANCE_REV_PROC_7550_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COMPLIANCE_REV_PROC_7550_X ) )
if( length( SE_01_COMPLIANCE_REV_PROC_7550_X ) > 1 )
{ 
  create_record( varname=SE_01_COMPLIANCE_REV_PROC_7550_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_COMPLIANCE_REV_PROC_7550_X <-  paste0( '{', SE_01_COMPLIANCE_REV_PROC_7550_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SE_01_COMPLIANCE_EXPLANATION
## DESCRIPTION:  If answered "no" to 7; explain
## LOCATION:  SCHED-E-PART-01-LINE-07
## TABLE:  SE-P01-T00-SCHOOLS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleE/Form990ScheduleE/ComplianceProc75_50Explanation'
V2 <- '//Return/ReturnData/IRS990ScheduleE/ComplianceProc75_50Explanation'
V_COMPLIANCE_EXPLANATION <- paste( V1, V2 , sep='|' )
SE_01_COMPLIANCE_EXPLANATION <- xml2::xml_text( xml2::xml_find_all( doc, V_COMPLIANCE_EXPLANATION ) )
if( length( SE_01_COMPLIANCE_EXPLANATION ) > 1 )
{ 
  create_record( varname=SE_01_COMPLIANCE_EXPLANATION, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SE_01_COMPLIANCE_EXPLANATION <-  paste0( '{', SE_01_COMPLIANCE_EXPLANATION, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SE_01_POLICY_STMT_NONDISCR_X,SE_01_POLICY_STMT_BROCHURES_X,SE_01_POLICY_BCAST_MEDIA_X,SE_01_POLICY_BCAST_MEDIA_EXPLAIN,SE_01_MAINT_RACIAL_RECORD_X,SE_01_MAINT_SCHOLARSHIP_RECORD_X,SE_01_MAINT_COPY_BROCHURES_X,SE_01_MAINT_COPY_SOL_X,SE_01_MAINT_EXPLANATION,SE_01_DISCR_RACE_STUDENT_RIGHT_X,SE_01_DISCR_RACE_ADM_POLICY_X,SE_01_DISCR_RACE_EMPL_FACULTY_X,SE_01_DISCR_RACE_SCHOLARSHIP_X,SE_01_DISCR_RACE_EDU_POLICY_X,SE_01_DISCR_RACE_USE_FACILITY_X,SE_01_DISCR_RACE_ATHLETIC_PROG_X,SE_01_DISCR_RACE_OTH_ACT_X,SE_01_DISCR_RACE_EXPLANATION,SE_01_GOVT_FIN_AID_REC_X,SE_01_GOVT_FIN_AID_REVOKED_X,SE_01_GOVT_FIN_AID_EXPLANATION,SE_01_COMPLIANCE_REV_PROC_7550_X,SE_01_COMPLIANCE_EXPLANATION)
df <- as.data.frame( var.list )


return( df )


}


