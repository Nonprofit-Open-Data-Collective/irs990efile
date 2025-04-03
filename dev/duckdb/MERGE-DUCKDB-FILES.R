library(DBI)
library(duckdb)
library(dbplyr)
library(dplyr)

db_files <- c("EFILE_2021_FROM_2022B.duckdb", "EFILE_2021_FROM_2026.duckdb")
output_db <- "EFILE2021W.duckdb"

merge_duckdb_files( db_files, output_db = "EFILE2021W.duckdb" )


merge_duckdb_files <- function(db_files, output_db = "merged_database.duckdb") {
  
  if (length(db_files) < 2) {
    stop("You need at least two DuckDB files to merge.")
  }

  if( ! dir.exists("MERGED") ){ dir.create("MERGED") }
  output_db <- paste0( "MERGED/", output_db )

  # Start a DuckDB connection for the output file
  duck.drv <- duckdb::duckdb()
  con <- dbConnect(duck.drv, dbdir = output_db)

  # Attach all input databases with unique names (db1, db2, db3, ...)
  db_aliases <- paste0("db", seq_along(db_files)) 
  for (i in seq_along(db_files)) {
    dbExecute(con, paste0("ATTACH '", db_files[i], "' AS ", db_aliases[i], ";"))
  }

  # Get list of common tables across all attached databases
  table_list <- c( "ATTRIBUTES", "FLATXML", "KEYS" )

  # Merge tables dynamically
  for (table.name in table_list) {
    print(paste("Merging table:", table.name))
    
    # Create union query for each database
    merged_tbl <- tbl(con, paste0(db_aliases[1], ".", table.name))  # Start with first database
    for (db in db_aliases[-1]) {
      merged_tbl <- union_all(merged_tbl, tbl(con, paste0(db, ".", table.name)))
    }
    
    # Write merged table to output database
    compute( merged_tbl, table.name, temporary = FALSE )
  }

  print("Merge complete. Output saved to: ")
  print(output_db)

  # Disconnect and shutdown to prevent file locks
  dbDisconnect(con, shutdown = TRUE)
  duckdb::duckdb_shutdown(duck.drv)
}






combine_splits <- function( filenames ){

  years <- get_ef_year( filenames ) |> unique()
  purrr::walk( years, merge_year, filenames )

  print( "PROCESSED FILES ARE IN THE MERGED FOLDER" )
  return( dir("MERGED") )
}

get_ef_year <- function( ef ){  substr( ef, 7, 10 ) }

merge_year <- function( year, filenames ){
  stub  <- paste0( "EFILE_", year )
  newfn <- paste0( "EFILE", year, ".duckdb" ) 
  fns   <- grep( stub, filenames, value=TRUE )
  if( length(fns) < 2 ){ 
    # fs::file_copy( fns, paste0("MERGED/", newfn) )
    file.rename( from=fns, to=newfn )
    print( paste0( "Files processed: ", paste0( fns, collapse="; " ) ) )
    return( NULL )
  }
  merge_duckdb_files( fns, output_db = newfn )
  print( paste0( "YEAR ", year, "MERGED" ) )
  print( paste0( "Files processed: ", paste0( fns, collapse="; " ) ) )

}






filenames <- 
c("EFILE_2009_FROM_2009.duckdb", "EFILE_2011_FROM_2009.duckdb", 
"EFILE_2019_FROM_2009.duckdb", "EFILE_2020_FROM_2009.duckdb", 
"EFILE_2021_FROM_2022B.duckdb", "EFILE_2021_FROM_2026.duckdb", 
"EFILE_2022_FROM_2026.duckdb", "EFILE_2023_FROM_2026.duckdb")

combine_splits( filenames )









#############################################




merge_duckdb_files <- function( db_files, output_db = "merged_database.duckdb") {

  # Ensure at least two databases are provided
  if (length(db_files) < 2) {
    stop("You need at least two DuckDB files to merge.")
  }
  
  # Open an in-memory DuckDB connection
  duck.drv <- duckdb::duckdb()
  con <- dbConnect( duck.drv, dbdir = output_db )
  # con <- dbConnect( duck.drv, dbdir = ":memory:" )
  
  # Attach all input databases with unique names (db1, db2, ..., dbk)
  db_aliases <- paste0( "db", seq_along(db_files) ) 
  for (i in seq_along(db_files)) {
    dbExecute( con, paste0("ATTACH '", db_files[i], "' AS ", db_aliases[i], ";") )
  }


  # dbGetQuery(con, "
  #   SELECT table_name, table_schema
  #   FROM information_schema.tables
  #   ORDER BY table_schema;
  #  ")

  # dbGetQuery(con, "PRAGMA database_list;") 
  # dbListTables( con )
  # print(dbGetQuery(con, "SELECT * FROM db1.KEYS LIMIT 5"))
  # print(dbGetQuery(con, "SELECT * FROM db2.KEYS LIMIT 5"))




  library( dbplyr )
  library( dplyr )
  keys1 <- tbl( con, "db1.KEYS" )
  keys2 <- tbl( con, "db2.KEYS" )

  keys <- union_all( keys1, keys2 )
  compute( keys, 'KEYS3', temporary = FALSE )

  # print(dbGetQuery(con, "SELECT * FROM KEYS2 LIMIT 5"))

  dbListTables( con )

  dbDisconnect( con, shutdown = TRUE )
  duckdb::duckdb_shutdown( duck.drv )


  # Get table names from the first database
  tables <- dbGetQuery(con, paste0("SELECT table_name FROM ", db_aliases[1], ".information_schema.tables;"))$table_name
  
  # Attach the output database
  dbExecute( con, paste0("ATTACH '", output_db, "' AS merged;") )

  # Loop over each table and merge rows from all databases
  for (table in tables) {
    table_exists_in_all <- all(sapply(db_aliases, function(db) {
      table %in% dbGetQuery(con, paste0("SELECT table_name FROM ", db, ".information_schema.tables;"))$table_name
    }))

    if (table_exists_in_all) {
      print(paste("Merging table:", table))

      # Construct the UNION ALL query to merge all databases
      union_query <- paste(sapply(db_aliases, function(db) {
        paste0("SELECT * FROM ", db, ".", table)
      }), collapse = " UNION ALL ")

      # Create the merged table
      dbExecute(con, paste0("CREATE TABLE merged.", table, " AS ", union_query, ";"))
    }
  }

  print(paste("Merged database saved as:", output_db))
  
  # Disconnect
  dbDisconnect( con, shutdown = TRUE )
  duckdb::duckdb_shutdown( duck.drv )
}



# List of DuckDB files to merge
duckdb_files <- c("EFILE2009.duckdb", "EFILE2011.duckdb", "EFILE2013.duckdb")

# Call function to merge
merge_duckdb_files(duckdb_files, output_db = "EFILE_MERGED.duckdb")

# Verify the merged database
con <- dbConnect(duckdb::duckdb(), dbdir = "EFILE_MERGED.duckdb")
print(dbListTables(con))
dbDisconnect(con)












