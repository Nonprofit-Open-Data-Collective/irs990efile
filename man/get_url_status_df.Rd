% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GET_AWS_INDEX.R
\name{get_url_status_df}
\alias{get_url_status_df}
\title{Get URL Status for Multiple Days}
\usage{
get_url_status_df(days = 30)
}
\arguments{
\item{days}{An integer specifying the number of days to check.}
}
\value{
A data frame containing the status of URLs for each day.
}
\description{
Checks the status of AWS index URLs for the last specified number of days.
}
\examples{
get_url_status_df(30)
}
