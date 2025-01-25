###---------------------------------------------------
###   BUILD FULL DATABASE
###---------------------------------------------------

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
build_database <- function(index=NULL, years=NULL)
{
    start.build.time <- Sys.time()

    if (is.null(index)) {
        index <- build_index()
    }
    
    index <- dplyr::filter(index, FormType %in% c("990", "990EZ"))
    index <- index %>% dplyr::distinct( URL, .keep_all = TRUE )

    if (is.null(years)) {
        years <- index[["TaxYear"]] |> unique()         
    }
    years <- years |> as.character() |> sort()
    index <- dplyr::filter(index, TaxYear %in% years)
    saveRDS(index, "build-index.rds")

    session.info <- sessionInfo()
    dump(list = "session.info", file = "SESSION-INFO.R")

    zz <- file("BUILD-LOG.txt", open = "wt")
    sink( zz, split = TRUE )
    sink( zz, type = "message", append=TRUE )

    print(paste0("There are ", nrow(index), " returns in this build."))
    print(paste0("Years: ", paste0(years, collapse = ";")))
    print(paste0("You have ", parallel::detectCores(), " cores available for parallel processing."))
    print(paste0("DATABASE BUILD START TIME: ", Sys.time()))
    print(paste0("###########################"))
    print(paste0("###########################"))

    for (i in years) 
    {
        print(paste0("STARTING LOOP ", i))

        index.i <- dplyr::filter(index, TaxYear == i)
        print(paste0("There are ", nrow(index.i), " returns in ", i, "."))

        groups <- split_index(index.i, group.size = 200)
        print(paste0("There are ", length(groups), " groups being sent for parallel collection."))

        dir.create(as.character(i))
        setwd(as.character(i))
        start.time <- Sys.time()
        failed.urls <- build_tables_parallel(groups = groups, year = i)
        end.time <- Sys.time()
        setwd("..")

        print(paste0("There were ", length(failed.urls), " failed URLS"))
        print(paste0("Time for the ", i, " loop: ", round(difftime(end.time, start.time, units = "hours"), 2), " hours"))
        print(paste0("###########################"))
        print(paste0("###########################"))

        saveRDS( failed.urls, paste0("../FAILED-URLS-", i, ".rds") )
    }

    # combine split files into /COMPILED/ folder
    # aggregate xpath and odd case logs:
    # > MISSING-XPATHS.txt
    # > COLLAPSED-RECORDS.txt
    bind_data(years = years)

    end.build.time <- Sys.time()
    print(paste0("DATABASE BUILD FINISH TIME: ", Sys.time()))
    print(paste0("TOTAL BUILD TIME: ", round(difftime(end.build.time, start.build.time, units = "hours"), 2), " HOURS"))

    sink(type = "message")
    sink()
    close(zz)
    file.show("BUILD-LOG.txt")

    savehistory("build-history.Rhistory")

    return(NULL)
}

#' Combine Table Segments
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
    data.table::fwrite( df, "MISSING-XPATHS-ALL.CSV" ) 
    tb <- df %>% count_xpaths()
    data.table::fwrite( tb, "MISSING-XPATHS-COUNT.CSV" )

    recs <- unlist( DFR )
    fileConn <- file( "COLLAPSED-RECORDS-ALL-YEARS.txt" )
    writeLines( recs, fileConn )
    close( fileConn )

}


