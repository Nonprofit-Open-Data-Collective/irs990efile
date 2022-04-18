#' @export
rdb.keys <- 
structure(list(xpath = c("/Return/ReturnHeader/Filer/EIN", "/Return/ReturnHeader/Filer/Name/BusinessNameLine1", 
"/Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1", 
"/Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt", 
"/Return/ReturnHeader/Filer/Name/BusinessNameLine2", "/Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2", 
"/Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2Txt", 
"/Return/ReturnHeader/ReturnType", "/Return/ReturnHeader/ReturnTypeCd", 
"/Return/ReturnHeader/TaxYear", "/Return/ReturnHeader/TaxYr"), 
    variable_name = c("ORG_EIN", "ORG_NAME_L1", "ORG_NAME_L1", 
    "ORG_NAME_L1", "ORG_NAME_L2", "ORG_NAME_L2", "ORG_NAME_L2", 
    "RETURN_TYPE", "RETURN_TYPE", "TAX_YEAR", "TAX_YEAR"), description = c("Orgainization Employer Identification Number (EIN)", 
    "Name of Filing Organization (line 1)", "Name of Filing Organization (line 1)", 
    "Name of Filing Organization (line 1)", "Name of Filing Organization (line 2)", 
    "Name of Filing Organization (line 2)", "Name of Filing Organization (line 2)", 
    "Return type", "Return type", "Tax year", "Tax year"), location_code_xsd = c("", 
    "", "", "", "", "", "", "", "", "", ""), location_code_family = c("F990-PC-PART-00-SECTION-D", 
    "F990-PC-PART-00-SECTION-C", "F990-PC-PART-00-SECTION-C", 
    "F990-PC-PART-00-SECTION-C", "F990-PC-PART-00-SECTION-C", 
    "F990-PC-PART-00-SECTION-C", "F990-PC-PART-00-SECTION-C", 
    "F990-PC-PART-00-LINE-00", "F990-PC-PART-00-LINE-00", "F990-PC-PART-00-SECTION-A", 
    "F990-PC-PART-00-SECTION-A"), location_code = c("F990-PC-PART-00-SECTION-D", 
    "F990-PC-PART-00-SECTION-C", "F990-PC-PART-00-SECTION-C", 
    "F990-PC-PART-00-SECTION-C", "F990-PC-PART-00-SECTION-C", 
    "F990-PC-PART-00-SECTION-C", "F990-PC-PART-00-SECTION-C", 
    "F990-PC-PART-00-LINE-00", "F990-PC-PART-00-LINE-00", "F990-PC-PART-00-SECTION-A", 
    "F990-PC-PART-00-SECTION-A"), form = c("F990", "F990", "F990", 
    "F990", "F990", "F990", "F990", "F990", "F990", "F990", "F990"
    ), form_type = c("PC", "PC", "PC", "PC", "PC", "PC", "PC", 
    "PC", "PC", "PC", "PC"), form_part = c("PART-00", "PART-00", 
    "PART-00", "PART-00", "PART-00", "PART-00", "PART-00", "PART-00", 
    "PART-00", "PART-00", "PART-00"), form_line_number = c("Section D", 
    "Section C", "Section C", "Section C", "Section C", "Section C", 
    "Section C", "Line 00", "Line 00", "Section A", "Section A"
    ), variable_scope = c("HD", "HD", "HD", "HD", "HD", "HD", 
    "HD", "HD", "HD", "HD", "HD"), data_type_xsd = c("EINType", 
    "BusinessNameLine1Type", "BusinessNameLine1Type", "BusinessNameLine1Type", 
    "BusinessNameLine2Type", "BusinessNameLine2Type", "BusinessNameLine2Type", 
    "StringType", "StringType", "YearType", "YearType"), data_type_simple = c("numeric", 
    "text", "text", "text", "text", "text", "text", "text", "text", 
    "date", "date"), rdb_relationship = c("ONE", "ONE", "ONE", 
    "ONE", "ONE", "ONE", "ONE", "ONE", "ONE", "ONE", "ONE"), 
    rdb_table = c("F9-P00-T00-HEADER", "F9-P00-T00-HEADER", "F9-P00-T00-HEADER", 
    "F9-P00-T00-HEADER", "F9-P00-T00-HEADER", "F9-P00-T00-HEADER", 
    "F9-P00-T00-HEADER", "F9-P00-T00-HEADER", "F9-P00-T00-HEADER", 
    "F9-P00-T00-HEADER", "F9-P00-T00-HEADER"), required = c(FALSE, 
    FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, NA, NA, FALSE, 
    FALSE), versions = c("2009v1.0;2009v1.1;2009v1.2;2009v1.3;2009v1.4;2009v1.7;2010v3.2;2010v3.4;2010v3.6;2010v3.7;2011v1.2;2011v1.3;2011v1.4;2011v1.5;2012v2.0;2012v2.1;2012v2.2;2012v2.3;2012v3.0;2013v3.0;2013v3.1;2013v4.0;2014v5.0;2014v6.0;2015v2.0;2015v2.1;2015v3.0;2016v3.0", 
    "2009v1.0;2009v1.1;2009v1.2;2009v1.3;2009v1.4;2009v1.7;2010v3.2;2010v3.4;2010v3.6;2010v3.7;2011v1.2;2011v1.3;2011v1.4;2011v1.5;2012v2.0;2012v2.1;2012v2.2;2012v2.3;2012v3.0", 
    "2013v3.0;2013v3.1;2013v4.0", "2014v5.0;2014v6.0;2015v2.0;2015v2.1;2015v3.0;2016v3.0", 
    "2009v1.0;2009v1.1;2009v1.2;2009v1.3;2009v1.4;2009v1.7;2010v3.2;2010v3.4;2010v3.6;2010v3.7;2011v1.2;2011v1.3;2011v1.4;2011v1.5;2012v2.0;2012v2.1;2012v2.2;2012v2.3;2012v3.0", 
    "2013v3.0;2013v3.1;2013v4.0", "2014v5.0;2014v6.0;2015v2.0;2015v2.1;2015v3.0;2016v3.0", 
    "2009v1.0;2009v1.1;2009v1.2;2009v1.3;2009v1.4;2009v1.7;2010v3.2;2010v3.4;2010v3.6;2010v3.7;2011v1.2;2011v1.3;2011v1.4;2011v1.5;2012v2.0;2012v2.1;2012v2.2;2012v2.3;2012v3.0", 
    "2013v3.0;2013v3.1;2013v4.0;2014v5.0;2014v6.0;2015v2.0;2015v2.1;2015v3.0;2016v3.0", 
    "2009v1.0;2009v1.1;2009v1.2;2009v1.3;2009v1.4;2009v1.7;2010v3.2;2010v3.4;2010v3.6;2010v3.7;2011v1.2;2011v1.3;2011v1.4;2011v1.5;2012v2.0;2012v2.1;2012v2.2;2012v2.3;2012v3.0", 
    "2013v3.0;2013v3.1;2013v4.0;2014v5.0;2014v6.0;2015v2.0;2015v2.1;2015v3.0;2016v3.0"
    ), latest_version = c(2016, 2012, 2013, 2016, 2012, 2013, 
    2016, 2012, 2016, 2012, 2016), duplicated = c(FALSE, FALSE, 
    FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE
    ), current_version = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 
    TRUE, TRUE, TRUE, TRUE, TRUE), production_rule = c(NA, NA, 
    NA, NA, NA, NA, NA, NA, NA, NA, NA), validated = c(NA, NA, 
    NA, NA, NA, NA, NA, NA, NA, NA, NA)), row.names = c("85", 
"79", "80", "81", "82", "83", "84", "6", "7", "16", "17"), class = "data.frame")



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



#' @title Create all one-to-one tables.
#'
#' @description Convert the concordance file into a set of table build functions
#'   for all of the one-to-one tables in the concordance. 
#'
#' @export
do_all_chunks <- function()
{

	# GET ALL ONE-TO-ONE TABLES 

	data( concordance )
	t <- sort( unique( d$rdb_table ) )
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

