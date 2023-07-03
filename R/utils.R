###---------------------------------------------------
###   FUNCTIONS TO FACILITATE PRODUCTION RULES
###---------------------------------------------------
  
#' @importFrom magrittr "%>%"

# @export
# magrittr::`%>%`

#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
zeroPC <- function( var )
{ 
    if( FORMTYPE=="990" )
    {
       if( length(var) == 0 ){ return("0") }
       if( is.na(var) ){ return("0") }
    }
    return( var )
}
    
#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
zeroEZ <- function( var )
{ 
    if( FORMTYPE=="990EZ" )
    {
      if( length(var) == 0 ){ return("0") }
      if( is.na(var) ){ return("0") }
    }
    return( var )
}

#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export 
zeroALL <- function( var )
{
    if( length(var) == 0 ){ return("0") }
    if( is.na(var)  ){ return("0") }
    return( var )
}

#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
get_object_id <- function( url )
{
    object.id <- gsub("https://nccs-efile.s3.us-east-1.amazonaws.com/xml/", 
        "", url)
    object.id <- gsub("_public.xml", "", object.id)
    return(object.id)
}

#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
namedList <- function(...){
    names <- as.list(substitute(list(...)))[-1L]
    result <- list(...)
    names(result) <- names
    result[sapply(result, function(x){length(x)==0})] <- NA
    result[sapply(result, is.null)] <- NA
    result
}

#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
get_year <- function( index, year )
{
   dplyr::filter( index, TaxYear==year )
}




#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
simplify_varnames <- function( d, sep="", drop.prefix=TRUE )
{
  varnames <- names(d)

  if( drop.prefix )
  {  varnames <- substring( varnames, first=7 )  }

  varnames <- tolower( varnames )
  varnames <- gsub( pattern="_", replacement=sep, varnames )

  names(d) <- varnames
  return( d )
}







#' @title Record a change to raw data.   
#'
#' @description Make a note when a variable contained within a
#'   one-to-one table is collapsed into a single value. 
#'
#' @details Some variables in the 1:1 table list occassionally contain
#'   more than one value. For example, most nonprofits are registered in 
#'   a single state but a small proportion are registered in several. 
#'   These values are collapsed into a single value, for example 
#'   state = MN, OH, and NY becomes a single string `{MN},{OH},{NY}`. 
#'
#' @export
create_record <- function( varname, ein=ORG_EIN, year=TAX_YEAR, url=URL )
{
  file.name <- paste0( "COLLAPSE-RECORDS-", year, ".txt" )
  
  if( ! file.exists(file.name) )
  { file.create( file.name ) }
  
  variable <- deparse( substitute(varname) )

  fileConn <- file( file.name, open="a" )
  writeLines( paste0( "EIN: ", ein ), con = fileConn, sep = "\n" )
  writeLines( paste0( "YEAR: ", year ), con = fileConn, sep = "\n" )
  writeLines( paste0( "URL: ", url ), con = fileConn, sep = "\n" )
  writeLines( paste0( "VARIABLE: ", variable ), con = fileConn, sep = "\n\n" )
  close( fileConn )
}
