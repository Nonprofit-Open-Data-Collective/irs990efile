#' @title 
#'   Build table SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SD_P03_T00_ORGS_COLLECT_ART_HIST_TREASURE_OTH <- function( doc, url )
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
SD_03_ART_PUB_EXHIBITION_REV <- xml_text( xml_find_all( doc, V_ART_PUB_EXHIBITION_REV ) )




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
SD_03_ART_PUB_EXHIBITION_ASSET <- xml_text( xml_find_all( doc, V_ART_PUB_EXHIBITION_ASSET ) )




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
SD_03_WORKS_ART_REV <- xml_text( xml_find_all( doc, V_WORKS_ART_REV ) )




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
SD_03_WORKS_ART_ASSET <- xml_text( xml_find_all( doc, V_WORKS_ART_ASSET ) )




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
SD_03_COLLEC_PUB_EXHIBITION_X <- xml_text( xml_find_all( doc, V_COLLEC_PUB_EXHIBITION_X ) )




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
SD_03_COLLEC_SCHOLAR_RSRCH_X <- xml_text( xml_find_all( doc, V_COLLEC_SCHOLAR_RSRCH_X ) )




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
SD_03_COLLEC_PRESERVATION_X <- xml_text( xml_find_all( doc, V_COLLEC_PRESERVATION_X ) )




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
SD_03_COLLEC_LOAN_PROG_X <- xml_text( xml_find_all( doc, V_COLLEC_LOAN_PROG_X ) )




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
SD_03_COLLEC_OTH_DESC <- xml_text( xml_find_all( doc, V_COLLEC_OTH_DESC ) )




## VARIABLE NAME:  SD_03_COLLEC_OTH_X
## DESCRIPTION:  Collection Used For Other - CollectionUsedForOtherPurposes
## LOCATION:  SCHED-D-PART-03-LINE-03E
## TABLE:  SD-P03-T00-ORGS-COLLECT-ART-HIST-TREASURE-OTH
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  

V1 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedForOther/CollectionUsedForOtherPurposes'
V2 <- '//Return/ReturnData/IRS990ScheduleD/CollectionUsedOtherPurposesGrp/CollectionUsedOtherPurposesInd'
V_COLLEC_OTH_X <- paste( V1, V2 , sep='|' )
SD_03_COLLEC_OTH_X <- xml_text( xml_find_all( doc, V_COLLEC_OTH_X ) )




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
SD_03_SOL_ASSET_SALE_X <- xml_text( xml_find_all( doc, V_SOL_ASSET_SALE_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SD_03_ART_PUB_EXHIBITION_REV,SD_03_ART_PUB_EXHIBITION_ASSET,SD_03_WORKS_ART_REV,SD_03_WORKS_ART_ASSET,SD_03_COLLEC_PUB_EXHIBITION_X,SD_03_COLLEC_SCHOLAR_RSRCH_X,SD_03_COLLEC_PRESERVATION_X,SD_03_COLLEC_LOAN_PROG_X,SD_03_COLLEC_OTH_DESC,SD_03_COLLEC_OTH_X,SD_03_SOL_ASSET_SALE_X)
df <- as.data.frame( var.list )


return( df )


}


