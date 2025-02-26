build_database(index, years, batch.size)
¦
+-- prep_index(years, index)
¦
+-- create_batchfiles(index, years, group.size=batch.size)
¦
+-- Loop: for each year in years
¦   ¦
¦   +-- build_one_year(year)
¦   ¦   ¦
¦   ¦   +-- get_batchfile(year)
¦   ¦   ¦
¦   ¦   +-- build_tables_parallel(batch.list, year)
¦   ¦   ¦   ¦
¦   ¦   ¦   +-- send_batch(batch.ids, cl)
¦   ¦   ¦   ¦   +-- parsapply_tables(batch.id)
¦   ¦   ¦   ¦
¦   ¦   ¦   +-- Other parallel processing functions
¦   ¦   ¦
¦   ¦   +-- Error handling and logging
¦   ¦
¦   +-- bind_data(years)
¦   ¦   +-- Merges compiled CSVs
¦   ¦   +-- Processes missing XPath logs
¦   ¦   +-- Cleans up temporary files
¦   ¦
¦   +-- Logging and summary
¦
+-- Save history, finalize logs, and return NULL



