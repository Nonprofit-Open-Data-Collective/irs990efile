###---------------------------------------------------
###   FUNCTIONS TO FACILITATE PRODUCTION RULES
###---------------------------------------------------
  
#' @importFrom magrittr "%>%"
#' @export
magrittr::`%>%`

#' Retrieve the Concordance File
#'
#' Downloads the master concordance file from GitHub or loads a local version.
#'
#' @param gh Logical; if TRUE, fetches the concordance file from GitHub. If FALSE, uses a local dataset.
#'
#' @return A data.table containing the concordance data.
#' @examples
#' concordance <- get_concordance(gh = TRUE)
#' head(concordance)
#' @export
get_concordance <- function( gh=TRUE ){
  if( gh ){
    base <- "https://raw.githubusercontent.com/"
    gh.id <- "Nonprofit-Open-Data-Collective/"
    rn <- "irs-efile-master-concordance-file/refs/heads/master/"
    fn <- "concordance.csv"
    url <- paste0( base, gh.id, rn, fn )
    concordance <- data.table::fread( url, showProgress = FALSE )
  }
  if( is.null(concordance) | ! gh ){ data(concordance) }
  return( concordance )
}
  
#' Extract Object ID from URL
#'
#' Parses and extracts the unique object ID from a given URL.
#'
#' @param url A string containing the full URL to parse.
#'
#' @return A string representing the extracted object ID.
#' @examples
#' base <- "https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/"
#' fn <- "202301529349200315_public.xml"
#' url <- paste0( base, fn )
#' id <- get_object_id(url)
#' # "OID-202301529349200315"
#' @export
get_object_id <- function( url ){
  base_01 <- "https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/"
  base_02 <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/"
  object.id <- gsub( paste0( base_01, "|", base_02 ), "", url)
  object.id <- gsub( "_public.xml", "", object.id )
  object.id <- paste0( "OID-", object.id )
  return(object.id)
}

#' Extract Text from an XML Node
#'
#' Retrieves text from specific nodes within an XML document.
#'
#' @param doc An XML document object.
#' @param TEMP_VAR The XPath expression specifying the nodes to retrieve.
#'
#' @return A character vector containing the extracted text or NA if no text is found.
#' @examples
#' xml_data <- retrieve_xml(doc, "//TagName")
#' @export
retrieve_xml <- function( doc, TEMP_VAR ) {
  x <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_VAR ) )
  if( length(x) == 0 ){ x <- NA }
  return(x)
}

#' Zero Replacement for 990 Forms
#'
#' Replaces missing or NA values with "0" for IRS Form 990 data.
#'
#' @param var A variable to evaluate.
#'
#' @return The original variable or "0" if it is missing/NA.
#' @export
zeroPC <- function( var )
{ 
    if( FORMTYPE=="990" )
    {
       if( length(var) == 0 ){ return("0") }
       if( is.na(var) ){ return("0") }
    }
    return( var )
}
    
#' Zero Replacement for 990EZ Forms
#'
#' Replaces missing or NA values with "0" for IRS Form 990EZ data.
#'
#' @param var A variable to evaluate.
#'
#' @return The original variable or "0" if it is missing/NA.
#' @export
zeroEZ <- function( var )
{ 
    if( FORMTYPE=="990EZ" )
    {
      if( length(var) == 0 ){ return("0") }
      if( is.na(var) ){ return("0") }
    }
    return( var )
}

#' General Zero Replacement
#'
#' Replaces missing or NA values with "0" for all data types.
#'
#' @param var A variable to evaluate.
#'
#' @return The original variable or "0" if it is missing/NA. 
#' @export
zeroALL <- function( var )
{
    if( length(var) == 0 ){ return("0") }
    if( is.na(var)  ){ return("0") }
    return( var )
}


#' Standardize Boolean Inputs
#'
#' Converts various representations of true/false into a standardized boolean format.
#'
#' @param x A vector of values to standardize.
#'
#' @return A logical vector indicating TRUE/FALSE values.
#' @examples
#' standardize_boole(c("YES", "NO", NA))
#' @export
standardize_boole <- function( x ){
  x[ is.na(x) ] <- FALSE
  x <- toupper( x )
  TF <- x %in% c("TRUE","YES","1","X")
  return( TF )
}

#' Create a Named List
#'
#' Constructs a named list from the provided arguments.
#'
#' @param ... Named arguments to include in the list.
#'
#' @return A named list.
#' @examples
#' my_list <- namedList(a = 1, b = 2)
#' @export
namedList <- function(...){
    names <- as.list(substitute(list(...)))[-1L]
    result <- list(...)
    names(result) <- names
    result[sapply(result, function(x){length(x)==0})] <- NA
    result[sapply(result, is.null)] <- NA
    result
}

#' Filter Dataset by Year
#'
#' Subsets a dataset for a specified tax year.
#'
#' @param index A data frame containing tax year information.
#' @param year The tax year to filter.
#'
#' @return A data frame filtered by the specified year.
#' @examples
#' filtered_data <- get_year(index, 2020)
#' @export
get_year <- function( index, year )
{
   dplyr::filter( index, TaxYear==year )
}


#' Format EIN
#'
#' Formats Employer Identification Numbers (EINs) into a standard format.
#'
#' @param x A vector of EINs.
#' @param to Specify output format: "id" for EIN-XX-XXXXXX or "n" for numeric only.
#'
#' @return A vector of formatted EINs.
#' @examples
#' formatted_ein <- format_ein(c("12345678"), to = "id")
#' @export
format_ein <- function( x, to="id" ) {
    if( to == "id" )
    {   
        x <- stringr::str_pad( x, 9, side="left", pad="0" )
        sub1 <- substr( x, 1, 2 )
        sub2 <- substr( x, 3, 9 )
        ein  <- paste0( "EIN-", sub1, "-", sub2 ) 
        return(ein)
    }

    if( to == "n" )
    {  
       x <- gsub( "[^0-9]", "", x )
       return( x )
    }
  
}

#' Simplify Variable Names
#'
#' Standardizes and simplifies variable names in a data frame.
#'
#' @param d A data frame.
#' @param sep Separator for words in variable names.
#' @param drop.prefix Logical; whether to drop prefixes.
#'
#' @return A data frame with simplified variable names.
#' @examples
#' new_data <- simplify_varnames(data, sep = "_")
#' @export
simplify_varnames <- function( d, sep="", drop.prefix=TRUE )
{
  varnames <- names(d)

  if( drop.prefix )
  {  varnames <- substring( varnames, first=7 )  }

  varnames <- tolower( varnames )
  varnames <- gsub( pattern="_", replacement=sep, varnames )

  names(d) <- varnames
  return( d )
}



#' @title Record a change to raw data.   
#'
#' @description Make a note when a variable contained within a
#'   one-to-one table is collapsed into a single value. 
#'
#' @details Some variables in the 1:1 table list occassionally contain
#'   more than one value. For example, most nonprofits are registered in 
#'   a single state but a small proportion are registered in several. 
#'   These values are collapsed into a single value, for example 
#'   state = MN, OH, and NY becomes a single string `{MN},{OH},{NY}`. 
#'
#' @export
log_collapsed_record <- function( varname, ein=ORG_EIN, year=TAX_YEAR, url=URL ){
  file.name <- paste0("COLLAPSED-RECORDS-", year, ".txt")
  if (!file.exists(file.name)){file.create(file.name)}
  fileConn <- file(file.name, open = "a")
  values <- paste0( "{", varname, "}", collapse = ";;" )
  writeLines(paste0("YEAR: ", year), con = fileConn, sep = "\n")
  writeLines(paste0("EIN: ", ein), con = fileConn, sep = "\n")
  writeLines(paste0("VARIABLE: ", substitute(varname) ), con = fileConn, sep = "\n")
  writeLines(paste0("VALUES: ", values), con = fileConn, sep = "\n")
  writeLines(paste0("URL: ", url), con = fileConn, sep = "\n\n")
  close(fileConn)
}


#' @title Log a failed URL.   
#'
#' @description Make a note when a url fails to load or is invalid. 
#'
#' @details Poor internet connections, long server latency, or invalid 
#'  urls, or corrupted XML structure will result in an XML file failing to load.
#'
#' @export
log_fails <- function( urls ){
  file.name <- paste0("FAILED-URLS.txt")
  if (!file.exists(file.name)){ file.create(file.name) }
  fileConn <- file(file.name, open = "a")
  writeLines( paste0(url), con = fileConn, sep = "\n")
  close(fileConn)
}


#' @title Log missing xpaths.   
#' @description Create a log of which xpaths are currently missing from the concordance file. 
#' @export
log_missing_xpaths <- function( doc, url ){

  xx <- doc %>% xmltools::xml_get_paths(mark_terminal = ">>") %>% unlist()
  xp <- grep( "^>>", xx, value=TRUE ) %>% unique()
  xp <- gsub( ">>", "", xp )
  data(xpaths) # load concordance xpaths 
  missing <- setdiff( xp, xpaths )
  VERSION <- xml2::xml_attr( doc, attr='returnVersion' )
  
  if( length(missing) > 0 ){
    file.name <- paste0("MISSING-XPATHS.txt")
    if (!file.exists(file.name)){ file.create(file.name) }
    fileConn <- file(file.name, open = "a")
    writeLines( paste0("VERSION: ", VERSION), con = fileConn, sep = "\n")
    writeLines( paste0("URL: ", url), con = fileConn, sep = "\n")
    writeLines( paste0(missing, collapse="\n"), con = fileConn, sep = "\n\n")
    close(fileConn) }
}

#' @title Convert Missing Xpath List to DF.   
#' @description Converts the list of xpaths created by log_missing_xpaths() to a data frame. 
#' @export
xp_to_df <- function(x){
  VERSION <- gsub( "VERSION: ", "", x[1] )
  URL <- gsub( "URL: ", "", x[2] )
  XPATH <- grep( "^/", x, value=T )
  df <- data.frame( XPATH, VERSION, URL )
  return(df)
}

#' @title Process Missing Xpaths Log.   
#' @description Read a MISSING-XPATHS.txt file and convert the log to a data frame. 
#' @export
get_missing_xpath_df <- function( path=NULL )
{
  if( is.null(path)){ path <- getwd() }
  fn <- paste0(path,"/MISSING-XPATHS.txt")
  if( ! file.exists(fn) ){ return(NULL) }
  con <- file( fn, open="r" )
  txt <- readLines(con)
  close(con)
  rv <- grepl( "^VERSION", txt )
  L <- split( txt, f=cumsum(rv) )
  DF <- L %>% lapply(xp_to_df) %>% dplyr::bind_rows()
  return(DF)
}

#' @title Aggregate Missing XPATHS  
#' @description Read a MISSING-XPATHS data frame from get_missing_xpath_df()
#'   and return a table with counts of occurrences of each xpath
#'   along with the list of unique xsd versions the correspond to the xpath. 
#'
#' @param df A data frame of missing xpaths created by get_missing_xpath_df()
#' @examples
#' df <- get_missing_xpath_df( "2020" )
#' count_xpaths( df )
#' @export
count_xpaths <- function( df ){

  tb <- 
    df %>%
    dplyr::count( XPATH ) %>%
    arrange( -n )

  fx <- function(x){ x %>% unique() %>% sort() %>% paste0(collapse=";") }

  vs <- 
    df %>% 
    group_by(XPATH) %>% 
    summarize( VERSION=fx(VERSION) ) 

  xpc <- merge( tb, vs, by="XPATH", all.x=T ) %>% dplyr::arrange( -n )
  
  return( xpc )

}


#' @title Package Testing Function 
#' @description Build a small database to test the package.  
#' @param path The folder in which the test build will occur (if no value provided it uses the default folder). 
#' @examples
#' test_build()
#' @export
test_build <- function( path="." ) {

  setwd( path )

  wd <- paste(sample(LETTERS, 5), collapse = "")
  dir.create( wd )
  setwd( wd )

  # TEST SAMPLE
  index <- tinyindex

  # USE FIVE YEARS 
  index <- filter( index, TaxYear %in% 2018:2022 )

  # KEEP 100 CASES PER YEAR FOR QUICK TEST
  sL  <- split( index, index$TaxYear )
  dfL <- lapply( sL, dplyr::sample_n, 125 )
  index100 <- dplyr::bind_rows( dfL )

  cat( "Commencing irs990efile Package Test\n" )
  cat( paste0("Using Directory: ", getwd(), "\n\n" ) )
  cat( "Building a small database (~500 990 returns).\n" )
  cat( "Average build time 5-10 minutes.\n" )
  cat( "Check BUILD-LOG.txt for progress.\n\n" )
  cat( " (1) Create directory structure.\n" )
  cat( " (2) Split the index into BATCHFILES, one for each year.\n" )
  cat( " (3) Parse XML batches into tables and save as CSV files in the YEAR folders.\n" )
  cat( " (4) Combine all batched CSV files into compiled tables in the COMPILED folder.\n" )
  cat( " (5) Combine all logfiles of missing xpaths into the FIX folder for review.\n\n" )
  
  build_database( index=index100, batch.size=10 )
  
}

