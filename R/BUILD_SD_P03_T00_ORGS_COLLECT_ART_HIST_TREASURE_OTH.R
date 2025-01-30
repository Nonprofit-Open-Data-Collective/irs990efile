#' @title 
#'   Build table SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P03_T00_ORGS_COLLECT_ART_HIST_TREASURE_OTH <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SD_03_ART_PUB_EXHIBITION_ASSET
## DESCRIPTION:  Assets in Form 990; Part X
## LOCATION:  SCHED-D-PART-03-LINE-01B(ii)
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ArtPublicExhibitionAmountsGrp/AssetsIncludedAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ArtPublicExhibitionAmts/AssetsInPartX'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/ArtPublicExhibitionAmts/AssetsInPartX'
V_ART_PUB_EXHIBITION_ASSET <- paste( V1, V2, V3 , sep='|' )
SD_03_ART_PUB_EXHIBITION_ASSET <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_PUB_EXHIBITION_ASSET ) )
if( length( SD_03_ART_PUB_EXHIBITION_ASSET ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_ART_PUB_EXHIBITION_ASSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_ART_PUB_EXHIBITION_ASSET <-  paste0( '{', SD_03_ART_PUB_EXHIBITION_ASSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_ART_PUB_EXHIBITION_REV
## DESCRIPTION:  Revenues on Form 990; Part VIII; line 1
## LOCATION:  SCHED-D-PART-03-LINE-01B(i)
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/ArtPublicExhibitionAmountsGrp/RevenuesIncludedAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleD/ArtPublicExhibitionAmts/RevenuesIncluded'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/ArtPublicExhibitionAmts/RevenuesOnPartVIIILine1'
V_ART_PUB_EXHIBITION_REV <- paste( V1, V2, V3 , sep='|' )
SD_03_ART_PUB_EXHIBITION_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_ART_PUB_EXHIBITION_REV ) )
if( length( SD_03_ART_PUB_EXHIBITION_REV ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_ART_PUB_EXHIBITION_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_ART_PUB_EXHIBITION_REV <-  paste0( '{', SD_03_ART_PUB_EXHIBITION_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_COLLEC_OTH_X
## DESCRIPTION:  Collection Used For Other - CollectionUsedForOtherPurposes
## LOCATION:  SCHED-D-PART-03-LINE-03E
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedForOther/CollectionUsedForOtherPurposes'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedOtherPurposesGrp/CollectionUsedOtherPurposesInd'
V_COLLEC_OTH_X <- paste( V1, V2 , sep='|' )
SD_03_COLLEC_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_OTH_X ) )
if( length( SD_03_COLLEC_OTH_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_COLLEC_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_COLLEC_OTH_X <-  paste0( '{', SD_03_COLLEC_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_COLLEC_OTH_DESC
## DESCRIPTION:  Collection Used For Other - DescriptionOfOtherPurposes
## LOCATION:  SCHED-D-PART-03-LINE-03E
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  text
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedForOther/DescriptionOfOtherPurposes'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedOtherPurposesGrp/OtherPurposesDesc'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/CollectionUsedForOtherPurposes/DescriptionOfOtherPurposes'
V_COLLEC_OTH_DESC <- paste( V1, V2, V3 , sep='|' )
SD_03_COLLEC_OTH_DESC <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_OTH_DESC ) )
if( length( SD_03_COLLEC_OTH_DESC ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_COLLEC_OTH_DESC, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_COLLEC_OTH_DESC <-  paste0( '{', SD_03_COLLEC_OTH_DESC, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_COLLEC_PRESERVATION_X
## DESCRIPTION:  Collection used for preservation
## LOCATION:  SCHED-D-PART-03-LINE-03C
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedPreservationInd'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollectUsedForPreservation'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/CollectUsedForPreservation'
V_COLLEC_PRESERVATION_X <- paste( V1, V2, V3 , sep='|' )
SD_03_COLLEC_PRESERVATION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_PRESERVATION_X ) )
if( length( SD_03_COLLEC_PRESERVATION_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_COLLEC_PRESERVATION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_COLLEC_PRESERVATION_X <-  paste0( '{', SD_03_COLLEC_PRESERVATION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_COLLEC_PUB_EXHIBITION_X
## DESCRIPTION:  Collection used for public exhibition
## LOCATION:  SCHED-D-PART-03-LINE-03A
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedPubExhibitionInd'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollectUsedForPublicExhibition'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/CollectUsedForPublicExhibition'
V_COLLEC_PUB_EXHIBITION_X <- paste( V1, V2, V3 , sep='|' )
SD_03_COLLEC_PUB_EXHIBITION_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_PUB_EXHIBITION_X ) )
if( length( SD_03_COLLEC_PUB_EXHIBITION_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_COLLEC_PUB_EXHIBITION_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_COLLEC_PUB_EXHIBITION_X <-  paste0( '{', SD_03_COLLEC_PUB_EXHIBITION_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_COLLEC_LOAN_PROG_X
## DESCRIPTION:  Collection used for loan or exchange programs
## LOCATION:  SCHED-D-PART-03-LINE-03D
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectUsedForLoanOrExchPrgrms'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollUsedLoanOrExchProgInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/CollectUsedForLoanOrExchPrgrms'
V_COLLEC_LOAN_PROG_X <- paste( V1, V2, V3 , sep='|' )
SD_03_COLLEC_LOAN_PROG_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_LOAN_PROG_X ) )
if( length( SD_03_COLLEC_LOAN_PROG_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_COLLEC_LOAN_PROG_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_COLLEC_LOAN_PROG_X <-  paste0( '{', SD_03_COLLEC_LOAN_PROG_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_COLLEC_SCHOLAR_RSRCH_X
## DESCRIPTION:  Collection used for scholarly research
## LOCATION:  SCHED-D-PART-03-LINE-03B
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectUsedForScholarResearch'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollUsedScholarlyRsrchInd'
V3 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/CollectUsedForScholarResearch'
V_COLLEC_SCHOLAR_RSRCH_X <- paste( V1, V2, V3 , sep='|' )
SD_03_COLLEC_SCHOLAR_RSRCH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_SCHOLAR_RSRCH_X ) )
if( length( SD_03_COLLEC_SCHOLAR_RSRCH_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_COLLEC_SCHOLAR_RSRCH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_COLLEC_SCHOLAR_RSRCH_X <-  paste0( '{', SD_03_COLLEC_SCHOLAR_RSRCH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_WORKS_ART_ASSET
## DESCRIPTION:  Assets in Form 990; Part X
## LOCATION:  SCHED-D-PART-03-LINE-02B
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/HeldWorksOfArtAmts/AssetsInPartX'
V2 <- '//Return/ReturnData/IRS990ScheduleD/HeldWorksArtGrp/AssetsIncludedAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/HeldWorksOfArtAmts/AssetsInPartX'
V_WORKS_ART_ASSET <- paste( V1, V2, V3 , sep='|' )
SD_03_WORKS_ART_ASSET <- xml2::xml_text( xml2::xml_find_all( doc, V_WORKS_ART_ASSET ) )
if( length( SD_03_WORKS_ART_ASSET ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_WORKS_ART_ASSET, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_WORKS_ART_ASSET <-  paste0( '{', SD_03_WORKS_ART_ASSET, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_WORKS_ART_REV
## DESCRIPTION:  Revenues on Form 990; Part VIII; line 1
## LOCATION:  SCHED-D-PART-03-LINE-02A
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/HeldWorksOfArtAmts/RevenuesOnPartVIIILine1'
V2 <- '//Return/ReturnData/IRS990ScheduleD/HeldWorksArtGrp/RevenuesIncludedAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleD/HeldWorksOfArtAmts/RevenuesIncluded'
V_WORKS_ART_REV <- paste( V1, V2, V3 , sep='|' )
SD_03_WORKS_ART_REV <- xml2::xml_text( xml2::xml_find_all( doc, V_WORKS_ART_REV ) )
if( length( SD_03_WORKS_ART_REV ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_WORKS_ART_REV, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_WORKS_ART_REV <-  paste0( '{', SD_03_WORKS_ART_REV, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SD_03_SOL_ASSET_SALE_X
## DESCRIPTION:  During the year; did the organization solicit or receive donations of art; historical treasures or other similar assets to be sold to raise funds rather than to be maintained as part of the organization's collection?
## LOCATION:  SCHED-D-PART-03-LINE-05
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/Form990ScheduleDPartIII/SolicitedAssetsForSale'
V2 <- '//Return/ReturnData/IRS990ScheduleD/SolicitedAssetsForSale'
V3 <- '//Return/ReturnData/IRS990ScheduleD/SolicitedAssetsSaleInd'
V_SOL_ASSET_SALE_X <- paste( V1, V2, V3 , sep='|' )
SD_03_SOL_ASSET_SALE_X <- xml2::xml_text( xml2::xml_find_all( doc, V_SOL_ASSET_SALE_X ) )
if( length( SD_03_SOL_ASSET_SALE_X ) > 1 )
{ 
  log_collapsed_record( varname=SD_03_SOL_ASSET_SALE_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SD_03_SOL_ASSET_SALE_X <-  paste0( '{', SD_03_SOL_ASSET_SALE_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(SD_03_ART_PUB_EXHIBITION_ASSET,SD_03_ART_PUB_EXHIBITION_REV,SD_03_COLLEC_OTH_X,SD_03_COLLEC_OTH_DESC,SD_03_COLLEC_PRESERVATION_X,SD_03_COLLEC_PUB_EXHIBITION_X,SD_03_COLLEC_LOAN_PROG_X,SD_03_COLLEC_SCHOLAR_RSRCH_X,SD_03_WORKS_ART_ASSET,SD_03_WORKS_ART_REV,SD_03_SOL_ASSET_SALE_X)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


