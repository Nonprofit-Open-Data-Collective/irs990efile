TABLE.HEADERS$"F9-P08-T01-REVENUE-PROGRAMS"  <-
  c("//Form990PartVIII/ProgramServiceRevenue",
    "//IRS990/ProgramServiceRevenue",  
    "//IRS990/ProgramServiceRevenueGrp")
    
         
drive <- "C:/Users/jdlec/Dropbox (Personal)/00 - URBAN/04-DATAPREP/comp-data/update-efile-code/TEST-RDB-FX-OCT"

concordance <- 
  read.csv( paste0( drive, "/", "concordance.csv" ) )

v.map <- get_var_map( rdb.table )
 
create_code_chunk_rdb( rdb.table="F9-P08-T01-REVENUE-PROGRAMS", show=FALSE )

create_code_chunk_rdb <- function( rdb.table="F9-P08-T01-REVENUE-PROGRAMS", show=FALSE )
{
    
    if( ! exists("concordance") ){ data(concordance) }
    
    rdb.keys <- dplyr::filter( concordance, variable_name %in% RDB.KEYS )
    names( rdb.keys ) <- toupper( names( rdb.keys ) )
    
    if( ! exists("rdb.keys") ){ data(rdbkeys) }
    names( rdb.keys ) <- toupper( names( rdb.keys ) )
    
    concordance <- concordance[ concordance$rdb_table == rdb.table , ]
    concordance <- concordance[ ! duplicated( concordance$xpath ) , ]
    names( concordance ) <- toupper( names( concordance ) )
    # concordance$VARIABLE_NAME <- gsub( "-", "_", concordance$VARIABLE_NAME )
    # key.names <- paste0( "F9_00_", unique(rdb.keys$VARIABLE_NAME) )
    concordance <- concordance[ ! concordance$VARIABLE_NAME %in% RDB.KEYS , ]
    
    function.name <- paste0( "BUILD_", gsub( "-", "_", rdb.table ) )
    filename <- paste0( function.name, ".R" )
    file.create( filename )

    fileConn <- file( filename, open="a" )
    
    # ROXYGEN COMMENTS FOR PACKAGE FUNCTIONS 
    writeLines( "#' @title ", con = fileConn, sep = "\n" )
    writeLines( paste0( "#'   Build table ", rdb.table ), con = fileConn, sep = "\n" )  
    writeLines( "#' ", con = fileConn, sep = "\n" )
    writeLines( "#' @description ", con = fileConn, sep = "\n" )
    writeLines( "#'   Generate a 1:M table for the relational database.", con = fileConn, sep = "\n" )
    writeLines( "#' ", con = fileConn, sep = "\n" ) 
    writeLines( "#' @export ", con = fileConn, sep = "\n" )
    
    writeLines( paste0( function.name, " <- function( doc, url )" ), con = fileConn, sep = "\n" )
    writeLines( "{", con = fileConn, sep = "\n\n\n" )
    close( fileConn )

    add_keys( filename, rdb.keys=rdb.keys )

    fileConn <- file( filename, open="a" )  

    writeLines( "######----------------------------------------------------", con = fileConn, sep = "\n" )
    writeLines( "######", con = fileConn, sep = "\n" )  
    writeLines( "######    BUILD 1:M TABLE ", con = fileConn, sep = "\n" )
    writeLines( "######", con = fileConn, sep = "\n" )  
    writeLines( "######----------------------------------------------------", con = fileConn, sep = "\n\n\n" ) 

    fxline1 <- paste0( "table.headers <- TABLE.HEADERS[ '", rdb.table, "' ]" )
    fxline2 <- paste0( "v.map <- get_var_map( '", rdb.table, "' )" )

    writeLines( fxline1, con = fileConn, sep = "\n" )    
    writeLines( fxline2, con = fileConn, sep = "\n\n\n" )
 
    fxline3 <- paste0( "df <- get_table_v2( doc, table.name='", rdb.table, "', table.headers  )" )
    
    writeLines( fxline3, con = fileConn, sep = "\n" )
    writeLines( "if( is.null(df) ){ return( NULL ) }" , con = fileConn, sep = "\n" )
    writeLines( "df <- re_name( df, v.map )", con = fileConn, sep = "\n\n\n" )

    writeLines( "rdb.table <- ", con = fileConn, sep = "\n" )
    writeLines( "  data.frame( ", con = fileConn, sep = "\n" )
    writeLines( "   OBJECTID = OBJECTID,", con = fileConn, sep = "\n" )
    writeLines( "   URL = URL,", con = fileConn, sep = "\n" )
    writeLines( "   RETURN_TIME_STAMP = F9_00_RETURN_TIME_STAMP,", con = fileConn, sep = "\n" )
    writeLines( "   RETURN_VERSION = RETURN_VERSION,", con = fileConn, sep = "\n" )
    writeLines( "   RETURN_TYPE = F9_00_RETURN_TYPE,", con = fileConn, sep = "\n" )
    writeLines( "   RETURN_AMENDED_X = F9_00_RETURN_AMENDED_X,", con = fileConn, sep = "\n" )
    writeLines( "   RETURN_GROUP_X = F9_00_RETURN_GROUP_X,", con = fileConn, sep = "\n" )
    writeLines( "   TAX_YEAR = F9_00_TAX_YEAR,", con = fileConn, sep = "\n" )
    writeLines( "   ORG_EIN = F9_00_ORG_EIN,", con = fileConn, sep = "\n" )
    writeLines( "   ORG_NAME_L1 = F9_00_ORG_NAME_L1,", con = fileConn, sep = "\n" )
    writeLines( "   ORG_NAME_L2 = F9_00_ORG_NAME_L2,", con = fileConn, sep = "\n" )
    writeLines( "   df  )", con = fileConn, sep = "\n\n\n" )

    writeLines( "return ( rdb.table )", con = fileConn, sep = "\n\n\n" )
    writeLines( "}", con = fileConn, sep = "\n\n\n" )

    close( fileConn ) 
    
    if( show==TRUE ){ shell( filename ) }
    
    return( NULL )

}



    RDB.KEYS <- 
      c( "F9_00_RETURN_TIME_STAMP", "F9_00_RETURN_TYPE",
         "F9_00_RETURN_AMENDED_X", "F9_00_RETURN_GROUP_X", 
         "F9_00_TAX_YEAR", "F9_00_ORG_EIN", 
         "F9_00_ORG_NAME_L1", "F9_00_ORG_NAME_L2" )
         



  
  df <- get_table_v2( doc, table.name, table.headers  )
  
  if( is.null(df) ){ return( NULL ) }
  
  df <- re_name( df, v.map )

  rdb.table <- 
    data.frame( OBJECT_ID=OBJECTID, EIN=EIN, NAME=NAME, 
                TAXYR=TAXYR, FORMTYPE=FORMTYPE, URL=URL, df )  
                
  return ( rdb.table )