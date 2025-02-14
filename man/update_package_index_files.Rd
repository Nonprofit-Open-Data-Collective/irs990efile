% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GET_INDEX.R
\name{update_package_index_files}
\alias{update_package_index_files}
\title{Update IndexYEAR Files For Package}
\usage{
update_package_index_files(index = NULL, formtype = c("990", "990EZ"))
}
\arguments{
\item{index}{A data frame containing an IRS e-file index with columns \code{FormType} and \code{TaxYear}.}
}
\value{
None. The function performs side effects, including reading and writing data.
}
\description{
Filters the index for specific IRS Form types and splits it by tax year, saving each year's data to a file.
}
\details{
This function facilitates updates to the package by refreshining the index files used for building annual databases. The most recent index file would first be obtained through the Giving Tuesday Data Commons. The function then filters the index to include only desired form types (990 and 990EZ filers are the default), identifies unique tax years, and processes the index for each year. For every tax year, it:
\itemize{
\item Reads the corresponding file for the tax year.
\item Creates an in-memory object for the index of that year.
\item Saves the data to the package using \code{use_data} with \code{overwrite = TRUE}.
}
}
\examples{
\dontrun{
split_index(my_index)
}
}
