
###---------------------------------------------------
###   RELATIONAL DATABASE FUNCTIONS
###---------------------------------------------------

# "group" here means the root xpath that defines
# a collection of variables on a one-to-many table
#
# find_group_names() identifies all possible roots
# get_var_map() creates a crosswalk between IRS 
#   variable names and concordance variable names
# get_table() build the data table
# re_name() converts IRS names to concordance names


#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
find_group_names <- function( table.name )
{
  data(concordance)
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  xpaths <- TABLE$xpath %>% as.character()
  xpaths <- gsub( "IRS990EZ", "IRS990", xpaths )
  nodes <- strsplit( xpaths, "/" )
  d1 <- suppressWarnings( data.frame( do.call( cbind, nodes ), stringsAsFactors=F ) )
  not.equal <- apply( d1, MARGIN=1, FUN=function(x){ length( unique( x )) > 1 } ) 
  this.one <- which( not.equal == T )[ 1 ]
  group.names <- d1[ this.one,  ] %>% as.character() %>% unique()
  group.names <- paste0( "//", group.names )
  return( group.names )
}

# data(concordance)
# find_group_names( concordance=concordance, table.name="F9-P07-TABLE-01-DTK-COMPENSATION" )


#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
validate_group_names <- function( nd, table.name )
{
  data(concordance)
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  original.xpaths <- TABLE$xpath %>% as.character()
  
  # check to see if nodes all in table
  xp <- nd %>% xml2::xml_path()
  
  # remove counts like "/Return/ReturnData/IRS990/ProgramServiceRevenueGrp[1]/Desc" 
  xp <- gsub( "\\[[0-9]{1,}\\]", "", xp )

  diff <- setdiff( nd, original.xpaths )

  result <- ifelse( length(diff) == 0, TRUE, FALSE )
  return( result ) 

}


#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
get_var_map <- function( concordance, table.name )
{
   data(concordance)
   TABLE <- dplyr::filter( concordance, rdb_table == table.name )
   xpaths <- TABLE$xpath %>% as.character()
   res <- strsplit( xpaths, "/" )
   v.map <- data.frame( VARIABLE=as.character(TABLE$variable_name), 
            XSD_VARNAME=unlist( lapply( res, last ) ), stringsAsFactors=F )
   v.map <- unique( v.map )
   return( v.map )
}

# data(concordance)
# v.map <- get_var_map( concordance=concordance, table.name="F9-P07-TABLE-01-DTK-COMPENSATION" )


#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
remove_count <- function( x )
{ 
  # "/Return/ReturnData/IRS990/ProgramServiceRevenueGrp[102]/Desc" 
  # "/Return/ReturnData/IRS990/ProgramServiceRevenueGrp/Desc"
  x <- gsub( "\\[[0-9]{1,}\\]", "", x )
  return(x)
}


#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
get_table <- function( doc, group.names, table.name )
{

  data(concordance)
  TABLE <- dplyr::filter( concordance, rdb_table == table.name )
  original.xpaths <- TABLE$xpath %>% as.character()
   
  all.groups <- paste0( group.names, collapse="|" )
  nd <- xml2::xml_find_all( doc, all.groups )
  if( length( nd ) == 0 ){ return(NULL) }

  # ensure group names unique to table
  valid <- validate_group_names( nd, table.name )
  if( ! valid )
  { 
    xp <- nd %>% xml2::xml_path()
    xp <- gsub( "\\[[0-9]{1,}\\]", "", xp ) %>% unique()
    print("TABLE: ")
    print( table.name )
    print("TABLE XPATHS: ")
    print( original.xpaths )
    print("CURRENT XPATHS: ")
    print( xp )
    stop( 'Group names are not unique to the table' )
  }

  # ensure we are using root node for table
  table.xpaths <- ( xml2::xml_get_paths( nd, only_terminal_parent = TRUE ))[[1]]
  if( length( table.xpaths ) > 1 )
  {
     nodes <- strsplit( table.xpaths, "/" )
     d1 <- suppressWarnings( data.frame( do.call( cbind, nodes ), stringsAsFactors=F ) )
     not.equal <- apply( d1, MARGIN=1, FUN=function(x){ length( unique( x )) > 1 } ) 
     this.one <- which( not.equal == T )[ 1 ]
     if( this.one < 2 ){ return( NULL ) }
     table.root <- d1[ this.one - 1,  ] %>% as.character() %>% unique()
     table.root <- paste0( "//", table.root )
     nd <- xml2::xml_find_all( doc, table.root )
  }

  rdb.table <- xmltools::xml_dig_df( nd ) %>% bind_rows() 
  rdb.table <- rdb.table %>% dplyr::mutate_if(is.factor, as.character) 
  return( rdb.table )
}

# get_table( doc, group.names )




#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
re_name <- function( df, v.map )
{

  for( i in unique( v.map$VARIABLE ) )
  {
         this.one <- names( df ) %in% v.map[ v.map$VARIABLE == i , "XSD_VARNAME" ] 
         names( df )[this.one] <- i
  }

      return( df )

}

  
#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
build_rdb_table <- function( doc, url, group.names, v.map )
{

    
   ####----------------------------------------------------
   ####     KEYS
   ####----------------------------------------------------


   ## OBJECT ID
        
   OBJECTID <- get_object_id( url )



   ## URL
   
   URL <- url
   
   

   ## EIN

   EIN  <- xml2::xml_text( xml2::xml_find_all( doc, "//Return/ReturnHeader/Filer/EIN" ) )



   ## NAME

   V_990NAMEpost2014 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt"
   V_990NAME_2013 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1"
   V_990NAMEpre2013  <- "//Return/ReturnHeader/Filer/Name/BusinessNameLine1"
   name.xpath <- paste( V_990NAME_2013, V_990NAMEpre2013, V_990NAMEpost2014, sep="|" )
   NAME <- xml2::xml_text( xml2::xml_find_all( doc, name.xpath ) )


   ## TYPE OF TAX FORM

   V_990TFpost2013 <- "//Return/ReturnHeader/ReturnTypeCd"
   V_990TFpre2013  <- "//Return/ReturnHeader/ReturnType"
   tax.form.xpath <- paste( V_990TFpost2013, V_990TFpre2013, sep="|" )
   FORMTYPE <- xml2::xml_text( xml2::xml_find_all( doc, tax.form.xpath ) )
   
   
   ## TAX YEAR

   V_990FYRpost2013 <- "//Return/ReturnHeader/TaxYr"
   V_990FYRpre2013  <- "//Return/ReturnHeader/TaxYear"
   fiscal.year.xpath <- paste( V_990FYRpost2013, V_990FYRpre2013, sep="|" )
   TAXYR <- xml2::xml_text( xml2::xml_find_all( doc, fiscal.year.xpath ) )
   
   
   
   ####  BUILD TABLE 
   
   df <- get_table( doc, group.names )
   
   if( is.null(df) ){ return( NULL ) }
   
   rdb.table <- data.frame( OBJECT_ID=OBJECTID, EIN=EIN, NAME=NAME, TAXYR=TAXYR, 
                            FORMTYPE=FORMTYPE, URL=URL, df, stringsAsFactors=F )
   
   rdb.table <- re_name( rdb.table, v.map )
        
   return ( rdb.table )
        
}






# USAGE:
#
#  partvii.01 <- list()   # dtk compensation table
#  partvii.01.group.names <- find_group_names( partvii, "F9-P07-TABLE-01-DTK-COMPENSATION" )
#  partvii.01.v.map       <- get_var_map( partvii, table.name="F9-P07-TABLE-01-DTK-COMPENSATION" )
#  partvii.01[[1]]        <- build_rdb_table( doc, url, group.names=partvii.01.group.names, v.map=partvii.01.v.map )




