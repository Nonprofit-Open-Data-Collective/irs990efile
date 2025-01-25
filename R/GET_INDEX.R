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
build_index <- function( tax.years=NULL )
{
   base <- "https://nccs-efile.s3.us-east-1.amazonaws.com/index/data-commons-efile-index-"

   # WILL FIND MOST RECENT YEAR INDEX IS AVAILABLE
   if( is.null(tax.years) )
   {   
      latest.year <- format( Sys.Date(), "%Y" )
      URL <- paste0( base, latest.year, ".csv" )
      is.valid <- valid_url( URL ) 
      while( is.valid == FALSE )
      { 
         latest.year <- as.numeric(latest.year) - 1 
         URL <- paste0( base, latest.year, ".csv" )
         is.valid <- valid_url( URL )   
      }
      tax.years <- 2007:latest.year
   }
   
   index.list <- list()
 
   for( i in tax.years )
   {
     URL <- paste0( base, i, ".csv" )
     df <- try( data.table::fread( URL, 
                  colClasses = 'character', 
                  data.table = FALSE,
                  showProgress = FALSE ) )
     index.list[[ as.character(i) ]] <- df 
   }

   index <- dplyr::bind_rows( index.list )

   new.order <- 
   c("OrganizationName","EIN","FormType","TaxYear","URL",
     "OrgType","TaxStatus","YearFormed","DAF",
     "LegalDomicileState","LegalDomicileCountry",
     "GrossReceipts","TotalRevenueCY","TotalExpensesCY",
     "TotalAssetsBkEOY","TotalLiabilitiesBkEOY",
     "TotalNetAssetsBkEOY",
     "GroupAffiliatesIncluded","GroupExemptionNumber", 
     "GroupReturnForAffiliates",
     "TaxPeriod", "TaxPeriodBeginDate", "TaxPeriodEndDate",
     "ReturnVersion","DateSigned","SubmittedOn","IndexedOn",  
     "ObjectId","ReturnTs","BuildTs","DocStatus", 
     "FileSizeBytes","FileSha256","ZipFile")
   index <- index[ new.order ]

   return( index )
}


#' @title
#' Check if URL is valid
#'
#' @description
#' Check whether a URL is valid. 
#'
#' @details
#' Pings a given URL to see if it is active or exists.  
#'
#' @param URL Any URL you wish to test. 
#' 
#' @return Returns a value of TRUE or FALSE.  
#'
#' @examples
#' \dontrun{
#' # TRUE
#' valid_url( "https://nccs-efile.s3.us-east-1.amazonaws.com/index/data-commons-index-file-2020.csv" )
#' # FALSE
#' valid_url( "https://nccs-efile.s3.us-east-1.amazonaws.com/index/data-commons-index-file-2090.csv" )
#' }
#' @export
valid_url <- function( URL , t=2 ){
  con <- url( URL )
  check <- 
    suppressWarnings( 
      try( open.connection( con, open="rt", timeout=t ), silent=T )[1]
    )
  suppressWarnings( try( close.connection( con ), silent=T ))
  ifelse( is.null( check ), TRUE, FALSE )
}




#' Update IndexYEAR Files For Package
#'
#' Filters the index for specific IRS Form types and splits it by tax year, saving each year's data to a file.
#'
#' @param index A data frame containing an IRS e-file index with columns `FormType` and `TaxYear`.
#'
#' @details This function facilitates updates to the package by refreshining the index files used for building annual databases. The most recent index file would first be obtained through the Giving Tuesday Data Commons. The function then filters the index to include only desired form types (990 and 990EZ filers are the default), identifies unique tax years, and processes the index for each year. For every tax year, it:
#' \itemize{
#'   \item Reads the corresponding file for the tax year.
#'   \item Creates an in-memory object for the index of that year.
#'   \item Saves the data to the package using `use_data` with `overwrite = TRUE`.
#' }
#'
#' @return None. The function performs side effects, including reading and writing data.
#'
#' @examples
#' \dontrun{
#' split_index(my_index)
#' }
#' @export
update_package_index_files <- function( index=NULL, formtype=c("990","990EZ") ) {

  f1.exists <- file.exists("data")
  f2.exists <- file.exists("data-index")
  if( ! ( f1.exists & f2.exists ) )
  { 
    cat("\nMUST BE INSIDE THE PACKAGE FOLDER TO EXECUTE\n\n")
    cat("  }}  YOUR CURRENT LOCATION:\n")
    cat( paste0( "  }}  ", getwd(), "\n\n" ))
    return(invisible(NULL))
  }
  
  if( is.null(index) ){ index <- get_current_index_full() }
  
  index <- index %>% dplyr::filter( FormType %in% formtype )
  index <- index %>% dplyr::distinct( URL, .keep_all = TRUE )
  years <- unique( index$TaxYear ) |> sort()

  use_data <- usethis::use_data

  for( i in years )
  {
    index.i <- dplyr::filter( index, TaxYear == i )
    fn <- paste0( "data-index/data-commons-efile-index-", i, ".csv" )
    data.table::fwrite( index.i, fn )
    ds <- paste0( "index", i )
    eval( call( "<-", as.name(ds), index.i ) )
    do.call( "use_data", list(as.name(ds), overwrite = TRUE))
  }
  
  cat("\nNEW INDEX FILES FOR THE PACKAGE ARE IN THE DATA FOLDER\n\n")
  
}

