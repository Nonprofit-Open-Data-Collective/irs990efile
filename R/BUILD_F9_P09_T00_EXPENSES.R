#' @title 
#'   Build table F9-P09-T00-EXPENSES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P09_T00_EXPENSES <- function( doc, url ){ 


keys <- get_keys( doc, url )
URL <- url
ORG_EIN <- keys[['ORG_EIN']]
TAX_YEAR <- keys[['TAX_YEAR']]


######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  F9_09_EXP_FEE_SVC_ACC_FUNDR
## DESCRIPTION:  Fees for Services - Accounting - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11C-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountingFees/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesAccounting/Fundraising'
V3 <- '//Return/ReturnData/IRS990/FeesForServicesAccountingGrp/FundraisingAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesAccounting/Fundraising'
V_EXP_FEE_SVC_ACC_FUNDR <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_FEE_SVC_ACC_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_ACC_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_ACC_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_ACC_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_ACC_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_ACC_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_ACC_MGMT
## DESCRIPTION:  Fees for Services - Accounting - Management and General
## LOCATION:  F990-PC-PART-09-LINE-11C-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountingFees/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesAccounting/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/FeesForServicesAccountingGrp/ManagementAndGeneralAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesAccounting/ManagementAndGeneral'
V_EXP_FEE_SVC_ACC_MGMT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_FEE_SVC_ACC_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_ACC_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_ACC_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_ACC_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_ACC_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_ACC_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_ACC_PROG
## DESCRIPTION:  Fees for Services - Accounting - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-11C-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountingFees/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesAccounting/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/FeesForServicesAccountingGrp/ProgramServicesAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesAccounting/ProgramServices'
V_EXP_FEE_SVC_ACC_PROG <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_FEE_SVC_ACC_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_ACC_PROG ) )
if( length( F9_09_EXP_FEE_SVC_ACC_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_ACC_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_ACC_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_ACC_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_ACC_TOT
## DESCRIPTION:  Fees for Services - Accounting - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11C-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AccountingFees/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesAccounting/Total'
V3 <- '//Return/ReturnData/IRS990/FeesForServicesAccountingGrp/TotalAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesAccounting/Total'
V_EXP_FEE_SVC_ACC_TOT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_FEE_SVC_ACC_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_ACC_TOT ) )
if( length( F9_09_EXP_FEE_SVC_ACC_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_ACC_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_ACC_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_ACC_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_AD_PROMO_FUNDR
## DESCRIPTION:  Advertising and promotion - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-12-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Advertising/Fundraising'
V2 <- '//Return/ReturnData/IRS990/AdvertisingGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/Advertising/Fundraising'
V_EXP_AD_PROMO_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_AD_PROMO_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_AD_PROMO_FUNDR ) )
if( length( F9_09_EXP_AD_PROMO_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_AD_PROMO_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_AD_PROMO_FUNDR <-  paste0( '{', F9_09_EXP_AD_PROMO_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_AD_PROMO_MGMT
## DESCRIPTION:  Advertising and promotion - Management and General
## LOCATION:  F990-PC-PART-09-LINE-12-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Advertising/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/AdvertisingGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/Advertising/ManagementAndGeneral'
V_EXP_AD_PROMO_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_AD_PROMO_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_AD_PROMO_MGMT ) )
if( length( F9_09_EXP_AD_PROMO_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_AD_PROMO_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_AD_PROMO_MGMT <-  paste0( '{', F9_09_EXP_AD_PROMO_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_AD_PROMO_PROG
## DESCRIPTION:  Advertising and promotion - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-12-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Advertising/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/AdvertisingGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/Advertising/ProgramServices'
V_EXP_AD_PROMO_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_AD_PROMO_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_AD_PROMO_PROG ) )
if( length( F9_09_EXP_AD_PROMO_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_AD_PROMO_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_AD_PROMO_PROG <-  paste0( '{', F9_09_EXP_AD_PROMO_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_AD_PROMO_TOT
## DESCRIPTION:  Advertising and promotion - total expense
## LOCATION:  F990-PC-PART-09-LINE-12-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Advertising/Total'
V2 <- '//Return/ReturnData/IRS990/AdvertisingGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/Advertising/Total'
V_EXP_AD_PROMO_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_AD_PROMO_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_AD_PROMO_TOT ) )
if( length( F9_09_EXP_AD_PROMO_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_AD_PROMO_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_AD_PROMO_TOT <-  paste0( '{', F9_09_EXP_AD_PROMO_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_OTH_FUNDR
## DESCRIPTION:  All Other expenses - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-24E-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AllOtherExpenses/Fundraising'
V2 <- '//Return/ReturnData/IRS990/AllOtherExpensesGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/AllOtherExpenses/Fundraising'
V_EXP_OTH_OTH_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_OTH_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_OTH_FUNDR ) )
if( length( F9_09_EXP_OTH_OTH_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_OTH_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_OTH_FUNDR <-  paste0( '{', F9_09_EXP_OTH_OTH_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_OTH_MGMT
## DESCRIPTION:  All Other expenses - Admin
## LOCATION:  F990-PC-PART-09-LINE-24E-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AllOtherExpenses/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/AllOtherExpensesGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/AllOtherExpenses/ManagementAndGeneral'
V_EXP_OTH_OTH_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_OTH_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_OTH_MGMT ) )
if( length( F9_09_EXP_OTH_OTH_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_OTH_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_OTH_MGMT <-  paste0( '{', F9_09_EXP_OTH_OTH_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_OTH_PROG
## DESCRIPTION:  All Other expenses - Program
## LOCATION:  F990-PC-PART-09-LINE-24E-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AllOtherExpenses/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/AllOtherExpensesGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/AllOtherExpenses/ProgramServices'
V_EXP_OTH_OTH_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_OTH_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_OTH_PROG ) )
if( length( F9_09_EXP_OTH_OTH_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_OTH_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_OTH_PROG <-  paste0( '{', F9_09_EXP_OTH_OTH_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_OTH_TOT
## DESCRIPTION:  Other expenses - total expense
## LOCATION:  F990-PC-PART-09-LINE-24E-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/AllOtherExpenses/Total'
V2 <- '//Return/ReturnData/IRS990/AllOtherExpensesGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/AllOtherExpenses/Total'
V_EXP_OTH_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_OTH_TOT ) )
if( length( F9_09_EXP_OTH_OTH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_OTH_TOT <-  paste0( '{', F9_09_EXP_OTH_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_BEN_PAID_MEMB_PROG
## DESCRIPTION:  Benefits Paid to or for Members - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-04-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BenefitsPaidToOrForMembers/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/BenefitsToMembers/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/BenefitsToMembersGrp/ProgramServicesAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/BenefitsToMembers/ProgramServices'
V_EXP_BEN_PAID_MEMB_PROG <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_BEN_PAID_MEMB_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_BEN_PAID_MEMB_PROG ) )
if( length( F9_09_EXP_BEN_PAID_MEMB_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_BEN_PAID_MEMB_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_BEN_PAID_MEMB_PROG <-  paste0( '{', F9_09_EXP_BEN_PAID_MEMB_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_BEN_PAID_MEMB_TOT
## DESCRIPTION:  Benefits Paid to or for Members - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-04-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/BenefitsPaidToOrForMembers/Total'
V2 <- '//Return/ReturnData/IRS990/BenefitsToMembers/Total'
V3 <- '//Return/ReturnData/IRS990/BenefitsToMembersGrp/TotalAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/BenefitsToMembers/Total'
V_EXP_BEN_PAID_MEMB_TOT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_BEN_PAID_MEMB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_BEN_PAID_MEMB_TOT ) )
if( length( F9_09_EXP_BEN_PAID_MEMB_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_BEN_PAID_MEMB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_BEN_PAID_MEMB_TOT <-  paste0( '{', F9_09_EXP_BEN_PAID_MEMB_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DTK_FUNDR
## DESCRIPTION:  Compensation for Current Officers, Directors, Trustees and Key Employees - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-05-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/FundraisingAmt'
V2 <- '//Return/ReturnData/IRS990/CompCurrentOfficersDirectors/Fundraising'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompCurrentOfficersDirectors/Fundraising'
V_EXP_COMP_DTK_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DTK_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DTK_FUNDR ) )
if( length( F9_09_EXP_COMP_DTK_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DTK_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DTK_FUNDR <-  paste0( '{', F9_09_EXP_COMP_DTK_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DTK_MGMT
## DESCRIPTION:  Compensation for Current Officers, Directors, Trustees and Key Employees - Admin
## LOCATION:  F990-PC-PART-09-LINE-05-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/ManagementAndGeneralAmt'
V2 <- '//Return/ReturnData/IRS990/CompCurrentOfficersDirectors/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompCurrentOfficersDirectors/ManagementAndGeneral'
V_EXP_COMP_DTK_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DTK_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DTK_MGMT ) )
if( length( F9_09_EXP_COMP_DTK_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DTK_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DTK_MGMT <-  paste0( '{', F9_09_EXP_COMP_DTK_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DTK_PROG
## DESCRIPTION:  Compensation for Current Officers, Directors, Trustees and Key Employees - Program
## LOCATION:  F990-PC-PART-09-LINE-05-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/ProgramServicesAmt'
V2 <- '//Return/ReturnData/IRS990/CompCurrentOfficersDirectors/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompCurrentOfficersDirectors/ProgramServices'
V_EXP_COMP_DTK_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DTK_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DTK_PROG ) )
if( length( F9_09_EXP_COMP_DTK_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DTK_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DTK_PROG <-  paste0( '{', F9_09_EXP_COMP_DTK_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DTK_TOT
## DESCRIPTION:  Compensation for Current Officers, Directors, Trustees and Key Employees - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-05-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompCurrentOfcrDirectorsGrp/TotalAmt'
V2 <- '//Return/ReturnData/IRS990/CompCurrentOfficersDirectors/Total'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompCurrentOfficersDirectors/Total'
V_EXP_COMP_DTK_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DTK_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DTK_TOT ) )
if( length( F9_09_EXP_COMP_DTK_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DTK_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DTK_TOT <-  paste0( '{', F9_09_EXP_COMP_DTK_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DSQ_PERS_FUNDR
## DESCRIPTION:  Compensation not included above, or to disqualified persons - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-06-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompDisqualPersons/Fundraising'
V2 <- '//Return/ReturnData/IRS990/CompDisqualPersonsGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompDisqualPersons/Fundraising'
V_EXP_COMP_DSQ_PERS_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DSQ_PERS_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DSQ_PERS_FUNDR ) )
if( length( F9_09_EXP_COMP_DSQ_PERS_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DSQ_PERS_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DSQ_PERS_FUNDR <-  paste0( '{', F9_09_EXP_COMP_DSQ_PERS_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DSQ_PERS_MGMT
## DESCRIPTION:  Compensation not included above, or to disqualified persons - Management and General
## LOCATION:  F990-PC-PART-09-LINE-06-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompDisqualPersons/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/CompDisqualPersonsGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompDisqualPersons/ManagementAndGeneral'
V_EXP_COMP_DSQ_PERS_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DSQ_PERS_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DSQ_PERS_MGMT ) )
if( length( F9_09_EXP_COMP_DSQ_PERS_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DSQ_PERS_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DSQ_PERS_MGMT <-  paste0( '{', F9_09_EXP_COMP_DSQ_PERS_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DSQ_PERS_PROG
## DESCRIPTION:  Compensation not included above, or to disqualified persons - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-06-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompDisqualPersons/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/CompDisqualPersonsGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompDisqualPersons/ProgramServices'
V_EXP_COMP_DSQ_PERS_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DSQ_PERS_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DSQ_PERS_PROG ) )
if( length( F9_09_EXP_COMP_DSQ_PERS_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DSQ_PERS_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DSQ_PERS_PROG <-  paste0( '{', F9_09_EXP_COMP_DSQ_PERS_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_COMP_DSQ_PERS_TOT
## DESCRIPTION:  Compensation not included above, or to disqualified persons - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-06-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/CompDisqualPersons/Total'
V2 <- '//Return/ReturnData/IRS990/CompDisqualPersonsGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/CompDisqualPersons/Total'
V_EXP_COMP_DSQ_PERS_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_COMP_DSQ_PERS_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_COMP_DSQ_PERS_TOT ) )
if( length( F9_09_EXP_COMP_DSQ_PERS_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_COMP_DSQ_PERS_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_COMP_DSQ_PERS_TOT <-  paste0( '{', F9_09_EXP_COMP_DSQ_PERS_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_CONF_MEETING_FUNDR
## DESCRIPTION:  Conferences, conventions, and meetings- Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-19-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConferencesConventionsMeetings/Fundraising'
V2 <- '//Return/ReturnData/IRS990/ConferencesMeetings/Fundraising'
V3 <- '//Return/ReturnData/IRS990/ConferencesMeetingsGrp/FundraisingAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/ConferencesMeetings/Fundraising'
V_EXP_CONF_MEETING_FUNDR <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_CONF_MEETING_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_CONF_MEETING_FUNDR ) )
if( length( F9_09_EXP_CONF_MEETING_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_CONF_MEETING_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_CONF_MEETING_FUNDR <-  paste0( '{', F9_09_EXP_CONF_MEETING_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_CONF_MEETING_MGMT
## DESCRIPTION:  Conferences, conventions, and meetings- Management and General
## LOCATION:  F990-PC-PART-09-LINE-19-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConferencesConventionsMeetings/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/ConferencesMeetings/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/ConferencesMeetingsGrp/ManagementAndGeneralAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/ConferencesMeetings/ManagementAndGeneral'
V_EXP_CONF_MEETING_MGMT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_CONF_MEETING_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_CONF_MEETING_MGMT ) )
if( length( F9_09_EXP_CONF_MEETING_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_CONF_MEETING_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_CONF_MEETING_MGMT <-  paste0( '{', F9_09_EXP_CONF_MEETING_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_CONF_MEETING_PROG
## DESCRIPTION:  Conferences, conventions, and meetings- Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-19-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConferencesConventionsMeetings/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/ConferencesMeetings/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/ConferencesMeetingsGrp/ProgramServicesAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/ConferencesMeetings/ProgramServices'
V_EXP_CONF_MEETING_PROG <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_CONF_MEETING_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_CONF_MEETING_PROG ) )
if( length( F9_09_EXP_CONF_MEETING_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_CONF_MEETING_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_CONF_MEETING_PROG <-  paste0( '{', F9_09_EXP_CONF_MEETING_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_CONF_MEETING_TOT
## DESCRIPTION:  Conferences, conventions, and meetings- total expense
## LOCATION:  F990-PC-PART-09-LINE-19-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ConferencesConventionsMeetings/Total'
V2 <- '//Return/ReturnData/IRS990/ConferencesMeetings/Total'
V3 <- '//Return/ReturnData/IRS990/ConferencesMeetingsGrp/TotalAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/ConferencesMeetings/Total'
V_EXP_CONF_MEETING_TOT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_CONF_MEETING_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_CONF_MEETING_TOT ) )
if( length( F9_09_EXP_CONF_MEETING_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_CONF_MEETING_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_CONF_MEETING_TOT <-  paste0( '{', F9_09_EXP_CONF_MEETING_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_DEPREC_FUNDR
## DESCRIPTION:  Depreciation, depletion, and amortization
## LOCATION:  F990-PC-PART-09-LINE-22-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DepreciationDepletion/Fundraising'
V2 <- '//Return/ReturnData/IRS990/DepreciationDepletionEtc/Fundraising'
V3 <- '//Return/ReturnData/IRS990/DepreciationDepletionGrp/FundraisingAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/DepreciationDepletion/Fundraising'
V_EXP_DEPREC_FUNDR <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_DEPREC_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_DEPREC_FUNDR ) )
if( length( F9_09_EXP_DEPREC_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_DEPREC_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_DEPREC_FUNDR <-  paste0( '{', F9_09_EXP_DEPREC_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_DEPREC_MGMT
## DESCRIPTION:  Depreciation, depletion, and amortization
## LOCATION:  F990-PC-PART-09-LINE-22-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DepreciationDepletion/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/DepreciationDepletionEtc/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/DepreciationDepletionGrp/ManagementAndGeneralAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/DepreciationDepletion/ManagementAndGeneral'
V_EXP_DEPREC_MGMT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_DEPREC_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_DEPREC_MGMT ) )
if( length( F9_09_EXP_DEPREC_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_DEPREC_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_DEPREC_MGMT <-  paste0( '{', F9_09_EXP_DEPREC_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_DEPREC_PROG
## DESCRIPTION:  Depreciation, depletion, and amortization
## LOCATION:  F990-PC-PART-09-LINE-22-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DepreciationDepletion/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/DepreciationDepletionEtc/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/DepreciationDepletionGrp/ProgramServicesAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/DepreciationDepletion/ProgramServices'
V_EXP_DEPREC_PROG <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_DEPREC_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_DEPREC_PROG ) )
if( length( F9_09_EXP_DEPREC_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_DEPREC_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_DEPREC_PROG <-  paste0( '{', F9_09_EXP_DEPREC_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_DEPREC_TOT
## DESCRIPTION:  Depreciation, depletion, and amortization
## LOCATION:  F990-PC-PART-09-LINE-22-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/DepreciationDepletion/Total'
V2 <- '//Return/ReturnData/IRS990/DepreciationDepletionEtc/Total'
V3 <- '//Return/ReturnData/IRS990/DepreciationDepletionGrp/TotalAmt'
V4 <- '//Return/ReturnData/IRS990/Form990PartIX/DepreciationDepletion/Total'
V_EXP_DEPREC_TOT <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_DEPREC_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_DEPREC_TOT ) )
if( length( F9_09_EXP_DEPREC_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_DEPREC_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_DEPREC_TOT <-  paste0( '{', F9_09_EXP_DEPREC_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_INVEST_FUNDR
## DESCRIPTION:  Investment Management Fees - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11F-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesInvstMgmntFees/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForSrvcInvstMgmntFeesGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesInvstMgmntFees/Fundraising'
V_EXP_FEE_SVC_INVEST_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_INVEST_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_INVEST_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_INVEST_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_INVEST_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_INVEST_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_INVEST_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_INVEST_MGMT
## DESCRIPTION:  Investment Management Fees -admin
## LOCATION:  F990-PC-PART-09-LINE-11F-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesInvstMgmntFees/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/FeesForSrvcInvstMgmntFeesGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesInvstMgmntFees/ManagementAndGeneral'
V_EXP_FEE_SVC_INVEST_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_INVEST_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_INVEST_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_INVEST_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_INVEST_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_INVEST_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_INVEST_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_INVEST_PROG
## DESCRIPTION:  Investment Management Fees - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-11F-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesInvstMgmntFees/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/FeesForSrvcInvstMgmntFeesGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesInvstMgmntFees/ProgramServices'
V_EXP_FEE_SVC_INVEST_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_INVEST_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_INVEST_PROG ) )
if( length( F9_09_EXP_FEE_SVC_INVEST_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_INVEST_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_INVEST_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_INVEST_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_INVEST_TOT
## DESCRIPTION:  Investment Management Fees - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11F-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesInvstMgmntFees/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForSrvcInvstMgmntFeesGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesInvstMgmntFees/Total'
V_EXP_FEE_SVC_INVEST_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_INVEST_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_INVEST_TOT ) )
if( length( F9_09_EXP_FEE_SVC_INVEST_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_INVEST_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_INVEST_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_INVEST_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LEGAL_FUNDR
## DESCRIPTION:  Fees for Services - Legal - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11B-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLegal/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLegalGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLegal/Fundraising'
V4 <- '//Return/ReturnData/IRS990/LegalFees/Fundraising'
V_EXP_FEE_SVC_LEGAL_FUNDR <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_FEE_SVC_LEGAL_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_LEGAL_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LEGAL_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LEGAL_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_LEGAL_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LEGAL_MGMT
## DESCRIPTION:  Fees for Services - Legal - Management and General
## LOCATION:  F990-PC-PART-09-LINE-11B-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLegal/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLegalGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLegal/ManagementAndGeneral'
V_EXP_FEE_SVC_LEGAL_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_LEGAL_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_LEGAL_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LEGAL_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LEGAL_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_LEGAL_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LEGAL_PROG
## DESCRIPTION:  Fees for Services - Legal - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-11B-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLegal/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLegalGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLegal/ProgramServices'
V4 <- '//Return/ReturnData/IRS990/LegalFees/ProgramServices'
V_EXP_FEE_SVC_LEGAL_PROG <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_FEE_SVC_LEGAL_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_PROG ) )
if( length( F9_09_EXP_FEE_SVC_LEGAL_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LEGAL_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LEGAL_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_LEGAL_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LEGAL_TOT
## DESCRIPTION:  Fees for Services - Legal - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11B-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLegal/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLegalGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLegal/Total'
V_EXP_FEE_SVC_LEGAL_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_LEGAL_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_TOT ) )
if( length( F9_09_EXP_FEE_SVC_LEGAL_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LEGAL_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LEGAL_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_LEGAL_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LOB_FUNDR
## DESCRIPTION:  Fees for Services - Lobbying - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11D-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLobbying/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLobbyingGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLobbying/Fundraising'
V_EXP_FEE_SVC_LOB_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_LOB_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LOB_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_LOB_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LOB_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LOB_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_LOB_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LOB_MGMT
## DESCRIPTION:  Fees for Services - Lobbying - Management and General
## LOCATION:  F990-PC-PART-09-LINE-11D-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLobbying/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLobbyingGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLobbying/ManagementAndGeneral'
V_EXP_FEE_SVC_LOB_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_LOB_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LOB_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_LOB_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LOB_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LOB_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_LOB_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LOB_PROG
## DESCRIPTION:  Fees for Services - Lobbying - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-11D-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLobbying/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLobbyingGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLobbying/ProgramServices'
V_EXP_FEE_SVC_LOB_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_LOB_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LOB_PROG ) )
if( length( F9_09_EXP_FEE_SVC_LOB_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LOB_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LOB_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_LOB_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_LOB_TOT
## DESCRIPTION:  Fees for Services - Lobbying - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11D-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesLobbying/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesLobbyingGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesLobbying/Total'
V_EXP_FEE_SVC_LOB_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_LOB_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_LOB_TOT ) )
if( length( F9_09_EXP_FEE_SVC_LOB_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_LOB_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_LOB_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_LOB_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_MGMT_FUNDR
## DESCRIPTION:  Fees for Services - Management - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11A-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesManagement/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesManagementGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesManagement/Fundraising'
V_EXP_FEE_SVC_MGMT_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_MGMT_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_MGMT_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_MGMT_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_MGMT_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_MGMT_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_MGMT_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_MGMT_MGMT
## DESCRIPTION:  Fees for Services - Management - Management and General
## LOCATION:  F990-PC-PART-09-LINE-11A-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesManagement/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesManagementGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesManagement/ManagementAndGeneral'
V_EXP_FEE_SVC_MGMT_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_MGMT_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_MGMT_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_MGMT_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_MGMT_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_MGMT_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_MGMT_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_MGMT_PROG
## DESCRIPTION:  Fees for Services - Management - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-11A-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesManagement/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesManagementGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesManagement/ProgramServices'
V_EXP_FEE_SVC_MGMT_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_MGMT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_MGMT_PROG ) )
if( length( F9_09_EXP_FEE_SVC_MGMT_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_MGMT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_MGMT_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_MGMT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_MGMT_TOT
## DESCRIPTION:  Fees for Services - Management - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11A-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesManagement/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesManagementGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesManagement/Total'
V_EXP_FEE_SVC_MGMT_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_MGMT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_MGMT_TOT ) )
if( length( F9_09_EXP_FEE_SVC_MGMT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_MGMT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_MGMT_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_MGMT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_OTH_FUNDR
## DESCRIPTION:  Fees for Services - Other - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11G-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesOther/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesOtherGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesOther/Fundraising'
V_EXP_FEE_SVC_OTH_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_OTH_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_OTH_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_OTH_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_OTH_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_OTH_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_OTH_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_OTH_MGMT
## DESCRIPTION:  Fees for Services - Other - Management and General
## LOCATION:  F990-PC-PART-09-LINE-11G-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesOther/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesOtherGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesOther/ManagementAndGeneral'
V_EXP_FEE_SVC_OTH_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_OTH_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_OTH_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_OTH_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_OTH_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_OTH_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_OTH_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_OTH_PROG
## DESCRIPTION:  Fees for Services - Other - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-11G-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesOther/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesOtherGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesOther/ProgramServices'
V_EXP_FEE_SVC_OTH_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_OTH_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_OTH_PROG ) )
if( length( F9_09_EXP_FEE_SVC_OTH_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_OTH_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_OTH_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_OTH_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_OTH_TOT
## DESCRIPTION:  Fees for Services - Other - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11G-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesOther/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesOtherGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesOther/Total'
V_EXP_FEE_SVC_OTH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_OTH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_OTH_TOT ) )
if( length( F9_09_EXP_FEE_SVC_OTH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_OTH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_OTH_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_OTH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_FUNDR_FUNDR
## DESCRIPTION:  Fees for Professional Fundraising Services - Fundraising Expenses
## LOCATION:  F990-PC-PART-09-LINE-11E-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/Fundraising'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesProfFundraising/Fundraising'
V_EXP_FEE_SVC_FUNDR_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_FUNDR_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_FUNDR ) )
if( length( F9_09_EXP_FEE_SVC_FUNDR_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_FUNDR_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_FUNDR_FUNDR <-  paste0( '{', F9_09_EXP_FEE_SVC_FUNDR_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_FUNDR_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-11E-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesProfFundraising/ManagementAndGeneral'
V_EXP_FEE_SVC_FUNDR_MGMT <- paste( V1, V2 , sep='|' )
F9_09_EXP_FEE_SVC_FUNDR_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_MGMT ) )
if( length( F9_09_EXP_FEE_SVC_FUNDR_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_FUNDR_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_FUNDR_MGMT <-  paste0( '{', F9_09_EXP_FEE_SVC_FUNDR_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_FUNDR_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-11E-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesProfFundraising/ProgramServices'
V_EXP_FEE_SVC_FUNDR_PROG <- paste( V1, V2 , sep='|' )
F9_09_EXP_FEE_SVC_FUNDR_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_PROG ) )
if( length( F9_09_EXP_FEE_SVC_FUNDR_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_FUNDR_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_FUNDR_PROG <-  paste0( '{', F9_09_EXP_FEE_SVC_FUNDR_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_FUNDR_TOT
## DESCRIPTION:  Fees for Professional Fundraising Services - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-11E-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/Total'
V2 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesProfFundraising/Total'
V_EXP_FEE_SVC_FUNDR_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_FEE_SVC_FUNDR_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_TOT ) )
if( length( F9_09_EXP_FEE_SVC_FUNDR_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_FEE_SVC_FUNDR_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_FEE_SVC_FUNDR_TOT <-  paste0( '{', F9_09_EXP_FEE_SVC_FUNDR_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_GRANT_FRGN_PROG
## DESCRIPTION:  total Grants to Foreign Orgs and Governments - Program Service Expenses
## LOCATION:  F990-PC-PART-09-LINE-03-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ForeignGrants/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/ForeignGrantsGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/ForeignGrants/ProgramServices'
V_EXP_GRANT_FRGN_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_GRANT_FRGN_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRANT_FRGN_PROG ) )
if( length( F9_09_EXP_GRANT_FRGN_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_GRANT_FRGN_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_GRANT_FRGN_PROG <-  paste0( '{', F9_09_EXP_GRANT_FRGN_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_GRANT_FRGN_TOT
## DESCRIPTION:  total Grants to Foreign Orgs and Governments - Total Expense
## LOCATION:  F990-PC-PART-09-LINE-03-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/ForeignGrants/Total'
V2 <- '//Return/ReturnData/IRS990/ForeignGrantsGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/Form990PartIX/ForeignGrants/Total'
V_EXP_GRANT_FRGN_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_GRANT_FRGN_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRANT_FRGN_TOT ) )
if( length( F9_09_EXP_GRANT_FRGN_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_GRANT_FRGN_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_GRANT_FRGN_TOT <-  paste0( '{', F9_09_EXP_GRANT_FRGN_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_GRANT_US_INDIV_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-02-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/GrantsToDomesticIndividuals/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/GrantsToDomesticIndividuals/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/GrantsToDomesticIndividualsGrp/ProgramServicesAmt'
V_EXP_GRANT_US_INDIV_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_GRANT_US_INDIV_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRANT_US_INDIV_PROG ) )
if( length( F9_09_EXP_GRANT_US_INDIV_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_GRANT_US_INDIV_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_GRANT_US_INDIV_PROG <-  paste0( '{', F9_09_EXP_GRANT_US_INDIV_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_GRANT_US_INDIV_TOT
## DESCRIPTION:  Grants To Domestic Individuals - Total
## LOCATION:  F990-PC-PART-09-LINE-02-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/GrantsToDomesticIndividuals/Total'
V2 <- '//Return/ReturnData/IRS990/GrantsToDomesticIndividuals/Total'
V3 <- '//Return/ReturnData/IRS990/GrantsToDomesticIndividualsGrp/TotalAmt'
V_EXP_GRANT_US_INDIV_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_GRANT_US_INDIV_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRANT_US_INDIV_TOT ) )
if( length( F9_09_EXP_GRANT_US_INDIV_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_GRANT_US_INDIV_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_GRANT_US_INDIV_TOT <-  paste0( '{', F9_09_EXP_GRANT_US_INDIV_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_GRANT_US_ORG_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-01-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/GrantsToDomesticOrgs/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/GrantsToDomesticOrgs/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/GrantsToDomesticOrgsGrp/ProgramServicesAmt'
V_EXP_GRANT_US_ORG_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_GRANT_US_ORG_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRANT_US_ORG_PROG ) )
if( length( F9_09_EXP_GRANT_US_ORG_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_GRANT_US_ORG_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_GRANT_US_ORG_PROG <-  paste0( '{', F9_09_EXP_GRANT_US_ORG_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_GRANT_US_ORG_TOT
## DESCRIPTION:  Grants To Domestic Orgs - Total
## LOCATION:  F990-PC-PART-09-LINE-01-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/GrantsToDomesticOrgs/Total'
V2 <- '//Return/ReturnData/IRS990/GrantsToDomesticOrgs/Total'
V3 <- '//Return/ReturnData/IRS990/GrantsToDomesticOrgsGrp/TotalAmt'
V_EXP_GRANT_US_ORG_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_GRANT_US_ORG_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_GRANT_US_ORG_TOT ) )
if( length( F9_09_EXP_GRANT_US_ORG_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_GRANT_US_ORG_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_GRANT_US_ORG_TOT <-  paste0( '{', F9_09_EXP_GRANT_US_ORG_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INFO_TECH_FUNDR
## DESCRIPTION:  Information Technology - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-14-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/InformationTechnology/Fundraising'
V2 <- '//Return/ReturnData/IRS990/InformationTechnology/Fundraising'
V3 <- '//Return/ReturnData/IRS990/InformationTechnologyGrp/FundraisingAmt'
V_EXP_INFO_TECH_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INFO_TECH_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INFO_TECH_FUNDR ) )
if( length( F9_09_EXP_INFO_TECH_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INFO_TECH_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INFO_TECH_FUNDR <-  paste0( '{', F9_09_EXP_INFO_TECH_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INFO_TECH_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-14-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/InformationTechnology/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/InformationTechnology/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/InformationTechnologyGrp/ManagementAndGeneralAmt'
V_EXP_INFO_TECH_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INFO_TECH_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INFO_TECH_MGMT ) )
if( length( F9_09_EXP_INFO_TECH_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INFO_TECH_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INFO_TECH_MGMT <-  paste0( '{', F9_09_EXP_INFO_TECH_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INFO_TECH_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-14-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/InformationTechnology/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/InformationTechnology/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/InformationTechnologyGrp/ProgramServicesAmt'
V_EXP_INFO_TECH_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INFO_TECH_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INFO_TECH_PROG ) )
if( length( F9_09_EXP_INFO_TECH_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INFO_TECH_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INFO_TECH_PROG <-  paste0( '{', F9_09_EXP_INFO_TECH_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INFO_TECH_TOT
## DESCRIPTION:  Information Technology - Total
## LOCATION:  F990-PC-PART-09-LINE-14-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/InformationTechnology/Total'
V2 <- '//Return/ReturnData/IRS990/InformationTechnology/Total'
V3 <- '//Return/ReturnData/IRS990/InformationTechnologyGrp/TotalAmt'
V_EXP_INFO_TECH_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INFO_TECH_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INFO_TECH_TOT ) )
if( length( F9_09_EXP_INFO_TECH_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INFO_TECH_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INFO_TECH_TOT <-  paste0( '{', F9_09_EXP_INFO_TECH_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INSURANCE_FUNDR
## DESCRIPTION:  Insurance - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-23-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Insurance/Fundraising'
V2 <- '//Return/ReturnData/IRS990/Insurance/Fundraising'
V3 <- '//Return/ReturnData/IRS990/InsuranceGrp/FundraisingAmt'
V_EXP_INSURANCE_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INSURANCE_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INSURANCE_FUNDR ) )
if( length( F9_09_EXP_INSURANCE_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INSURANCE_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INSURANCE_FUNDR <-  paste0( '{', F9_09_EXP_INSURANCE_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INSURANCE_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-23-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Insurance/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Insurance/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/InsuranceGrp/ManagementAndGeneralAmt'
V_EXP_INSURANCE_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INSURANCE_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INSURANCE_MGMT ) )
if( length( F9_09_EXP_INSURANCE_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INSURANCE_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INSURANCE_MGMT <-  paste0( '{', F9_09_EXP_INSURANCE_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INSURANCE_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-23-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Insurance/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Insurance/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/InsuranceGrp/ProgramServicesAmt'
V_EXP_INSURANCE_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INSURANCE_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INSURANCE_PROG ) )
if( length( F9_09_EXP_INSURANCE_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INSURANCE_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INSURANCE_PROG <-  paste0( '{', F9_09_EXP_INSURANCE_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INSURANCE_TOT
## DESCRIPTION:  Insurance - Total
## LOCATION:  F990-PC-PART-09-LINE-23-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Insurance/Total'
V2 <- '//Return/ReturnData/IRS990/Insurance/Total'
V3 <- '//Return/ReturnData/IRS990/InsuranceGrp/TotalAmt'
V_EXP_INSURANCE_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INSURANCE_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INSURANCE_TOT ) )
if( length( F9_09_EXP_INSURANCE_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INSURANCE_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INSURANCE_TOT <-  paste0( '{', F9_09_EXP_INSURANCE_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INT_FUNDR
## DESCRIPTION:  Interest - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-20-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Interest/Fundraising'
V2 <- '//Return/ReturnData/IRS990/Interest/Fundraising'
V3 <- '//Return/ReturnData/IRS990/InterestGrp/FundraisingAmt'
V_EXP_INT_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INT_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INT_FUNDR ) )
if( length( F9_09_EXP_INT_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INT_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INT_FUNDR <-  paste0( '{', F9_09_EXP_INT_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INT_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-20-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Interest/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Interest/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/InterestGrp/ManagementAndGeneralAmt'
V_EXP_INT_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INT_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INT_MGMT ) )
if( length( F9_09_EXP_INT_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INT_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INT_MGMT <-  paste0( '{', F9_09_EXP_INT_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INT_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-20-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Interest/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Interest/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/InterestGrp/ProgramServicesAmt'
V_EXP_INT_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INT_PROG ) )
if( length( F9_09_EXP_INT_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INT_PROG <-  paste0( '{', F9_09_EXP_INT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_INT_TOT
## DESCRIPTION:  Interest - Total
## LOCATION:  F990-PC-PART-09-LINE-20-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Interest/Total'
V2 <- '//Return/ReturnData/IRS990/Interest/Total'
V3 <- '//Return/ReturnData/IRS990/InterestGrp/TotalAmt'
V_EXP_INT_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_INT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_INT_TOT ) )
if( length( F9_09_EXP_INT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_INT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_INT_TOT <-  paste0( '{', F9_09_EXP_INT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_JOINT_COST_X
## DESCRIPTION:  Form990 Part IX - Joint costs?
## LOCATION:  F990-PC-PART-09-LINE-26
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/JointCosts'
V2 <- '//Return/ReturnData/IRS990/JointCosts'
V3 <- '//Return/ReturnData/IRS990/JointCostsInd'
V_EXP_JOINT_COST_X <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_JOINT_COST_X <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_JOINT_COST_X ) )
if( length( F9_09_EXP_JOINT_COST_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_JOINT_COST_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_JOINT_COST_X <-  paste0( '{', F9_09_EXP_JOINT_COST_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OCCUPANCY_FUNDR
## DESCRIPTION:  Occupancy - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-16-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Occupancy/Fundraising'
V2 <- '//Return/ReturnData/IRS990/Occupancy/Fundraising'
V3 <- '//Return/ReturnData/IRS990/OccupancyGrp/FundraisingAmt'
V_EXP_OCCUPANCY_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OCCUPANCY_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OCCUPANCY_FUNDR ) )
if( length( F9_09_EXP_OCCUPANCY_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OCCUPANCY_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OCCUPANCY_FUNDR <-  paste0( '{', F9_09_EXP_OCCUPANCY_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OCCUPANCY_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-16-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Occupancy/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Occupancy/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/OccupancyGrp/ManagementAndGeneralAmt'
V_EXP_OCCUPANCY_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OCCUPANCY_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OCCUPANCY_MGMT ) )
if( length( F9_09_EXP_OCCUPANCY_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OCCUPANCY_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OCCUPANCY_MGMT <-  paste0( '{', F9_09_EXP_OCCUPANCY_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OCCUPANCY_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-16-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Occupancy/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Occupancy/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/OccupancyGrp/ProgramServicesAmt'
V_EXP_OCCUPANCY_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OCCUPANCY_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OCCUPANCY_PROG ) )
if( length( F9_09_EXP_OCCUPANCY_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OCCUPANCY_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OCCUPANCY_PROG <-  paste0( '{', F9_09_EXP_OCCUPANCY_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OCCUPANCY_TOT
## DESCRIPTION:  Occupancy - Total
## LOCATION:  F990-PC-PART-09-LINE-16-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Occupancy/Total'
V2 <- '//Return/ReturnData/IRS990/Occupancy/Total'
V3 <- '//Return/ReturnData/IRS990/OccupancyGrp/TotalAmt'
V4 <- '//Return/ReturnData/IRS990EZ/OccupancyRentUtilitiesAndMaint'
V5 <- '//Return/ReturnData/IRS990EZ/OccupancyRentUtltsAndMaintAmt'
V_EXP_OCCUPANCY_TOT <- paste( V1, V2, V3, V4, V5 , sep='|' )
F9_09_EXP_OCCUPANCY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OCCUPANCY_TOT ) )
if( length( F9_09_EXP_OCCUPANCY_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OCCUPANCY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OCCUPANCY_TOT <-  paste0( '{', F9_09_EXP_OCCUPANCY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OFFICE_FUNDR
## DESCRIPTION:  Office Expenses - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-13-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OfficeExpenses/Fundraising'
V2 <- '//Return/ReturnData/IRS990/OfficeExpenses/Fundraising'
V3 <- '//Return/ReturnData/IRS990/OfficeExpensesGrp/FundraisingAmt'
V_EXP_OFFICE_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OFFICE_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OFFICE_FUNDR ) )
if( length( F9_09_EXP_OFFICE_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OFFICE_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OFFICE_FUNDR <-  paste0( '{', F9_09_EXP_OFFICE_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OFFICE_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-13-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OfficeExpenses/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/OfficeExpenses/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/OfficeExpensesGrp/ManagementAndGeneralAmt'
V_EXP_OFFICE_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OFFICE_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OFFICE_MGMT ) )
if( length( F9_09_EXP_OFFICE_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OFFICE_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OFFICE_MGMT <-  paste0( '{', F9_09_EXP_OFFICE_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OFFICE_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-13-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OfficeExpenses/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/OfficeExpenses/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/OfficeExpensesGrp/ProgramServicesAmt'
V4 <- '//Return/ReturnData/IRS990/Supplies/ProgramServices'
V_EXP_OFFICE_PROG <- paste( V1, V2, V3, V4 , sep='|' )
F9_09_EXP_OFFICE_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OFFICE_PROG ) )
if( length( F9_09_EXP_OFFICE_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OFFICE_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OFFICE_PROG <-  paste0( '{', F9_09_EXP_OFFICE_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OFFICE_TOT
## DESCRIPTION:  Office Expenses - Total
## LOCATION:  F990-PC-PART-09-LINE-13-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OfficeExpenses/Total'
V2 <- '//Return/ReturnData/IRS990/OfficeExpenses/Total'
V3 <- '//Return/ReturnData/IRS990/OfficeExpensesGrp/TotalAmt'
V_EXP_OFFICE_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OFFICE_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OFFICE_TOT ) )
if( length( F9_09_EXP_OFFICE_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OFFICE_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OFFICE_TOT <-  paste0( '{', F9_09_EXP_OFFICE_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_EMPL_BEN_FUNDR
## DESCRIPTION:  Other Employee Benefits - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-09-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherEmployeeBenefits/Fundraising'
V2 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefits/Fundraising'
V3 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefitsGrp/FundraisingAmt'
V_EXP_OTH_EMPL_BEN_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_EMPL_BEN_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_EMPL_BEN_FUNDR ) )
if( length( F9_09_EXP_OTH_EMPL_BEN_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_EMPL_BEN_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_EMPL_BEN_FUNDR <-  paste0( '{', F9_09_EXP_OTH_EMPL_BEN_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_EMPL_BEN_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-09-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherEmployeeBenefits/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefits/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefitsGrp/ManagementAndGeneralAmt'
V_EXP_OTH_EMPL_BEN_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_EMPL_BEN_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_EMPL_BEN_MGMT ) )
if( length( F9_09_EXP_OTH_EMPL_BEN_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_EMPL_BEN_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_EMPL_BEN_MGMT <-  paste0( '{', F9_09_EXP_OTH_EMPL_BEN_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_EMPL_BEN_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-09-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherEmployeeBenefits/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefits/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefitsGrp/ProgramServicesAmt'
V_EXP_OTH_EMPL_BEN_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_EMPL_BEN_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_EMPL_BEN_PROG ) )
if( length( F9_09_EXP_OTH_EMPL_BEN_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_EMPL_BEN_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_EMPL_BEN_PROG <-  paste0( '{', F9_09_EXP_OTH_EMPL_BEN_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_EMPL_BEN_TOT
## DESCRIPTION:  Other Employee Benefits - Total
## LOCATION:  F990-PC-PART-09-LINE-09-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherEmployeeBenefits/Total'
V2 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefits/Total'
V3 <- '//Return/ReturnData/IRS990/OtherEmployeeBenefitsGrp/TotalAmt'
V_EXP_OTH_EMPL_BEN_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_EMPL_BEN_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_EMPL_BEN_TOT ) )
if( length( F9_09_EXP_OTH_EMPL_BEN_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_EMPL_BEN_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_EMPL_BEN_TOT <-  paste0( '{', F9_09_EXP_OTH_EMPL_BEN_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_SAL_WAGE_FUNDR
## DESCRIPTION:  Other Salaries And Wages - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-07-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherSalariesAndWages/Fundraising'
V2 <- '//Return/ReturnData/IRS990/OtherSalariesAndWages/Fundraising'
V3 <- '//Return/ReturnData/IRS990/OtherSalariesAndWagesGrp/FundraisingAmt'
V_EXP_OTH_SAL_WAGE_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_SAL_WAGE_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_SAL_WAGE_FUNDR ) )
if( length( F9_09_EXP_OTH_SAL_WAGE_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_SAL_WAGE_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_SAL_WAGE_FUNDR <-  paste0( '{', F9_09_EXP_OTH_SAL_WAGE_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_SAL_WAGE_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-07-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherSalariesAndWages/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/OtherSalariesAndWages/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/OtherSalariesAndWagesGrp/ManagementAndGeneralAmt'
V_EXP_OTH_SAL_WAGE_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_SAL_WAGE_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_SAL_WAGE_MGMT ) )
if( length( F9_09_EXP_OTH_SAL_WAGE_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_SAL_WAGE_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_SAL_WAGE_MGMT <-  paste0( '{', F9_09_EXP_OTH_SAL_WAGE_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_SAL_WAGE_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-07-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherSalariesAndWages/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/OtherSalariesAndWages/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/OtherSalariesAndWagesGrp/ProgramServicesAmt'
V_EXP_OTH_SAL_WAGE_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_SAL_WAGE_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_SAL_WAGE_PROG ) )
if( length( F9_09_EXP_OTH_SAL_WAGE_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_SAL_WAGE_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_SAL_WAGE_PROG <-  paste0( '{', F9_09_EXP_OTH_SAL_WAGE_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OTH_SAL_WAGE_TOT
## DESCRIPTION:  Other Salaries And Wages - Total
## LOCATION:  F990-PC-PART-09-LINE-07-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/OtherSalariesAndWages/Total'
V2 <- '//Return/ReturnData/IRS990/OtherSalariesAndWages/Total'
V3 <- '//Return/ReturnData/IRS990/OtherSalariesAndWagesGrp/TotalAmt'
V_EXP_OTH_SAL_WAGE_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_OTH_SAL_WAGE_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OTH_SAL_WAGE_TOT ) )
if( length( F9_09_EXP_OTH_SAL_WAGE_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OTH_SAL_WAGE_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OTH_SAL_WAGE_TOT <-  paste0( '{', F9_09_EXP_OTH_SAL_WAGE_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAY_AFFIL_FUNDR
## DESCRIPTION:  Payments To Affiliates - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-21-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PaymentsToAffiliates/Fundraising'
V2 <- '//Return/ReturnData/IRS990/PaymentsToAffiliates/Fundraising'
V3 <- '//Return/ReturnData/IRS990/PaymentsToAffiliatesGrp/FundraisingAmt'
V_EXP_PAY_AFFIL_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAY_AFFIL_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAY_AFFIL_FUNDR ) )
if( length( F9_09_EXP_PAY_AFFIL_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAY_AFFIL_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAY_AFFIL_FUNDR <-  paste0( '{', F9_09_EXP_PAY_AFFIL_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAY_AFFIL_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-21-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PaymentsToAffiliates/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/PaymentsToAffiliates/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/PaymentsToAffiliatesGrp/ManagementAndGeneralAmt'
V_EXP_PAY_AFFIL_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAY_AFFIL_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAY_AFFIL_MGMT ) )
if( length( F9_09_EXP_PAY_AFFIL_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAY_AFFIL_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAY_AFFIL_MGMT <-  paste0( '{', F9_09_EXP_PAY_AFFIL_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAY_AFFIL_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-21-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PaymentsToAffiliates/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/PaymentsToAffiliates/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/PaymentsToAffiliatesGrp/ProgramServicesAmt'
V_EXP_PAY_AFFIL_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAY_AFFIL_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAY_AFFIL_PROG ) )
if( length( F9_09_EXP_PAY_AFFIL_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAY_AFFIL_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAY_AFFIL_PROG <-  paste0( '{', F9_09_EXP_PAY_AFFIL_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAY_AFFIL_TOT
## DESCRIPTION:  Payments To Affiliates - Total
## LOCATION:  F990-PC-PART-09-LINE-21-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PaymentsToAffiliates/Total'
V2 <- '//Return/ReturnData/IRS990/PaymentsToAffiliates/Total'
V3 <- '//Return/ReturnData/IRS990/PaymentsToAffiliatesGrp/TotalAmt'
V_EXP_PAY_AFFIL_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAY_AFFIL_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAY_AFFIL_TOT ) )
if( length( F9_09_EXP_PAY_AFFIL_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAY_AFFIL_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAY_AFFIL_TOT <-  paste0( '{', F9_09_EXP_PAY_AFFIL_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAYROLL_TAX_FUNDR
## DESCRIPTION:  Payroll Taxes - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-10-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PayrollTaxes/Fundraising'
V2 <- '//Return/ReturnData/IRS990/PayrollTaxes/Fundraising'
V3 <- '//Return/ReturnData/IRS990/PayrollTaxesGrp/FundraisingAmt'
V_EXP_PAYROLL_TAX_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAYROLL_TAX_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAYROLL_TAX_FUNDR ) )
if( length( F9_09_EXP_PAYROLL_TAX_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAYROLL_TAX_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAYROLL_TAX_FUNDR <-  paste0( '{', F9_09_EXP_PAYROLL_TAX_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAYROLL_TAX_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-10-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PayrollTaxes/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/PayrollTaxes/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/PayrollTaxesGrp/ManagementAndGeneralAmt'
V_EXP_PAYROLL_TAX_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAYROLL_TAX_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAYROLL_TAX_MGMT ) )
if( length( F9_09_EXP_PAYROLL_TAX_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAYROLL_TAX_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAYROLL_TAX_MGMT <-  paste0( '{', F9_09_EXP_PAYROLL_TAX_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAYROLL_TAX_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-10-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PayrollTaxes/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/PayrollTaxes/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/PayrollTaxesGrp/ProgramServicesAmt'
V_EXP_PAYROLL_TAX_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAYROLL_TAX_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAYROLL_TAX_PROG ) )
if( length( F9_09_EXP_PAYROLL_TAX_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAYROLL_TAX_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAYROLL_TAX_PROG <-  paste0( '{', F9_09_EXP_PAYROLL_TAX_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PAYROLL_TAX_TOT
## DESCRIPTION:  Payroll Taxes - Total
## LOCATION:  F990-PC-PART-09-LINE-10-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PayrollTaxes/Total'
V2 <- '//Return/ReturnData/IRS990/PayrollTaxes/Total'
V3 <- '//Return/ReturnData/IRS990/PayrollTaxesGrp/TotalAmt'
V_EXP_PAYROLL_TAX_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PAYROLL_TAX_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PAYROLL_TAX_TOT ) )
if( length( F9_09_EXP_PAYROLL_TAX_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PAYROLL_TAX_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PAYROLL_TAX_TOT <-  paste0( '{', F9_09_EXP_PAYROLL_TAX_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PENSION_CONTR_FUNDR
## DESCRIPTION:  Pension Plan Contributions - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-08-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PensionPlanContributions/Fundraising'
V2 <- '//Return/ReturnData/IRS990/PensionPlanContributions/Fundraising'
V3 <- '//Return/ReturnData/IRS990/PensionPlanContributionsGrp/FundraisingAmt'
V_EXP_PENSION_CONTR_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PENSION_CONTR_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PENSION_CONTR_FUNDR ) )
if( length( F9_09_EXP_PENSION_CONTR_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PENSION_CONTR_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PENSION_CONTR_FUNDR <-  paste0( '{', F9_09_EXP_PENSION_CONTR_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PENSION_CONTR_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-08-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PensionPlanContributions/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/PensionPlanContributions/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/PensionPlanContributionsGrp/ManagementAndGeneralAmt'
V_EXP_PENSION_CONTR_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PENSION_CONTR_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PENSION_CONTR_MGMT ) )
if( length( F9_09_EXP_PENSION_CONTR_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PENSION_CONTR_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PENSION_CONTR_MGMT <-  paste0( '{', F9_09_EXP_PENSION_CONTR_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PENSION_CONTR_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-08-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PensionPlanContributions/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/PensionPlanContributions/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/PensionPlanContributionsGrp/ProgramServicesAmt'
V_EXP_PENSION_CONTR_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PENSION_CONTR_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PENSION_CONTR_PROG ) )
if( length( F9_09_EXP_PENSION_CONTR_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PENSION_CONTR_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PENSION_CONTR_PROG <-  paste0( '{', F9_09_EXP_PENSION_CONTR_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_PENSION_CONTR_TOT
## DESCRIPTION:  Pension Plan Contributions - Total
## LOCATION:  F990-PC-PART-09-LINE-08-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/PensionPlanContributions/Total'
V2 <- '//Return/ReturnData/IRS990/PensionPlanContributions/Total'
V3 <- '//Return/ReturnData/IRS990/PensionPlanContributionsGrp/TotalAmt'
V_EXP_PENSION_CONTR_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_PENSION_CONTR_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_PENSION_CONTR_TOT ) )
if( length( F9_09_EXP_PENSION_CONTR_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_PENSION_CONTR_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_PENSION_CONTR_TOT <-  paste0( '{', F9_09_EXP_PENSION_CONTR_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_ROY_FUNDR
## DESCRIPTION:  Royalties - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-15-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Royalties/Fundraising'
V2 <- '//Return/ReturnData/IRS990/Royalties/Fundraising'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesGrp/FundraisingAmt'
V_EXP_ROY_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_ROY_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_ROY_FUNDR ) )
if( length( F9_09_EXP_ROY_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_ROY_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_ROY_FUNDR <-  paste0( '{', F9_09_EXP_ROY_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_ROY_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-15-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Royalties/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Royalties/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesGrp/ManagementAndGeneralAmt'
V_EXP_ROY_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_ROY_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_ROY_MGMT ) )
if( length( F9_09_EXP_ROY_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_ROY_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_ROY_MGMT <-  paste0( '{', F9_09_EXP_ROY_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_ROY_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-15-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Royalties/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Royalties/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesGrp/ProgramServicesAmt'
V_EXP_ROY_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_ROY_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_ROY_PROG ) )
if( length( F9_09_EXP_ROY_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_ROY_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_ROY_PROG <-  paste0( '{', F9_09_EXP_ROY_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_ROY_TOT
## DESCRIPTION:  Royalties - Total
## LOCATION:  F990-PC-PART-09-LINE-15-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Royalties/Total'
V2 <- '//Return/ReturnData/IRS990/Royalties/Total'
V3 <- '//Return/ReturnData/IRS990/RoyaltiesGrp/TotalAmt'
V_EXP_ROY_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_ROY_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_ROY_TOT ) )
if( length( F9_09_EXP_ROY_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_ROY_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_ROY_TOT <-  paste0( '{', F9_09_EXP_ROY_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TOT_FUNDR
## DESCRIPTION:  Total Functional Expenses - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-25-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalFunctionalExpenses/Fundraising'
V2 <- '//Return/ReturnData/IRS990/TotalFunctionalExpenses/Fundraising'
V3 <- '//Return/ReturnData/IRS990/TotalFunctionalExpensesGrp/FundraisingAmt'
V_EXP_TOT_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TOT_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_FUNDR ) )
if( length( F9_09_EXP_TOT_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TOT_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TOT_FUNDR <-  paste0( '{', F9_09_EXP_TOT_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TOT_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-25-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalFunctionalExpenses/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/TotalFunctionalExpenses/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/TotalFunctionalExpensesGrp/ManagementAndGeneralAmt'
V_EXP_TOT_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TOT_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_MGMT ) )
if( length( F9_09_EXP_TOT_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TOT_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TOT_MGMT <-  paste0( '{', F9_09_EXP_TOT_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TOT_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-25-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalFunctionalExpenses/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/TotalFunctionalExpenses/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/TotalFunctionalExpensesGrp/ProgramServicesAmt'
V_EXP_TOT_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TOT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_PROG ) )
if( length( F9_09_EXP_TOT_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TOT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TOT_PROG <-  paste0( '{', F9_09_EXP_TOT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TOT_TOT
## DESCRIPTION:  Total Functional Expenses - Total
## LOCATION:  F990-PC-PART-09-LINE-25-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalFunctionalExpenses/Total'
V2 <- '//Return/ReturnData/IRS990/TotalFunctionalExpenses/Total'
V3 <- '//Return/ReturnData/IRS990/TotalFunctionalExpensesGrp/TotalAmt'
V_EXP_TOT_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TOT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TOT_TOT ) )
if( length( F9_09_EXP_TOT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TOT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TOT_TOT <-  paste0( '{', F9_09_EXP_TOT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_JOINT_COST_FUNDR
## DESCRIPTION:  Total Joint Costs - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-26-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalJointCosts/Fundraising'
V2 <- '//Return/ReturnData/IRS990/TotalJointCosts/Fundraising'
V3 <- '//Return/ReturnData/IRS990/TotalJointCostsGrp/FundraisingAmt'
V_EXP_JOINT_COST_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_JOINT_COST_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_JOINT_COST_FUNDR ) )
if( length( F9_09_EXP_JOINT_COST_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_JOINT_COST_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_JOINT_COST_FUNDR <-  paste0( '{', F9_09_EXP_JOINT_COST_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_JOINT_COST_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-26-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalJointCosts/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/TotalJointCosts/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/TotalJointCostsGrp/ManagementAndGeneralAmt'
V_EXP_JOINT_COST_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_JOINT_COST_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_JOINT_COST_MGMT ) )
if( length( F9_09_EXP_JOINT_COST_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_JOINT_COST_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_JOINT_COST_MGMT <-  paste0( '{', F9_09_EXP_JOINT_COST_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_JOINT_COST_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-26-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalJointCosts/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/TotalJointCosts/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/TotalJointCostsGrp/ProgramServicesAmt'
V_EXP_JOINT_COST_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_JOINT_COST_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_JOINT_COST_PROG ) )
if( length( F9_09_EXP_JOINT_COST_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_JOINT_COST_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_JOINT_COST_PROG <-  paste0( '{', F9_09_EXP_JOINT_COST_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_JOINT_COST_TOT
## DESCRIPTION:  Total Joint Costs - Total
## LOCATION:  F990-PC-PART-09-LINE-26-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TotalJointCosts/Total'
V2 <- '//Return/ReturnData/IRS990/TotalJointCosts/Total'
V3 <- '//Return/ReturnData/IRS990/TotalJointCostsGrp/TotalAmt'
V_EXP_JOINT_COST_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_JOINT_COST_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_JOINT_COST_TOT ) )
if( length( F9_09_EXP_JOINT_COST_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_JOINT_COST_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_JOINT_COST_TOT <-  paste0( '{', F9_09_EXP_JOINT_COST_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_FUNDR
## DESCRIPTION:  Travel - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-17-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Travel/Fundraising'
V2 <- '//Return/ReturnData/IRS990/Travel/Fundraising'
V3 <- '//Return/ReturnData/IRS990/TravelGrp/FundraisingAmt'
V_EXP_TRAVEL_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_FUNDR ) )
if( length( F9_09_EXP_TRAVEL_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_FUNDR <-  paste0( '{', F9_09_EXP_TRAVEL_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-17-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Travel/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Travel/ManagementAndGeneral'
V3 <- '//Return/ReturnData/IRS990/TravelGrp/ManagementAndGeneralAmt'
V_EXP_TRAVEL_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_MGMT ) )
if( length( F9_09_EXP_TRAVEL_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_MGMT <-  paste0( '{', F9_09_EXP_TRAVEL_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-17-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Travel/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Travel/ProgramServices'
V3 <- '//Return/ReturnData/IRS990/TravelGrp/ProgramServicesAmt'
V_EXP_TRAVEL_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_PROG ) )
if( length( F9_09_EXP_TRAVEL_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_PROG <-  paste0( '{', F9_09_EXP_TRAVEL_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_TOT
## DESCRIPTION:  Travel - Total
## LOCATION:  F990-PC-PART-09-LINE-17-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/Travel/Total'
V2 <- '//Return/ReturnData/IRS990/Travel/Total'
V3 <- '//Return/ReturnData/IRS990/TravelGrp/TotalAmt'
V_EXP_TRAVEL_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_TOT ) )
if( length( F9_09_EXP_TRAVEL_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_TOT <-  paste0( '{', F9_09_EXP_TRAVEL_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_ENTMT_FUNDR
## DESCRIPTION:  Travel Entrtnmnt Public Officials - Fundraising
## LOCATION:  F990-PC-PART-09-LINE-18-COL-D
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TravelEntrtnmntPublicOfficials/Fundraising'
V2 <- '//Return/ReturnData/IRS990/PymtTravelEntrtnmntPubOfclGrp/FundraisingAmt'
V3 <- '//Return/ReturnData/IRS990/TravelEntrtnmntPublicOfficials/Fundraising'
V_EXP_TRAVEL_ENTMT_FUNDR <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_ENTMT_FUNDR <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_ENTMT_FUNDR ) )
if( length( F9_09_EXP_TRAVEL_ENTMT_FUNDR ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_ENTMT_FUNDR, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_ENTMT_FUNDR <-  paste0( '{', F9_09_EXP_TRAVEL_ENTMT_FUNDR, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_ENTMT_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-18-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TravelEntrtnmntPublicOfficials/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/PymtTravelEntrtnmntPubOfclGrp/ManagementAndGeneralAmt'
V3 <- '//Return/ReturnData/IRS990/TravelEntrtnmntPublicOfficials/ManagementAndGeneral'
V_EXP_TRAVEL_ENTMT_MGMT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_ENTMT_MGMT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_ENTMT_MGMT ) )
if( length( F9_09_EXP_TRAVEL_ENTMT_MGMT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_ENTMT_MGMT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_ENTMT_MGMT <-  paste0( '{', F9_09_EXP_TRAVEL_ENTMT_MGMT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_ENTMT_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-18-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TravelEntrtnmntPublicOfficials/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/PymtTravelEntrtnmntPubOfclGrp/ProgramServicesAmt'
V3 <- '//Return/ReturnData/IRS990/TravelEntrtnmntPublicOfficials/ProgramServices'
V_EXP_TRAVEL_ENTMT_PROG <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_ENTMT_PROG <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_ENTMT_PROG ) )
if( length( F9_09_EXP_TRAVEL_ENTMT_PROG ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_ENTMT_PROG, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_ENTMT_PROG <-  paste0( '{', F9_09_EXP_TRAVEL_ENTMT_PROG, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_TRAVEL_ENTMT_TOT
## DESCRIPTION:  Travel Entrtnmnt Public Officials - Total
## LOCATION:  F990-PC-PART-09-LINE-18-COL-A
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/Form990PartIX/TravelEntrtnmntPublicOfficials/Total'
V2 <- '//Return/ReturnData/IRS990/PymtTravelEntrtnmntPubOfclGrp/TotalAmt'
V3 <- '//Return/ReturnData/IRS990/TravelEntrtnmntPublicOfficials/Total'
V_EXP_TRAVEL_ENTMT_TOT <- paste( V1, V2, V3 , sep='|' )
F9_09_EXP_TRAVEL_ENTMT_TOT <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_TRAVEL_ENTMT_TOT ) )
if( length( F9_09_EXP_TRAVEL_ENTMT_TOT ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_TRAVEL_ENTMT_TOT, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_TRAVEL_ENTMT_TOT <-  paste0( '{', F9_09_EXP_TRAVEL_ENTMT_TOT, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part IX
## LOCATION:  F990-PC-PART-09-LINE-00
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIX'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIXInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_09_INFO_SCHED_O_X <- xml2::xml_text( xml2::xml_find_all( doc, V_INFO_SCHED_O_X ) )
if( length( F9_09_INFO_SCHED_O_X ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_INFO_SCHED_O_X, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_INFO_SCHED_O_X <-  paste0( '{', F9_09_INFO_SCHED_O_X, '}', collapse=';' ) 
} 




## VARIABLE NAME:  F9_09_EXP_OFFICE_TOT_V2
## DESCRIPTION:  Printing; publications; postage; and shipping
## LOCATION:  F990-EZ-PART-01-LINE-15
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/PrintingPublicationsPostage'
V2 <- '//Return/ReturnData/IRS990EZ/PrintingPublicationsPostageAmt'
V_EXP_OFFICE_TOT_V2 <- paste( V1, V2 , sep='|' )
F9_09_EXP_OFFICE_TOT_V2 <- xml2::xml_text( xml2::xml_find_all( doc, V_EXP_OFFICE_TOT_V2 ) )
if( length( F9_09_EXP_OFFICE_TOT_V2 ) > 1 )
{ 
  log_collapsed_record( varname=F9_09_EXP_OFFICE_TOT_V2, ein=ORG_EIN, year=TAX_YEAR, url=URL )
  F9_09_EXP_OFFICE_TOT_V2 <-  paste0( '{', F9_09_EXP_OFFICE_TOT_V2, '}', collapse=';' ) 
} 




var.list <- 
namedList(F9_09_EXP_FEE_SVC_ACC_FUNDR,F9_09_EXP_FEE_SVC_ACC_MGMT,F9_09_EXP_FEE_SVC_ACC_PROG,F9_09_EXP_FEE_SVC_ACC_TOT,F9_09_EXP_AD_PROMO_FUNDR,F9_09_EXP_AD_PROMO_MGMT,F9_09_EXP_AD_PROMO_PROG,F9_09_EXP_AD_PROMO_TOT,F9_09_EXP_OTH_OTH_FUNDR,F9_09_EXP_OTH_OTH_MGMT,F9_09_EXP_OTH_OTH_PROG,F9_09_EXP_OTH_OTH_TOT,F9_09_EXP_BEN_PAID_MEMB_PROG,F9_09_EXP_BEN_PAID_MEMB_TOT,F9_09_EXP_COMP_DTK_FUNDR,F9_09_EXP_COMP_DTK_MGMT,F9_09_EXP_COMP_DTK_PROG,F9_09_EXP_COMP_DTK_TOT,F9_09_EXP_COMP_DSQ_PERS_FUNDR,F9_09_EXP_COMP_DSQ_PERS_MGMT,F9_09_EXP_COMP_DSQ_PERS_PROG,F9_09_EXP_COMP_DSQ_PERS_TOT,F9_09_EXP_CONF_MEETING_FUNDR,F9_09_EXP_CONF_MEETING_MGMT,F9_09_EXP_CONF_MEETING_PROG,F9_09_EXP_CONF_MEETING_TOT,F9_09_EXP_DEPREC_FUNDR,F9_09_EXP_DEPREC_MGMT,F9_09_EXP_DEPREC_PROG,F9_09_EXP_DEPREC_TOT,F9_09_EXP_FEE_SVC_INVEST_FUNDR,F9_09_EXP_FEE_SVC_INVEST_MGMT,F9_09_EXP_FEE_SVC_INVEST_PROG,F9_09_EXP_FEE_SVC_INVEST_TOT,F9_09_EXP_FEE_SVC_LEGAL_FUNDR,F9_09_EXP_FEE_SVC_LEGAL_MGMT,F9_09_EXP_FEE_SVC_LEGAL_PROG,F9_09_EXP_FEE_SVC_LEGAL_TOT,F9_09_EXP_FEE_SVC_LOB_FUNDR,F9_09_EXP_FEE_SVC_LOB_MGMT,F9_09_EXP_FEE_SVC_LOB_PROG,F9_09_EXP_FEE_SVC_LOB_TOT,F9_09_EXP_FEE_SVC_MGMT_FUNDR,F9_09_EXP_FEE_SVC_MGMT_MGMT,F9_09_EXP_FEE_SVC_MGMT_PROG,F9_09_EXP_FEE_SVC_MGMT_TOT,F9_09_EXP_FEE_SVC_OTH_FUNDR,F9_09_EXP_FEE_SVC_OTH_MGMT,F9_09_EXP_FEE_SVC_OTH_PROG,F9_09_EXP_FEE_SVC_OTH_TOT,F9_09_EXP_FEE_SVC_FUNDR_FUNDR,F9_09_EXP_FEE_SVC_FUNDR_MGMT,F9_09_EXP_FEE_SVC_FUNDR_PROG,F9_09_EXP_FEE_SVC_FUNDR_TOT,F9_09_EXP_GRANT_FRGN_PROG,F9_09_EXP_GRANT_FRGN_TOT,F9_09_EXP_GRANT_US_INDIV_PROG,F9_09_EXP_GRANT_US_INDIV_TOT,F9_09_EXP_GRANT_US_ORG_PROG,F9_09_EXP_GRANT_US_ORG_TOT,F9_09_EXP_INFO_TECH_FUNDR,F9_09_EXP_INFO_TECH_MGMT,F9_09_EXP_INFO_TECH_PROG,F9_09_EXP_INFO_TECH_TOT,F9_09_EXP_INSURANCE_FUNDR,F9_09_EXP_INSURANCE_MGMT,F9_09_EXP_INSURANCE_PROG,F9_09_EXP_INSURANCE_TOT,F9_09_EXP_INT_FUNDR,F9_09_EXP_INT_MGMT,F9_09_EXP_INT_PROG,F9_09_EXP_INT_TOT,F9_09_EXP_JOINT_COST_X,F9_09_EXP_OCCUPANCY_FUNDR,F9_09_EXP_OCCUPANCY_MGMT,F9_09_EXP_OCCUPANCY_PROG,F9_09_EXP_OCCUPANCY_TOT,F9_09_EXP_OFFICE_FUNDR,F9_09_EXP_OFFICE_MGMT,F9_09_EXP_OFFICE_PROG,F9_09_EXP_OFFICE_TOT,F9_09_EXP_OTH_EMPL_BEN_FUNDR,F9_09_EXP_OTH_EMPL_BEN_MGMT,F9_09_EXP_OTH_EMPL_BEN_PROG,F9_09_EXP_OTH_EMPL_BEN_TOT,F9_09_EXP_OTH_SAL_WAGE_FUNDR,F9_09_EXP_OTH_SAL_WAGE_MGMT,F9_09_EXP_OTH_SAL_WAGE_PROG,F9_09_EXP_OTH_SAL_WAGE_TOT,F9_09_EXP_PAY_AFFIL_FUNDR,F9_09_EXP_PAY_AFFIL_MGMT,F9_09_EXP_PAY_AFFIL_PROG,F9_09_EXP_PAY_AFFIL_TOT,F9_09_EXP_PAYROLL_TAX_FUNDR,F9_09_EXP_PAYROLL_TAX_MGMT,F9_09_EXP_PAYROLL_TAX_PROG,F9_09_EXP_PAYROLL_TAX_TOT,F9_09_EXP_PENSION_CONTR_FUNDR,F9_09_EXP_PENSION_CONTR_MGMT,F9_09_EXP_PENSION_CONTR_PROG,F9_09_EXP_PENSION_CONTR_TOT,F9_09_EXP_ROY_FUNDR,F9_09_EXP_ROY_MGMT,F9_09_EXP_ROY_PROG,F9_09_EXP_ROY_TOT,F9_09_EXP_TOT_FUNDR,F9_09_EXP_TOT_MGMT,F9_09_EXP_TOT_PROG,F9_09_EXP_TOT_TOT,F9_09_EXP_JOINT_COST_FUNDR,F9_09_EXP_JOINT_COST_MGMT,F9_09_EXP_JOINT_COST_PROG,F9_09_EXP_JOINT_COST_TOT,F9_09_EXP_TRAVEL_FUNDR,F9_09_EXP_TRAVEL_MGMT,F9_09_EXP_TRAVEL_PROG,F9_09_EXP_TRAVEL_TOT,F9_09_EXP_TRAVEL_ENTMT_FUNDR,F9_09_EXP_TRAVEL_ENTMT_MGMT,F9_09_EXP_TRAVEL_ENTMT_PROG,F9_09_EXP_TRAVEL_ENTMT_TOT,F9_09_INFO_SCHED_O_X,F9_09_EXP_OFFICE_TOT_V2)
if( sum(is.na(var.list)) == length(var.list)){return(NULL)}
df <- as.data.frame( c(keys,var.list) )


return( df )


}


