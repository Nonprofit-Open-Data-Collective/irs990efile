

GET_AWS_INDEX.R
---------------
|-- get_last_n_dates(N = 30)
|-- url_is_valid(url)
|-- find_current_index_full(days = 100)
|-- find_current_index_batch(days = 100)
|-- get_url_status(url)
|-- get_url_status_df(days = 30)
|-- download_current_index_full()
|-- get_current_index_full( TIMEOUT=600 )
|-- get_current_index_batch( TIMEOUT=600 )
|-- get_index_list_awscli()
|-- extract_filenames_full(strings)
|-- extract_filenames_batch(strings)
|-- extract_dates(x)
|-- find_most_recent_date(dates)
|-- get_current_index_full_awscli()
|-- get_all_batch_indices_awscli()

GET_INDEX.R
-----------
|-- build_index( tax.years=NULL )
|-- valid_url( URL , t=2 )
|-- update_package_index_files( index=NULL, formtype=c("990","990EZ")

GET_KEYS.R
----------
|-- get_keys( doc, url )



TABLE_HEADERS.R
---------------
|-- get_table_headers()

UTILS.R
-------
|-- get_concordance( gh=TRUE )
|-- get_object_id( url )
|-- retrieve_xml( doc, TEMP_VAR )
|-- zeroPC( var )
|-- zeroEZ( var )
|-- zeroALL( var )
|-- standardize_boole( x )
|-- namedList(...)
|-- get_year( index, year )
|-- format_ein( x, to="id" )
|-- simplify_varnames( d, sep="", drop.prefix=TRUE )
|-- log_collapsed_record( varname, ein=ORG_EIN, year=TAX_YEAR, url=URL )
|-- log_failed_url( URL )
|-- log_missing_xpaths( doc, url )
|-- xp_to_df(x)
|-- get_missing_xpath_df( path=NULL )
|-- count_xpaths( df )
|-- test_build( path="." )
|-- update_xpaths()
|-- update_concordance()
|-- update_tinyindex()



Document1.R
-----------
|-- build_database(index=NULL, years=NULL, batch.size=1000)
|-- build_one_year( year, index=NULL )


Document3.R
-----------
|-- build_database(index = NULL, years = NULL)
|-- bind_data(years)
|-- build_tables_parallel(groups, year, fx.names = NULL)
|-- build_tables(urls, year, fx.names = NULL, table.names = NULL)

Document4.R
-----------
|-- send_batch(batch.ids, batch.list, fx.names, year)
|-- parsapply_tables(batch.id, batch.list, fx.names, year)

Document5.R
-----------
|-- build_tables_parallel(groups, year, fx.names = NULL)
|-- build_tables(urls, year, fx.names = NULL, table.names = NULL)
|-- send_batch(batch.ids, batch.list, fx.names, year)
|-- parsapply_tables(batch.id, batch.list, fx.names, year)

Document6.R
-----------
|-- build_tables_parallel(groups, year, fx.names = NULL)
|-- build_one_year(year, index = NULL)
|-- build_database(index=NULL, years=NULL, batch.size=1000)



FULL_DATABASE.R
---------------
|-- split_index( year, index, group.size = 25)
|-- create_batchfiles( index, years, group.size )
|-- get_batchfile( year )
|-- get_batch_ids( batch.list=NULL, path="." )
|-- get_batch_counts( batch.ids )
|-- get_batch_names( batch.ids )
|-- remove_batch(x)
|-- prep_index( years=NULL, index=NULL, form.type=c("990", "990EZ")
|-- build_one_year( year, index=NULL )
|-- build_database(index=NULL, years=NULL, batch.size=1000)
|-- resume_build_database( years=NULL, index=NULL )
|-- bind_data(years)

TABLE_FUNCTIONS.R
-----------------
|-- get_table_names( exclude = c("T99")
|-- get_fx_names( table.names=NULL )
|-- get_fxdf(fx.name, all.npos, time, year)
|-- parse_npo( url, fx.names, logXP=TRUE )
|-- build_tables(urls, year, fx.names = NULL)
|-- parsapply_tables( batch.id )
|-- build_tables_parallel( batch.list, year, fx.names = NULL)
|-- send_batch(batch.ids, cl)



TABLE_FUNCTIONS_RDB.R
---------------------
|-- find_table_headers( table.name )
|-- get_var_map( table.name )
|-- re_name( df, v.map )
|-- collapse_nodes( lc.xpaths )
|-- drop_empty_nodes( nodeset )
|-- get_table_v2( doc, table.name, table.headers )


