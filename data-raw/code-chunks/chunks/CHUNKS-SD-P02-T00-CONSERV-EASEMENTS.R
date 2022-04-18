#' @title 
#'   Build table SD-P02-T00-CONSERV-EASEMENTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P02_T00_CONSERV_EASEMENTS <- function( doc, url )
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

ORG_EIN <- xml_text( xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



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
ORG_NAME_L1 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



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
ORG_NAME_L2 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml_text( xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml_text( xml_find_all( doc, TEMP_TAX_YEAR ) )



######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_02_EMT_HIST_LAND_AREA_X
## DESCRIPTION:  Historic land area
## LOCATION:  SCHED-D-PART-02-LINE-01
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/HistoricLandArea'
V2 <- '//Return/ReturnData/IRS990ScheduleD/HistoricLandArea'
V3 <- '//Return/ReturnData/IRS990ScheduleD/HistoricLandAreaInd'
V_EMT_HIST_LAND_AREA_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_HIST_LAND_AREA_X <- xml_text( xml_find_all( doc, V_EMT_HIST_LAND_AREA_X ) )




## VARIABLE NAME:  SD_02_EMT_HIST_STR_X
## DESCRIPTION:  Historic structure
## LOCATION:  SCHED-D-PART-02-LINE-01
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/HistoricStructure'
V2 <- '//Return/ReturnData/IRS990ScheduleD/HistoricStructure'
V3 <- '//Return/ReturnData/IRS990ScheduleD/HistoricStructureInd'
V_EMT_HIST_STR_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_HIST_STR_X <- xml_text( xml_find_all( doc, V_EMT_HIST_STR_X ) )




## VARIABLE NAME:  SD_02_EMT_NATURAL_HABITAT_X
## DESCRIPTION:  Protection of natural habitat
## LOCATION:  SCHED-D-PART-02-LINE-01
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/ProtectionOfNaturalHabitat'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ProtectionNaturalHabitatInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/ProtectionOfNaturalHabitat'
V_EMT_NATURAL_HABITAT_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_NATURAL_HABITAT_X <- xml_text( xml_find_all( doc, V_EMT_NATURAL_HABITAT_X ) )




## VARIABLE NAME:  SD_02_EMT_OPEN_SPACE_X
## DESCRIPTION:  Preservation of open space
## LOCATION:  SCHED-D-PART-02-LINE-01
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/PreservationOfOpenSpace'
V2 <- '//Return/ReturnData/IRS990ScheduleD/PreservationOfOpenSpace'
V3 <- '//Return/ReturnData/IRS990ScheduleD/PreservationOpenSpaceInd'
V_EMT_OPEN_SPACE_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_OPEN_SPACE_X <- xml_text( xml_find_all( doc, V_EMT_OPEN_SPACE_X ) )




## VARIABLE NAME:  SD_02_EMT_PUB_USE_X
## DESCRIPTION:  Preservation for  public use
## LOCATION:  SCHED-D-PART-02-LINE-01
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/PreservationForPublicUse'
V2 <- '//Return/ReturnData/IRS990ScheduleD/PreservationForPublicUse'
V3 <- '//Return/ReturnData/IRS990ScheduleD/PreservationPublicUseInd'
V_EMT_PUB_USE_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_PUB_USE_X <- xml_text( xml_find_all( doc, V_EMT_PUB_USE_X ) )




## VARIABLE NAME:  SD_02_EMT_TOT_NUM
## DESCRIPTION:  Total number of easements
## LOCATION:  SCHED-D-PART-02-LINE-02a
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/TotalNumberOfEasements'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalEasementsCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalNumberOfEasements'
V_EMT_TOT_NUM <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_TOT_NUM <- xml_text( xml_find_all( doc, V_EMT_TOT_NUM ) )




## VARIABLE NAME:  SD_02_EMT_TOT_ACREAGE
## DESCRIPTION:  Total acreage subject to easements
## LOCATION:  SCHED-D-PART-02-LINE-02b
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/TotalAcreage'
V2 <- '//Return/ReturnData/IRS990ScheduleD/TotalAcreage'
V3 <- '//Return/ReturnData/IRS990ScheduleD/TotalAcreageCnt'
V_EMT_TOT_ACREAGE <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_TOT_ACREAGE <- xml_text( xml_find_all( doc, V_EMT_TOT_ACREAGE ) )




## VARIABLE NAME:  SD_02_EMT_NUM_HIST_STR
## DESCRIPTION:  Number of easements on a certified historic structure included in (a)
## LOCATION:  SCHED-D-PART-02-LINE-02c
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/NmbrHistStructEasements'
V2 <- '//Return/ReturnData/IRS990ScheduleD/HistoricStructureEasementsCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/NmbrHistStructEasements'
V_EMT_NUM_HIST_STR <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_NUM_HIST_STR <- xml_text( xml_find_all( doc, V_EMT_NUM_HIST_STR ) )




## VARIABLE NAME:  SD_02_EMT_NUM_HIST_STR_AFTER_06
## DESCRIPTION:  Number of historic structure easements acquired after 8/17/2006
## LOCATION:  SCHED-D-PART-02-LINE-02d
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/NmbrHistStructEasementsAfter'
V2 <- '//Return/ReturnData/IRS990ScheduleD/HistoricStrctrEasementsAftrCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/NmbrHistStructEasementsAfter'
V_EMT_NUM_HIST_STR_AFTER_06 <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_NUM_HIST_STR_AFTER_06 <- xml_text( xml_find_all( doc, V_EMT_NUM_HIST_STR_AFTER_06 ) )




## VARIABLE NAME:  SD_02_EMT_NUM_MODIFIED
## DESCRIPTION:  Number of conservation easements modified; transferred; released; or terminated by the organization during the taxable year
## LOCATION:  SCHED-D-PART-02-LINE-03
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/NmbrEasementsModified'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ModifiedEasementsCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/NmbrEasementsModified'
V_EMT_NUM_MODIFIED <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_NUM_MODIFIED <- xml_text( xml_find_all( doc, V_EMT_NUM_MODIFIED ) )




## VARIABLE NAME:  SD_02_EMT_NUM_STATES
## DESCRIPTION:  Number of states in which the organization held an easement
## LOCATION:  SCHED-D-PART-02-LINE-04
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/NmbrStatesInWhichEasementsHeld'
V2 <- '//Return/ReturnData/IRS990ScheduleD/NmbrStatesInWhichEasementsHeld'
V3 <- '//Return/ReturnData/IRS990ScheduleD/StatesEasementsHeldCnt'
V_EMT_NUM_STATES <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_NUM_STATES <- xml_text( xml_find_all( doc, V_EMT_NUM_STATES ) )




## VARIABLE NAME:  SD_02_EMT_WRITTEN_POLICY_X
## DESCRIPTION:  Does the organization have a written policy regarding the periodic monitoring; inspection; and enforcement of the easements it holds?
## LOCATION:  SCHED-D-PART-02-LINE-05
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/WrittenPolicyMonitoring'
V2 <- '//Return/ReturnData/IRS990ScheduleD/WrittenPolicyMonitoring'
V3 <- '//Return/ReturnData/IRS990ScheduleD/WrittenPolicyMonitoringInd'
V_EMT_WRITTEN_POLICY_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_WRITTEN_POLICY_X <- xml_text( xml_find_all( doc, V_EMT_WRITTEN_POLICY_X ) )




## VARIABLE NAME:  SD_02_EMT_STAFF_HOURS_ENFORCE
## DESCRIPTION:  Staff hours devoted to monitoring or enforcing easements during the year
## LOCATION:  SCHED-D-PART-02-LINE-06
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/StaffHoursSpentOnEnforcement'
V2 <- '//Return/ReturnData/IRS990ScheduleD/StaffHoursSpentEnforcementCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/StaffHoursSpentOnEnforcement'
V_EMT_STAFF_HOURS_ENFORCE <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_STAFF_HOURS_ENFORCE <- xml_text( xml_find_all( doc, V_EMT_STAFF_HOURS_ENFORCE ) )




## VARIABLE NAME:  SD_02_EMT_EXP_INCURRED_ENFORCE
## DESCRIPTION:  Amount of expenses incurred in monitoring or enforcing easements during the taxable year
## LOCATION:  SCHED-D-PART-02-LINE-07
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesIncurredEnforcementAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ExpensesIncurredForEnforcement'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/ExpensesIncurredForEnforcement'
V_EMT_EXP_INCURRED_ENFORCE <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_EXP_INCURRED_ENFORCE <- xml_text( xml_find_all( doc, V_EMT_EXP_INCURRED_ENFORCE ) )




## VARIABLE NAME:  SD_02_EMT_170H_SATISFIED_X
## DESCRIPTION:  Does each conservation easement reported on line 2(d) above satisfy the requirements of section 170(h)(4)(B)(i) and 170(h)(4)(B)(ii)?
## LOCATION:  SCHED-D-PART-02-LINE-08
## TABLE:  SD-P02-T00-CONSERV-EASEMENTS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartII/Sect170hRequirementsSatisfied'
V2 <- '//Return/ReturnData/IRS990ScheduleD/Sect170hRequirementsSatisfied'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Section170hRqrStsfdInd'
V_EMT_170H_SATISFIED_X <- paste( V1, V2, V3 , sep='|' )
SD_02_EMT_170H_SATISFIED_X <- xml_text( xml_find_all( doc, V_EMT_170H_SATISFIED_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_02_EMT_HIST_LAND_AREA_X,SD_02_EMT_HIST_STR_X,SD_02_EMT_NATURAL_HABITAT_X,SD_02_EMT_OPEN_SPACE_X,SD_02_EMT_PUB_USE_X,SD_02_EMT_TOT_NUM,SD_02_EMT_TOT_ACREAGE,SD_02_EMT_NUM_HIST_STR,SD_02_EMT_NUM_HIST_STR_AFTER_06,SD_02_EMT_NUM_MODIFIED,SD_02_EMT_NUM_STATES,SD_02_EMT_WRITTEN_POLICY_X,SD_02_EMT_STAFF_HOURS_ENFORCE,SD_02_EMT_EXP_INCURRED_ENFORCE,SD_02_EMT_170H_SATISFIED_X)
df <- as.data.frame( var.list )


return( df )


}


