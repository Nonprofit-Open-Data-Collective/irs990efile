##########
##########  IDENTIFY THE MOST CURRENT INDEX FILE FROM AWS
##########


#' @title Get Last N Dates
#' @description Generates a sequence of the last N dates in "YYYY-MM-DD" format.
#' @param N An integer specifying the number of days to generate.
#' @return A character vector of dates in "YYYY-MM-DD" format.
#' @examples
#' get_last_n_dates(30)
#' @export
get_last_n_dates <- function(N = 30) {
  today <- Sys.Date()
  last_n_dates <- seq(today, by = "-1 day", length.out = N)
  formatted_dates <- as.character(last_n_dates)
  return(formatted_dates)
}

#' @title Validate URL Status
#' @description Checks if a given URL is valid by sending an HTTP HEAD request.
#' @param url A character string representing the URL to validate.
#' @return A logical value indicating if the URL is valid (HTTP status 200).
#' @examples
#' base <- "https://gt990datalake-rawdata.s3.us-east-1.amazonaws.com/Indices/990xmls/"
#' fn_01 <- "index_all_years_efiledata_xmls_created_on_2024-12-23.csv"
#' fn_02 <- "index_all_years_efiledata_xmls_created_on_2024-12-24.csv"
#' url_01 <- paste0( base, fn_01 )  
#' url_02 <- paste0( base, fn_02 )  
#' url_is_valid( url_01 )   # file exists
#' url_is_valid( url_02 )   # file does not exist
#' @export
url_is_valid <- function(url) {
  hd <- httr::HEAD(url)
  status <- hd$all_headers[[1]]$status
  return(status == "200")
}

#' @title Find Most Recent AWS Full Index
#' @description Identifies the most recent AWS index file (all years) within the given number of days.
#' @param days An integer specifying the number of past days to check.
#' @return A character string representing the URL of the most recent index file, or NA if none found.
#' @examples
#' find_current_index_full(100)
#' @export
find_current_index_full <- function(days = 100) {
  base <- "https://gt990datalake-rawdata.s3.us-east-1.amazonaws.com/Indices/990xmls/index_all_years_efiledata_xmls_created_on_"
  dd <- get_last_n_dates(days)
  urls <- paste0(base, dd, ".csv")
  while.count <- 0
  not.a.url <- TRUE
  while (not.a.url) {
    while.count <- while.count + 1
    if (while.count > days) {
      return(NA)
    }
    not.a.url <- !url_is_valid(urls[while.count])
  }
  return(urls[while.count])
}

#' @title Find Most Recent AWS Batch Index
#' @description Identifies the most recent AWS batch index file within the given number of days (only new files).
#' @param days An integer specifying the number of past days to check.
#' @return A character string representing the URL of the most recent index file, or NA if none found.
#' @examples
#' find_current_index_batch(100)
#' @export
find_current_index_batch <- function(days = 100) {
  base <- "https://gt990datalake-rawdata.s3.us-east-1.amazonaws.com/Indices/990xmls/index_latest_only_efiledata_xmls_created_on_"
  dd <- get_last_n_dates(days)
  urls <- paste0(base, dd, ".csv")
  while.count <- 0
  not.a.url <- TRUE
  while (not.a.url) {
    while.count <- while.count + 1
    if (while.count > days) {
      return(NA)
    }
    not.a.url <- !url_is_valid(urls[while.count])
  }
  return(urls[while.count])
}

#' @title Get URL Status
#' @description Retrieves the HTTP status of a given URL.
#' @param url A character string representing the URL to check.
#' @return A data frame containing the URL, its existence status, and the HTTP status code.
#' @examples
#' get_url_status("https://example.com")
#' @export
get_url_status <- function(url) {
  hd <- httr::HEAD(url)
  status <- hd$all_headers[[1]]$status
  row <- data.frame(url = url, exists = status == "200", status = status)
  return(row)
}

#' @title Get URL Status for Multiple Days
#' @description Checks the status of AWS index URLs for the last specified number of days.
#' @param days An integer specifying the number of days to check.
#' @return A data frame containing the status of URLs for each day.
#' @examples
#' get_url_status_df(30)
#' @export
get_url_status_df <- function(days = 30) {
  base <- "https://gt990datalake-rawdata.s3.us-east-1.amazonaws.com/Indices/990xmls/"
  fn   <- "index_all_years_efiledata_xmls_created_on_"
  dd   <- get_last_n_dates(days)
  urls <- paste0( base, fn, dd, ".csv" )
  mL   <- purrr::map(urls, get_url_status)
  dff  <- dplyr::bind_rows(mL)
  return(dff)
}

#' @title Download Current AWS Index
#' @description Downloads the most recent AWS index file.
#' @return None. Downloads the file as "INDEX.CSV" in the working directory.
#' @examples
#' \dontrun{
#' fn <- download_current_index()
#' index <- data.table::fread( fn )
#' split_index( index )
#' }
#' @export
download_current_index_full <- function() {
  url <- find_current_index_full()
  fn <- extract_filenames( url )
  options( timeout = 600 )
  download.file( url, destfile = fn )
  return( fn )
}

#' @title Load Full Data Commons Efiler Index
#' @description Loads the most recent efiler index file into a data.table.
#' @return A data.table containing the full index file (all records).
#' @examples
#' \dontrun{
#' df <- load_current_index()
#' }
#' @export
get_current_index_full <- function( TIMEOUT=600 ) {
  url <- find_current_index_full()
  options(timeout = TIMEOUT)
  dt <- data.table::fread(url)
  return(dt)
}


#' @title Load Most Recent Data Commons Batch Index
#' @description Loads the most recent batch index file into a data.table.
#' @return A data.table containing the most recent batch 
#'   index file (only records new to this batch).
#' @examples
#' \dontrun{
#' df <- get_current_index_batch()
#' }
#' @export
get_current_index_batch <- function( TIMEOUT=600 ) {
  url <- find_current_index_batch()
  options(timeout = TIMEOUT)
  dt <- data.table::fread(url)
  return(dt)
}



##########
##########    IF YOU HAVE THE AWS CLI PACKAGE INSTALLED
##########    https://990data.givingtuesday.org/access-via-aws-account-2/
##########


#' @title Get AWS Index List
#' @description Retrieves a list of AWS indices using the AWS CLI.
#' @return A character vector containing the raw output of the AWS CLI command.
#' @examples
#' \dontrun{
#' get_index_list_awscli()
#' }
#' @export
get_index_list_awscli <- function() {
  s3.bash <- 'aws s3 ls s3://gt990datalake-rawdata/Indices/990xmls/ --recursive --no-sign-request'
  bash.out <- system(s3.bash, intern = TRUE)
  return(bash.out)
}

#' @title Extract Index Filenames
#' @description Extracts filenames matching a specific pattern from a vector of strings.
#' @param strings A character vector containing strings to search.
#' @return A character vector of matched filenames.
#' @examples
#' \dontrun{
#' index.list <- get_index_list_awscli()
#' extract_filenames_full( index.list )
#' }
#' @export
extract_filenames_full <- function(strings) {
  pattern <- "index_all_years_efiledata_xmls_created_on_\\d{4}-\\d{2}-\\d{2}\\.csv"
  matches <- regmatches(strings, regexec(pattern, strings)) |> unlist()
  if (length(matches) == 0) {
    return(NA_character_)
  }
  return(matches)
}

#' @title Extract Batch Index Filenames
#' @description Extracts batch index filenames from the list of all files in the GTDC AWS S3 index bucket.
#' @param strings A character vector containing strings to search.
#' @return A character vector of matched filenames.
#' @examples
#' \dontrun{
#' index.list <- get_index_list_awscli()
#' extract_filenames_batch( index.list )
#' }
#' @export
extract_filenames_batch <- function(strings) {
  pattern <- "index_latest_only_efiledata_xmls_created_on_\\d{4}-\\d{2}-\\d{2}\\.csv"
  matches <- regmatches(strings, regexec(pattern, strings)) |> unlist()
  if (length(matches) == 0) {
    return(NA_character_)
  }
  return(matches)
}

#' @title Extract Dates from Filenames
#' @description Extracts dates in "YYYY-MM-DD" format from a vector of strings.
#' @param x A character vector containing filenames.
#' @return A character vector of extracted dates.
#' @examples
#' extract_dates("xmls_created_on_2023-11-19.csv")
#' @export
extract_dates <- function(x) {
  stringr::str_extract(x, "\\d{4}-\\d{2}-\\d{2}")
}

#' @title Find Most Recent Date
#' @description Finds the position of the most recent date in a vector of dates.
#' @param dates A character vector of dates in "YYYY-MM-DD" format.
#' @return An integer indicating the position of the most recent date.
#' @examples
#' dates <- c( "2023-11-18", "2023-11-19", "2024-06-01" )
#' find_most_recent_date( dates )
#' @export
find_most_recent_date <- function(dates) {
  date_objects <- as.Date(dates)
  most_recent <- which.max(date_objects)
  return(most_recent)
}

#' @title Get Current AWS Index Using CLI
#' @description Retrieves the filename of the most recent AWS index.
#' @return A character string representing the filename of the most recent index.
#' @examples
#' \dontrun{
#' get_current_index_full_awscli()
#' }
#' @export
get_current_index_full_awscli <- function() {
  fL <- get_index_list_awscli()
  fns <- extract_filenames_full(fL)
  dates <- extract_dates(fns)
  most.recent <- find_most_recent_date(dates)
  current.index <- fns[most.recent]
  return(current.index)
}

#' @title Get All Batch Index Filenames Using CLI
#' @description Retrieves the filename of the most recent AWS index.
#' @return A character string representing the filename of the most recent index.
#' @examples
#' \dontrun{
#' get_all_batch_indices_awscli()
#' }
#' @export
get_all_batch_indices_awscli <- function() {
  fL <- get_index_list()
  fns <- extract_batch_filenames(fL)
  return(fns)
}