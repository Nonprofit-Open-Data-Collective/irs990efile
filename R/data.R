#' @name tinyindex
#' @docType data
#' @title Small AWS efile index created for demo and testing purposes.
#'
#' @description A dataset reporting the meta-data for 10,000 nonprofit efile returns. 
#'  The index gives the URL (web address) of each XML file stores in the AWS instance 
#'  and is the basis for an iterative data build in this package. 
#'
#' @format A data frame with 10000 rows and 10 variables:
#' \describe{
#'   \item{OrganizationName}{Name of the nonprofit filing the 990 form}
#'   \item{EIN}{The nonprofit Employer Identification Number, i.e. the unique org ID}
#'   \item{FormType}{Type of tax form used (990,990EZ,990PF)}
#'   \item{TaxPeriod}{Due date of the tax filing in format YYYY-MM}
#'   \item{TaxYear}{The calendar year covered by the tax filing (TaxPeriod-1) in format YYYY}
#'   \item{URL}{Online address of the XML file containing efile data for the organization}
#'   \item{DLN}{IRS Document Locator Number - internal ID used to track efilings}
#'   \item{SubmittedOn"}{Date the filing was submitted}
#'   \item{ObjectId}{Internal IRS field}
#'   \item{LastUpdated}{Internal IRS field}
#' }
#' @source \url{https://registry.opendata.aws/irs990/}
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

#' @name index2009
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2009. 
NULL

#' @name index2010
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2010. 
NULL

#' @name index2011
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2011. 
NULL

#' @name index2012
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2012. 
NULL

#' @name index2013
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2013. 
NULL

#' @name index2014
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2014. 
NULL

#' @name index2015
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2015. 
NULL

#' @name index2016
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2016. 
NULL

#' @name index2017
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2017. 
NULL

#' @name index2018
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2018. 
NULL

#' @name index2019
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2019. 
NULL

#' @name index2020
#' @docType data
#' @title The IRS index file previously available on AWS for the year 2020. 
NULL



