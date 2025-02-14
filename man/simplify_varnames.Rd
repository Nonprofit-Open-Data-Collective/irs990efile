% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/UTILS.R
\name{simplify_varnames}
\alias{simplify_varnames}
\title{Simplify Variable Names}
\usage{
simplify_varnames(d, sep = "", drop.prefix = TRUE)
}
\arguments{
\item{d}{A data frame.}

\item{sep}{Separator for words in variable names.}

\item{drop.prefix}{Logical; whether to drop prefixes.}
}
\value{
A data frame with simplified variable names.
}
\description{
Standardizes and simplifies variable names in a data frame.
}
\examples{
new_data <- simplify_varnames(data, sep = "_")
}
