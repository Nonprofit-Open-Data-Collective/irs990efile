###---------------------------------------------------
###   BUILD INDEX
###---------------------------------------------------

#' @title
#' Build Efiler Index
#'
#' @description
#' Build an index of IRS 990 efilers available on AWS
#'
#' @details
#' AWS has reference index files in JSON format available 
#' at <https://s3.amazonaws.com/irs-form-990/index_YEAR> where
#' YEAR is the year of interest. Note that these index files 
#' are organized by filing dates, not the tax year for the 
#' nonprofit. Unless the fiscal year ends in December the tax 
#' year is a year before the filing date (for example, individuals 
#' file 2019 income taxes in April of 2020). 
#'
#' @param file.years Numeric or character vector of years starting in 2011. 
#' 
#' @return Returns a data frame of the AWS index file. 
#'
#'   See the tinyindex for a full list of variables in 
#'   the index file. 
#'
#' @examples
#' \dontrun{
#' index <- build_index( years=2015:2018 )
#' }
#' @export
build_index <- function( file.years=2011:2021 )
{
   
   index.list <- list()
   counter <- 1
   
   for( i in file.years )
   {
     index.url <- paste0( "https://s3.amazonaws.com/irs-form-990/index_", i, ".json" )
     index.list[[ counter ]] <- jsonlite::fromJSON( index.url )[[1]]
     counter <- counter + 1
     
   }

   index <- dplyr::bind_rows( index.list )

   index <- unique( index )  # remove a couple of strange duplicates

   # REFORMAT DATE FROM YYYY-MM TO YYYY
   # Tax Period represents the end of the nonprofit's accounting year
   # The tax filing year is always the previous year, unless the accounting year ends in December
   
   tax.year <- as.numeric( substr( index$TaxPeriod, 1, 4 ) )
   month <- substr( index$TaxPeriod, 5, 6 )
   index$TaxYear <- tax.year - 1
   index$TaxYear[ month == "12" ] <- tax.year[ month == "12" ]
   
   return( index )

}
