build_rdb_table <- function( url, table.name )
{
  
   doc <- NULL
   try( doc <- xml2::read_xml( url ), silent=T ) 
   if( is.null(doc) )
   { 
      return( NULL )
   }
   xml2::xml_ns_strip( doc )

   ####----------------------------------------------------
   ####     KEYS
   ####----------------------------------------------------


   ## OBJECT ID
        
   OBJECTID <- get_object_id( url )



   ## URL
   
   URL <- url
   
   

   ## EIN

   EIN  <- xml2::xml_text( xml2::xml_find_all( doc, "//Return/ReturnHeader/Filer/EIN" ) )
   EIN2 <- format_ein( EIN )


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
   
   group.names <- find_group_names( table.name=table.name )
   df <- get_table( doc, group.names, table.name  )
   
   if( is.null(df) ){ return( NULL ) }
  
   v.map <- get_var_map( table.name=table.name )
   df <- re_name( df, v.map )
  
   rdb.table <- data.frame( OBJECT_ID=OBJECTID, EIN=EIN, EIN2=EIN2, NAME=NAME, TAXYR=TAXYR, 
                            FORMTYPE=FORMTYPE, URL=URL, df, stringsAsFactors=F )
   
   return ( rdb.table )
        
}




##  FX
##
##  add keys
##  add v.map
##  add table headers (group names)
##  

  ####  BUILD TABLE 
  
  # if( is.null(table.headers) )
  # { table.headers <- find_table_headers( table.name=table.name ) }
  
  df <- get_table_v2( doc, table.name, table.headers  )
  
  if( is.null(df) ){ return( NULL ) }
  
  v.map <- get_var_map( table.name=table.name )
  df <- re_name( df, v.map )
  
  rdb.table <- 
    data.frame( OBJECT_ID=OBJECTID, 
                EIN=EIN, 
                NAME=NAME, 
                TAXYR=TAXYR, 
                FORMTYPE=FORMTYPE, 
                URL=URL, 
                df )  # keys are recycled
                
  return ( rdb.table )
  
  
  

create_rdb_fx <- function( rdb.table="F9-P07-T01-COMPENSATION", show=FALSE )
{

    if( ! exists("rdb.keys") ){ data(rdbkeys) }
    names( rdb.keys ) <- toupper( names( rdb.keys ) )
    
    if( ! exists("concordance") ){ data(concordance) }
    
    concordance <- concordance[ concordance$rdb_table == rdb.table , ]
    concordance <- concordance[ ! duplicated( concordance$xpath ) , ]
    names( concordance ) <- toupper( names( concordance ) )
    concordance$VARIABLE_NAME <- gsub( "-", "_", concordance$VARIABLE_NAME )
    key.names <- paste0( "F9_00_", unique(rdb.keys$VARIABLE_NAME) )
    concordance <- concordance[ ! concordance$VARIABLE_NAME %in% key.names , ]
    
    function.name <- paste0( "BUILD_", gsub( "-", "_", rdb.table ), " <- function( doc, url )" )

    filename <- paste0( "CHUNKS-", rdb.table, ".R" )
    file.create( filename )

    fileConn <- file( filename, open="a" )
    
    # ROXYGEN COMMENTS FOR PACKAGE FUNCTIONS 
    writeLines( "#' @title ", con = fileConn, sep = "\n" )
    writeLines( paste0( "#'   Build table ", rdb.table ), con = fileConn, sep = "\n" )  
    writeLines( "#' ", con = fileConn, sep = "\n" )
    writeLines( "#' @description ", con = fileConn, sep = "\n" )
    writeLines( "#'   Generate a 1:1 table for the relational database.", con = fileConn, sep = "\n" )
    writeLines( "#' ", con = fileConn, sep = "\n" ) 
    writeLines( "#' @export ", con = fileConn, sep = "\n" )
    
    writeLines( function.name, con = fileConn, sep = "\n" )
    writeLines( "{", con = fileConn, sep = "\n\n\n" )
    close( fileConn )

    add_keys( filename, rdb.keys=rdb.keys )

    fileConn <- file( filename, open="a" ) 