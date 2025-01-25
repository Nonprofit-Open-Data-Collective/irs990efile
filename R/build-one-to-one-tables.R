

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
#' @details some additional details
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
parse_npo <- function( url, fx.names ) {

  # check if XML exists at URL 
  doc <- NULL
  try( doc <- xml2::read_xml( url ), silent=T ) 
  if( is.null(doc) )
  { 
     one.npo <- list()
     one.npo[["FAIL"]] <- url
     return( one.npo )
  }
  
  xml2::xml_ns_strip( doc )
  one.npo <- sapply( fx.names, do.call, list( doc, url ) )
  one.npo[["BUILD_SCHEDULE_TABLE"]] <- get_schedules( doc, url )
  return( one.npo )
}


#' @title Combine like tables from a named list 
#'
#' @description Extract all tables indexed as fx.name from the list.   
#'
#' @details The parse_npo function returns a named list with
#'    elements corresponding to rdb_tables in the concordance,
#'    indexed by their function names instead of table names.
#'    The get_fxdf function identifies all list elements 
#'    corresponding to the fx.name and returns a data frame.
#'
#' @export
get_fxdf <- function( fx.name, all.npos, time, year ){
  t.name <- substr( fx.name, start=7, stop=nchar(fx.name) )
  t.name <- gsub( "_", "-", t.name )
  df.list <- lapply( all.npos, '[[', fx.name )
  df <- dplyr::bind_rows( df.list )
  saveRDS( df, paste0( year, "-", t.name, "-", time, ".rds" ) )
  # write.csv( df, paste0( year, "-", t.name, "-", time, ".csv" ), row.names=F )  
}


#  time <- format(Sys.time(), "%b-%d-%Y-%Hh-%Mm")
#  year <- 2018
#  all.npos <- map( urls, parse_npo, fx.names )
#  get_fxdf( fx.name="BUILD_F9_P07_T01_COMPENSATION", all.npos, time, year ) 
#  # do all tables: 
#  fx.names <- c( fx.names, "BUILD_SCHEDULE_TABLE" )
#  walk( fx.names, get_fxdf, all.npos, time, year )


#' @title get build functions  
#'
#' @description Get available build functions from the concordance file.   
#'
#' @details Each rdb_table in the concordance file has a corresponding build function.  
#'
#' @export
get_fx_names <- function( exclude=c("T99") ) {
   table.names  <- concordance[["rdb_table"]] |> unique()
   if( ! is.null(exclude) )
   { 
     exclude <- paste0( "-", exclude, "-", collapse="|" )
     table.names <- table.names[ ! grepl( exclude, table.names ) ]  
   }
   fx.names <- gsub( "-", "_", table.names )
   fx.names <- paste0( "BUILD_", fx.names )
}



#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
build_tables <- function( urls, year, fx.names=NULL )
{

  if( is.null(fx.names) )
  {  fx.names <- get_fx_names( exclude="T99" )  }

  # get all tables from one doc 
  # and return as named list
  all.npos <- purrr::map( urls, parse_npo, fx.names )
  
  # add random string so filenames not duplicated
  # when using parallelization 
  time <- format(Sys.time(), "%b-%d-%Y-%Hh-%Mm")
  rand <- paste( sample(LETTERS,5), collapse="" )
  time <- paste0( "time-", time, "-", rand  )
  
  # silently write temp tables to memory
  fx.names <- c( fx.names, "BUILD_SCHEDULE_TABLE" )
  purrr::walk( fx.names, get_fxdf, all.npos, time, year )

  # failed urls 
  failed.urls <- lapply( all.npos, '[[', "FAIL" ) |> unlist()   
  print( paste( "There are ", length(failed.urls), " failed XML URLs to re-try." ) )
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
  # 'fx.names' and 'year' passed through clusterExport
  failed.urls <- build_tables( index.group, fx.names=fx.names, year=year ) 
  return( failed.urls )
}





#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
build_tables_parallel <- function( groups, year, fx.names=NULL ){

  if( is.null(fx.names) )
  {  fx.names <- get_fx_names( exclude="T99" )  }
  
  num.cores <- parallel::detectCores() - 1
  cl <- parallel::makeCluster( num.cores )
  parallel::clusterExport( cl, varlist = c("year","fx.names"), envir=environment() )  
  results <- parallel::parSapply( cl, X=groups, FUN=parsapply_tables )   
  parallel::stopCluster( cl )
  
  failed.urls <- unlist( results )
  return( failed.urls )
}



