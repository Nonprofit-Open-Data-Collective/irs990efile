build_database(index, years, batch.size)
¦
+-- future::plan(multisession, workers = availableCores() - 1)  # Set parallelization strategy
¦
+-- prep_index(years, index)
¦
+-- create_batchfiles(index, years, group.size=batch.size)
¦
+-- furrr::future_map(years, build_one_year, .progress = TRUE)  # Run years in parallel
¦   ¦
¦   +-- build_one_year(year)
¦   ¦   ¦
¦   ¦   +-- get_batchfile(year)
¦   ¦   ¦
¦   ¦   +-- furrr::future_map(batch.list, build_tables_parallel, .progress = TRUE)  # Parallel batch processing
¦   ¦   ¦   ¦
¦   ¦   ¦   +-- build_tables_parallel(groups, year, fx.names)
¦   ¦   ¦   ¦   ¦
¦   ¦   ¦   ¦   +-- furrr::future_map(groups, parsapply_tables, .progress = TRUE)  # Process batches in parallel
¦   ¦   ¦   ¦   ¦   +-- parsapply_tables(batch.id, batch.list, fx.names, year)
¦   ¦   ¦   ¦   ¦   +-- build_tables(urls, year, fx.names)  # Processes tables from URLs
¦   ¦   ¦   ¦   ¦       +-- furrr::future_map(urls, parse_npo, fx.names, .progress = TRUE)
¦   ¦   ¦   ¦   ¦       +-- purrr::walk(fx.names, get_fxdf, all.npos, time, year)
¦   ¦   ¦   ¦   ¦       +-- Log failed URLs
¦   ¦   ¦   ¦   ¦
¦   ¦   ¦   ¦   +-- send_batch(batch.ids, batch.list, fx.names, year)  # Batch processing in parallel
¦   ¦   ¦   ¦   ¦   +-- furrr::future_map(batch.ids, parsapply_tables, .progress = TRUE)
¦   ¦   ¦   ¦   ¦   +-- Log errors for failed batches
¦   ¦   ¦   ¦   ¦   +-- Remove completed batches from queue
¦   ¦   ¦   ¦   ¦
¦   ¦   ¦   ¦   +-- Log errors and failures
¦   ¦   ¦   ¦
¦   ¦   ¦   +-- Error handling and logging
¦   ¦   ¦
¦   ¦   +-- Summary logs for year
¦   ¦
¦   +-- bind_data(years)  # Merges compiled data
¦   ¦   +-- Consolidates CSV files
¦   ¦   +-- Aggregates missing XPath logs
¦   ¦   +-- Cleans up temporary files
¦   ¦
¦   +-- Logging and summary
¦
+-- Save history, finalize logs, and return NULL