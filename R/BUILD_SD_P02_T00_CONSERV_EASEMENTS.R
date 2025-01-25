#' @title 
#'   Build table SD-P02-T00-CONSERV-EASEMENTS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P02_T00_CONSERV_EASEMENTS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


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
SD_02_EMT_EXP_INCURRED_ENFORCE <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_EXP_INCURRED_ENFORCE ) )
if( length( SD_02_EMT_EXP_INCURRED_ENFORCE ) > 1 )
{ 
  create_record( varname=SD_02_EMT_EXP_INCURRED_ENFORCE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_EXP_INCURRED_ENFORCE <-  paste0( '{', SD_02_EMT_EXP_INCURRED_ENFORCE, '}', collapse=';' ) 
} 




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
SD_02_EMT_HIST_LAND_AREA_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_HIST_LAND_AREA_X ) )
if( length( SD_02_EMT_HIST_LAND_AREA_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_HIST_LAND_AREA_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_HIST_LAND_AREA_X <-  paste0( '{', SD_02_EMT_HIST_LAND_AREA_X, '}', collapse=';' ) 
} 




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
SD_02_EMT_HIST_STR_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_HIST_STR_X ) )
if( length( SD_02_EMT_HIST_STR_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_HIST_STR_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_HIST_STR_X <-  paste0( '{', SD_02_EMT_HIST_STR_X, '}', collapse=';' ) 
} 




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
SD_02_EMT_NUM_MODIFIED <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_NUM_MODIFIED ) )
if( length( SD_02_EMT_NUM_MODIFIED ) > 1 )
{ 
  create_record( varname=SD_02_EMT_NUM_MODIFIED, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_NUM_MODIFIED <-  paste0( '{', SD_02_EMT_NUM_MODIFIED, '}', collapse=';' ) 
} 




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
SD_02_EMT_NUM_HIST_STR <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_NUM_HIST_STR ) )
if( length( SD_02_EMT_NUM_HIST_STR ) > 1 )
{ 
  create_record( varname=SD_02_EMT_NUM_HIST_STR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_NUM_HIST_STR <-  paste0( '{', SD_02_EMT_NUM_HIST_STR, '}', collapse=';' ) 
} 




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
SD_02_EMT_NUM_HIST_STR_AFTER_06 <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_NUM_HIST_STR_AFTER_06 ) )
if( length( SD_02_EMT_NUM_HIST_STR_AFTER_06 ) > 1 )
{ 
  create_record( varname=SD_02_EMT_NUM_HIST_STR_AFTER_06, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_NUM_HIST_STR_AFTER_06 <-  paste0( '{', SD_02_EMT_NUM_HIST_STR_AFTER_06, '}', collapse=';' ) 
} 




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
SD_02_EMT_NUM_STATES <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_NUM_STATES ) )
if( length( SD_02_EMT_NUM_STATES ) > 1 )
{ 
  create_record( varname=SD_02_EMT_NUM_STATES, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_NUM_STATES <-  paste0( '{', SD_02_EMT_NUM_STATES, '}', collapse=';' ) 
} 




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
SD_02_EMT_PUB_USE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_PUB_USE_X ) )
if( length( SD_02_EMT_PUB_USE_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_PUB_USE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_PUB_USE_X <-  paste0( '{', SD_02_EMT_PUB_USE_X, '}', collapse=';' ) 
} 




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
SD_02_EMT_OPEN_SPACE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_OPEN_SPACE_X ) )
if( length( SD_02_EMT_OPEN_SPACE_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_OPEN_SPACE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_OPEN_SPACE_X <-  paste0( '{', SD_02_EMT_OPEN_SPACE_X, '}', collapse=';' ) 
} 




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
SD_02_EMT_NATURAL_HABITAT_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_NATURAL_HABITAT_X ) )
if( length( SD_02_EMT_NATURAL_HABITAT_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_NATURAL_HABITAT_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_NATURAL_HABITAT_X <-  paste0( '{', SD_02_EMT_NATURAL_HABITAT_X, '}', collapse=';' ) 
} 




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
SD_02_EMT_170H_SATISFIED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_170H_SATISFIED_X ) )
if( length( SD_02_EMT_170H_SATISFIED_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_170H_SATISFIED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_170H_SATISFIED_X <-  paste0( '{', SD_02_EMT_170H_SATISFIED_X, '}', collapse=';' ) 
} 




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
SD_02_EMT_STAFF_HOURS_ENFORCE <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_STAFF_HOURS_ENFORCE ) )
if( length( SD_02_EMT_STAFF_HOURS_ENFORCE ) > 1 )
{ 
  create_record( varname=SD_02_EMT_STAFF_HOURS_ENFORCE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_STAFF_HOURS_ENFORCE <-  paste0( '{', SD_02_EMT_STAFF_HOURS_ENFORCE, '}', collapse=';' ) 
} 




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
SD_02_EMT_TOT_ACREAGE <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_TOT_ACREAGE ) )
if( length( SD_02_EMT_TOT_ACREAGE ) > 1 )
{ 
  create_record( varname=SD_02_EMT_TOT_ACREAGE, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_TOT_ACREAGE <-  paste0( '{', SD_02_EMT_TOT_ACREAGE, '}', collapse=';' ) 
} 




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
SD_02_EMT_TOT_NUM <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_TOT_NUM ) )
if( length( SD_02_EMT_TOT_NUM ) > 1 )
{ 
  create_record( varname=SD_02_EMT_TOT_NUM, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_TOT_NUM <-  paste0( '{', SD_02_EMT_TOT_NUM, '}', collapse=';' ) 
} 




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
SD_02_EMT_WRITTEN_POLICY_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EMT_WRITTEN_POLICY_X ) )
if( length( SD_02_EMT_WRITTEN_POLICY_X ) > 1 )
{ 
  create_record( varname=SD_02_EMT_WRITTEN_POLICY_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_02_EMT_WRITTEN_POLICY_X <-  paste0( '{', SD_02_EMT_WRITTEN_POLICY_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_02_EMT_EXP_INCURRED_ENFORCE,SD_02_EMT_HIST_LAND_AREA_X,SD_02_EMT_HIST_STR_X,SD_02_EMT_NUM_MODIFIED,SD_02_EMT_NUM_HIST_STR,SD_02_EMT_NUM_HIST_STR_AFTER_06,SD_02_EMT_NUM_STATES,SD_02_EMT_PUB_USE_X,SD_02_EMT_OPEN_SPACE_X,SD_02_EMT_NATURAL_HABITAT_X,SD_02_EMT_170H_SATISFIED_X,SD_02_EMT_STAFF_HOURS_ENFORCE,SD_02_EMT_TOT_ACREAGE,SD_02_EMT_TOT_NUM,SD_02_EMT_WRITTEN_POLICY_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


