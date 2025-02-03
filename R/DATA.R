#' @name xpaths
#' @title XML xpaths in the current concordance crosswalk.
#' @docType data
NULL

#' @name tinyindex
#' @docType data
#' @title Small 990 efile index data frame used for demo and testing purposes.
#'
#' @description An index file for a sample of 10,000 nonprofit efile returns. 
#'  The index gives the URL (web address) of each XML file stored in the Data Commons 
#'  AWS S3 instance and is the primary object used to define returns in a new build. 
#'
#' @format A data frame with 34 fields:
#' \describe{
#'   \item{BuildTs}{POSIXct: Timestamp indicating when the data was built.}
#'   \item{DAF}{Logical: Indicates if the record relates to a Donor-Advised Fund.}
#'   \item{DateSigned}{Date: The date the filing was signed.}
#'   \item{DocStatus}{Character: Status of the filing document (e.g., approved, pending).}
#'   \item{EIN}{Integer: Employer Identification Number of the organization.}
#'   \item{FileSha256}{Character: SHA-256 checksum of the file for integrity verification.}
#'   \item{FileSizeBytes}{Integer: Size of the file in bytes.}
#'   \item{FormType}{Character: Type of IRS Form 990 (e.g., "990", "990EZ").}
#'   \item{GrossReceipts}{Integer64: Gross receipts reported by the organization.}
#'   \item{GroupAffiliatesIncluded}{Logical: Indicates if group affiliates are included.}
#'   \item{GroupExemptionNumber}{Integer: Group exemption number if applicable.}
#'   \item{GroupReturnForAffiliates}{Logical: Indicates if the return is for group affiliates.}
#'   \item{IndexedOn}{Date: The date when the record was indexed.}
#'   \item{LegalDomicileCountry}{Character: Country of legal domicile of the organization.}
#'   \item{LegalDomicileState}{Character: State of legal domicile of the organization.}
#'   \item{ObjectId}{Integer64: Unique identifier for the object.}
#'   \item{OrgType}{Character: Type of organization (e.g., "Corp", "Association").}
#'   \item{OrganizationName}{Character: Name of the organization.}
#'   \item{ReturnTs}{POSIXct: Timestamp indicating when the return was submitted.}
#'   \item{ReturnVersion}{Character: Version of the IRS form used.}
#'   \item{SubmittedOn}{Date: Date when the return was submitted.}
#'   \item{TaxPeriod}{Date: Tax period associated with the filing.}
#'   \item{TaxPeriodBeginDate}{Date: Start date of the tax period.}
#'   \item{TaxPeriodEndDate}{Date: End date of the tax period.}
#'   \item{TaxStatus}{Character: Tax status of the organization (e.g., "501c3").}
#'   \item{TaxYear}{Integer: The tax year the filing corresponds to.}
#'   \item{TotalAssetsBkEOY}{Integer64: Total assets at the end of the year as per the organization's books.}
#'   \item{TotalExpensesCY}{Integer64: Total expenses for the current year.}
#'   \item{TotalLiabilitiesBkEOY}{Integer64: Total liabilities at the end of the year as per the organization's books.}
#'   \item{TotalNetAssetsBkEOY}{Integer64: Total net assets at the end of the year as per the organization's books.}
#'   \item{TotalRevenueCY}{Integer64: Total revenue for the current year.}
#'   \item{URL}{Character: URL to the raw XML file of the IRS 990 data.}
#'   \item{Website}{Character: Website of the organization.}
#'   \item{YearFormed}{Integer: The year the organization was formed.}
#'   \item{ZipFile}{Character: Name of the ZIP file if applicable.}
#' }
#'
#' @source Giving Tuesday Data Commons: \url{https://990data.givingtuesday.org/}
NULL 


#' @name concordance
#' @docType data
#' @title The Master Concordance File that serves as a crosswalk between xpaths and variable names.
#'
#' @description The concordance file is the Rosetta Stone of the IRS efile database. 
#'  It documents the type of mapping needed to convert XML files into
#'  rectangular relational database tables appropriate for research.
#'
#' @details There are multiple versions of 990 forms (the 990 and 990EZ)
#'  and multiple versions of each form over time, so each variable is
#'  is associated with multiple xpaths describing its possible location 
#'  in an xml document. The primary purpose of the `concordance` file is
#'  to organize xpaths by variable, and to organize variables into tables,
#'  as well as provide documentatoin used to generate the data dictionary. 
#'
#' @format A data frame with 6782 rows and 22 variables:
#' \describe{
#'   \item{xpath}{the xml document path for a variable}
#'   \item{variable_name}{the primary variable label for the dataset}
#'   \item{description}{}
#'   \item{location_code_xsd}{}
#'   \item{location_code_family}{}
#'   \item{location_code}{}
#'   \item{form}{}
#'   \item{form_type}{}
#'   \item{form_part}{}
#'   \item{form_line_number}{}
#'   \item{variable_scope}{}
#'   \item{data_type_xsd}{}
#'   \item{data_type_simple}{}
#'   \item{rdb_relationship}{}
#'   \item{rdb_table}{}
#'   \item{required}{}
#'   \item{versions}{}
#'   \item{latest_version}{}
#'   \item{duplicated}{}
#'   \item{current_version}{}
#'   \item{production_rule}{}
#'   \item{validated}{}
#' }
#' @source \url{https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file}
NULL


#' @name rdbkeys
#' @docType data
#' @title Small of variables added to every RDB table.  
#'
#' @description The `rdbkeys` data frame contains a small set of variables 
#'  that represent the metadata and unique ID keys that are added to every
#'  one-to-one and one-to-many table created from the concordance file in 
#'  order to identify unique tax files, filter data, or link tables.
#' 
#' @details The URL, OBJECTID, and RETURN_VERSION are added by the `add_keys()` function.
#'
#' @format A data frame containing concordance fields for the following variables:
#' \describe{
#'   \item{ORG_EIN}{Name of the nonprofit filing the 990 form}
#'   \item{ORG_NAME_L1}{The nonprofit Employer Identification Number, i.e. the unique org ID}
#'   \item{ORG_NAME_L2}{Type of tax form used (990,990EZ,990PF)}
#'   \item{RETURN_TYPE}{Due date of the tax filing in format YYYY-MM}
#'   \item{TAX_YEAR}{The calendar year covered by the tax filing (TaxPeriod-1) in format YYYY}
#' }
#' 
#' @seealso [irs990efile::add_keys()]
#' 
#' @examples
#' \dontrun{
#' data( rdbkeys )
#' }
#' 
#' @source \url{https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file}
NULL 


#' @name index
#' @docType data
#' @title The IRS 990 efiler index returned from get_current_index_full() or get_current_index_batch(). 
#' @format A data frame with 34 variables:
#' \describe{
#'   \item{BuildTs}{POSIXct: Timestamp indicating when the data was built.}
#'   \item{DAF}{Logical: Indicates if the record relates to a Donor-Advised Fund.}
#'   \item{DateSigned}{Date: The date the filing was signed.}
#'   \item{DocStatus}{Character: Status of the filing document (e.g., approved, pending).}
#'   \item{EIN}{Integer: Employer Identification Number of the organization.}
#'   \item{FileSha256}{Character: SHA-256 checksum of the file for integrity verification.}
#'   \item{FileSizeBytes}{Integer: Size of the file in bytes.}
#'   \item{FormType}{Character: Type of IRS Form 990 (e.g., "990", "990EZ").}
#'   \item{GrossReceipts}{Integer64: Gross receipts reported by the organization.}
#'   \item{GroupAffiliatesIncluded}{Logical: Indicates if group affiliates are included.}
#'   \item{GroupExemptionNumber}{Integer: Group exemption number if applicable.}
#'   \item{GroupReturnForAffiliates}{Logical: Indicates if the return is for group affiliates.}
#'   \item{IndexedOn}{Date: The date when the record was indexed.}
#'   \item{LegalDomicileCountry}{Character: Country of legal domicile of the organization.}
#'   \item{LegalDomicileState}{Character: State of legal domicile of the organization.}
#'   \item{ObjectId}{Integer64: Unique identifier for the object.}
#'   \item{OrgType}{Character: Type of organization (e.g., "Corp", "Association").}
#'   \item{OrganizationName}{Character: Name of the organization.}
#'   \item{ReturnTs}{POSIXct: Timestamp indicating when the return was submitted.}
#'   \item{ReturnVersion}{Character: Version of the IRS form used.}
#'   \item{SubmittedOn}{Date: Date when the return was submitted.}
#'   \item{TaxPeriod}{Date: Tax period associated with the filing.}
#'   \item{TaxPeriodBeginDate}{Date: Start date of the tax period.}
#'   \item{TaxPeriodEndDate}{Date: End date of the tax period.}
#'   \item{TaxStatus}{Character: Tax status of the organization (e.g., "501c3").}
#'   \item{TaxYear}{Integer: The tax year the filing corresponds to.}
#'   \item{TotalAssetsBkEOY}{Integer64: Total assets at the end of the year as per the organization's books.}
#'   \item{TotalExpensesCY}{Integer64: Total expenses for the current year.}
#'   \item{TotalLiabilitiesBkEOY}{Integer64: Total liabilities at the end of the year as per the organization's books.}
#'   \item{TotalNetAssetsBkEOY}{Integer64: Total net assets at the end of the year as per the organization's books.}
#'   \item{TotalRevenueCY}{Integer64: Total revenue for the current year.}
#'   \item{URL}{Character: URL to the raw XML file of the IRS 990 data.}
#'   \item{Website}{Character: Website of the organization.}
#'   \item{YearFormed}{Integer: The year the organization was formed.}
#'   \item{ZipFile}{Character: Name of the ZIP file if applicable.}
#' }
#'
#' @source Giving Tuesday: \url{https://990data.givingtuesday.org/}
#' @examples
#' index <- get_current_index_full()
#' table(index$FormType,index$TaxYear) |> knitr::kable() 
NULL


