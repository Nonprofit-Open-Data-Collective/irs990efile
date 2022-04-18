#' @title Add RDB unique keys to a build table function. 
#'
#' @description Add a set of meta-data variables contained in the `rdbkeys` file and 
#'  unique keys needed for filtering or merging tables generated from the 
#'  concordance files. 
#'
#' @details This is an internal function only. 
#' 
#' @export
add_keys <- function( filename, rdb.keys )
{

    fileConn <- file( filename, open="a" )

    writeLines( "####----------------------------------------------------", con = fileConn, sep = "\n" ) 
    writeLines( "####     KEYS", con = fileConn, sep = "\n" )
    writeLines( "####----------------------------------------------------", con = fileConn, sep = "\n\n\n" )
   
    writeLines( "## OBJECT ID", con = fileConn, sep = "\n\n" )
    writeLines( "OBJECTID <- get_object_id( url )", con = fileConn, sep = "\n\n\n" )
   
    writeLines( "## URL", con = fileConn, sep = "\n\n" )
    writeLines( "URL <- url", con = fileConn, sep = "\n\n\n" ) 

    writeLines( "## RETURN VERSION", con = fileConn, sep = "\n\n" )
    writeLines( "RETURN_VERSION <- xml2::xml_attr( doc, attr='returnVersion' )", con = fileConn, sep = "\n\n\n" )

    for( i in unique( rdb.keys$VARIABLE_NAME ) )
    {

       sub.dat <- rdb.keys[ rdb.keys$VARIABLE_NAME == i , ]

       writeLines( paste("## VARIABLE NAME: ", i), con = fileConn, sep = "\n" )
       writeLines( paste("## DESCRIPTION: ", sub.dat$DESCRIPTION[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## LOCATION: ", sub.dat$LOCATION_CODE[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## TABLE: ", sub.dat$RDB_TABLE[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## VARIABLE TYPE: ", sub.dat$DATA_TYPE_SIMPLE[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## PRODUCTION RULE: ", sub.dat$PRODUCTION_RULE[1]), con = fileConn, sep = "\n\n" )


       xpath.vec <- sub.dat$XPATH

       num.paths <- length( xpath.vec )


       if( num.paths > 1 ){

       for( j in 1:num.paths )
       {
         xpath.j <- paste( "V", j, sep="" )
         writeLines( paste( xpath.j, " <- '/", xpath.vec[j], "'", sep=""), con = fileConn, sep = "\n" )

       }
        or.var.name <- paste0( "TEMP_", i )
        or.statement <- paste( or.var.name, "<- paste(", paste( "V", 1:num.paths, sep="", collapse=", " ), ", sep='|' )" ) 
        writeLines( or.statement, con = fileConn, sep = "\n" )
        writeLines( paste( i, "<- xml2::xml_text( xml2::xml_find_all( doc,", or.var.name, ") )"), con = fileConn, sep = "\n\n\n\n" )

        } else
        {

          single.xpath <- paste( "'", xpath.vec, "'", sep="" )
          writeLines( paste( i, "<- xml2::xml_text( xml2::xml_find_all( doc,", single.xpath, ") )"), con = fileConn, sep = "\n\n\n\n" )

        }
    }


    close( fileConn ) 
    
    return( NULL )

}



#' @title Concordance to table functions 
#'
#' @description Turn the concordance file into a set of functions to build 1-to-1 tables.  
#'
#' @details Note that this function only works for RDB tables with one-to-one cardinality
#'  (see the `rdb_relationship` variable in the `concordance` file for cardinality). 
#' 
#' @examples
#' \dontrun{
#'   data( concordance )
#'   # list of all one-to-one table
#'   unique( concordance$rdb_tables[ concordance$rdb_relationship == "ONE" ] ) 
#'   # create a new function to build a single table
#'   create_code_chunks( rdb.table="F9-P00-T00-HEADER", show=TRUE )
#'   # create functions for all one-to-one tables 
#'   do_all_chunks() 
#' }
#' 
#' @export
create_code_chunks <- function( rdb.table="F9-P00-T00-HEADER", show=FALSE )
{

    if( ! exists("rdb.keys") ){ source( "rdb-keys.R" ) }
    names( rdb.keys ) <- toupper( names( rdb.keys ) )
    
    if( ! exists("concordance") ){ source( "concordance.R" ) }
    
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

    writeLines( "######----------------------------------------------------", con = fileConn, sep = "\n" )
    writeLines( "######", con = fileConn, sep = "\n" )  
    writeLines( "######    1:1 TABLE VARIABLES", con = fileConn, sep = "\n" )
    writeLines( "######", con = fileConn, sep = "\n" )  
    writeLines( "######----------------------------------------------------", con = fileConn, sep = "\n\n\n" ) 
    
 
    for( i in unique( concordance$VARIABLE_NAME ) )
    {

       sub.dat <- concordance[ concordance$VARIABLE_NAME == i , ]

       writeLines( paste("## VARIABLE NAME: ", i), con = fileConn, sep = "\n" )
       writeLines( paste("## DESCRIPTION: ", sub.dat$DESCRIPTION[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## LOCATION: ", sub.dat$LOCATION_CODE[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## TABLE: ", sub.dat$RDB_TABLE[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## VARIABLE TYPE: ", sub.dat$DATA_TYPE_SIMPLE[1]), con = fileConn, sep = "\n" )
       writeLines( paste("## PRODUCTION RULE: ", sub.dat$PRODUCTION_RULE[1]), con = fileConn, sep = "\n\n" )


       xpath.vec <- sub.dat$XPATH

       num.paths <- length( xpath.vec )


       if( num.paths > 1 ){

       for( j in 1:num.paths )
       {
         xpath.j <- paste( "V", j, sep="" )
         writeLines( paste( xpath.j, " <- '/", xpath.vec[j], "'", sep=""), con = fileConn, sep = "\n" )

       }
        or.var.name <- paste0( "V_", substr( i, 7, nchar(i) ) )
        or.statement <- paste( or.var.name, "<- paste(", paste( "V", 1:num.paths, sep="", collapse=", " ), ", sep='|' )" ) 
        writeLines( or.statement, con = fileConn, sep = "\n" )
        writeLines( paste( i, "<- xml2::xml_text( xml2::xml_find_all( doc,", or.var.name, ") )"), con = fileConn, sep = "\n\n\n\n\n" )

        } else
        {

          single.xpath <- paste( "'", xpath.vec, "'", sep="" )
          writeLines( paste( i, "<- xml2::xml_text( xml2::xml_find_all( doc,", single.xpath, ") )"), con = fileConn, sep = "\n\n\n\n\n\n" )

        }
    }

    var.names <- c( 'OBJECTID', 'URL', unique( rdb.keys$VARIABLE_NAME ), unique(concordance$VARIABLE_NAME) ) 

    writeLines( "var.list <- ", con = fileConn, sep = "\n" )
    writeLines( paste0( "namedList(", paste0(var.names, collapse=","), ")" ), con = fileConn, sep = "\n" )
    writeLines( "df <- as.data.frame( var.list )", con = fileConn, sep = "\n\n\n" )

    # THIS ALSO WORKS
    #+     writeLines( "var.names <- ", con = fileConn, sep = "\n" )
    #+     writeLines( paste0( "c(", paste0("'",var.names,"'", collapse=","), ")" ), con = fileConn, sep = "\n" )
    #+     writeLines( "dd <- sapply( var.names, get, simplify=FALSE ) # named list", con = fileConn, sep = "\n" )
    #+     writeLines( "dd[ sapply( dd, identical, character(0) ) ] <- NA", con = fileConn, sep = "\n" )
    #+     writeLines( "df <- as.data.frame( dd )", con = fileConn, sep = "\n\n\n" )
 

    writeLines( "return( df )", con = fileConn, sep = "\n\n\n" )

    writeLines( "}", con = fileConn, sep = "\n\n\n" )

    close( fileConn ) 
    
    if( show==TRUE ){ shell( filename ) }
    
    return( NULL )

}




# Loop through the concordance and 
# create code chunks for all of the 1:1 tables

#' @title Create all one-to-one tables.
#'
#' @description Convert the concordance into a set of table build functions
#'   for all of the one-to-one tables in the concordance file. 
#'
#' @export
do_all_chunks <- function()
{

	# GET ALL ONE-TO-ONE TABLES 

	data( concordance )
	t <- sort( unique( concordance$rdb_table ) )
	t00 <- t[ grepl( "-T00-", t ) ]



	# CREATE CODE CHUNKS FOR ALL ONE-TO-ONE TABLES

	dir.create( "chunks" )
	setwd( "chunks" )

	for( i in t00 )
	{
	   create_code_chunks(  rdb.table=i, show=FALSE )
	}
	
	return(NULL) 

}

