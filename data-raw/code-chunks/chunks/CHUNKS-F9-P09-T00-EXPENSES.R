#' @title 
#'   Build table F9-P09-T00-EXPENSES
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_F9_P09_T00_EXPENSES <- function( doc, url )
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


## VARIABLE NAME:  F9_09_INFO_SCHED_O_X
## DESCRIPTION:  Schedule O contains a response to a question in Part IX
## LOCATION:  F990-PC-PART-09-LINE-00
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIX'
V2 <- '//Return/ReturnData/IRS990/InfoInScheduleOPartIXInd'
V_INFO_SCHED_O_X <- paste( V1, V2 , sep='|' )
F9_09_INFO_SCHED_O_X <- xml_text( xml_find_all( doc, V_INFO_SCHED_O_X ) )




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
F9_09_EXP_GRANT_US_ORG_TOT <- xml_text( xml_find_all( doc, V_EXP_GRANT_US_ORG_TOT ) )




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
F9_09_EXP_GRANT_US_ORG_PROG <- xml_text( xml_find_all( doc, V_EXP_GRANT_US_ORG_PROG ) )




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
F9_09_EXP_GRANT_US_INDIV_TOT <- xml_text( xml_find_all( doc, V_EXP_GRANT_US_INDIV_TOT ) )




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
F9_09_EXP_GRANT_US_INDIV_PROG <- xml_text( xml_find_all( doc, V_EXP_GRANT_US_INDIV_PROG ) )




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
F9_09_EXP_GRANT_FRGN_TOT <- xml_text( xml_find_all( doc, V_EXP_GRANT_FRGN_TOT ) )




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
F9_09_EXP_GRANT_FRGN_PROG <- xml_text( xml_find_all( doc, V_EXP_GRANT_FRGN_PROG ) )




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
F9_09_EXP_BEN_PAID_MEMB_TOT <- xml_text( xml_find_all( doc, V_EXP_BEN_PAID_MEMB_TOT ) )




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
F9_09_EXP_BEN_PAID_MEMB_PROG <- xml_text( xml_find_all( doc, V_EXP_BEN_PAID_MEMB_PROG ) )




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
F9_09_EXP_COMP_DTK_TOT <- xml_text( xml_find_all( doc, V_EXP_COMP_DTK_TOT ) )




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
F9_09_EXP_COMP_DTK_PROG <- xml_text( xml_find_all( doc, V_EXP_COMP_DTK_PROG ) )




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
F9_09_EXP_COMP_DTK_MGMT <- xml_text( xml_find_all( doc, V_EXP_COMP_DTK_MGMT ) )




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
F9_09_EXP_COMP_DTK_FUNDR <- xml_text( xml_find_all( doc, V_EXP_COMP_DTK_FUNDR ) )




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
F9_09_EXP_COMP_DSQ_PERS_TOT <- xml_text( xml_find_all( doc, V_EXP_COMP_DSQ_PERS_TOT ) )




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
F9_09_EXP_COMP_DSQ_PERS_PROG <- xml_text( xml_find_all( doc, V_EXP_COMP_DSQ_PERS_PROG ) )




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
F9_09_EXP_COMP_DSQ_PERS_MGMT <- xml_text( xml_find_all( doc, V_EXP_COMP_DSQ_PERS_MGMT ) )




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
F9_09_EXP_COMP_DSQ_PERS_FUNDR <- xml_text( xml_find_all( doc, V_EXP_COMP_DSQ_PERS_FUNDR ) )




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
F9_09_EXP_OTH_SAL_WAGE_TOT <- xml_text( xml_find_all( doc, V_EXP_OTH_SAL_WAGE_TOT ) )




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
F9_09_EXP_OTH_SAL_WAGE_PROG <- xml_text( xml_find_all( doc, V_EXP_OTH_SAL_WAGE_PROG ) )




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
F9_09_EXP_OTH_SAL_WAGE_MGMT <- xml_text( xml_find_all( doc, V_EXP_OTH_SAL_WAGE_MGMT ) )




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
F9_09_EXP_OTH_SAL_WAGE_FUNDR <- xml_text( xml_find_all( doc, V_EXP_OTH_SAL_WAGE_FUNDR ) )




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
F9_09_EXP_PENSION_CONTR_TOT <- xml_text( xml_find_all( doc, V_EXP_PENSION_CONTR_TOT ) )




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
F9_09_EXP_PENSION_CONTR_PROG <- xml_text( xml_find_all( doc, V_EXP_PENSION_CONTR_PROG ) )




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
F9_09_EXP_PENSION_CONTR_MGMT <- xml_text( xml_find_all( doc, V_EXP_PENSION_CONTR_MGMT ) )




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
F9_09_EXP_PENSION_CONTR_FUNDR <- xml_text( xml_find_all( doc, V_EXP_PENSION_CONTR_FUNDR ) )




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
F9_09_EXP_OTH_EMPL_BEN_TOT <- xml_text( xml_find_all( doc, V_EXP_OTH_EMPL_BEN_TOT ) )




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
F9_09_EXP_OTH_EMPL_BEN_PROG <- xml_text( xml_find_all( doc, V_EXP_OTH_EMPL_BEN_PROG ) )




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
F9_09_EXP_OTH_EMPL_BEN_MGMT <- xml_text( xml_find_all( doc, V_EXP_OTH_EMPL_BEN_MGMT ) )




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
F9_09_EXP_OTH_EMPL_BEN_FUNDR <- xml_text( xml_find_all( doc, V_EXP_OTH_EMPL_BEN_FUNDR ) )




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
F9_09_EXP_PAYROLL_TAX_TOT <- xml_text( xml_find_all( doc, V_EXP_PAYROLL_TAX_TOT ) )




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
F9_09_EXP_PAYROLL_TAX_PROG <- xml_text( xml_find_all( doc, V_EXP_PAYROLL_TAX_PROG ) )




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
F9_09_EXP_PAYROLL_TAX_MGMT <- xml_text( xml_find_all( doc, V_EXP_PAYROLL_TAX_MGMT ) )




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
F9_09_EXP_PAYROLL_TAX_FUNDR <- xml_text( xml_find_all( doc, V_EXP_PAYROLL_TAX_FUNDR ) )




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
F9_09_EXP_FEE_SVC_MGMT_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_MGMT_TOT ) )




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
F9_09_EXP_FEE_SVC_MGMT_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_MGMT_PROG ) )




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
F9_09_EXP_FEE_SVC_MGMT_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_MGMT_MGMT ) )




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
F9_09_EXP_FEE_SVC_MGMT_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_MGMT_FUNDR ) )




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
F9_09_EXP_FEE_SVC_LEGAL_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_TOT ) )




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
F9_09_EXP_FEE_SVC_LEGAL_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_PROG ) )




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
F9_09_EXP_FEE_SVC_LEGAL_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_MGMT ) )




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
F9_09_EXP_FEE_SVC_LEGAL_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LEGAL_FUNDR ) )




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
F9_09_EXP_FEE_SVC_ACC_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_ACC_TOT ) )




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
F9_09_EXP_FEE_SVC_ACC_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_ACC_PROG ) )




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
F9_09_EXP_FEE_SVC_ACC_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_ACC_MGMT ) )




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
F9_09_EXP_FEE_SVC_ACC_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_ACC_FUNDR ) )




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
F9_09_EXP_FEE_SVC_LOB_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LOB_TOT ) )




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
F9_09_EXP_FEE_SVC_LOB_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LOB_PROG ) )




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
F9_09_EXP_FEE_SVC_LOB_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LOB_MGMT ) )




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
F9_09_EXP_FEE_SVC_LOB_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_LOB_FUNDR ) )




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
F9_09_EXP_FEE_SVC_FUNDR_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_TOT ) )




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_FUNDR_PROG
## DESCRIPTION:  Program services
## LOCATION:  F990-PC-PART-09-LINE-11E-COL-B
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/ProgramServices'
V2 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesProfFundraising/ProgramServices'
V_EXP_FEE_SVC_FUNDR_PROG <- paste( V1, V2 , sep='|' )
F9_09_EXP_FEE_SVC_FUNDR_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_PROG ) )




## VARIABLE NAME:  F9_09_EXP_FEE_SVC_FUNDR_MGMT
## DESCRIPTION:  Management and general
## LOCATION:  F990-PC-PART-09-LINE-11E-COL-C
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990/FeesForServicesProfFundraising/ManagementAndGeneral'
V2 <- '//Return/ReturnData/IRS990/Form990PartIX/FeesForServicesProfFundraising/ManagementAndGeneral'
V_EXP_FEE_SVC_FUNDR_MGMT <- paste( V1, V2 , sep='|' )
F9_09_EXP_FEE_SVC_FUNDR_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_MGMT ) )




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
F9_09_EXP_FEE_SVC_FUNDR_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_FUNDR_FUNDR ) )




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
F9_09_EXP_FEE_SVC_INVEST_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_INVEST_TOT ) )




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
F9_09_EXP_FEE_SVC_INVEST_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_INVEST_PROG ) )




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
F9_09_EXP_FEE_SVC_INVEST_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_INVEST_MGMT ) )




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
F9_09_EXP_FEE_SVC_INVEST_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_INVEST_FUNDR ) )




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
F9_09_EXP_FEE_SVC_OTH_TOT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_OTH_TOT ) )




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
F9_09_EXP_FEE_SVC_OTH_PROG <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_OTH_PROG ) )




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
F9_09_EXP_FEE_SVC_OTH_MGMT <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_OTH_MGMT ) )




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
F9_09_EXP_FEE_SVC_OTH_FUNDR <- xml_text( xml_find_all( doc, V_EXP_FEE_SVC_OTH_FUNDR ) )




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
F9_09_EXP_AD_PROMO_TOT <- xml_text( xml_find_all( doc, V_EXP_AD_PROMO_TOT ) )




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
F9_09_EXP_AD_PROMO_PROG <- xml_text( xml_find_all( doc, V_EXP_AD_PROMO_PROG ) )




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
F9_09_EXP_AD_PROMO_MGMT <- xml_text( xml_find_all( doc, V_EXP_AD_PROMO_MGMT ) )




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
F9_09_EXP_AD_PROMO_FUNDR <- xml_text( xml_find_all( doc, V_EXP_AD_PROMO_FUNDR ) )




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
F9_09_EXP_OFFICE_TOT <- xml_text( xml_find_all( doc, V_EXP_OFFICE_TOT ) )




## VARIABLE NAME:  F9_09_EXP_OFFICE_TOT_V2
## DESCRIPTION:  Printing; publications; postage; and shipping
## LOCATION:  F990-EZ-PART-01-LINE-15
## TABLE:  F9-P09-T00-EXPENSES
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990EZ/PrintingPublicationsPostage'
V2 <- '//Return/ReturnData/IRS990EZ/PrintingPublicationsPostageAmt'
V_EXP_OFFICE_TOT_V2 <- paste( V1, V2 , sep='|' )
F9_09_EXP_OFFICE_TOT_V2 <- xml_text( xml_find_all( doc, V_EXP_OFFICE_TOT_V2 ) )




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
F9_09_EXP_OFFICE_PROG <- xml_text( xml_find_all( doc, V_EXP_OFFICE_PROG ) )




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
F9_09_EXP_OFFICE_MGMT <- xml_text( xml_find_all( doc, V_EXP_OFFICE_MGMT ) )




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
F9_09_EXP_OFFICE_FUNDR <- xml_text( xml_find_all( doc, V_EXP_OFFICE_FUNDR ) )




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
F9_09_EXP_INFO_TECH_TOT <- xml_text( xml_find_all( doc, V_EXP_INFO_TECH_TOT ) )




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
F9_09_EXP_INFO_TECH_PROG <- xml_text( xml_find_all( doc, V_EXP_INFO_TECH_PROG ) )




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
F9_09_EXP_INFO_TECH_MGMT <- xml_text( xml_find_all( doc, V_EXP_INFO_TECH_MGMT ) )




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
F9_09_EXP_INFO_TECH_FUNDR <- xml_text( xml_find_all( doc, V_EXP_INFO_TECH_FUNDR ) )




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
F9_09_EXP_ROY_TOT <- xml_text( xml_find_all( doc, V_EXP_ROY_TOT ) )




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
F9_09_EXP_ROY_PROG <- xml_text( xml_find_all( doc, V_EXP_ROY_PROG ) )




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
F9_09_EXP_ROY_MGMT <- xml_text( xml_find_all( doc, V_EXP_ROY_MGMT ) )




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
F9_09_EXP_ROY_FUNDR <- xml_text( xml_find_all( doc, V_EXP_ROY_FUNDR ) )




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
F9_09_EXP_OCCUPANCY_TOT <- xml_text( xml_find_all( doc, V_EXP_OCCUPANCY_TOT ) )




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
F9_09_EXP_OCCUPANCY_PROG <- xml_text( xml_find_all( doc, V_EXP_OCCUPANCY_PROG ) )




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
F9_09_EXP_OCCUPANCY_MGMT <- xml_text( xml_find_all( doc, V_EXP_OCCUPANCY_MGMT ) )




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
F9_09_EXP_OCCUPANCY_FUNDR <- xml_text( xml_find_all( doc, V_EXP_OCCUPANCY_FUNDR ) )




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
F9_09_EXP_TRAVEL_TOT <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_TOT ) )




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
F9_09_EXP_TRAVEL_PROG <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_PROG ) )




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
F9_09_EXP_TRAVEL_MGMT <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_MGMT ) )




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
F9_09_EXP_TRAVEL_FUNDR <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_FUNDR ) )




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
F9_09_EXP_TRAVEL_ENTMT_TOT <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_ENTMT_TOT ) )




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
F9_09_EXP_TRAVEL_ENTMT_PROG <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_ENTMT_PROG ) )




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
F9_09_EXP_TRAVEL_ENTMT_MGMT <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_ENTMT_MGMT ) )




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
F9_09_EXP_TRAVEL_ENTMT_FUNDR <- xml_text( xml_find_all( doc, V_EXP_TRAVEL_ENTMT_FUNDR ) )




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
F9_09_EXP_CONF_MEETING_TOT <- xml_text( xml_find_all( doc, V_EXP_CONF_MEETING_TOT ) )




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
F9_09_EXP_CONF_MEETING_PROG <- xml_text( xml_find_all( doc, V_EXP_CONF_MEETING_PROG ) )




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
F9_09_EXP_CONF_MEETING_MGMT <- xml_text( xml_find_all( doc, V_EXP_CONF_MEETING_MGMT ) )




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
F9_09_EXP_CONF_MEETING_FUNDR <- xml_text( xml_find_all( doc, V_EXP_CONF_MEETING_FUNDR ) )




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
F9_09_EXP_INT_TOT <- xml_text( xml_find_all( doc, V_EXP_INT_TOT ) )




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
F9_09_EXP_INT_PROG <- xml_text( xml_find_all( doc, V_EXP_INT_PROG ) )




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
F9_09_EXP_INT_MGMT <- xml_text( xml_find_all( doc, V_EXP_INT_MGMT ) )




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
F9_09_EXP_INT_FUNDR <- xml_text( xml_find_all( doc, V_EXP_INT_FUNDR ) )




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
F9_09_EXP_PAY_AFFIL_TOT <- xml_text( xml_find_all( doc, V_EXP_PAY_AFFIL_TOT ) )




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
F9_09_EXP_PAY_AFFIL_PROG <- xml_text( xml_find_all( doc, V_EXP_PAY_AFFIL_PROG ) )




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
F9_09_EXP_PAY_AFFIL_MGMT <- xml_text( xml_find_all( doc, V_EXP_PAY_AFFIL_MGMT ) )




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
F9_09_EXP_PAY_AFFIL_FUNDR <- xml_text( xml_find_all( doc, V_EXP_PAY_AFFIL_FUNDR ) )




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
F9_09_EXP_DEPREC_TOT <- xml_text( xml_find_all( doc, V_EXP_DEPREC_TOT ) )




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
F9_09_EXP_DEPREC_PROG <- xml_text( xml_find_all( doc, V_EXP_DEPREC_PROG ) )




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
F9_09_EXP_DEPREC_MGMT <- xml_text( xml_find_all( doc, V_EXP_DEPREC_MGMT ) )




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
F9_09_EXP_DEPREC_FUNDR <- xml_text( xml_find_all( doc, V_EXP_DEPREC_FUNDR ) )




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
F9_09_EXP_INSURANCE_TOT <- xml_text( xml_find_all( doc, V_EXP_INSURANCE_TOT ) )




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
F9_09_EXP_INSURANCE_PROG <- xml_text( xml_find_all( doc, V_EXP_INSURANCE_PROG ) )




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
F9_09_EXP_INSURANCE_MGMT <- xml_text( xml_find_all( doc, V_EXP_INSURANCE_MGMT ) )




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
F9_09_EXP_INSURANCE_FUNDR <- xml_text( xml_find_all( doc, V_EXP_INSURANCE_FUNDR ) )




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
F9_09_EXP_OTH_OTH_TOT <- xml_text( xml_find_all( doc, V_EXP_OTH_OTH_TOT ) )




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
F9_09_EXP_OTH_OTH_PROG <- xml_text( xml_find_all( doc, V_EXP_OTH_OTH_PROG ) )




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
F9_09_EXP_OTH_OTH_MGMT <- xml_text( xml_find_all( doc, V_EXP_OTH_OTH_MGMT ) )




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
F9_09_EXP_OTH_OTH_FUNDR <- xml_text( xml_find_all( doc, V_EXP_OTH_OTH_FUNDR ) )




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
F9_09_EXP_TOT_TOT <- xml_text( xml_find_all( doc, V_EXP_TOT_TOT ) )




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
F9_09_EXP_TOT_PROG <- xml_text( xml_find_all( doc, V_EXP_TOT_PROG ) )




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
F9_09_EXP_TOT_MGMT <- xml_text( xml_find_all( doc, V_EXP_TOT_MGMT ) )




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
F9_09_EXP_TOT_FUNDR <- xml_text( xml_find_all( doc, V_EXP_TOT_FUNDR ) )




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
F9_09_EXP_JOINT_COST_X <- xml_text( xml_find_all( doc, V_EXP_JOINT_COST_X ) )




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
F9_09_EXP_JOINT_COST_TOT <- xml_text( xml_find_all( doc, V_EXP_JOINT_COST_TOT ) )




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
F9_09_EXP_JOINT_COST_PROG <- xml_text( xml_find_all( doc, V_EXP_JOINT_COST_PROG ) )




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
F9_09_EXP_JOINT_COST_MGMT <- xml_text( xml_find_all( doc, V_EXP_JOINT_COST_MGMT ) )




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
F9_09_EXP_JOINT_COST_FUNDR <- xml_text( xml_find_all( doc, V_EXP_JOINT_COST_FUNDR ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,F9_09_INFO_SCHED_O_X,F9_09_EXP_GRANT_US_ORG_TOT,F9_09_EXP_GRANT_US_ORG_PROG,F9_09_EXP_GRANT_US_INDIV_TOT,F9_09_EXP_GRANT_US_INDIV_PROG,F9_09_EXP_GRANT_FRGN_TOT,F9_09_EXP_GRANT_FRGN_PROG,F9_09_EXP_BEN_PAID_MEMB_TOT,F9_09_EXP_BEN_PAID_MEMB_PROG,F9_09_EXP_COMP_DTK_TOT,F9_09_EXP_COMP_DTK_PROG,F9_09_EXP_COMP_DTK_MGMT,F9_09_EXP_COMP_DTK_FUNDR,F9_09_EXP_COMP_DSQ_PERS_TOT,F9_09_EXP_COMP_DSQ_PERS_PROG,F9_09_EXP_COMP_DSQ_PERS_MGMT,F9_09_EXP_COMP_DSQ_PERS_FUNDR,F9_09_EXP_OTH_SAL_WAGE_TOT,F9_09_EXP_OTH_SAL_WAGE_PROG,F9_09_EXP_OTH_SAL_WAGE_MGMT,F9_09_EXP_OTH_SAL_WAGE_FUNDR,F9_09_EXP_PENSION_CONTR_TOT,F9_09_EXP_PENSION_CONTR_PROG,F9_09_EXP_PENSION_CONTR_MGMT,F9_09_EXP_PENSION_CONTR_FUNDR,F9_09_EXP_OTH_EMPL_BEN_TOT,F9_09_EXP_OTH_EMPL_BEN_PROG,F9_09_EXP_OTH_EMPL_BEN_MGMT,F9_09_EXP_OTH_EMPL_BEN_FUNDR,F9_09_EXP_PAYROLL_TAX_TOT,F9_09_EXP_PAYROLL_TAX_PROG,F9_09_EXP_PAYROLL_TAX_MGMT,F9_09_EXP_PAYROLL_TAX_FUNDR,F9_09_EXP_FEE_SVC_MGMT_TOT,F9_09_EXP_FEE_SVC_MGMT_PROG,F9_09_EXP_FEE_SVC_MGMT_MGMT,F9_09_EXP_FEE_SVC_MGMT_FUNDR,F9_09_EXP_FEE_SVC_LEGAL_TOT,F9_09_EXP_FEE_SVC_LEGAL_PROG,F9_09_EXP_FEE_SVC_LEGAL_MGMT,F9_09_EXP_FEE_SVC_LEGAL_FUNDR,F9_09_EXP_FEE_SVC_ACC_TOT,F9_09_EXP_FEE_SVC_ACC_PROG,F9_09_EXP_FEE_SVC_ACC_MGMT,F9_09_EXP_FEE_SVC_ACC_FUNDR,F9_09_EXP_FEE_SVC_LOB_TOT,F9_09_EXP_FEE_SVC_LOB_PROG,F9_09_EXP_FEE_SVC_LOB_MGMT,F9_09_EXP_FEE_SVC_LOB_FUNDR,F9_09_EXP_FEE_SVC_FUNDR_TOT,F9_09_EXP_FEE_SVC_FUNDR_PROG,F9_09_EXP_FEE_SVC_FUNDR_MGMT,F9_09_EXP_FEE_SVC_FUNDR_FUNDR,F9_09_EXP_FEE_SVC_INVEST_TOT,F9_09_EXP_FEE_SVC_INVEST_PROG,F9_09_EXP_FEE_SVC_INVEST_MGMT,F9_09_EXP_FEE_SVC_INVEST_FUNDR,F9_09_EXP_FEE_SVC_OTH_TOT,F9_09_EXP_FEE_SVC_OTH_PROG,F9_09_EXP_FEE_SVC_OTH_MGMT,F9_09_EXP_FEE_SVC_OTH_FUNDR,F9_09_EXP_AD_PROMO_TOT,F9_09_EXP_AD_PROMO_PROG,F9_09_EXP_AD_PROMO_MGMT,F9_09_EXP_AD_PROMO_FUNDR,F9_09_EXP_OFFICE_TOT,F9_09_EXP_OFFICE_TOT_V2,F9_09_EXP_OFFICE_PROG,F9_09_EXP_OFFICE_MGMT,F9_09_EXP_OFFICE_FUNDR,F9_09_EXP_INFO_TECH_TOT,F9_09_EXP_INFO_TECH_PROG,F9_09_EXP_INFO_TECH_MGMT,F9_09_EXP_INFO_TECH_FUNDR,F9_09_EXP_ROY_TOT,F9_09_EXP_ROY_PROG,F9_09_EXP_ROY_MGMT,F9_09_EXP_ROY_FUNDR,F9_09_EXP_OCCUPANCY_TOT,F9_09_EXP_OCCUPANCY_PROG,F9_09_EXP_OCCUPANCY_MGMT,F9_09_EXP_OCCUPANCY_FUNDR,F9_09_EXP_TRAVEL_TOT,F9_09_EXP_TRAVEL_PROG,F9_09_EXP_TRAVEL_MGMT,F9_09_EXP_TRAVEL_FUNDR,F9_09_EXP_TRAVEL_ENTMT_TOT,F9_09_EXP_TRAVEL_ENTMT_PROG,F9_09_EXP_TRAVEL_ENTMT_MGMT,F9_09_EXP_TRAVEL_ENTMT_FUNDR,F9_09_EXP_CONF_MEETING_TOT,F9_09_EXP_CONF_MEETING_PROG,F9_09_EXP_CONF_MEETING_MGMT,F9_09_EXP_CONF_MEETING_FUNDR,F9_09_EXP_INT_TOT,F9_09_EXP_INT_PROG,F9_09_EXP_INT_MGMT,F9_09_EXP_INT_FUNDR,F9_09_EXP_PAY_AFFIL_TOT,F9_09_EXP_PAY_AFFIL_PROG,F9_09_EXP_PAY_AFFIL_MGMT,F9_09_EXP_PAY_AFFIL_FUNDR,F9_09_EXP_DEPREC_TOT,F9_09_EXP_DEPREC_PROG,F9_09_EXP_DEPREC_MGMT,F9_09_EXP_DEPREC_FUNDR,F9_09_EXP_INSURANCE_TOT,F9_09_EXP_INSURANCE_PROG,F9_09_EXP_INSURANCE_MGMT,F9_09_EXP_INSURANCE_FUNDR,F9_09_EXP_OTH_OTH_TOT,F9_09_EXP_OTH_OTH_PROG,F9_09_EXP_OTH_OTH_MGMT,F9_09_EXP_OTH_OTH_FUNDR,F9_09_EXP_TOT_TOT,F9_09_EXP_TOT_PROG,F9_09_EXP_TOT_MGMT,F9_09_EXP_TOT_FUNDR,F9_09_EXP_JOINT_COST_X,F9_09_EXP_JOINT_COST_TOT,F9_09_EXP_JOINT_COST_PROG,F9_09_EXP_JOINT_COST_MGMT,F9_09_EXP_JOINT_COST_FUNDR)
df <- as.data.frame( var.list )


return( df )


}


