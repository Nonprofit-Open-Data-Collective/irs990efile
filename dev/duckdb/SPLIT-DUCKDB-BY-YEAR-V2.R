#####
#####   Write FAILED_URL table to CSV
##### 

# Function to check if a table exists and write it to CSV
export_table_to_csv <- function(con, table_name, output_csv) {

  # Check if the table exists
  table_exists <- 
   dbGetQuery( con, 
     paste0(  "SELECT COUNT(*) AS count FROM information_schema.tables 
               WHERE table_name = '", table_name, "';"
     ))$count > 0

  # If the table exists, export it to CSV
  if (table_exists) {
    
    # Fetch table data
    df <- dbGetQuery(con, paste0("SELECT * FROM ", table_name, ";"))
    
    # Write to CSV
    write.csv( df, output_csv, row.names = FALSE )
    
    print(paste("Table", table_name, "exported"))
  } 
}


#####
#####   Perform the Split and Save Subsets
##### 

library(DBI)
library(duckdb)


factor_by_year( vintage="2022B" )




factor_by_year <- function( vintage ){

  FILENAME <- paste0("EFILE", vintage, ".duckdb")
  FILEPATH <- normalizePath(FILENAME, winslash = "/", mustWork = TRUE)

  # Open the original database connection
  drv <- duckdb::duckdb()
  con_orig <- dbConnect( drv, dbdir = FILENAME, read_only = TRUE)
  dbListTables( con_orig )

  # Ensure FAILED directory exists
  if( ! dir.exists("FAILED") ){ dir.create("FAILED") }

  # Write failed URL list to file
  FN.CSV <- paste0( "FAILED/FAILED-URLS-", vintage, ".CSV" )
  export_table_to_csv( con_orig, table_name="FAILED_URLS", output_csv=FN.CSV )

  # Get distinct TAX_YEAR values
  tax_years <- dbGetQuery(con_orig, "SELECT DISTINCT TAX_YEAR FROM KEYS;")$TAX_YEAR
  tax_years <- sort(tax_years)

  num_rows <- dbGetQuery(con_orig, paste0( "SELECT COUNT(*) AS num_rows FROM KEYS;" ))
  row_count <- list()
  row_count[["TOTAL"]] <- num_rows

  # Disconnect from the original database
  dbDisconnect( con_orig, shutdown = TRUE )
  duckdb::duckdb_shutdown(drv)

  # Ensure SPLITS directory exists
  if (!dir.exists("SPLITS")) { dir.create("SPLITS") }

  # Loop over each TAX_YEAR and create a subset
  for (year in tax_years) {
    print(paste("Processing TAX_YEAR:", year))

    # Define new database file
    DB_OUT   <- paste0( "SPLITS/EFILE_", year, "_FROM_", vintage, ".duckdb" )
    # PATH_OUT <- normalizePath( DB_OUT, winslash = "/", mustWork = TRUE )

    # Create a new connection for the subset database
    drv <- duckdb::duckdb()
    con_subset <- dbConnect( drv, dbdir = DB_OUT )

    # Attach the original database so we can query from it
    dbExecute(con_subset, paste0("ATTACH '", FILEPATH, "' AS orig_db;"))
    dbListTables( con_subset )

    # Create KEYS subset in the new database
    dbExecute(con_subset, paste0("
      CREATE TABLE KEYS AS 
      SELECT * FROM orig_db.KEYS WHERE TAX_YEAR = ", year, ";
    "), immediate = TRUE)

    # Create FLATXML subset in the new database
    dbExecute(con_subset, paste0("
      CREATE TABLE FLATXML AS 
      SELECT f.* FROM orig_db.FLATXML f
      JOIN KEYS k ON f.OBJECTID = k.OBJECTID;
    "), immediate = TRUE)

    # Create ATTRIBUTES subset in the new database
    dbExecute(con_subset, paste0("
      CREATE TABLE ATTRIBUTES AS 
      SELECT a.* FROM orig_db.ATTRIBUTES a
      JOIN KEYS k ON a.OBJECTID = k.OBJECTID;
    "), immediate = TRUE)

    num_rows <- dbGetQuery(con_subset, paste0( "SELECT COUNT(*) AS num_rows FROM KEYS;" ))
    row_count[[paste0("Y_",year)]] <- num_rows
    print( paste0( "NUMBER OF ROWS IN ", year, " KEYS: ", num_rows ) )

    # dbGetQuery(con_subset, "PRAGMA database_list;") 
    print(paste("Saved:", DB_OUT ))

    flush.console()

    # Close the subset database connection
    dbDisconnect( con_subset, shutdown = TRUE )
    duckdb::duckdb_shutdown(drv)
  }

  tot_rows <- row_count[[ "TOTAL" ]]
  cat( paste0( "Original size: ", tot_rows, " rows\n" ) )
  fin <- row_count |> unlist() |> sum() - tot_rows
  cat( paste0( "Final size: ", fin , " rows\n" ) )

  return( row_count )
}


