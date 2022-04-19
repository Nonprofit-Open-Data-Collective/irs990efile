#' @title 
#'   Build table SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SH_P03_T00_FAP_COMMUNITY_BENEFIT_POLICY <- function( doc, url )
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


## VARIABLE NAME:  SH_03_BAD_DEBT_EXP_REPORTED_X
## DESCRIPTION:  Bad debt expense reported?
## LOCATION:  SCHED-H-PART-03-SECTION-A-LINE-01
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/BadDebtExpenseReportedInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/BadDebtExpenseReported'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/BadDebtExpenseReported'
V_BAD_DEBT_EXP_REPORTED_X <- paste( V1, V2, V3 , sep='|' )
SH_03_BAD_DEBT_EXP_REPORTED_X <- xml2::xml_text( xml2::xml_find_all( doc, V_BAD_DEBT_EXP_REPORTED_X ) )
if( length( SH_03_BAD_DEBT_EXP_REPORTED_X ) > 1 )
{ 
  create_record( varname=SH_03_BAD_DEBT_EXP_REPORTED_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_BAD_DEBT_EXP_REPORTED_X <-  paste0( '{', SH_03_BAD_DEBT_EXP_REPORTED_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_BAD_DEBT_EXP_AMT
## DESCRIPTION:  Bad debt expense amount
## LOCATION:  SCHED-H-PART-03-SECTION-A-LINE-02
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/BadDebtExpenseAmt'
V2 <- '//Return/ReturnData/IRS990ScheduleH/BadDebtExpenseAmount'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/BadDebtExpenseAmount'
V_BAD_DEBT_EXP_AMT <- paste( V1, V2, V3 , sep='|' )
SH_03_BAD_DEBT_EXP_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_BAD_DEBT_EXP_AMT ) )
if( length( SH_03_BAD_DEBT_EXP_AMT ) > 1 )
{ 
  create_record( varname=SH_03_BAD_DEBT_EXP_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_BAD_DEBT_EXP_AMT <-  paste0( '{', SH_03_BAD_DEBT_EXP_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_BAD_DEBT_CONTR_FAP
## DESCRIPTION:  Amount attributable to
## LOCATION:  SCHED-H-PART-03-SECTION-A-LINE-03
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/AmountAttributableTo'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/AmountAttributableTo'
V3 <- '//Return/ReturnData/IRS990ScheduleH/BadDebtExpenseAttributableAmt'
V_BAD_DEBT_CONTR_FAP <- paste( V1, V2, V3 , sep='|' )
SH_03_BAD_DEBT_CONTR_FAP <- xml2::xml_text( xml2::xml_find_all( doc, V_BAD_DEBT_CONTR_FAP ) )
if( length( SH_03_BAD_DEBT_CONTR_FAP ) > 1 )
{ 
  create_record( varname=SH_03_BAD_DEBT_CONTR_FAP, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_BAD_DEBT_CONTR_FAP <-  paste0( '{', SH_03_BAD_DEBT_CONTR_FAP, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_MEDICARE_REIMBURSE_AMT
## DESCRIPTION:  Amount reimbursed by Medicare
## LOCATION:  SCHED-H-PART-03-SECTION-B-LINE-05
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/AmountReimbursedByMedicare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/AmountReimbursedByMedicare'
V3 <- '//Return/ReturnData/IRS990ScheduleH/ReimbursedByMedicareAmt'
V_MEDICARE_REIMBURSE_AMT <- paste( V1, V2, V3 , sep='|' )
SH_03_MEDICARE_REIMBURSE_AMT <- xml2::xml_text( xml2::xml_find_all( doc, V_MEDICARE_REIMBURSE_AMT ) )
if( length( SH_03_MEDICARE_REIMBURSE_AMT ) > 1 )
{ 
  create_record( varname=SH_03_MEDICARE_REIMBURSE_AMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_MEDICARE_REIMBURSE_AMT <-  paste0( '{', SH_03_MEDICARE_REIMBURSE_AMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_MEDICARE_COST_REIMBURSED 
## DESCRIPTION:  Cost of care reimbursed by Medicare
## LOCATION:  SCHED-H-PART-03-SECTION-B-LINE-06
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CostOfCareReimbursedByMedicare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CostOfCareReimbursedByMedcrAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/CostOfCareReimbursedByMedicare'
V_MEDICARE_COST_REIMBURSED  <- paste( V1, V2, V3 , sep='|' )
SH_03_MEDICARE_COST_REIMBURSED  <- xml2::xml_text( xml2::xml_find_all( doc, V_MEDICARE_COST_REIMBURSED  ) )
if( length( SH_03_MEDICARE_COST_REIMBURSED  ) > 1 )
{ 
  create_record( varname=SH_03_MEDICARE_COST_REIMBURSED , ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_MEDICARE_COST_REIMBURSED  <-  paste0( '{', SH_03_MEDICARE_COST_REIMBURSED , '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_MEDICARE_SURPLUS
## DESCRIPTION:  Line 5 less line 6
## LOCATION:  SCHED-H-PART-03-SECTION-B-LINE-07
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/Line5LessLine6'
V2 <- '//Return/ReturnData/IRS990ScheduleH/MedicareSurplusOrShortfallAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleH/MedicareSurplusOrShortfall'
V_MEDICARE_SURPLUS <- paste( V1, V2, V3 , sep='|' )
SH_03_MEDICARE_SURPLUS <- xml2::xml_text( xml2::xml_find_all( doc, V_MEDICARE_SURPLUS ) )
if( length( SH_03_MEDICARE_SURPLUS ) > 1 )
{ 
  create_record( varname=SH_03_MEDICARE_SURPLUS, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_MEDICARE_SURPLUS <-  paste0( '{', SH_03_MEDICARE_SURPLUS, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_MEDICARE_COST_ACC_X
## DESCRIPTION:  Cost accounting system
## LOCATION:  SCHED-H-PART-03-SECTION-B-LINE-08
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CostingMethodologyUsedGrp/CostAccountingSystemInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CostingMethodologyUsed/CostAccountingSystem'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/PartIIILine8Choice/CostAccountingSystem'
V_MEDICARE_COST_ACC_X <- paste( V1, V2, V3 , sep='|' )
SH_03_MEDICARE_COST_ACC_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MEDICARE_COST_ACC_X ) )
if( length( SH_03_MEDICARE_COST_ACC_X ) > 1 )
{ 
  create_record( varname=SH_03_MEDICARE_COST_ACC_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_MEDICARE_COST_ACC_X <-  paste0( '{', SH_03_MEDICARE_COST_ACC_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_MEDICARE_COST_OTH_X
## DESCRIPTION:  Costing Methodology Used - Other
## LOCATION:  SCHED-H-PART-03-SECTION-B-LINE-08
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CostingMethodologyUsed/Other'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CostingMethodologyUsedGrp/OtherInd'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/PartIIILine8Choice/Other'
V_MEDICARE_COST_OTH_X <- paste( V1, V2, V3 , sep='|' )
SH_03_MEDICARE_COST_OTH_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MEDICARE_COST_OTH_X ) )
if( length( SH_03_MEDICARE_COST_OTH_X ) > 1 )
{ 
  create_record( varname=SH_03_MEDICARE_COST_OTH_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_MEDICARE_COST_OTH_X <-  paste0( '{', SH_03_MEDICARE_COST_OTH_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_MEDICARE_COST_RATIO_X
## DESCRIPTION:  Cost to charge ratio
## LOCATION:  SCHED-H-PART-03-SECTION-B-LINE-08
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/CostingMethodologyUsed/CostToChargeRatio'
V2 <- '//Return/ReturnData/IRS990ScheduleH/CostingMethodologyUsedGrp/CostToChargeRatioInd'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/PartIIILine8Choice/CostToChargeRatio'
V_MEDICARE_COST_RATIO_X <- paste( V1, V2, V3 , sep='|' )
SH_03_MEDICARE_COST_RATIO_X <- xml2::xml_text( xml2::xml_find_all( doc, V_MEDICARE_COST_RATIO_X ) )
if( length( SH_03_MEDICARE_COST_RATIO_X ) > 1 )
{ 
  create_record( varname=SH_03_MEDICARE_COST_RATIO_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_MEDICARE_COST_RATIO_X <-  paste0( '{', SH_03_MEDICARE_COST_RATIO_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_COLLEC_POLICY_WRITTEN_X
## DESCRIPTION:  Written debt collection policy?
## LOCATION:  SCHED-H-PART-03-SECTION-C-LINE-09A
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/WrittenDebtCollectionPolicyInd'
V2 <- '//Return/ReturnData/IRS990ScheduleH/WrittenDebtCollectionPolicy'
V3 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/WrittenDebtCollectionPolicy'
V_COLLEC_POLICY_WRITTEN_X <- paste( V1, V2, V3 , sep='|' )
SH_03_COLLEC_POLICY_WRITTEN_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_POLICY_WRITTEN_X ) )
if( length( SH_03_COLLEC_POLICY_WRITTEN_X ) > 1 )
{ 
  create_record( varname=SH_03_COLLEC_POLICY_WRITTEN_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_COLLEC_POLICY_WRITTEN_X <-  paste0( '{', SH_03_COLLEC_POLICY_WRITTEN_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  SH_03_COLLEC_POLICY_PROV_FA_X
## DESCRIPTION:  Provision for charity care?
## LOCATION:  SCHED-H-PART-03-SECTION-C-LINE-09B
## TABLE:  SH-P03-T00-FAP-COMMUNITY-BENEFIT-POLICY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleH/ProvisionForCharityCare'
V2 <- '//Return/ReturnData/IRS990ScheduleH/Form990ScheduleHPartIII/ProvisionForCharityCare'
V3 <- '//Return/ReturnData/IRS990ScheduleH/ProvisionForCharityCareInd'
V4 <- '//Return/ReturnData/IRS990ScheduleH/FinancialAssistancePrvsnInd'
V_COLLEC_POLICY_PROV_FA_X <- paste( V1, V2, V3, V4 , sep='|' )
SH_03_COLLEC_POLICY_PROV_FA_X <- xml2::xml_text( xml2::xml_find_all( doc, V_COLLEC_POLICY_PROV_FA_X ) )
if( length( SH_03_COLLEC_POLICY_PROV_FA_X ) > 1 )
{ 
  create_record( varname=SH_03_COLLEC_POLICY_PROV_FA_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  SH_03_COLLEC_POLICY_PROV_FA_X <-  paste0( '{', SH_03_COLLEC_POLICY_PROV_FA_X, '}', collapse=';' ) 
} 




var.list <- 
namedList(OBJECTID,URL,RETURN_VERSION,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SH_03_BAD_DEBT_EXP_REPORTED_X,SH_03_BAD_DEBT_EXP_AMT,SH_03_BAD_DEBT_CONTR_FAP,SH_03_MEDICARE_REIMBURSE_AMT,SH_03_MEDICARE_COST_REIMBURSED ,SH_03_MEDICARE_SURPLUS,SH_03_MEDICARE_COST_ACC_X,SH_03_MEDICARE_COST_OTH_X,SH_03_MEDICARE_COST_RATIO_X,SH_03_COLLEC_POLICY_WRITTEN_X,SH_03_COLLEC_POLICY_PROV_FA_X)
df <- as.data.frame( var.list )


return( df )


}


