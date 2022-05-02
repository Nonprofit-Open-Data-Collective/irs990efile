###---------------------------------------------------
###   BUILD FULL DATABASE
###---------------------------------------------------

#' @title
#' Build a complete database 
#'
#' @description
#' Build a database of IRS 990 efilers available on AWS
#'
#' @details
#' To be added... 
#'
#' @param index An index file created from `build_index()`. 
#' @param years The TaxYears to include in the build.
#' 
#' @return Saves log files and database tables to your computer.  
#'
#' @examples
#' \dontrun{
#' index <- build_index( )
#' build_database( index, years=2015:2017 )
#' }
#' @export
build_database <- function( index=NULL, years=NULL )
{
  
  start.build.time <- Sys.time()
  
  if( is.null(index) )
  { index <- build_index() }
  index <- dplyr::filter( index, FormType %in% c("990","990EZ") )
  
  if( is.null(years) )
  { years <- sort(unique( index$TaxYear )) }
  index <- dplyr::filter( index, TaxYear %in% years )
  saveRDS( index, "build-index.rds" )

  session.info <- sessionInfo()
  dump( list="session.info", file="SESSION-INFO.R" )
  
  zz <- file( "BUILD-LOG.txt", open = "wt" )
  sink( zz, split=T )
  sink( zz, type = "message", append=TRUE )
  
  print( paste0( "There are ", nrow(index), " returns in this build." ) )
  print( paste0( "Years: ", paste0( years, collapse=";" ) ) )
  print( paste0( "You have ", parallel::detectCores(), " cores available for parallel processing." ) )
  print( paste0( "DATABASE BUILD START TIME: ", Sys.time() ) )
  print( paste0( "###########################" ) )
  print( paste0( "###########################" ) )
  
  
  for( i in years )
  {
    
    print( paste0( "STARTING LOOP ", i ) )

    index.i <- dplyr::filter( index, TaxYear == i )
    print( paste0( "There are ", nrow(index.i), " returns in ", i, "." ) )
  
    groups <- split_index( index.i, group.size = 200 )
    print( paste0( "There are ", length(groups), " groups being sent for parallel collection." ) )
  
    dir.create( as.character(i) )
    setwd( as.character(i) )
    start.time <- Sys.time()
    failed.urls <- build_tables_parallel( groups=groups, year=i )
    end.time <- Sys.time()
    setwd( ".." )
  
    print( paste0( "There were ", length(failed.urls), " failed URLS" ) )
    print( paste0( "Time for the ", i, " loop (hours): ", round( difftime( end.time, start.time, units="hours" ), 2 ) ) )
    print( paste0( "###########################" ) )
    print( paste0( "###########################" ) )
    
    saveRDS( failed.urls, paste0("FAILED-URLS-", i, ".rds") )
  
  }

  bind_data( years=years )
  
  end.build.time <- Sys.time()
  print( paste0( "DATABASE BUILD FINISH TIME: ", Sys.time() ) )
  print( paste0( "TOTAL BUILD TIME: ", round( difftime( end.build.time, start.build.time, units="hours" ), 2 ) )

  sink(type = "message")
  sink()      # close sink
  close(zz)   # close connection
  file.show( "BUILD-LOG.txt" )
        
  savehistory( "build-history.Rhistory" ) 
  
  return( NULL )
}


#' @title
#' Combine table segments.  
#'
#' @description
#' Combine all of the raw table files created during parallel processing. 
#'
#' @details
#' To be added... 
#'
#' @export
bind_data <- function( years )
{
   dir.create( "COMPILED" )
  
   for( i in years )
   {
     setwd( as.character(i) )
     file.names <- dir()
     
     # drop the dates from the end and combine years
     x <- substr( file.names, 6, nchar(file.names)-30 )
     table.names <- unique(x)
     table.names <- table.names[ ! table.names == "" ] 

     for( j in table.names )
     {
       these <- grepl( j, file.names ) & grepl( "*.rds", file.names )
       loop.list <- ( file.names )[ these ]

       d <- NULL

       for( k in loop.list )
       {
           d.k <- readRDS( k )
           d <- dplyr::bind_rows( d, d.k )
       }

       d <- unique(d)

       # drop the -time from table name 
       j <- substr( j, 1, nchar(j)-5 )
     
       write.csv( d, paste0( "../COMPILED/", j, "-", i, ".csv" ), row.names=F )
       saveRDS(   d, paste0( "../COMPILED/", j, "-", i, ".rds") )
       
     } # end j loop
     
     setwd( ".." )
     
   } # end i loop 
}

