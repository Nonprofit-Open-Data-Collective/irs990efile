#' @title 
#'   Build table SM-P01-T00-NONCASH-CONTRIBUTIONS
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SM_P01_T00_NONCASH_CONTRIBUTIONS <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SM_01_PROP_HELD_X
## DESCRIPTION:  Any property that must be held?
## LOCATION:  SCHED-M-PART-01-LINE-30A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/AnyPropertyThatMustBeHeld'
V2 <- '//Return/ReturnData/IRS990ScheduleM/AnyPropertyThatMustBeHeldInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/AnyPropertyThatMustBeHeld'
V_PROP_HELD_X <- paste( V1, V2, V3 , sep='|' )
SM_01_PROP_HELD_X <- xml2::xml_text( xml2::xml_find_all( doc, V_PROP_HELD_X ) )
if( length( SM_01_PROP_HELD_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_PROP_HELD_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_PROP_HELD_X <-  paste0( '{', SM_01_PROP_HELD_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ARCHAE_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-24-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifacts/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifactsGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArchaeologicalArtifacts/MethodOfDeterminingRevenues'
V_ARCHAE_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_ARCHAE_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_ARCHAE_METHOD_REV ) )
if( length( SM_01_ARCHAE_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ARCHAE_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ARCHAE_METHOD_REV <-  paste0( '{', SM_01_ARCHAE_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ARCHAE_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-24-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifacts/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifactsGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArchaeologicalArtifacts/NonCashCheckbox'
V_ARCHAE_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_ARCHAE_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ARCHAE_NONCSH_X ) )
if( length( SM_01_ARCHAE_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ARCHAE_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ARCHAE_NONCSH_X <-  paste0( '{', SM_01_ARCHAE_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ARCHAE_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-24-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifacts/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifactsGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArchaeologicalArtifacts/RevenuesReportedLine1G'
V_ARCHAE_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ARCHAE_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ARCHAE_NONCSH_CONTR ) )
if( length( SM_01_ARCHAE_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ARCHAE_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ARCHAE_NONCSH_CONTR <-  paste0( '{', SM_01_ARCHAE_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ARCHAE_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-24-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifacts/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArchaeologicalArtifactsGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArchaeologicalArtifacts/NumberOfContributions'
V_ARCHAE_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ARCHAE_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ARCHAE_NUM_CONTR ) )
if( length( SM_01_ARCHAE_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ARCHAE_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ARCHAE_NUM_CONTR <-  paste0( '{', SM_01_ARCHAE_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_FRACT_INT_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-03-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterest/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterestGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtFractionalInterest/MethodOfDeterminingRevenues'
V_ART_FRACT_INT_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_FRACT_INT_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_FRACT_INT_METHOD_REV ) )
if( length( SM_01_ART_FRACT_INT_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_FRACT_INT_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_FRACT_INT_METHOD_REV <-  paste0( '{', SM_01_ART_FRACT_INT_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_FRACT_INT_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-03-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterest/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterestGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtFractionalInterest/NonCashCheckbox'
V_ART_FRACT_INT_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_FRACT_INT_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_FRACT_INT_NONCSH_X ) )
if( length( SM_01_ART_FRACT_INT_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_FRACT_INT_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_FRACT_INT_NONCSH_X <-  paste0( '{', SM_01_ART_FRACT_INT_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_FRACT_INT_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-03-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterest/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterestGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtFractionalInterest/RevenuesReportedLine1G'
V_ART_FRACT_INT_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_FRACT_INT_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_FRACT_INT_NONCSH_CONTR ) )
if( length( SM_01_ART_FRACT_INT_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_FRACT_INT_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_FRACT_INT_NONCSH_CONTR <-  paste0( '{', SM_01_ART_FRACT_INT_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_FRACT_INT_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-03-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterest/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtFractionalInterestGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtFractionalInterest/NumberOfContributions'
V_ART_FRACT_INT_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_FRACT_INT_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_FRACT_INT_NUM_CONTR ) )
if( length( SM_01_ART_FRACT_INT_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_FRACT_INT_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_FRACT_INT_NUM_CONTR <-  paste0( '{', SM_01_ART_FRACT_INT_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_HIST_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-02-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasures/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasuresGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtHistoricalTreasures/MethodOfDeterminingRevenues'
V_ART_HIST_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_HIST_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_HIST_METHOD_REV ) )
if( length( SM_01_ART_HIST_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_HIST_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_HIST_METHOD_REV <-  paste0( '{', SM_01_ART_HIST_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_HIST_TREASURE_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-02-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasures/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasuresGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtHistoricalTreasures/NonCashCheckbox'
V_ART_HIST_TREASURE_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_HIST_TREASURE_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_HIST_TREASURE_NONCSH_X ) )
if( length( SM_01_ART_HIST_TREASURE_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_HIST_TREASURE_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_HIST_TREASURE_NONCSH_X <-  paste0( '{', SM_01_ART_HIST_TREASURE_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_HIST_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-02-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasures/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasuresGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtHistoricalTreasures/RevenuesReportedLine1G'
V_ART_HIST_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_HIST_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_HIST_NONCSH_CONTR ) )
if( length( SM_01_ART_HIST_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_HIST_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_HIST_NONCSH_CONTR <-  paste0( '{', SM_01_ART_HIST_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_HIST_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-02-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasures/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ArtHistoricalTreasuresGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ArtHistoricalTreasures/NumberOfContributions'
V_ART_HIST_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_HIST_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_HIST_NUM_CONTR ) )
if( length( SM_01_ART_HIST_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_HIST_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_HIST_NUM_CONTR <-  paste0( '{', SM_01_ART_HIST_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOAT_PLANE_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-07-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanes/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanesGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BoatsAndPlanes/MethodOfDeterminingRevenues'
V_BOAT_PLANE_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_BOAT_PLANE_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_BOAT_PLANE_METHOD_REV ) )
if( length( SM_01_BOAT_PLANE_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOAT_PLANE_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOAT_PLANE_METHOD_REV <-  paste0( '{', SM_01_BOAT_PLANE_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOAT_PLANE_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-07-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanes/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanesGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BoatsAndPlanes/NonCashCheckbox'
V_BOAT_PLANE_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_BOAT_PLANE_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BOAT_PLANE_NONCSH_X ) )
if( length( SM_01_BOAT_PLANE_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOAT_PLANE_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOAT_PLANE_NONCSH_X <-  paste0( '{', SM_01_BOAT_PLANE_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOAT_PLANE_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-07-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanes/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanesGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BoatsAndPlanes/RevenuesReportedLine1G'
V_BOAT_PLANE_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_BOAT_PLANE_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_BOAT_PLANE_NONCSH_CONTR ) )
if( length( SM_01_BOAT_PLANE_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOAT_PLANE_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOAT_PLANE_NONCSH_CONTR <-  paste0( '{', SM_01_BOAT_PLANE_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOAT_PLANE_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-07-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanes/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BoatsAndPlanesGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BoatsAndPlanes/NumberOfContributions'
V_BOAT_PLANE_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_BOAT_PLANE_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_BOAT_PLANE_NUM_CONTR ) )
if( length( SM_01_BOAT_PLANE_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOAT_PLANE_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOAT_PLANE_NUM_CONTR <-  paste0( '{', SM_01_BOAT_PLANE_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOOK_PUBLICA_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-04-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BooksAndPublications/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BooksAndPublicationsGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BooksAndPublications/MethodOfDeterminingRevenues'
V_BOOK_PUBLICA_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_BOOK_PUBLICA_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_BOOK_PUBLICA_METHOD_REV ) )
if( length( SM_01_BOOK_PUBLICA_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOOK_PUBLICA_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOOK_PUBLICA_METHOD_REV <-  paste0( '{', SM_01_BOOK_PUBLICA_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOOK_PUBLICA_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-04-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BooksAndPublications/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BooksAndPublicationsGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BooksAndPublications/NonCashCheckbox'
V_BOOK_PUBLICA_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_BOOK_PUBLICA_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BOOK_PUBLICA_NONCSH_X ) )
if( length( SM_01_BOOK_PUBLICA_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOOK_PUBLICA_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOOK_PUBLICA_NONCSH_X <-  paste0( '{', SM_01_BOOK_PUBLICA_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_BOOK_PUBLICA_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-04-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/BooksAndPublications/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/BooksAndPublicationsGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/BooksAndPublications/RevenuesReportedLine1G'
V_BOOK_PUBLICA_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_BOOK_PUBLICA_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_BOOK_PUBLICA_NONCSH_CONTR ) )
if( length( SM_01_BOOK_PUBLICA_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_BOOK_PUBLICA_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_BOOK_PUBLICA_NONCSH_CONTR <-  paste0( '{', SM_01_BOOK_PUBLICA_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CAR_BEHICLE_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-06-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehicles/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehiclesGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/CarsAndOtherVehicles/MethodOfDeterminingRevenues'
V_CAR_BEHICLE_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_CAR_BEHICLE_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_CAR_BEHICLE_METHOD_REV ) )
if( length( SM_01_CAR_BEHICLE_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CAR_BEHICLE_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CAR_BEHICLE_METHOD_REV <-  paste0( '{', SM_01_CAR_BEHICLE_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CAR_BEHICLE_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-06-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehicles/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehiclesGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/CarsAndOtherVehicles/NonCashCheckbox'
V_CAR_BEHICLE_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_CAR_BEHICLE_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CAR_BEHICLE_NONCSH_X ) )
if( length( SM_01_CAR_BEHICLE_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CAR_BEHICLE_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CAR_BEHICLE_NONCSH_X <-  paste0( '{', SM_01_CAR_BEHICLE_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CAR_BEHICLE_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-06-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehicles/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehiclesGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/CarsAndOtherVehicles/RevenuesReportedLine1G'
V_CAR_BEHICLE_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_CAR_BEHICLE_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_CAR_BEHICLE_NONCSH_CONTR ) )
if( length( SM_01_CAR_BEHICLE_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CAR_BEHICLE_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CAR_BEHICLE_NONCSH_CONTR <-  paste0( '{', SM_01_CAR_BEHICLE_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CAR_BEHICLE_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-06-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehicles/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CarsAndOtherVehiclesGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/CarsAndOtherVehicles/NumberOfContributions'
V_CAR_BEHICLE_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_CAR_BEHICLE_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_CAR_BEHICLE_NUM_CONTR ) )
if( length( SM_01_CAR_BEHICLE_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CAR_BEHICLE_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CAR_BEHICLE_NUM_CONTR <-  paste0( '{', SM_01_CAR_BEHICLE_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CLOTHING_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-05-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ClothingAndHouseholdGoods/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ClothingAndHouseholdGoodsGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ClothingAndHouseholdGoods/MethodOfDeterminingRevenues'
V_CLOTHING_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_CLOTHING_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_CLOTHING_METHOD_REV ) )
if( length( SM_01_CLOTHING_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CLOTHING_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CLOTHING_METHOD_REV <-  paste0( '{', SM_01_CLOTHING_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CLOTHING_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-05-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ClothingAndHouseholdGoods/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ClothingAndHouseholdGoodsGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ClothingAndHouseholdGoods/NonCashCheckbox'
V_CLOTHING_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_CLOTHING_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_CLOTHING_NONCSH_X ) )
if( length( SM_01_CLOTHING_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CLOTHING_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CLOTHING_NONCSH_X <-  paste0( '{', SM_01_CLOTHING_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_CLOTHING_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-05-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/ClothingAndHouseholdGoods/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ClothingAndHouseholdGoodsGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ClothingAndHouseholdGoods/RevenuesReportedLine1G'
V_CLOTHING_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_CLOTHING_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_CLOTHING_NONCSH_CONTR ) )
if( length( SM_01_CLOTHING_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_CLOTHING_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_CLOTHING_NONCSH_CONTR <-  paste0( '{', SM_01_CLOTHING_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_COLLECTIBLES_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-18-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Collectibles/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CollectiblesGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Collectibles/MethodOfDeterminingRevenues'
V_COLLECTIBLES_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_COLLECTIBLES_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLECTIBLES_METHOD_REV ) )
if( length( SM_01_COLLECTIBLES_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_COLLECTIBLES_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_COLLECTIBLES_METHOD_REV <-  paste0( '{', SM_01_COLLECTIBLES_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_COLLECTIBLES_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-18-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Collectibles/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CollectiblesGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Collectibles/NonCashCheckbox'
V_COLLECTIBLES_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_COLLECTIBLES_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLECTIBLES_NONCSH_X ) )
if( length( SM_01_COLLECTIBLES_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_COLLECTIBLES_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_COLLECTIBLES_NONCSH_X <-  paste0( '{', SM_01_COLLECTIBLES_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_COLLECTIBLES_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-18-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Collectibles/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CollectiblesGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Collectibles/RevenuesReportedLine1G'
V_COLLECTIBLES_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_COLLECTIBLES_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLECTIBLES_NONCSH_CONTR ) )
if( length( SM_01_COLLECTIBLES_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_COLLECTIBLES_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_COLLECTIBLES_NONCSH_CONTR <-  paste0( '{', SM_01_COLLECTIBLES_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_COLLECTIBLES_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-18-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Collectibles/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/CollectiblesGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Collectibles/NumberOfContributions'
V_COLLECTIBLES_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_COLLECTIBLES_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLECTIBLES_NUM_CONTR ) )
if( length( SM_01_COLLECTIBLES_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_COLLECTIBLES_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_COLLECTIBLES_NUM_CONTR <-  paste0( '{', SM_01_COLLECTIBLES_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_DRUG_MEDICAL_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-20-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSupplies/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSuppliesGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/DrugsAndMedicalSupplies/MethodOfDeterminingRevenues'
V_DRUG_MEDICAL_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_DRUG_MEDICAL_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_DRUG_MEDICAL_METHOD_REV ) )
if( length( SM_01_DRUG_MEDICAL_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_DRUG_MEDICAL_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_DRUG_MEDICAL_METHOD_REV <-  paste0( '{', SM_01_DRUG_MEDICAL_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_DRUG_MEDICAL_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-20-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSupplies/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSuppliesGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/DrugsAndMedicalSupplies/NonCashCheckbox'
V_DRUG_MEDICAL_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_DRUG_MEDICAL_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_DRUG_MEDICAL_NONCSH_X ) )
if( length( SM_01_DRUG_MEDICAL_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_DRUG_MEDICAL_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_DRUG_MEDICAL_NONCSH_X <-  paste0( '{', SM_01_DRUG_MEDICAL_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_DRUG_MEDICAL_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-20-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSupplies/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSuppliesGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/DrugsAndMedicalSupplies/RevenuesReportedLine1G'
V_DRUG_MEDICAL_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_DRUG_MEDICAL_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_DRUG_MEDICAL_NONCSH_CONTR ) )
if( length( SM_01_DRUG_MEDICAL_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_DRUG_MEDICAL_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_DRUG_MEDICAL_NONCSH_CONTR <-  paste0( '{', SM_01_DRUG_MEDICAL_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_DRUG_MEDICAL_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-20-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSupplies/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/DrugsAndMedicalSuppliesGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/DrugsAndMedicalSupplies/NumberOfContributions'
V_DRUG_MEDICAL_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_DRUG_MEDICAL_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_DRUG_MEDICAL_NUM_CONTR ) )
if( length( SM_01_DRUG_MEDICAL_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_DRUG_MEDICAL_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_DRUG_MEDICAL_NUM_CONTR <-  paste0( '{', SM_01_DRUG_MEDICAL_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_FOOD_INV_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-19-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventory/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventoryGrp/MethodOfDeterminingRevenuesTxt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/FoodInventory/MethodOfDeterminingRevenues'
V_FOOD_INV_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_FOOD_INV_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_FOOD_INV_METHOD_REV ) )
if( length( SM_01_FOOD_INV_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_FOOD_INV_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_FOOD_INV_METHOD_REV <-  paste0( '{', SM_01_FOOD_INV_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_FOOD_INV_NONCSH_X
## DESCRIPTION:  Checkbox for lines on Part I
## LOCATION:  SCHED-M-PART-01-LINE-19-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventory/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventoryGrp/NonCashCheckboxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/FoodInventory/NonCashCheckbox'
V_FOOD_INV_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_FOOD_INV_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_FOOD_INV_NONCSH_X ) )
if( length( SM_01_FOOD_INV_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_FOOD_INV_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_FOOD_INV_NONCSH_X <-  paste0( '{', SM_01_FOOD_INV_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_FOOD_INV_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-19-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventory/NoncashContribsRptdF990'
V2 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventoryGrp/NoncashContributionsRptF990Amt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/FoodInventory/RevenuesReportedLine1G'
V_FOOD_INV_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_FOOD_INV_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_FOOD_INV_NONCSH_CONTR ) )
if( length( SM_01_FOOD_INV_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_FOOD_INV_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_FOOD_INV_NONCSH_CONTR <-  paste0( '{', SM_01_FOOD_INV_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_FOOD_INV_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-19-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventory/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/FoodInventoryGrp/ContributionCnt'
V3 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/FoodInventory/NumberOfContributions'
V_FOOD_INV_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_FOOD_INV_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_FOOD_INV_NUM_CONTR ) )
if( length( SM_01_FOOD_INV_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_FOOD_INV_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_FOOD_INV_NUM_CONTR <-  paste0( '{', SM_01_FOOD_INV_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_NUM_FORM_8283_REC
## DESCRIPTION:  Number of 8283s received
## LOCATION:  SCHED-M-PART-01-LINE-29
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form8283ReceivedCnt'
V2 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/NumberOf8283Received'
V3 <- '//Return/ReturnData/IRS990ScheduleM/NumberOf8283Received'
V_NUM_FORM_8283_REC <- paste( V1, V2, V3 , sep='|' )
SM_01_NUM_FORM_8283_REC <- xml2::xml_text( xml2::xml_find_all( doc, V_NUM_FORM_8283_REC ) )
if( length( SM_01_NUM_FORM_8283_REC ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_NUM_FORM_8283_REC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_NUM_FORM_8283_REC <-  paste0( '{', SM_01_NUM_FORM_8283_REC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_HIST_ARTIFACT_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-22-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/HistoricalArtifacts/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifacts/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifactsGrp/MethodOfDeterminingRevenuesTxt'
V_HIST_ARTIFACT_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_HIST_ARTIFACT_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_HIST_ARTIFACT_METHOD_REV ) )
if( length( SM_01_HIST_ARTIFACT_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_HIST_ARTIFACT_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_HIST_ARTIFACT_METHOD_REV <-  paste0( '{', SM_01_HIST_ARTIFACT_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_HIST_ARTIFACT_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-22-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/HistoricalArtifacts/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifacts/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifactsGrp/NonCashCheckboxInd'
V_HIST_ARTIFACT_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_HIST_ARTIFACT_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_HIST_ARTIFACT_NONCSH_X ) )
if( length( SM_01_HIST_ARTIFACT_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_HIST_ARTIFACT_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_HIST_ARTIFACT_NONCSH_X <-  paste0( '{', SM_01_HIST_ARTIFACT_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_HIST_ARTIFACT_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-22-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/HistoricalArtifacts/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifacts/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifactsGrp/ContributionCnt'
V_HIST_ARTIFACT_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_HIST_ARTIFACT_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_HIST_ARTIFACT_NUM_CONTR ) )
if( length( SM_01_HIST_ARTIFACT_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_HIST_ARTIFACT_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_HIST_ARTIFACT_NUM_CONTR <-  paste0( '{', SM_01_HIST_ARTIFACT_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_HIST_ARTIFACT_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-22-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/HistoricalArtifacts/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifacts/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/HistoricalArtifactsGrp/NoncashContributionsRptF990Amt'
V_HIST_ARTIFACT_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_HIST_ARTIFACT_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_HIST_ARTIFACT_NONCSH_CONTR ) )
if( length( SM_01_HIST_ARTIFACT_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_HIST_ARTIFACT_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_HIST_ARTIFACT_NONCSH_CONTR <-  paste0( '{', SM_01_HIST_ARTIFACT_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_IP_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-08-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/IntellectualProperty/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualProperty/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualPropertyGrp/MethodOfDeterminingRevenuesTxt'
V_IP_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_IP_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_IP_METHOD_REV ) )
if( length( SM_01_IP_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_IP_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_IP_METHOD_REV <-  paste0( '{', SM_01_IP_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_IP_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-08-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/IntellectualProperty/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualProperty/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualPropertyGrp/NonCashCheckboxInd'
V_IP_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_IP_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_IP_NONCSH_X ) )
if( length( SM_01_IP_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_IP_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_IP_NONCSH_X <-  paste0( '{', SM_01_IP_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_IP_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-08-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/IntellectualProperty/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualProperty/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualPropertyGrp/ContributionCnt'
V_IP_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_IP_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_IP_NUM_CONTR ) )
if( length( SM_01_IP_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_IP_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_IP_NUM_CONTR <-  paste0( '{', SM_01_IP_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_IP_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-08-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/IntellectualProperty/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualProperty/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/IntellectualPropertyGrp/NoncashContributionsRptF990Amt'
V_IP_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_IP_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_IP_NONCSH_CONTR ) )
if( length( SM_01_IP_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_IP_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_IP_NONCSH_CONTR <-  paste0( '{', SM_01_IP_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_HIST_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-13-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribHistStruct/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStruct/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStructGrp/MethodOfDeterminingRevenuesTxt'
V_QUAL_HIST_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_HIST_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_HIST_METHOD_REV ) )
if( length( SM_01_QUAL_HIST_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_HIST_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_HIST_METHOD_REV <-  paste0( '{', SM_01_QUAL_HIST_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_HIST_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-13-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribHistStruct/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStruct/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStructGrp/NonCashCheckboxInd'
V_QUAL_HIST_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_HIST_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_HIST_NONCSH_X ) )
if( length( SM_01_QUAL_HIST_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_HIST_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_HIST_NONCSH_X <-  paste0( '{', SM_01_QUAL_HIST_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_HIST_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-13-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribHistStruct/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStruct/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStructGrp/ContributionCnt'
V_QUAL_HIST_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_HIST_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_HIST_NUM_CONTR ) )
if( length( SM_01_QUAL_HIST_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_HIST_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_HIST_NUM_CONTR <-  paste0( '{', SM_01_QUAL_HIST_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_HIST_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-13-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribHistStruct/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStruct/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribHistStructGrp/NoncashContributionsRptF990Amt'
V_QUAL_HIST_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_HIST_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_HIST_NONCSH_CONTR ) )
if( length( SM_01_QUAL_HIST_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_HIST_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_HIST_NONCSH_CONTR <-  paste0( '{', SM_01_QUAL_HIST_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_OTH_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-14-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribOther/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOther/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOtherGrp/MethodOfDeterminingRevenuesTxt'
V_QUAL_OTH_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_OTH_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_OTH_METHOD_REV ) )
if( length( SM_01_QUAL_OTH_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_OTH_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_OTH_METHOD_REV <-  paste0( '{', SM_01_QUAL_OTH_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_OTH_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-14-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribOther/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOther/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOtherGrp/NonCashCheckboxInd'
V_QUAL_OTH_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_OTH_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_OTH_NONCSH_X ) )
if( length( SM_01_QUAL_OTH_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_OTH_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_OTH_NONCSH_X <-  paste0( '{', SM_01_QUAL_OTH_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_OTH_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-14-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribOther/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOther/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOtherGrp/ContributionCnt'
V_QUAL_OTH_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_OTH_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_OTH_NUM_CONTR ) )
if( length( SM_01_QUAL_OTH_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_OTH_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_OTH_NUM_CONTR <-  paste0( '{', SM_01_QUAL_OTH_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_QUAL_OTH_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-14-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/QualifiedContribOther/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOther/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/QualifiedContribOtherGrp/NoncashContributionsRptF990Amt'
V_QUAL_OTH_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_QUAL_OTH_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_QUAL_OTH_NONCSH_CONTR ) )
if( length( SM_01_QUAL_OTH_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_QUAL_OTH_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_QUAL_OTH_NONCSH_CONTR <-  paste0( '{', SM_01_QUAL_OTH_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_COMMERCIAL_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-16-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateCommercial/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercial/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercialGrp/MethodOfDeterminingRevenuesTxt'
V_RE_COMMERCIAL_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_COMMERCIAL_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_COMMERCIAL_METHOD_REV ) )
if( length( SM_01_RE_COMMERCIAL_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_COMMERCIAL_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_COMMERCIAL_METHOD_REV <-  paste0( '{', SM_01_RE_COMMERCIAL_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_COMMERCIAL_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-16-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateCommercial/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercial/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercialGrp/NonCashCheckboxInd'
V_RE_COMMERCIAL_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_COMMERCIAL_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_COMMERCIAL_NONCSH_X ) )
if( length( SM_01_RE_COMMERCIAL_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_COMMERCIAL_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_COMMERCIAL_NONCSH_X <-  paste0( '{', SM_01_RE_COMMERCIAL_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_COMMERCIAL_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-16-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateCommercial/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercial/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercialGrp/ContributionCnt'
V_RE_COMMERCIAL_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_COMMERCIAL_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_COMMERCIAL_NUM_CONTR ) )
if( length( SM_01_RE_COMMERCIAL_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_COMMERCIAL_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_COMMERCIAL_NUM_CONTR <-  paste0( '{', SM_01_RE_COMMERCIAL_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_COMMERCIAL_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-16-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateCommercial/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercial/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateCommercialGrp/NoncashContributionsRptF990Amt'
V_RE_COMMERCIAL_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_COMMERCIAL_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_COMMERCIAL_NONCSH_CONTR ) )
if( length( SM_01_RE_COMMERCIAL_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_COMMERCIAL_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_COMMERCIAL_NONCSH_CONTR <-  paste0( '{', SM_01_RE_COMMERCIAL_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_OTH_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-17-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateOther/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOther/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOtherGrp/MethodOfDeterminingRevenuesTxt'
V_RE_OTH_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_OTH_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_OTH_METHOD_REV ) )
if( length( SM_01_RE_OTH_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_OTH_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_OTH_METHOD_REV <-  paste0( '{', SM_01_RE_OTH_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_OTH_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-17-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateOther/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOther/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOtherGrp/NonCashCheckboxInd'
V_RE_OTH_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_OTH_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_OTH_NONCSH_X ) )
if( length( SM_01_RE_OTH_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_OTH_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_OTH_NONCSH_X <-  paste0( '{', SM_01_RE_OTH_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_OTH_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-17-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateOther/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOther/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOtherGrp/ContributionCnt'
V_RE_OTH_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_OTH_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_OTH_NUM_CONTR ) )
if( length( SM_01_RE_OTH_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_OTH_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_OTH_NUM_CONTR <-  paste0( '{', SM_01_RE_OTH_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_OTH_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-17-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateOther/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOther/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateOtherGrp/NoncashContributionsRptF990Amt'
V_RE_OTH_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_OTH_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_OTH_NONCSH_CONTR ) )
if( length( SM_01_RE_OTH_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_OTH_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_OTH_NONCSH_CONTR <-  paste0( '{', SM_01_RE_OTH_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_RESID_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-15-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateResidential/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidential/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidentialGrp/MethodOfDeterminingRevenuesTxt'
V_RE_RESID_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_RESID_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_RESID_METHOD_REV ) )
if( length( SM_01_RE_RESID_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_RESID_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_RESID_METHOD_REV <-  paste0( '{', SM_01_RE_RESID_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_RESID_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-15-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateResidential/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidential/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidentialGrp/NonCashCheckboxInd'
V_RE_RESID_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_RESID_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_RESID_NONCSH_X ) )
if( length( SM_01_RE_RESID_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_RESID_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_RESID_NONCSH_X <-  paste0( '{', SM_01_RE_RESID_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_RESID_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-15-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateResidential/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidential/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidentialGrp/ContributionCnt'
V_RE_RESID_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_RESID_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_RESID_NUM_CONTR ) )
if( length( SM_01_RE_RESID_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_RESID_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_RESID_NUM_CONTR <-  paste0( '{', SM_01_RE_RESID_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_RE_RESID_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-15-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/RealEstateResidential/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidential/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/RealEstateResidentialGrp/NoncashContributionsRptF990Amt'
V_RE_RESID_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_RE_RESID_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_RE_RESID_NONCSH_CONTR ) )
if( length( SM_01_RE_RESID_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_RE_RESID_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_RE_RESID_NONCSH_CONTR <-  paste0( '{', SM_01_RE_RESID_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_REVIEW_PROCESS_UNUSUAL_X
## DESCRIPTION:  Review process reference unusual noncash gifts?
## LOCATION:  SCHED-M-PART-01-LINE-31
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ReviewProcessUnusualNCGifts'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ReviewProcessUnusualNCGifts'
V3 <- '//Return/ReturnData/IRS990ScheduleM/ReviewProcessUnusualNCGiftsInd'
V_REVIEW_PROCESS_UNUSUAL_X <- paste( V1, V2, V3 , sep='|' )
SM_01_REVIEW_PROCESS_UNUSUAL_X <- xml2::xml_text( xml2::xml_find_all( doc, V_REVIEW_PROCESS_UNUSUAL_X ) )
if( length( SM_01_REVIEW_PROCESS_UNUSUAL_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_REVIEW_PROCESS_UNUSUAL_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_REVIEW_PROCESS_UNUSUAL_X <-  paste0( '{', SM_01_REVIEW_PROCESS_UNUSUAL_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SPECIMENS_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-23-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ScientificSpecimens/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimens/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimensGrp/MethodOfDeterminingRevenuesTxt'
V_SPECIMENS_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_SPECIMENS_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_SPECIMENS_METHOD_REV ) )
if( length( SM_01_SPECIMENS_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SPECIMENS_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SPECIMENS_METHOD_REV <-  paste0( '{', SM_01_SPECIMENS_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SPECIMENS_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-23-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ScientificSpecimens/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimens/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimensGrp/NonCashCheckboxInd'
V_SPECIMENS_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_SPECIMENS_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SPECIMENS_NONCSH_X ) )
if( length( SM_01_SPECIMENS_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SPECIMENS_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SPECIMENS_NONCSH_X <-  paste0( '{', SM_01_SPECIMENS_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SPECIMENS_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-23-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ScientificSpecimens/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimens/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimensGrp/ContributionCnt'
V_SPECIMENS_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SPECIMENS_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SPECIMENS_NUM_CONTR ) )
if( length( SM_01_SPECIMENS_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SPECIMENS_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SPECIMENS_NUM_CONTR <-  paste0( '{', SM_01_SPECIMENS_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SPECIMENS_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-23-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ScientificSpecimens/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimens/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/ScientificSpecimensGrp/NoncashContributionsRptF990Amt'
V_SPECIMENS_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SPECIMENS_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SPECIMENS_NONCSH_CONTR ) )
if( length( SM_01_SPECIMENS_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SPECIMENS_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SPECIMENS_NONCSH_CONTR <-  paste0( '{', SM_01_SPECIMENS_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_STCK_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-10-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesCloselyHeldStock/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStock/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStockGrp/MethodOfDeterminingRevenuesTxt'
V_SEC_STCK_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_STCK_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_STCK_METHOD_REV ) )
if( length( SM_01_SEC_STCK_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_STCK_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_STCK_METHOD_REV <-  paste0( '{', SM_01_SEC_STCK_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_STCK_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-10-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesCloselyHeldStock/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStock/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStockGrp/NonCashCheckboxInd'
V_SEC_STCK_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_STCK_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_STCK_NONCSH_X ) )
if( length( SM_01_SEC_STCK_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_STCK_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_STCK_NONCSH_X <-  paste0( '{', SM_01_SEC_STCK_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_STCK_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-10-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesCloselyHeldStock/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStock/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStockGrp/ContributionCnt'
V_SEC_STCK_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_STCK_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_STCK_NUM_CONTR ) )
if( length( SM_01_SEC_STCK_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_STCK_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_STCK_NUM_CONTR <-  paste0( '{', SM_01_SEC_STCK_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_STCK_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-10-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesCloselyHeldStock/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStock/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesCloselyHeldStockGrp/NoncashContributionsRptF990Amt'
V_SEC_STCK_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_STCK_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_STCK_NONCSH_CONTR ) )
if( length( SM_01_SEC_STCK_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_STCK_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_STCK_NONCSH_CONTR <-  paste0( '{', SM_01_SEC_STCK_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_MISC_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-12-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesMiscellaneous/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneous/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneousGrp/MethodOfDeterminingRevenuesTxt'
V_SEC_MISC_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_MISC_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_MISC_METHOD_REV ) )
if( length( SM_01_SEC_MISC_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_MISC_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_MISC_METHOD_REV <-  paste0( '{', SM_01_SEC_MISC_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_MISC_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-12-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesMiscellaneous/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneous/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneousGrp/NonCashCheckboxInd'
V_SEC_MISC_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_MISC_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_MISC_NONCSH_X ) )
if( length( SM_01_SEC_MISC_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_MISC_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_MISC_NONCSH_X <-  paste0( '{', SM_01_SEC_MISC_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_MISC_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-12-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesMiscellaneous/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneous/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneousGrp/ContributionCnt'
V_SEC_MISC_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_MISC_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_MISC_NUM_CONTR ) )
if( length( SM_01_SEC_MISC_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_MISC_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_MISC_NUM_CONTR <-  paste0( '{', SM_01_SEC_MISC_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_MISC_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-12-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesMiscellaneous/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneous/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesMiscellaneousGrp/NoncashContributionsRptF990Amt'
V_SEC_MISC_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_MISC_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_MISC_NONCSH_CONTR ) )
if( length( SM_01_SEC_MISC_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_MISC_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_MISC_NONCSH_CONTR <-  paste0( '{', SM_01_SEC_MISC_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PTR_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-11-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPrtnrshpTrustIntrsts/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPrtnrshpTrustIntrsts/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecurPrtnrshpTrustIntrstsGrp/MethodOfDeterminingRevenuesTxt'
V_SEC_PTR_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PTR_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PTR_METHOD_REV ) )
if( length( SM_01_SEC_PTR_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PTR_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PTR_METHOD_REV <-  paste0( '{', SM_01_SEC_PTR_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PTR_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-11-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPrtnrshpTrustIntrsts/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPrtnrshpTrustIntrsts/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecurPrtnrshpTrustIntrstsGrp/NonCashCheckboxInd'
V_SEC_PTR_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PTR_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PTR_NONCSH_X ) )
if( length( SM_01_SEC_PTR_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PTR_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PTR_NONCSH_X <-  paste0( '{', SM_01_SEC_PTR_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PTR_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-11-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPrtnrshpTrustIntrsts/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPrtnrshpTrustIntrsts/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecurPrtnrshpTrustIntrstsGrp/ContributionCnt'
V_SEC_PTR_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PTR_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PTR_NUM_CONTR ) )
if( length( SM_01_SEC_PTR_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PTR_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PTR_NUM_CONTR <-  paste0( '{', SM_01_SEC_PTR_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PTR_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-11-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPrtnrshpTrustIntrsts/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPrtnrshpTrustIntrsts/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecurPrtnrshpTrustIntrstsGrp/NoncashContributionsRptF990Amt'
V_SEC_PTR_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PTR_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PTR_NONCSH_CONTR ) )
if( length( SM_01_SEC_PTR_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PTR_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PTR_NONCSH_CONTR <-  paste0( '{', SM_01_SEC_PTR_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PUB_TRADE_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-09-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPubliclyTraded/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTraded/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTradedGrp/MethodOfDeterminingRevenuesTxt'
V_SEC_PUB_TRADE_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PUB_TRADE_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PUB_TRADE_METHOD_REV ) )
if( length( SM_01_SEC_PUB_TRADE_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PUB_TRADE_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PUB_TRADE_METHOD_REV <-  paste0( '{', SM_01_SEC_PUB_TRADE_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PUB_TRADE_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-09-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPubliclyTraded/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTraded/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTradedGrp/NonCashCheckboxInd'
V_SEC_PUB_TRADE_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PUB_TRADE_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PUB_TRADE_NONCSH_X ) )
if( length( SM_01_SEC_PUB_TRADE_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PUB_TRADE_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PUB_TRADE_NONCSH_X <-  paste0( '{', SM_01_SEC_PUB_TRADE_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PUB_TRADE_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-09-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPubliclyTraded/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTraded/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTradedGrp/ContributionCnt'
V_SEC_PUB_TRADE_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PUB_TRADE_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PUB_TRADE_NUM_CONTR ) )
if( length( SM_01_SEC_PUB_TRADE_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PUB_TRADE_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PUB_TRADE_NUM_CONTR <-  paste0( '{', SM_01_SEC_PUB_TRADE_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_SEC_PUB_TRADE_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-09-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/SecuritiesPubliclyTraded/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTraded/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/SecuritiesPubliclyTradedGrp/NoncashContributionsRptF990Amt'
V_SEC_PUB_TRADE_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_SEC_PUB_TRADE_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_SEC_PUB_TRADE_NONCSH_CONTR ) )
if( length( SM_01_SEC_PUB_TRADE_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_SEC_PUB_TRADE_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_SEC_PUB_TRADE_NONCSH_CONTR <-  paste0( '{', SM_01_SEC_PUB_TRADE_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_TAXIDERMY_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-21-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Taxidermy/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/Taxidermy/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/TaxidermyGrp/MethodOfDeterminingRevenuesTxt'
V_TAXIDERMY_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_TAXIDERMY_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_TAXIDERMY_METHOD_REV ) )
if( length( SM_01_TAXIDERMY_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_TAXIDERMY_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_TAXIDERMY_METHOD_REV <-  paste0( '{', SM_01_TAXIDERMY_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_TAXIDERMY_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-21-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Taxidermy/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/Taxidermy/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/TaxidermyGrp/NonCashCheckboxInd'
V_TAXIDERMY_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_TAXIDERMY_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_TAXIDERMY_NONCSH_X ) )
if( length( SM_01_TAXIDERMY_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_TAXIDERMY_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_TAXIDERMY_NONCSH_X <-  paste0( '{', SM_01_TAXIDERMY_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_TAXIDERMY_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-21-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Taxidermy/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/Taxidermy/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/TaxidermyGrp/ContributionCnt'
V_TAXIDERMY_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_TAXIDERMY_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_TAXIDERMY_NUM_CONTR ) )
if( length( SM_01_TAXIDERMY_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_TAXIDERMY_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_TAXIDERMY_NUM_CONTR <-  paste0( '{', SM_01_TAXIDERMY_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_TAXIDERMY_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-21-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/Taxidermy/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/Taxidermy/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/TaxidermyGrp/NoncashContributionsRptF990Amt'
V_TAXIDERMY_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_TAXIDERMY_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_TAXIDERMY_NONCSH_CONTR ) )
if( length( SM_01_TAXIDERMY_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_TAXIDERMY_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_TAXIDERMY_NONCSH_CONTR <-  paste0( '{', SM_01_TAXIDERMY_NONCSH_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_THIRD_PARTIES_USED_X
## DESCRIPTION:  Third parties used?
## LOCATION:  SCHED-M-PART-01-LINE-32A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/ThirdPartiesUsed'
V2 <- '//Return/ReturnData/IRS990ScheduleM/ThirdPartiesUsed'
V3 <- '//Return/ReturnData/IRS990ScheduleM/ThirdPartiesUsedInd'
V_THIRD_PARTIES_USED_X <- paste( V1, V2, V3 , sep='|' )
SM_01_THIRD_PARTIES_USED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_THIRD_PARTIES_USED_X ) )
if( length( SM_01_THIRD_PARTIES_USED_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_THIRD_PARTIES_USED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_THIRD_PARTIES_USED_X <-  paste0( '{', SM_01_THIRD_PARTIES_USED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_WORK_METHOD_REV
## DESCRIPTION:  Method of determining revenues
## LOCATION:  SCHED-M-PART-01-LINE-01-COL-D
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/WorksOfArt/MethodOfDeterminingRevenues'
V2 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArt/MethodOfDeterminingRevenues'
V3 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArtGrp/MethodOfDeterminingRevenuesTxt'
V_ART_WORK_METHOD_REV <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_WORK_METHOD_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_WORK_METHOD_REV ) )
if( length( SM_01_ART_WORK_METHOD_REV ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_WORK_METHOD_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_WORK_METHOD_REV <-  paste0( '{', SM_01_ART_WORK_METHOD_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_WORK_NONCSH_X
## DESCRIPTION:  Checkbox for line on Part I
## LOCATION:  SCHED-M-PART-01-LINE-01-COL-A
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/WorksOfArt/NonCashCheckbox'
V2 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArt/NonCashCheckbox'
V3 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArtGrp/NonCashCheckboxInd'
V_ART_WORK_NONCSH_X <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_WORK_NONCSH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_WORK_NONCSH_X ) )
if( length( SM_01_ART_WORK_NONCSH_X ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_WORK_NONCSH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_WORK_NONCSH_X <-  paste0( '{', SM_01_ART_WORK_NONCSH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_WORK_NUM_CONTR
## DESCRIPTION:  Number of contributions
## LOCATION:  SCHED-M-PART-01-LINE-01-COL-B
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/WorksOfArt/NumberOfContributions'
V2 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArt/NumberOfContributions'
V3 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArtGrp/ContributionCnt'
V_ART_WORK_NUM_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_WORK_NUM_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_WORK_NUM_CONTR ) )
if( length( SM_01_ART_WORK_NUM_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_WORK_NUM_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_WORK_NUM_CONTR <-  paste0( '{', SM_01_ART_WORK_NUM_CONTR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SM_01_ART_WORK_NONCSH_CONTR
## DESCRIPTION:  Revenues reported on F990; Pt VIII; line 1g
## LOCATION:  SCHED-M-PART-01-LINE-01-COL-C
## TABLE:  SM-P01-T00-NONCASH-CONTRIBUTIONS
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleM/Form990ScheduleMPartI/WorksOfArt/RevenuesReportedLine1G'
V2 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArt/NoncashContribsRptdF990'
V3 <- '//Return/ReturnData/IRS990ScheduleM/WorksOfArtGrp/NoncashContributionsRptF990Amt'
V_ART_WORK_NONCSH_CONTR <- paste( V1, V2, V3 , sep='|' )
SM_01_ART_WORK_NONCSH_CONTR <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_WORK_NONCSH_CONTR ) )
if( length( SM_01_ART_WORK_NONCSH_CONTR ) > 1 )
{ 
  log_collapsed_record( varname=SM_01_ART_WORK_NONCSH_CONTR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SM_01_ART_WORK_NONCSH_CONTR <-  paste0( '{', SM_01_ART_WORK_NONCSH_CONTR, '}', collapse=';' ) 
} 




var.list <- 
namedList(SM_01_PROP_HELD_X,SM_01_ARCHAE_METHOD_REV,SM_01_ARCHAE_NONCSH_X,SM_01_ARCHAE_NONCSH_CONTR,SM_01_ARCHAE_NUM_CONTR,SM_01_ART_FRACT_INT_METHOD_REV,SM_01_ART_FRACT_INT_NONCSH_X,SM_01_ART_FRACT_INT_NONCSH_CONTR,SM_01_ART_FRACT_INT_NUM_CONTR,SM_01_ART_HIST_METHOD_REV,SM_01_ART_HIST_TREASURE_NONCSH_X,SM_01_ART_HIST_NONCSH_CONTR,SM_01_ART_HIST_NUM_CONTR,SM_01_BOAT_PLANE_METHOD_REV,SM_01_BOAT_PLANE_NONCSH_X,SM_01_BOAT_PLANE_NONCSH_CONTR,SM_01_BOAT_PLANE_NUM_CONTR,SM_01_BOOK_PUBLICA_METHOD_REV,SM_01_BOOK_PUBLICA_NONCSH_X,SM_01_BOOK_PUBLICA_NONCSH_CONTR,SM_01_CAR_BEHICLE_METHOD_REV,SM_01_CAR_BEHICLE_NONCSH_X,SM_01_CAR_BEHICLE_NONCSH_CONTR,SM_01_CAR_BEHICLE_NUM_CONTR,SM_01_CLOTHING_METHOD_REV,SM_01_CLOTHING_NONCSH_X,SM_01_CLOTHING_NONCSH_CONTR,SM_01_COLLECTIBLES_METHOD_REV,SM_01_COLLECTIBLES_NONCSH_X,SM_01_COLLECTIBLES_NONCSH_CONTR,SM_01_COLLECTIBLES_NUM_CONTR,SM_01_DRUG_MEDICAL_METHOD_REV,SM_01_DRUG_MEDICAL_NONCSH_X,SM_01_DRUG_MEDICAL_NONCSH_CONTR,SM_01_DRUG_MEDICAL_NUM_CONTR,SM_01_FOOD_INV_METHOD_REV,SM_01_FOOD_INV_NONCSH_X,SM_01_FOOD_INV_NONCSH_CONTR,SM_01_FOOD_INV_NUM_CONTR,SM_01_NUM_FORM_8283_REC,SM_01_HIST_ARTIFACT_METHOD_REV,SM_01_HIST_ARTIFACT_NONCSH_X,SM_01_HIST_ARTIFACT_NUM_CONTR,SM_01_HIST_ARTIFACT_NONCSH_CONTR,SM_01_IP_METHOD_REV,SM_01_IP_NONCSH_X,SM_01_IP_NUM_CONTR,SM_01_IP_NONCSH_CONTR,SM_01_QUAL_HIST_METHOD_REV,SM_01_QUAL_HIST_NONCSH_X,SM_01_QUAL_HIST_NUM_CONTR,SM_01_QUAL_HIST_NONCSH_CONTR,SM_01_QUAL_OTH_METHOD_REV,SM_01_QUAL_OTH_NONCSH_X,SM_01_QUAL_OTH_NUM_CONTR,SM_01_QUAL_OTH_NONCSH_CONTR,SM_01_RE_COMMERCIAL_METHOD_REV,SM_01_RE_COMMERCIAL_NONCSH_X,SM_01_RE_COMMERCIAL_NUM_CONTR,SM_01_RE_COMMERCIAL_NONCSH_CONTR,SM_01_RE_OTH_METHOD_REV,SM_01_RE_OTH_NONCSH_X,SM_01_RE_OTH_NUM_CONTR,SM_01_RE_OTH_NONCSH_CONTR,SM_01_RE_RESID_METHOD_REV,SM_01_RE_RESID_NONCSH_X,SM_01_RE_RESID_NUM_CONTR,SM_01_RE_RESID_NONCSH_CONTR,SM_01_REVIEW_PROCESS_UNUSUAL_X,SM_01_SPECIMENS_METHOD_REV,SM_01_SPECIMENS_NONCSH_X,SM_01_SPECIMENS_NUM_CONTR,SM_01_SPECIMENS_NONCSH_CONTR,SM_01_SEC_STCK_METHOD_REV,SM_01_SEC_STCK_NONCSH_X,SM_01_SEC_STCK_NUM_CONTR,SM_01_SEC_STCK_NONCSH_CONTR,SM_01_SEC_MISC_METHOD_REV,SM_01_SEC_MISC_NONCSH_X,SM_01_SEC_MISC_NUM_CONTR,SM_01_SEC_MISC_NONCSH_CONTR,SM_01_SEC_PTR_METHOD_REV,SM_01_SEC_PTR_NONCSH_X,SM_01_SEC_PTR_NUM_CONTR,SM_01_SEC_PTR_NONCSH_CONTR,SM_01_SEC_PUB_TRADE_METHOD_REV,SM_01_SEC_PUB_TRADE_NONCSH_X,SM_01_SEC_PUB_TRADE_NUM_CONTR,SM_01_SEC_PUB_TRADE_NONCSH_CONTR,SM_01_TAXIDERMY_METHOD_REV,SM_01_TAXIDERMY_NONCSH_X,SM_01_TAXIDERMY_NUM_CONTR,SM_01_TAXIDERMY_NONCSH_CONTR,SM_01_THIRD_PARTIES_USED_X,SM_01_ART_WORK_METHOD_REV,SM_01_ART_WORK_NONCSH_X,SM_01_ART_WORK_NUM_CONTR,SM_01_ART_WORK_NONCSH_CONTR)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


