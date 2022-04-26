

# split one index into smaller groups
# so that if the process is interrupted it 
# can easily be restarted 
# and file sizes stay small 
# while being created 

#' @title Split index into groups
#'
#' @description Split the index into `group.size` in order 
#'  to facilitate batch processing of files. 
#'
#' @details
#'
#' @export
split_index <- function( index, group.size=1000 )
{
  urls <- index$URL
  f <- ( ( 1 : length(urls) ) + group.size - 1 ) %/% group.size
  f <- paste0( "g", f )
  f <- factor( f, levels=unique(f) )
  url.list <- split( urls, f )
  return( url.list )
}

# groups <- split_index( index=xx, group.size=10 )
# x is the specific set of breaks from groups 
# that is sent to the function by sapply 
# 
# index and year must be exported to the clusters 
#
# saves tables to disk and returns failed URLs 



#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
build_tables <- function( urls, year, table.names=NULL )
{

  # urls <- index$URL 
  # data( concordance )
  
  if( is.null(table.names) )
  { 
     rdb.tables <- concordance$rdb_table 
     table.names <- unique( rdb.tables )
     table.names <- table.names[ grepl( "-T00-", table.names ) ]
     table.names <- gsub( "-", "_", table.names )
     table.names <- paste0( "BUILD_", table.names )
  }

  
  all.npos <- list()
  failed.urls <- NULL
  
  
  
  # get all tables from one doc 
  # and save as names tables in 
  for( i in 1:length(urls) )
  { 
  
    url <- urls[i]
    doc <- NULL
    try( doc <- xml2::read_xml( url ), silent=T ) 
    if( is.null(doc) )
    { 
       failed.urls <- c( failed.urls, url )
       next
    }
    xml2::xml_ns_strip( doc )
  
    one.npo <- sapply( table.names, do.call, list( doc, url ) )
    
    one.npo$BUILD_SCHEDULE_TABLE <- get_schedules( doc, url )
  
    all.npos[[i]] <- one.npo
    
  }
  
  print( paste( "There are ", length(failed.urls), " failed XML URLs to re-try." ) )
  
  # add random string so filenames not duplicated
  # when using parallelization 
  time <- format(Sys.time(), "%b-%d-%Y-%Hh-%Mm")
  rand <- paste( sample(LETTERS,5), collapse="" )
  time <- paste0( "time-", time, "-", rand  )
  
  table.names <- c( table.names, "BUILD_SCHEDULE_TABLE" )
  
  for( j in table.names )
  {
    t.name <- substr( j, start=7, stop=nchar(j) )
    t.name <- gsub( "_", "-", t.name )
    df.list <- lapply( all.npos, '[[', j )
    df <- dplyr::bind_rows( df.list )
    saveRDS( df, paste0( year, "-", t.name, "-", time, ".rds" ) )
    # write.csv( df, paste0( year, "-", t.name, "-", time, ".csv" ), row.names=F )
  }

  return( failed.urls )
  
}




# TEST IT
# 
# urls <- index.2018$URL[1:25]  # grab 3 to test below 
# table.names <-  c( "BUILD_F9_P00_T00_HEADER", 
#                    "BUILD_F9_P09_T00_EXPENSES" )
# 
# build_tables( url=urls, table.names, year=2018 )


# not sure how to send arguments to build_tables()
# directly in a parSapply() call. Instead export
# them using clusterExport() then reference them in 
# the parsapply_tables() function 



# Note that we don't pass the variables year and 
# table.name because they are exported by 
# parallel::clusterExport


#' @title Passing arguments to parSapply
#'
#' @description Pass arguments to parallel sapply table function.  
#'
#' @details Helper function to send variables to the build_tables function in parSapply framework. 
#'
#' @export
parsapply_tables <- function( index.group )
{
  require( irs990efile ) 
  failed.urls <- build_tables( index.group, table.names=table.names, year=year ) 
  return( failed.urls )
}





#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
build_tables_parallel <- function( groups, cores, year, table.names=NULL )
{
  
  if( is.null(table.names) )
  { 
     rdb.tables <- concordance$rdb_table 
     table.names <- unique( rdb.tables )
     table.names <- table.names[ grepl( "-T00-", table.names ) ]
     table.names <- gsub( "-", "_", table.names )
     table.names <- paste0( "BUILD_", table.names )
  }
  
  cl <- parallel::makeCluster( cores )
  parallel::clusterExport( cl, varlist = c("year","table.names"), envir=environment() )        # index table.names year
  results <- parallel::parSapply( cl, X=groups, FUN=parsapply_tables )      # returns a list
  parallel::stopCluster( cl )
  failed.urls <- unlist( results )
  return( failed.urls )
  
}



