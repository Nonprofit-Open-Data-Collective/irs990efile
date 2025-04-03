library(DBI)
library(duckdb)
library(data.table)

# Each batch process creates an in-memory DuckDB instance
con_mem <- dbConnect(duckdb::duckdb(), dbdir = ":memory:")

# Load CSVs into the in-memory database
files <- dir()
get_table_name <- function(x) gsub("\\.csv", "", x)

for (i in files) {
  d <- data.table::fread(i)
  fn <- get_table_name(i)
  dbWriteTable(con_mem, fn, d, overwrite = TRUE)
}

# Attach the persistent DuckDB database on disk
dbExecute(con_mem, "ATTACH 'my_database.duckdb' AS persistent_db;")

# Transfer all 125 tables from the in-memory DB to the persistent DB
tables <- dbListTables(con_mem)

for (tbl in tables) {
  dbExecute(con_mem, sprintf("CREATE TABLE persistent_db.%s AS SELECT * FROM %s;", tbl, tbl))
}

# Close the in-memory instance
dbDisconnect(con_mem, shutdown = TRUE)




install.packages("RSQLite")

library( RSQLite )
library(DBI)

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbListTables(con)

dbWriteTable(con, "mtcars", mtcars)
dbListTables(con)


setwd( "D:/EFILE2/2021" )
files <- grep( "QJEBS", dir(), value=TRUE )

x <- "2021-SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP-time-Jan-28-2025-06h-07m-QJEBS.csv"

get_table_name <- function(x){
  x <- gsub( "^2021-", "", x )
  x <- gsub( "-time-.*", "", x )
  return(x)
}

fns <- get_table_name(files)



con <- dbConnect(RSQLite::SQLite(), ":memory:")
d <- data.table::fread( "filename.csv" )
dbWriteTable( conn=con, name="tablename", value=d )

for( i in files )
{
  d <- data.table::fread( i )
  fn <- get_table_name(i)
  dbWriteTable( con, fn, d )
}

dbListTables(con)

dbListFields( con, "F9-P00-T00-HEADER" )
hd <- dbReadTable( con, "F9-P00-T00-HEADER" )




