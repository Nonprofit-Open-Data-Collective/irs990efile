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
         latest.year <- latest.year - 1 
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
     "OrgType","TaxStatus","YearFormed",
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




# filename is the name of the latest index file
# available on the data commons
#
# filename <- "index_all_years_efiledata_xmls_created_on_2024-09-21.csv"
# update_index( filename )
#
# the new index will be split into individual tax year files

update_index <- function( filename ) {

  base <- "https://gt990datalake-rawdata.s3.amazonaws.com/Indices/990xmls/"
  URL <- paste0( base, filename )

  download.file( URL, destfile="index.csv" )
  index <- data.table::fread( "index.csv", colClasses=c( "ObjectId"="character" ) )  

  years <- unique( index$TaxYear ) |> sort()

  for( i in years )
  {
    index.i <- dplyr::filter( index, TaxYear == i )
    fn <- paste0( "data-commons-efile-index-", i, ".csv" )
    write.csv( index.i, fn, row.names=F )
  }
}




# library( tictoc )
# tic( )  #--------------------------------------
# index <- build_index( tax.years=2007:2010 )
# toc()   #---------------------------------------
# 
# 
# 
# build_index <- function( tax.years=2009:2020 )
# {
#   
#   index.list <- list()
#   counter <- 1
#   
#   for( i in tax.years )
#   {
#     index.list[[ counter ]] <- get( paste0( "index", i ) )
#     counter <- counter + 1  
#   }
#   
#   index <- dplyr::bind_rows( index.list )
#   
#   # index <- unique( index )  # remove a couple of strange duplicates
#   #
#   # REFORMAT DATE FROM YYYY-MM TO YYYY
#   # Tax Period represents the end of the nonprofit's accounting year
#   # The tax filing year is always the previous year, unless the accounting year ends in December
#   #
#   # tax.year <- as.numeric( substr( index$TaxPeriod, 1, 4 ) )
#   # month <- substr( index$TaxPeriod, 5, 6 )
#   # index$TaxYear <- tax.year - 1
#   # index$TaxYear[ month == "12" ] <- tax.year[ month == "12" ]
#   
#   return( index )
#   
# }
