#' Get Table Headers
#'
#' This function initializes and returns a list of predefined table headers. 
#' The table headers correspond to various sections and schedules of IRS Form 990 
#' and its associated schedules. Each header maps to a set of XML paths for 
#' data extraction from electronic filings.
#'
#' @details
#' The function defines a list of table headers with predefined keys. Each key 
#' represents a specific section or schedule of the IRS Form 990 or its supplements. 
#' The associated values are character vectors containing XML paths to extract 
#' relevant data from the forms.
#'
#' The resulting list is assigned to a global variable `TABLE.HEADERS` for use 
#' across the workspace. It can be accessed directly or via the return value of 
#' this function.
#'
#' @return
#' A named list where:
#' - Names represent table header identifiers (e.g., `F9-P03-T01-PROGRAMS-OTHER`).
#' - Values are character vectors containing XML paths for data extraction.
#'
#' @examples
#' # Initialize table headers
#' headers <- get_table_headers()
#' 
#' # Access specific table headers
#' headers$`F9-P03-T01-PROGRAMS-OTHER`
#'
#' @note
#' This function assigns the resulting list to a global variable `TABLE.HEADERS` 
#' using the `<<-` operator.
#'
#' @export
get_table_headers <- function(){

  TABLE.HEADERS <- list()

  TABLE.HEADERS$'F9-P03-T01-PROGRAMS-OTHER' <-  
  c("//IRS990/ActivityOther", "//Form990PartIII/ActivityOther", "//IRS990/ProgramServiceAccomplishments", 
  "//IRS990/ProgSrvcAccomActyOtherGrp", "//IRS990EZ/ProgSrvcAccomActyOtherGrp"
  )

  TABLE.HEADERS$'F9-P03-T02-PROGRAMS-EZ' <-  
  c("//IRS990EZ/ProgramServiceAccomplishment", "//IRS990EZ/ProgramSrvcAccomplishmentGrp"
  )

  TABLE.HEADERS$'F9-P07-T01-COMPENSATION' <-  
  c("//IRS990/Form990PartVIISectionA", "//IRS990/Form990PartVIISectionAGrp", 
  "//IRS990/FrmrOfcrDirTrstOrKeyEmployee", "//IRS990/OfcrDirTrusteesOrKeyEmployee", 
  "//IRS990EZ/Form990PartVIISectionA", "//IRS990EZ/Form990PartVIISectionAGrp", 
  "//IRS990EZ/OfficerDirectorTrusteeEmplGrp", "//IRS990EZ/OfficerDirectorTrusteeKeyEmpl"
  )

  TABLE.HEADERS$'F9-P07-T01-COMPENSATION-HCE-EZ' <-  
  c("//IRS990EZ/CompensationHighestPaidEmplGrp", "//IRS990EZ/CompensationOfHighestPaidEmpl", 
  "//IRS990EZ/PartVIOfCompOfHghstPdEmplTxt", "//IRS990EZ/PartVIOfCompOfHighestPaidEmpl"
  )

  TABLE.HEADERS$'F9-P07-T02-CONTRACTORS' <-  
  c("//IRS990/ContractorCompensation", "//IRS990/ContractorCompensationGrp", 
  "//IRS990/Form990PartVIISectionB", "//IRS990EZ/CompensationOfHghstPdCntrctGrp", 
  "//IRS990EZ/CompOfHghstPaidCntrctProfSer", "//IRS990EZ/PartVIAHghstPaidCntrctProfSer", 
  "//IRS990EZ/PartVIHghstPdCntrctProfSrvcTxt")

  TABLE.HEADERS$'F9-P08-T01-REVENUE-PROGRAMS' <-  
  c("//Form990PartVIII/ProgramServiceRevenue", "//IRS990/ProgramServiceRevenue", 
  "//IRS990/ProgramServiceRevenueGrp")

  TABLE.HEADERS$'F9-P08-T02-REVENUE-MISC' <-  
  c("//Form990PartVIII/OtherRevenueMisc", "//IRS990/OtherRevenueMisc", "//IRS990/OtherRevenueMiscGrp"
  )

  TABLE.HEADERS$'F9-P09-T01-EXPENSES-OTHER' <-  
  c("//Form990PartIX/OtherExpenses", "//IRS990/OtherExpenses", "//IRS990/OtherExpensesGrp"
  )

  TABLE.HEADERS$'SA-P01-T01-PUBLIC-CHARITY-STATUS' <-  
  c("//IRS990ScheduleA/Form990ScheduleAPartI", "//IRS990ScheduleA/OtherSupportSumAmt", 
  "//IRS990ScheduleA/SumOfAmounts", "//IRS990ScheduleA/SupportedOrgInformation", 
  "//IRS990ScheduleA/SupportedOrgInformationGrp"
  )


  TABLE.HEADERS$'SA-P06-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleA/Form990ScheduleAPartIVGrp", "//IRS990ScheduleA/Form990ScheduleAPartVIGrp", 
  "//IRS990ScheduleA/GeneralExplanation", "//IRS990ScheduleA/GeneralExplanationTxt"
  )

  TABLE.HEADERS$'SC-P01-T01-POLITICAL-ORGS-INFO' <-  
  c("//Form990ScheduleCPartI/Sec527PolOrgs", "//IRS990ScheduleC/Sec527PolOrgs", 
  "//IRS990ScheduleC/Section527PoliticalOrgGrp")


  TABLE.HEADERS$'SC-P04-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleC/Form990ScheduleCPartIV", "//IRS990ScheduleC/SupplementalInformationDetail"
  )


  TABLE.HEADERS$'SD-P07-T01-INVESTMENTS-OTH-SECURITIES' <-  
  c("//Form990ScheduleDPartVII/Other", "//IRS990ScheduleD/OtherSecurities", 
  "//IRS990ScheduleD/OtherSecuritiesGrp")

  TABLE.HEADERS$'SD-P07-T01-INVESTMENTS-OTH-EQUITY' <-  
  c("//IRS990ScheduleD/CloselyHeldEquityInterests", "//IRS990ScheduleD/CloselyHeldEquityInterestsGrp", 
  "//Form990ScheduleDPartVII/CloselyHeldEquityInterests")
  
  TABLE.HEADERS$'SD-P07-T01-INVESTMENTS-OTH-DERIVATIVES' <-  
  c("//IRS990ScheduleD/FinancialDerivatives", "//IRS990ScheduleD/FinancialDerivativesGrp", 
  "//Form990ScheduleDPartVII/FinancialDerivatives")
  
  
  TABLE.HEADERS$'SD-P08-T01-INVESTMENTS-PROG-RLTD' <-  
  c("//Form990ScheduleDPartVIII/InvestmentsProgramRelated", "//IRS990ScheduleD/InvestmentsProgramRelated", 
  "//IRS990ScheduleD/InvstProgramRelatedOrgGrp")


  TABLE.HEADERS$'SD-P09-T01-OTH-ASSETS' <-  
  c("//Form990ScheduleDPartIX/OtherAssets", "//IRS990ScheduleD/OtherAssets", 
  "//IRS990ScheduleD/OtherAssetsOrgGrp")

  TABLE.HEADERS$'SD-P10-T01-OTH-LIABILITIES' <-  
  c("//IRS990ScheduleD/Form990ScheduleDPartX", "//IRS990ScheduleD/OtherLiabilities", 
  "//IRS990ScheduleD/OtherLiabilitiesOrgGrp")

  TABLE.HEADERS$'SD-P13-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleD/Form990ScheduleDPartXIII", "//IRS990ScheduleD/Form990ScheduleDPartXIV", 
  "//IRS990ScheduleD/SupplementalInformationDetail")


  TABLE.HEADERS$'SE-P02-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleE/Form990ScheduleEPartII", "//IRS990ScheduleE/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SF-P01-T01-FRGN-ACTS-BY-REGION' <-  
  c("//IRS990ScheduleF/AccountActivitiesOutsideUSGrp", "//IRS990ScheduleF/AcctsActvsOutUSTable", 
  "//Form990ScheduleFPartI/AcctsActvsOutUSTable")

  TABLE.HEADERS$'SF-P02-T01-FRGN-ORG-GRANTS' <-  
  c("//Form990ScheduleFPartII/GrantsToOrgsOutsideUS", "//IRS990ScheduleF/GrantsToOrgOutsideUSGrp", 
  "//IRS990ScheduleF/GrantsToOrgsOutsideUS")

  TABLE.HEADERS$'SF-P03-T01-FRGN-INDIV-GRANTS' <-  
  c("//IRS990ScheduleF/ForeignIndividualsGrantsGrp", "//Form990ScheduleFPartIII/GrantsToIndOutsideUS", 
  "//IRS990ScheduleF/GrantsToIndOutsideUS")

  TABLE.HEADERS$'SF-P05-T99-EXPLANATION-TEXT' <-  
  c("//IRS990ScheduleF/Form990ScheduleFPartIV", "//IRS990ScheduleF/Form990ScheduleFPartV", 
  "//IRS990ScheduleF/SupplementalInformationDetail")

  TABLE.HEADERS$'SG-P01-T01-FUNDRAISERS-INFO' <-  
  c("//Form990ScheduleGPartI/FundraiserActivityInformation", "//IRS990ScheduleG/FundraiserActivityInfoGrp", 
  "//IRS990ScheduleG/FundraiserActivityInformation")

  TABLE.HEADERS$'SG-P02-T01-FUNDRAISING-EVENTS' <-  
  c("//IRS990ScheduleG/EventsInformation", "//Form990ScheduleGPartII/EventsInformation", 
  "//IRS990ScheduleG/FundraisingEventInformationGrp")

  TABLE.HEADERS$'SG-P04-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleG/Form990ScheduleGPartIV", "//IRS990ScheduleG/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SH-P04-T01-COMPANY-JOINT-VENTURES' <-  
  c("//IRS990ScheduleH/Form990ScheduleHPartIV", "//IRS990ScheduleH/ManagementCoAndJntVenturesGrp"
  )

  TABLE.HEADERS$'SH-P05-T01-HOSPITAL-FACILITY' <-  
  c("//IRS990ScheduleH/Form990ScheduleHPartV", "//IRS990ScheduleH/Form990ScheduleHPartVSectionA", 
  "//IRS990ScheduleH/HospitalFacilitiesGrp")

  TABLE.HEADERS$'SH-P05-T02-NON-HOSPITAL-FACILITY' <-  
  c("//Form990ScheduleHPartVSectionC/OtherFacilities", "//OthHlthCareFcltsNotHospitalGrp/OthHlthCareFcltsGrp"
  )

  TABLE.HEADERS$'SH-P05-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleH/SupplementalInformationGrp"
  )

  TABLE.HEADERS$'SH-P06-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleH/Form990ScheduleHPartVI"
  )

  TABLE.HEADERS$'SI-P02-T01-GRANTS-US-ORGS-GOVTS' <-  
  c("//Form990ScheduleIPartII/RecipientTable", "//IRS990ScheduleI/RecipientTable"
  )

  TABLE.HEADERS$'SI-P03-T01-GRANTS-US-INDIV' <-  
  c("//IRS990ScheduleI/Form990ScheduleIPartIII", "//IRS990ScheduleI/GrantsOtherAsstToIndivInUSGrp"
  )

  TABLE.HEADERS$'SI-P04-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleI/Form990ScheduleIPartIV", "//IRS990ScheduleI/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SJ-P02-T01-COMPENSATION-DTK' <-  
  c("//IRS990ScheduleJ/Form990ScheduleJPartII", "//IRS990ScheduleJ/RltdOrgOfficerTrstKeyEmplGrp"
  )

  TABLE.HEADERS$'SJ-P03-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleJ/Form990ScheduleJPartIII", "//IRS990ScheduleJ/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SK-P01-T01-BOND-ISSUES' <-  
  c("//IRS990ScheduleK/Form990ScheduleKPartI", "//IRS990ScheduleK/TaxExemptBondsIssuesGrp"
  )

  TABLE.HEADERS$'SK-P02-T01-BOND-PROCEEDS' <-  
  c("//IRS990ScheduleK/Form990ScheduleKPartII", "//IRS990ScheduleK/TaxExemptBondsProceedsGrp"
  )

  TABLE.HEADERS$'SK-P03-T01-BOND-PRIVATE-BIZ-USE' <-  
  c("//IRS990ScheduleK/Form990ScheduleKPartIII", "//IRS990ScheduleK/TaxExemptBondsPrivateBusUseGrp"
  )

  TABLE.HEADERS$'SK-P04-T01-BOND-ARBITRAGE' <-  
  c("//IRS990ScheduleK/Form990ScheduleKPartIV", "//IRS990ScheduleK/TaxExemptBondsArbitrageGrp"
  )

  TABLE.HEADERS$'SK-P05-T01-PROCEDURE-CORRECTIVE-ACT' <-  
  c("//IRS990ScheduleK/FedTaxRequirementsCompliance", "//IRS990ScheduleK/Form990ScheduleKPartV", 
  "//IRS990ScheduleK/ProceduresCorrectiveActionGrp")

  TABLE.HEADERS$'SK-P06-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleK/Form990ScheduleKPartV", "//IRS990ScheduleK/Form990ScheduleKPartVI", 
  "//IRS990ScheduleK/SupplementalInformationDetail")

  TABLE.HEADERS$'SL-P01-T01-EXCESS-BENEFIT-TRANSAC' <-  
  c("//IRS990ScheduleL/DisqualifiedPersonExBnftTrGrp", "//IRS990ScheduleL/DQPTable", 
  "//Form990ScheduleLPartI/DQPTable")

  TABLE.HEADERS$'SL-P02-T01-LOANS-INTERESTED-PERS' <-  
  c("//Form990ScheduleLPartII/LoanTable", "//IRS990ScheduleL/LoansBtwnOrgInterestedPrsnGrp", 
  "//IRS990ScheduleL/LoanTable")

  TABLE.HEADERS$'SL-P03-T01-GRANTS-INTERESTED-PERS' <-  
  c("//IRS990ScheduleL/Form990ScheduleLPartIII", "//IRS990ScheduleL/GrntAsstBnftInterestedPrsnGrp"
  )

  TABLE.HEADERS$'SL-P04-T01-BIZ-TRANSAC-INTERESTED-PERS' <-  
  c("//IRS990ScheduleL/BusTrInvolveInterestedPrsnGrp", "//IRS990ScheduleL/Form990ScheduleLPartIV"
  )

  TABLE.HEADERS$'SL-P05-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleL/Form990ScheduleLPartV", "//IRS990ScheduleL/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SM-P01-T01-NONCASH-CONTRIBUTIONS' <-  
  c("//Form990ScheduleMPartI/OtherNonCashContributionsTable", "//IRS990ScheduleM/OtherNonCashContributionsTable", 
  "//IRS990ScheduleM/OtherNonCashContriTableGrp")

  TABLE.HEADERS$'SM-P02-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleM/Form990ScheduleMPartII", "//IRS990ScheduleM/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SN-P01-T01-LIQUIDATION-TERMINATION-DISSOLUTION' <-  
  c("//Form990ScheduleNPartI/LiquidationTable", "//LiquidationOfAssetsTableGrp/LiquidationOfAssetsDetail", 
  "//IRS990ScheduleN/LiquidationTable")

  TABLE.HEADERS$'SN-P02-T01-DISPOSITION-OF-ASSETS' <-  
  c("//IRS990ScheduleN/DispositionOfAssetsDetail", "//IRS990ScheduleN/DispositionTable", 
  "//Form990ScheduleNPartII/DispositionTable")

  TABLE.HEADERS$'SN-P03-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleN/ExplanatoryText", "//IRS990ScheduleN/Form990ScheduleNPartIII", 
  "//IRS990ScheduleN/SupplementalInformationDetail")

  TABLE.HEADERS$'SO-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleO/GeneralExplanation", "//IRS990ScheduleO/SupplementalInformationDetail"
  )

  TABLE.HEADERS$'SR-P01-T01-ID-DISREGARDED-ENTITIES' <-  
  c("//IRS990ScheduleR/Form990ScheduleRPartI", "//IRS990ScheduleR/IdDisregardedEntitiesGrp"
  )

  TABLE.HEADERS$'SR-P02-T01-ID-RLTD-TAX-EXEMPED-ORGS' <-  
  c("//IRS990ScheduleR/Form990ScheduleRPartII", "//IRS990ScheduleR/IdRelatedTaxExemptOrgGrp"
  )

  TABLE.HEADERS$'SR-P03-T01-ID-RLTD-ORGS-TAXABLE-PARTNERSHIP' <-  
  c("//IRS990ScheduleR/Form990ScheduleRPartIII", "//IRS990ScheduleR/IdRelatedOrgTxblPartnershipGrp"
  )

  TABLE.HEADERS$'SR-P04-T01-ID-RLTD-ORGS-TAXABLE-CORPORATION' <-  
  c("//IRS990ScheduleR/Form990ScheduleRPartIV", "//IRS990ScheduleR/IdRelatedOrgTxblCorpTrGrp"
  )

  TABLE.HEADERS$'SR-P05-T01-TRANSACTIONS-RLTD-ORGS' <-  
  c("//Form990ScheduleRPartV/TransactionsRelatedOrgsTable", "//IRS990ScheduleR/TransactionsRelatedOrgGrp", 
  "//IRS990ScheduleR/TransactionsRelatedOrgsTable")

  TABLE.HEADERS$'SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP' <-  
  c("//IRS990ScheduleR/Form990ScheduleRPartVI", "//IRS990ScheduleR/UnrelatedOrgTxblPartnershipGrp"
  )

  TABLE.HEADERS$'SR-P07-T99-SUPPLEMENTAL-INFO' <-  
  c("//IRS990ScheduleR/Form990ScheduleRPartVII", "//IRS990ScheduleR/SupplementalInformationDetail"
  )

  TABLE.HEADERS <<- TABLE.HEADERS

  return( TABLE.HEADERS )

}

