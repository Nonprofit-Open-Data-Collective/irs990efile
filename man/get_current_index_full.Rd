% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GET_AWS_INDEX.R
\name{get_current_index_full}
\alias{get_current_index_full}
\title{Load Full Data Commons Efiler Index}
\usage{
get_current_index_full(TIMEOUT = 600)
}
\value{
A data.table containing the full index file (all records).
}
\description{
Loads the most recent efiler index file into a data.table.
}
\examples{
\dontrun{
df <- load_current_index()
}
}
