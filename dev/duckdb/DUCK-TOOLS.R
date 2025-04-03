# library( DBI )
# library( duckdb )
# library( dplyr )
# library( dbplyr )

#' Open a DuckDB database connection
#'
#' This function initializes an in-memory DuckDB connection with S3 support.
#' @param s3_region A character string specifying the S3 region. Default is "us-east-1".
#' @param anonymous A logical value indicating whether to enable anonymous S3 access. Default is TRUE.
#' @return A DuckDB database connection object.
#' @export
open_database <- function( s3_region = "us-east-1", anonymous = TRUE ) {

  duck.driver <- duckdb::duckdb()
  con <- DBI::dbConnect( duck.driver, dbdir = ":memory:" )
  
  DBI::dbExecute( con, "INSTALL httpfs; LOAD httpfs;" )
  DBI::dbExecute( con, paste0( "SET s3_region='", s3_region, "';" ) )
  DBI::dbExecute( con, "SET s3_endpoint='s3.amazonaws.com';" )
  
  if ( anonymous ) {
    DBI::dbExecute( con, "SET s3_access_key_id='';" )
    DBI::dbExecute( con, "SET s3_secret_access_key='';" )
  }
  
  return( con )
}

#' Attach an S3-hosted DuckDB database
#'
#' This function connects to a specified DuckDB database stored in an S3 bucket.
#' @param filename The name of the database file in the S3 bucket.
#' @param anonymous A logical value indicating whether to enable anonymous S3 access. Default is TRUE.
#' @return A DuckDB connection object with the attached database.
#' @export
get_s3_database <- function( filename, anonymous = TRUE ) {

  s3_base <- "s3://nccs-efile/duckdb/"
  s3_path <- paste0( s3_base, filename )
  con <- open_database( anonymous )
  
  dbname <- gsub( "\\.duckdb", "", filename )
  print( paste0( "Attached Database: ", dbname ) )
  
  SQL <- paste0( "ATTACH '", s3_path, "' AS ", dbname, ";" )
  DBI::dbExecute( con, SQL )
  
  table.names <- DBI::dbListTables( con )
  print( paste0( "Table Names: ", paste0( table.names, collapse = "; " ) ) )
  
  SQL <- paste0( "SELECT count(*) AS num_rows FROM ", dbname, ".KEYS;" )
  n_rows <- DBI::dbGetQuery( con, SQL )
  print( paste0( "Unique Returns: ", format( n_rows, big.mark = "," ) ) )
  
  return( con )
}

#' Flatten an XML table into a wide format
#'
#' Converts an XML table structure into a standard data frame format.
#' @param table_name The name of the table to flatten.
#' @param year The year of the dataset.
#' @param con A DuckDB connection object.
#' @return A tibble containing the flattened table.
#' @export
flatten_table <- function( table_name, year, con ) {

  fn <- paste0( "EFILE", year, ".FLATXML" )
  db <- dplyr::tbl( con, fn )
  
  wide_00 <- db %>%
    dplyr::filter( TYPE == "terminal" ) %>% 
    dplyr::filter( RDB_TABLE == table_name ) %>%
    dplyr::select( OBJECTID, VARIABLE_NAME, VALUE ) %>%
    tidyr::pivot_wider(
      names_from = VARIABLE_NAME, 
      values_from = VALUE,
      values_fill = ""
    )
  
  return( wide_00 )
}

#' Add key columns to a table
#'
#' This function merges a table with key columns from a metadata file.
#' @param db_tbl A data frame containing the table data.
#' @param table_name The name of the table.
#' @param year The dataset year.
#' @param cc_file A metadata file containing column mappings.
#' @param con A DuckDB connection object.
#' @return A tibble with key columns added.
#' @export
add_keys <- function( db_tbl, table_name, year, cc_file, con ) {

  keys   <- dplyr::tbl( con, paste0( "EFILE", year, ".KEYS" ) )
  db_tbl <- dplyr::right_join( keys, db_tbl, by = "OBJECTID" )
  
  new.order <- cc_file %>%
    dplyr::filter( rdb_table == table_name ) %>%
    dplyr::arrange( location_code_family, xpath ) %>%
    dplyr::pull( variable_name ) %>%
    unique()
  
  new.order <- new.order[ new.order %in% colnames( db_tbl ) ]
  key.names <- colnames( keys )
  
  db_tbl <- db_tbl %>% dplyr::relocate( c( key.names, new.order ) )
  
  print( paste0( "TABLE: ", table_name ) )
  # print( colnames( db_tbl ) )
  
  return( db_tbl )
}


#' Build a structured table and optionally save to S3
#'
#' Constructs a table with necessary transformations and writes it to S3 if specified.
#' @param table_name The name of the table.
#' @param year The dataset year.
#' @param con A DuckDB connection object.
#' @param ccfile A metadata file containing column mappings.
#' @param post_to_s3 A logical indicating whether to upload to S3. Default is TRUE.
#' @return An invisible tibble containing the processed table.
#' @export
build_table <- function( table_name, year, con, cc_file, post_to_s3 = FALSE ) {

  wide_00 <- 
    flatten_table( table_name = table_name, 
                   year = year, 
                   con = con )
  
  wide_00 <- 
    add_keys( db_tbl = wide_00, 
              table_name = table_name, 
              year = year, 
              cc_file = cc_file,
              con = con )
  
  if ( post_to_s3 ) {
    write_csv_to_s3( db_tbl = wide_00, table_name, year )
  }
  
  if ( ! post_to_s3 ) {
    fpath <- paste0( "CSV/", table_name, "-", year, ".CSV" ) 
    wide_00 %>% dplyr::compute( "TEMP", temporary = TRUE, overwrite = TRUE )
    SQL <- paste0( "COPY TEMP TO '", fpath, "' WITH ( HEADER, DELIMITER ',' );" )
    DBI::dbExecute( con, SQL )
  }
  
  return( invisible( wide_00 ) )
}

#' Build an RDB table from XML data and optionally save to S3
#'
#' Processes and structures an RDB table based on specified column mappings and writes it to S3 if specified.
#' @param table_name The name of the table.
#' @param year The dataset year.
#' @param TABLE.HEADERS A list containing table headers.
#' @param con A DuckDB connection object.
#' @param ccfile A metadata file containing column mappings.
#' @param post_to_s3 A logical indicating whether to upload to S3. Default is FALSE.
#' @return An invisible tibble containing the processed table.
#' @export
build_rdb_table <- function( table_name, year, TABLE.HEADERS, con, cc_file, post_to_s3 = FALSE ) {

  hd <- TABLE.HEADERS[[ table_name ]]
  hd <- gsub( "//", "/", hd )
  xpath_versions <- paste0( hd, collapse = "|" )
  
  db <- dplyr::tbl( con, paste0( "EFILE", year, ".FLATXML" ) )
  
  wide_xx <- db %>%
    dplyr::filter( grepl( xpath_versions, XPATH2 ) ) %>%
    dplyr::filter( TYPE == "terminal" ) %>%
    dplyr::select( OBJECTID, TABLE_ID, VARIABLE_NAME, VALUE ) %>%
    tidyr::pivot_wider( 
      names_from = VARIABLE_NAME, 
      values_from = VALUE,
      values_fill = "" )  
  
  keys <- dplyr::tbl( con, paste0( "EFILE", year, ".KEYS" ) )
  key.names <- colnames( keys )
  
  wide_xx <- dplyr::right_join( keys, wide_xx, by = "OBJECTID" )
  
  new.order <- cc_file %>%
    dplyr::filter( rdb_table == table_name ) %>%
    dplyr::arrange( location_code_family, xpath ) %>%
    dplyr::pull( variable_name ) %>%
    unique()
  
  new.order <- new.order[ new.order %in% colnames( wide_xx ) ]
  
  wide_xx <- wide_xx %>% dplyr::relocate( c( key.names, "TABLE_ID", new.order ) )
  
  if ( post_to_s3 ) {
    write_csv_to_s3( db_tbl = wide_xx, table_name, year )
  }
  
  if ( ! post_to_s3 ) {
    fpath <- paste0( "CSV/", table_name, "-", year, ".CSV" )
    wide_xx %>% dplyr::compute( "TEMP", temporary = TRUE, overwrite = TRUE )
    SQL <- paste0( "COPY TEMP TO '", fpath, "' WITH ( HEADER, DELIMITER ',' );" )
    DBI::dbExecute( con, SQL )
  }
  
  return( invisible( wide_xx ) )
}



############
############   SEND RESULTS BACK TO S3 BUCKETS 
############


#' Configure AWS credentials for DuckDB
#'
#' Retrieves AWS credentials from the environment and configures DuckDB for S3 access.
#' @export
configure_aws_credentials <- function() {
  credentials <- aws.signature::locate_credentials()
  DBI::dbExecute( con, paste0( "SET s3_access_key_id='", credentials$key, "';" ) )
  DBI::dbExecute( con, paste0( "SET s3_secret_access_key='", credentials$secret, "';" ) )
  DBI::dbExecute( con, paste0( "SET s3_session_token='", credentials$session_token, "';" ) )
  DBI::dbExecute( con, "SET s3_region='us-east-1';" )
}

#' Write a CSV file to S3 from a DuckDB table
#'
#' Saves a DuckDB table as a CSV file in an S3 bucket.
#' @param db_tbl The DuckDB table to save.
#' @param table_name The name of the table.
#' @param year The dataset year.
#' @export
write_csv_to_s3 <- function( db_tbl, table_name, year ) {

  fn <- paste0( table_name, "-", year, ".CSV" )
  s3_csv_base <- "s3://nccs-efile/public/v2025_03/"
  s3_csv_path <- paste0( s3_csv_base, fn )
  
  db_tbl %>% dplyr::compute( "TEMP", temporary = TRUE )
  SQL <- paste0( "COPY TEMP TO '", s3_csv_path, "' WITH ( HEADER, DELIMITER ',' );" )
  DBI::dbExecute( con, SQL )
}
