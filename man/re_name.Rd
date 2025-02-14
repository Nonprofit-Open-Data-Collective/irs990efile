% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TABLE_FUNCTIONS_RDB.R
\name{re_name}
\alias{re_name}
\title{Rename Data Frame Columns}
\usage{
re_name(df, v.map)
}
\arguments{
\item{df}{A data frame with columns to be renamed.}

\item{v.map}{A data frame containing the variable map with \code{XSD_VARNAME} (old names) and \code{VARIABLE} (new names).}
}
\value{
The input data frame with renamed columns.
}
\description{
Renames the columns of a data frame based on a variable map.
}
\examples{
renamed_df <- re_name(my_data, var_map)
}
