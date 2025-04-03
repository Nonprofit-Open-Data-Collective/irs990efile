library(DBI)
library(duckdb)
library(dplyr)
library(tidyr)

# Connect to DuckDB
con <- dbConnect(duckdb::duckdb(), dbdir = "your_database.duckdb")

# Reference the DuckDB table using `tbl()`
xml_tbl <- tbl(con, "xml_data")

# Extract only the relevant rows (Form990PartVIISectionA entries)
officers_tbl <- xml_tbl %>%
  filter(grepl("/Return/ReturnData/IRS990/Form990PartVIISectionA", xpath)) %>%
  select(table.id, xpath, value, type) %>%
  collect()  # Pulls the data into R for processing

# Transform into a relational format
officers_tbl_wide <- officers_tbl %>%
  filter(type == "leaf") %>%  # Keep only leaf nodes (actual values)
  mutate(xpath = gsub(".*/", "", xpath)) %>%  # Extract the final attribute name
  pivot_wider(names_from = xpath, values_from = value)  # Convert long format to wide

# Print result
print(officers_tbl_wide)

# Disconnect from DuckDB
dbDisconnect(con, shutdown = TRUE)