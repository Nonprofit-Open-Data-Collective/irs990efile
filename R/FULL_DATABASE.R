###---------------------------------------------------
###   BUILD FULL DATABASE
###---------------------------------------------------


#' Split Index into Groups
#'
#' Divides a vector of URLs into smaller groups of a specified size.
#'
#' @param index A data frame containing a column `URL` with URLs to be split.
#' @param group.size An integer specifying the maximum size of each group.
#'
#' @return A list of URL groups.
#' @examples
#' groups <- split_index(index, group.size = 1000)
#' @export
split_index <- function( year, index, group.size = 1000) {
  index <- prep_index( years=year, index )
  urls <- index[["URL"]]
  f <- ((1:length(urls)) + group.size - 1) %/% group.size
  f <- paste0("G", f)
  f.names <- unique(f)
  f <- factor(f, levels = f.names )
  url.list <- split(urls, f)
  dir.create( as.character(year), showWarnings=F )
  saveRDS( url.list, paste0(year,"/BATCHFILE.RDS") )
  return(invisible(url.list))
}

#' Apply split_index() to All Years
#'
#' Create YEAR folders and one BATCHFILE list in each.  
#'
#' @param index An index data frame containing columns `URL` and `TaxYear`.
#' @param years A vector of years that will be included in the build.
#' @param group.size An integer specifying the size of each batch used in parallel processing.
#'
#' @return NULL.
#' @examples
#' create_batchfiles( tinyindex, years=2020:2022, group.size=100 )
#' @export
create_batchfiles <- function( index, years, group.size ){
  years <- as.character(years)
  purrr::walk( years, split_index, index=index, group.size=group.size )
}

#' Create Batch Labels from a BATCHFILE
#'
#' Batch ids contain the batch name + size (number of URLs in the batch)  
#'   using the format NAME{SIZE} (g1{100}, g2{100}, etc.). 
#'
#' @param path The location of the BATCHFILE, defaults to the current directory.
#'
#' @return A character vector of batch IDs. 
#' @examples
#' create_batchfiles( tinyindex, years=2020:2022, group.size=100 )
#' get_batch_ids( path=2021 )
#' @export
get_batch_ids <- function( path="." ){
  if( ! file.exists(paste0(path,"/BATCHFILE.RDS")) ){  
    print( "NO BATCHFILE EXISTS" )
    return(NULL) }
  batch.list <- readRDS(paste0(path,"/BATCHFILE.RDS"))
  v1  <- names( batch.list )
  if( length(v1) == 0 ){ return(NULL) }
  v2  <- sapply( batch.list, length )
  ids <- paste0( v1, "{", v2, "}" )
  return(ids)
}

#' Parse Batch IDs and Return Batch Counts
#'
#' Parse the batch IDs (e.g. g1{100},g2{70}) and return  
#'   only the batch counts (100,70).  
#'
#' @param batch.ids Vector created by get_batch_ids()
#'
#' @return A numeric vector of batch counts.  
#' @examples
#' batch.ids <- c("g1{100}","g2{100}","g3{50}")
#' get_batch_counts( batch.ids )
#' @export
get_batch_counts <- function( batch.ids ){
  x <- stringr::str_match( batch.ids, ".*\\{([0-9]+)\\}")[, 2]
  n <- as.numeric(x)
  return(n)
}

#' Parse Batch IDs and Return Batch Names
#'
#' Parse the batch IDs (e.g. g1{100},g2{70}) and return  
#'   only the batch names ("g1","g2"). The batch names
#'   are used to retrieve URLs from the BATCHFILE and
#'   to delete the group from BATCHFILE after processing. 
#'
#' @param batch.ids Vector created by get_batch_ids()
#'
#' @return A character vector of batch names.   
#' @examples
#' batch.ids <- c("g1{100}","g2{100}","g3{50}")
#' get_batch_names( batch.ids )
#' @export
get_batch_names <- function( batch.ids ){
  x <- stringr::str_match( batch.ids, "(G[0-9]+)\\{[0-9]+\\}")[, 2]
  return(x)
}


#' Remove Batch of URLs from Queue
#'
#' Extracts and writes table data from URLs.
#'
#' @param x Batch name ("g1","g2",...) created from split_index()
#'
#' @return NULL
#' @examples
#' groups <- split_index( tinyindex )
#' L <- readRDS("BATCHFILE.RDS")
#' names(L)
#' remove_batch( "g3" )
#' L <- readRDS("BATCHFILE.RDS")
#' names(L)
#' @export
remove_batch <- function(x){
  L <- readRDS("BATCHFILE.RDS")
  L[[x]] <- NULL
  saveRDS( L, "BATCHFILE.RDS" )
}


#' Apply Specified Filters to the Build Index 
#'
#' @param index A Data Commons index from build_index(), get_current_index_full(), or get_current_index_batch().
#' @param year The desired years of the database to create. 
#'
#' @return A filtered index file. 
#' @examples
#' index <- get_current_index_batch()
#' index <- prep_index( index, years=2023 )
#' @export
prep_index <- function( years=NULL, index=NULL, form.type=c("990", "990EZ") ){
    if (is.null(index)) { index <- build_index() }
    if (is.null(years)) { years <- index[["TaxYear"]] |> unique() }
    years <- years |> as.character() |> sort()
    index <- dplyr::filter(index, TaxYear %in% years)
    index <- dplyr::filter(index, FormType %in% form.type )
    index <- index %>% dplyr::distinct( URL, .keep_all = TRUE )
    return(index)
}    


#' Database Build Steps for a Year of Data
#'
#' Using the BATCHFILE created by create_batchfiles(), 
#'   load the list of batched URLs, then send each
#'   batch to a CORE for XML parsing using parallel 
#'   processing functions. 
#' 
#' @param year The year of data you would like processed.
#'
#' @return The build_tables() function serves as the workhorse
#'   when parsing XML files into rectangular RDB tables. The
#'   function saves batched CSV files in the YEAR subfolder. 
#' 
#' @details The function should be run from the main project 
#'   folder that contains the YEAR subfolders created by 
#'   create_batchfiles(). A YEARX folder containing a BATCHFILE
#'   should exist when calling build_one_year( year=YEARX ).
#'
#' @examples
#' create_batchfiles( tinyindex, years=2020:2022, group.size=100 )
#' build_one_year( year=2021, index=tinyindex )
#' @export
build_one_year <- function( year, index=NULL ){

  setwd( as.character(year) )
  on.exit( setwd("..") )  # return to main folder on exit
  
  batch.ids <- get_batch_ids()
  n.urls <- get_batch_counts( batch.ids ) |> sum()
  
  start.time <- Sys.time()
  cat(paste0("STARTING YEAR ", year, "\n"))
  cat(paste0("There are ", n.urls, " returns in ", year, ".\n"))
  if( n.urls < 1 ){ return(NULL) }
  cat(paste0("There are ", length(batch.ids), " groups being sent for parallel collection.\n\n"))
  
  failed.urls <- build_tables_parallel( batch.ids = batch.ids, year = year )
  
  end.time <- Sys.time()
  total.mins <- difftime( end.time, start.time, units = "mins" ) |> round(2)
  
  cat(paste0("\nThere were ", length(failed.urls), " failed URLS\n"))
  cat(paste0("Time for the ", year, " loop: ", total.mins, " minutes\n\n"))
  cat(paste0("###########################\n"))
  cat(paste0("###########################\n\n"))

}


#' Build a Complete Database
#'
#' This function builds a database of IRS 990 e-filers available on AWS.
#'
#' @param index An optional index file created from `build_index()`. If not provided, it will be generated automatically.
#' @param years A vector of tax years to include in the build. If NULL, all available years are included.
#'
#' @return Saves log files, database tables, and build information to the local environment. Returns NULL.
#' @details The function filters forms by type (990, 990EZ) and processes the specified tax years. Logs and session information are saved for reproducibility.
#' @examples
#' \dontrun{
#' index <- build_index()
#' build_database(index, years = 2015:2017)
#' }
#' @export
build_database <- function(index=NULL, years=NULL, batch.size=1000) {

    index <- prep_index( years=years, index=index )
    
    if (is.null(years)) 
    { years <- index[["TaxYear"]] |> unique() |> as.character() |> sort() }

    create_batchfiles( index, years, group.size=batch.size )
    dir.create("HIST")
    
    #-------------
    
    start.build.time <- Sys.time()
    session.info <- sessionInfo()
    dump(list = "session.info", file = "HIST/SESSION-INFO.R")
    saveRDS( index, "HIST/build-index.rds" )
    
    # Redirect standard output and messages
    zz <- file( "BUILD-LOG.txt", open = "at" )
    sink( zz, split = TRUE )                            # Redirect standard output
    sink( zz, type = "message", append = TRUE )         # Redirect messages

    on.exit({
      sink(type = "message")      # Restore message output to console
      sink()                      # Restore standard output
      close(zz)                   # Close the file connection
      file.show("BUILD-LOG.txt")  # View the logs
    })
    
    cat(paste0("\nDATABASE BUILD START TIME: ", Sys.time(),"\n\n"))
    cat(paste0("You have ", parallel::detectCores(), " cores available for parallel processing.\n"))
    cat(paste0("Years: ", paste0(years, collapse = ";"),"\n"))
    cat(paste0("There are ", nrow(index), " returns in this build.\n\n"))
    cat( table( index$TaxYear ) |> knitr::kable(), sep="\n" )
    cat(paste0("\n###########################\n"))
    cat(paste0("###########################\n\n"))
    
    print(showConnections(all = TRUE))  # Check open connections before running functions
    
    for (i in years) 
    {
        build_one_year( i )
        flush.console()
    }
    
    print(showConnections(all = TRUE))  # Check open connections after execution

    cat(paste0("COMPILING FILES\n\n"))
    cat(paste0("###########################\n"))
    cat(paste0("###########################\n\n"))
    
    # combine split files into /COMPILED/ folder
    # aggregate xpath and odd case logs:
    # > MISSING-XPATHS.txt
    # > COLLAPSED-RECORDS.txt
    bind_data(years = years)

    end.build.time <- Sys.time()
    cat(paste0("DATABASE BUILD FINISH TIME: ", Sys.time(), " \n"))
    cat(paste0("TOTAL BUILD TIME: ", round(difftime(end.build.time, start.build.time, units = "hours"), 2), " HOURS\n\n"))

    savehistory("HIST/build-history.Rhistory")
     
    return(NULL)
}


#' @title Resume build_database() if Interrupted.   
#' @description If you need to pause build_database() before 
#'   it is complete or your computer restarts you can resume
#'   the process from the stop point. 
#' @param index Use the same index object that was originally passed to build_database().
#'   If left NULL it loads the version that is saved when build_database() is first called (build-index.rds). 
#' @param years A vector of years remaining in the build. If NULL, all index years will be attempted. 
#' @export
resume_build_database <- function( years=NULL, index=NULL ) {

    if( is.null(index) ){ index <- readRDS( "HIST/build-index.rds" ) }
    
    if (is.null(years)) 
    { years <- index[["TaxYear"]] |> unique() |> as.character() |> sort() }

    index <- prep_index( years=years, index=index )
    
    #-------------
    
    closeAllConnections()

    start.build.time <- Sys.time()
    
    zz <- file("BUILD-LOG.txt", open = "at")
    sink( zz, split = TRUE )
    sink( zz, type = "message", append=TRUE )

    on.exit({
      sink(type = "message")      # Restore message output to console
      sink()                      # Restore standard output
      close(zz)                   # Close the file connection
      file.show("BUILD-LOG.txt")  # View the logs
    })
    
    cat(paste0("#--------------------------------#\n"))
    cat(paste0("\n\nRESUMING DATABASE BUILD"))
    cat(paste0("###########################\n"))
    cat(paste0("###########################\n\n"))
    
    cat(paste0("NEW DATABASE BUILD START TIME: ", Sys.time(),"\n")) 
    cat(paste0("You have ", parallel::detectCores(), " cores available for parallel processing.\n"))
    cat(paste0("There are ", nrow(index), " returns in this build.\n"))
    cat(paste0("Years: ", paste0(years, collapse = ";"),"\n\n"))
    cat(paste0("###########################\n"))
    cat(paste0("###########################\n\n"))
    
    for (i in years) 
    {
        build_one_year( i )
        flush.console()
    }

    # combine split files into /COMPILED/ folder
    # aggregate xpath and odd case logs:
    # > MISSING-XPATHS.txt
    # > COLLAPSED-RECORDS.txt
    bind_data(years = years)

    end.build.time <- Sys.time()
    cat(paste0("DATABASE BUILD FINISH TIME: ", Sys.time(), " \n"))
    cat(paste0("TOTAL BUILD TIME: ", round(difftime(end.build.time, start.build.time, units = "hours"), 2), " HOURS \n\n"))

    savehistory("build-history.Rhistory")

    return(NULL)
}



#' Combine Batched CSV Files
#'
#' Combines all raw table files generated during parallel processing into compiled data.
#'
#' @param years A vector of tax years to compile. These correspond to subdirectories containing raw table files.
#'
#' @return Saves compiled data tables as CSV and RDS files in the "COMPILED" directory.
#' @details The function loops through raw table files, consolidates them by table name, and ensures unique entries. Results are stored for each tax year.
#' @examples
#' \dontrun{
#' bind_data(years = 2015:2017)
#' }
#' @export
bind_data <- function(years)
{
    dir.create("COMPILED")

    years <- as.character(years)
    for (i in years) 
    {
        setwd(i)
        file.names <- dir()

        # Drop the dates from the end and combine years
        x <- substr(file.names, 6, nchar(file.names) - 30)
        table.names <- unique(x)
        table.names <- table.names[!table.names == ""]

        for (j in table.names) 
        {
            these <- grepl(j, file.names) & grepl("*.csv", file.names)
            loop.list <- file.names[these]

            dk.list <- list()
            for (k in loop.list) 
            {
               if( file.info(k)$size > 0 )
               { 
                 d.k <- data.table::fread( k, colClasses="character" ) 
                 dk.list[[ k ]] <- d.k  
               }
            }

            d <- dplyr::bind_rows( dk.list )
            if( nrow(d)==0 ){ next }
            d <- unique(d)

            # Drop the -time from table name
            j <- substr(j, 1, nchar(j) - 5)

            data.table::fwrite(d, paste0("../COMPILED/", j, "-", i, ".csv"), row.names = FALSE)

        } # End j loop

        setwd("..")

    } # End i loop

    # collapsed records are 
    # cases that should be a single
    # value but are not
    
    # missing xpaths are those in
    # the xml files but not the
    # concordance 
    
    dir.create("FIX")
    
    DFX <- list()  # missing xpaths
    DFR <- list()  # collapsed records
    
    for( k in years )
    {
        setwd( k )
        DFX[[k]] <- get_missing_xpath_df()

        fn.k <- paste0( "COLLAPSED-RECORDS-", k, ".txt" )
        if( file.exists(fn.k) ){
          DFR[[k]] <- readLines( fn.k )
        }
        setwd("..")
    }
        
    df <- dplyr::bind_rows( DFX )
    data.table::fwrite( df, "FIX/MISSING-XPATHS-ALL.CSV" ) 
    tb <- df %>% count_xpaths()
    data.table::fwrite( tb, "FIX/MISSING-XPATHS-COUNT.CSV" )

    recs <- unlist( DFR )
    if( length(recs) > 0 )
    { 
      fileConn <- file( "FIX/COLLAPSED-RECORDS-ALL-YEARS.txt" )
      writeLines( recs, fileConn )
      close( fileConn )
    }

}


