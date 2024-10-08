% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{rdbkeys}
\alias{rdbkeys}
\title{Small of variables added to every RDB table.}
\format{
A data frame containing concordance fields for the following variables:
\describe{
\item{ORG_EIN}{Name of the nonprofit filing the 990 form}
\item{ORG_NAME_L1}{The nonprofit Employer Identification Number, i.e. the unique org ID}
\item{ORG_NAME_L2}{Type of tax form used (990,990EZ,990PF)}
\item{RETURN_TYPE}{Due date of the tax filing in format YYYY-MM}
\item{TAX_YEAR}{The calendar year covered by the tax filing (TaxPeriod-1) in format YYYY}
}
}
\source{
\url{https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file}
}
\description{
The \code{rdbkeys} data frame contains a small set of variables
that represent the metadata and unique ID keys that are added to every
one-to-one and one-to-many table created from the concordance file in
order to identify unique tax files, filter data, or link tables.
}
\details{
The URL, OBJECTID, and RETURN_VERSION are added by the \code{add_keys()} function.
}
\examples{
\dontrun{
data( rdbkeys )
}

}
\seealso{
\code{\link[=add_keys]{add_keys()}}
}
