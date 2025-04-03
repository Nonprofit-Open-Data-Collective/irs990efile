library(DBI)
library(duckdb)

# Connect to DuckDB (either in-memory or persistent)
con <- dbConnect(duckdb::duckdb(), dbdir = ":memory:")

# Load the semi-parquet table into DuckDB
parquet_file <- "your_semi_parquet_file.parquet"
dbExecute(con, paste0("CREATE TABLE xml_data AS SELECT * FROM read_parquet('", parquet_file, "');"))

# Define the possible XPaths (different schema versions)
possible_xpaths <- c(
  "/Return/ReturnData/IRS990/BenefitsPaidToMembersCY",
  "/Return/ReturnData/IRS990/CYBenefitsPaidToMembersAmt",
  "/Return/ReturnData/IRS990/Form990PartI/BenefitsPaidToMembersCurrYear",
  "/Return/ReturnData/IRS990EZ/BenefitsPaidToOrForMembers",
  "/Return/ReturnData/IRS990EZ/BenefitsPaidToOrForMembersAmt"
)

# Construct SQL query to retrieve the first available value
query <- paste0("
  SELECT value FROM xml_data 
  WHERE xpath IN ('", paste(possible_xpaths, collapse = "', '"), "') 
  LIMIT 1")

# Run the query
result <- dbGetQuery(con, query)

# Assign the extracted value to a variable
F9_01_EXP_BEN_PAID_MEMB_CY <- ifelse(nrow(result) > 0, result$value, NA)

# Print result
print(F9_01_EXP_BEN_PAID_MEMB_CY)

# Disconnect from DuckDB
dbDisconnect(con, shutdown = TRUE)


####
####   USING DPLYR FUNCTIONS
####

library(DBI)
library(duckdb)
library(dplyr, warn.conflicts = FALSE)
library(dbplyr)

# Connect to DuckDB database
con <- dbConnect(duckdb::duckdb(), dbdir = "your_database.duckdb")

# Reference the DuckDB table using `tbl()`
xml_tbl <- tbl(con, "xml_data")

# Define possible XPaths
possible_xpaths <- c(
  "/Return/ReturnData/IRS990/BenefitsPaidToMembersCY",
  "/Return/ReturnData/IRS990/CYBenefitsPaidToMembersAmt",
  "/Return/ReturnData/IRS990/Form990PartI/BenefitsPaidToMembersCurrYear",
  "/Return/ReturnData/IRS990EZ/BenefitsPaidToOrForMembers",
  "/Return/ReturnData/IRS990EZ/BenefitsPaidToOrForMembersAmt"
)

# Query the first matching value using `dplyr`
F9_01_EXP_BEN_PAID_MEMB_CY <- xml_tbl %>%
  filter(xpath %in% possible_xpaths) %>%
  select(value) %>%
  collect() %>%  # Executes query and returns data in R
  slice_head(n = 1) %>%
  pull(value)

# Print result
print(F9_01_EXP_BEN_PAID_MEMB_CY)

# Disconnect from DuckDB
dbDisconnect(con, shutdown = TRUE)