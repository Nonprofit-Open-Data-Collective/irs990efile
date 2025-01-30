         
#' @title RDB KEYS fields. 
#'
#' @description List of relational database fields that are present on all tables and are used for filtering observations and merges. 
#'
#' @details A character vector listing fields used as keys, mainly for internal package use. 
#' 
#' @export    
RDB.KEYS <- 
  c( "F9_00_RETURN_TIME_STAMP", "F9_00_RETURN_TYPE",
     "F9_00_RETURN_AMENDED_X", "F9_00_RETURN_GROUP_X",
     "F9_00_TAX_PERIOD_BEGIN_DATE", "F9_00_TAX_PERIOD_END_DATE",
     "F9_00_ORG_NAME_L1", "F9_00_ORG_NAME_L2",
     "F9_00_TAX_YEAR", "F9_00_ORG_EIN" )
         

#' @title Build all table functions from the concordance file. 
#'
#' @description Recreate all table build functions (each table is a chunk) fresh from the concordance.  
#' 
#' @export
build_all_chunks <- function(){
  if( ! exists("concordance") ){ concordance <- get_concordance() }
  tables <- sort( unique( concordance$rdb_table ) )
  oto <- grep( "-T00-", tables, value=TRUE )
  otm <- grep( "-T[0-9][1-9]-", tables, value=TRUE )
  purrr::walk( oto, create_code_chunk )
  purrr::walk( otm, create_code_chunk_rdb )
  create_get_keys_fx()
  return( NULL )
}






#' Create GET Keys Function
#'
#' Generates an R script file with a function to extract key variables from an XML document.
#'
#' @param filename Character. The name of the file to save the generated function. Default is "GET_KEYS.R".
#' @param RDB.KEYS Character vector. A list of keys to include in the generated function.
#' @param show Logical. If TRUE, opens the generated file for review. Default is FALSE.
#'
#' @details
#' This function creates an R script file that defines a custom function (`get_keys`).
#' The generated `get_keys` function extracts key variables from an XML document and processes them.
#' It includes metadata such as descriptions, locations, and production rules for each variable.
#'
#' The script dynamically handles multiple XPath expressions for a single variable and can
#' standardize certain boolean variables. The generated function returns a named list of extracted variables.
#'
#' @return NULL. The function generates an R script file as a side effect.
#'
#' @examples
#' \dontrun{
#' create_get_keys_fx( show = TRUE )
#' }
#'
#' @export
create_get_keys_fx <- function(filename = "GET_KEYS.R", KEYS=RDB.KEYS, show = FALSE) {

    if (!exists("concordance")) { concordance <- get_concordance() }

    concordance <- concordance[!duplicated(concordance$xpath), ]
    names(concordance) <- toupper(names(concordance))
    rdb.keys.df <- dplyr::filter(concordance, VARIABLE_NAME %in% KEYS)

    file.create(filename)

    fileConn <- file(filename, open = "a")
    
    # ROXYGEN COMMENTS FOR PACKAGE FUNCTIONS 
    writeLines( "#' @title ", con = fileConn, sep = "\n" )
    writeLines( "#'  Get Table Keys ", con = fileConn, sep = "\n" )  
    writeLines( "#' ", con = fileConn, sep = "\n" )
    writeLines( "#' @description ", con = fileConn, sep = "\n" )
    writeLines( "#'   Collect table IDs for relational datasets.", con = fileConn, sep = "\n" )
    writeLines( "#' ", con = fileConn, sep = "\n" ) 
    writeLines( "#' @export ", con = fileConn, sep = "\n" )

    writeLines("get_keys <- function( doc, url ){ ", con = fileConn, sep = "\n\n")

    writeLines("####----------------------------------------------------", con = fileConn, sep = "\n")
    writeLines("####     KEYS", con = fileConn, sep = "\n")
    writeLines("####----------------------------------------------------", con = fileConn, sep = "\n\n\n")

    writeLines("## OBJECT ID", con = fileConn, sep = "\n\n")
    writeLines("OBJECTID <- get_object_id( url )", con = fileConn, sep = "\n\n\n")

    writeLines("## URL", con = fileConn, sep = "\n\n")
    writeLines("URL <- url", con = fileConn, sep = "\n\n\n") 

    writeLines("## RETURN VERSION", con = fileConn, sep = "\n\n")
    writeLines("VERSION <- xml2::xml_attr( doc, attr='returnVersion' )", con = fileConn, sep = "\n\n\n")

    for (i in unique(KEYS)) {

       sub.dat <- dplyr::filter(rdb.keys.df, VARIABLE_NAME == i)
       vnm <- gsub("F9_00_", "", i)

       writeLines(paste("## VARIABLE NAME: ", i), con = fileConn, sep = "\n")
       writeLines(paste("## DESCRIPTION: ", sub.dat$DESCRIPTION[1]), con = fileConn, sep = "\n")
       writeLines(paste("## LOCATION: ", sub.dat$LOCATION_CODE[1]), con = fileConn, sep = "\n")
       writeLines(paste("## TABLE: ", sub.dat$RDB_TABLE[1]), con = fileConn, sep = "\n")
       writeLines(paste("## VARIABLE TYPE: ", sub.dat$DATA_TYPE_SIMPLE[1]), con = fileConn, sep = "\n")
       writeLines(paste("## PRODUCTION RULE: ", sub.dat$PRODUCTION_RULE[1]), con = fileConn, sep = "\n\n")

       xpath.vec <- sub.dat$XPATH

       num.paths <- length(xpath.vec)

       if (num.paths > 1) {
           for (j in 1:num.paths) {
               xpath.j <- paste("V", j, sep = "")
               writeLines(paste(xpath.j, " <- '/", xpath.vec[j], "'", sep = ""), con = fileConn, sep = "\n")
           }
           or.var.name <- paste0("TEMP_", i)
           or.statement <- paste(or.var.name, "<- paste(", paste("V", 1:num.paths, sep = "", collapse = ", "), ", sep='|' )") 
           writeLines(or.statement, con = fileConn, sep = "\n")
           writeLines(paste(vnm, "<- retrieve_xml( doc,", or.var.name, ")"), con = fileConn, sep = "\n")
       } else {
           single.xpath <- paste("'", xpath.vec, "'", sep = "")
           writeLines(paste(vnm, "<- retrieve_xml(  doc,", single.xpath, ") "), con = fileConn, sep = "\n")
       }

       if (i %in% c("F9_00_RETURN_AMENDED_X", "F9_00_RETURN_GROUP_X")) {
           writeLines(paste(vnm, "<- standardize_boole( ", vnm, ") "), con = fileConn, sep = "\n") 
       }

       writeLines(paste0("\n\n\n"), con = fileConn, sep = "") 
    }

    writeLines("EIN2 <- format_ein( ORG_EIN )", con = fileConn, sep = "\n")
    writeLines("DAYS <- as.Date(TAX_PERIOD_END_DATE) - as.Date(TAX_PERIOD_BEGIN_DATE)", con = fileConn, sep = "\n")
    writeLines("RETURN_TAXPER_DAYS <- as.numeric(DAYS) + 1", con = fileConn, sep = "\n")
    writeLines("RETURN_PARTIAL_X <- RETURN_TAXPER_DAYS < 360", con = fileConn, sep = "\n\n\n")

    keys <- gsub("F9_00_", "", KEYS)
    var.names <- c('OBJECTID', 'URL', 'VERSION', keys, 'EIN2', 'RETURN_TAXPER_DAYS', 'RETURN_PARTIAL_X' ) 
    var.names <- sort( var.names )
    
    writeLines("var.list <- ", con = fileConn, sep = "\n")
    writeLines(paste0("namedList(", paste0(var.names, collapse=","), ")"), con = fileConn, sep = "\n")
    writeLines("return( var.list )", con = fileConn, sep = "\n\n")
    writeLines("}", con = fileConn, sep = "\n\n\n")

    close(fileConn) 

    if (show == TRUE) {
        shell(filename)
    } 

    return(NULL)
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
create_code_chunk <- function( rdb.table="F9-P00-T00-HEADER", show=FALSE )
{

    # if( ! exists("rdb.keys") ){ data(rdbkeys) }
    # names( rdb.keys ) <- toupper( names( rdb.keys ) )
    
    if( ! exists("concordance") ){ concordance <- get_concordance() }
    
    concordance <- concordance[ ! duplicated( concordance$xpath ) , ]
    names( concordance ) <- toupper( names( concordance ) )
    ccdance <- dplyr::filter( concordance, RDB_TABLE ==  rdb.table ) 
    rdb.keys <- dplyr::filter( concordance, VARIABLE_NAME %in% RDB.KEYS )
    # ccdance <- ccdance[ ! ccdance$VARIABLE_NAME %in% RDB.KEYS , ]
    
    function.name <- paste0( "BUILD_", gsub( "-", "_", rdb.table ) )
    filename <- paste0( function.name, ".R" )
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
    
    writeLines( paste0( function.name, " <- function( doc, url ){ " ), con = fileConn, sep = "\n\n\n" )
    
    # close( fileConn )
    # add_keys( filename, rdb.keys=rdb.keys )
    # fileConn <- file( filename, open="a" )  

    writeLines( "keys <- get_keys( doc, url )", con = fileConn, sep = "\n" )
    writeLines( "URL <- url", con = fileConn, sep = "\n" )
    writeLines( "ORG_EIN <- keys[['ORG_EIN']]", con = fileConn, sep = "\n" )
    writeLines( "TAX_YEAR <- keys[['TAX_YEAR']]", con = fileConn, sep = "\n\n\n" )
    
    writeLines( "######----------------------------------------------------", con = fileConn, sep = "\n" )
    writeLines( "######", con = fileConn, sep = "\n" )  
    writeLines( "######    1:1 TABLE VARIABLES", con = fileConn, sep = "\n" )
    writeLines( "######", con = fileConn, sep = "\n" )  
    writeLines( "######----------------------------------------------------", con = fileConn, sep = "\n\n\n" ) 
    
 
    for( i in unique( ccdance$VARIABLE_NAME ) )
    {

       sub.dat <- ccdance[ ccdance$VARIABLE_NAME == i , ]

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
        writeLines( paste( i, "<- xml2::xml_text( xml2::xml_find_all( doc,", or.var.name, ") )"), con = fileConn, sep = "\n" )
        writeLines( paste0( "if( length( ", i, " ) > 1 )" ), con = fileConn, sep = "\n" )
        writeLines( paste0( "{ ", "\n  log_collapsed_record( varname=", i, ", ein=ORG_EIN, year=TAX_YEAR, url=URL )" ), con = fileConn, sep = "\n" )
        writeLines( paste0( "  ", i, " <-  paste0( '{', ", i, ", '}', collapse=';' ) "), con = fileConn, sep = "\n" )
        writeLines( "} ", con = fileConn, sep = "\n\n\n\n\n" )

        } else
        {

          single.xpath <- paste( "'", xpath.vec, "'", sep="" )
          writeLines( paste( i, "<- xml2::xml_text( xml2::xml_find_all( doc,", single.xpath, ") )"), con = fileConn, sep = "\n" )
          writeLines( paste0( "if( length( ", i, " ) > 1 )" ), con = fileConn, sep = "\n" )
          writeLines( paste0( "{ ", "\n  log_collapsed_record( varname=", i, ", ein=ORG_EIN, year=TAX_YEAR, url=URL )" ), con = fileConn, sep = "\n" )
          writeLines( paste0( "  ", i, " <-  paste0( '{', ", i, ", '}', collapse=';' ) "), con = fileConn, sep = "\n" )
          writeLines( "} ", con = fileConn, sep = "\n\n\n\n\n" )

        }
    }

    # keys <- gsub( "F9_00_", "", RDB.KEYS )
    var.names <- unique( ccdance$VARIABLE_NAME )

    writeLines( "var.list <- ", con = fileConn, sep = "\n" )
    writeLines( paste0( "namedList(", paste0( var.names, collapse=","), ")" ), con = fileConn, sep = "\n" )
    writeLines( "if( sum(is.na(var.list)) == length(var.list)){return(NULL)}", con = fileConn, sep = "\n" )
    writeLines( "df <- as.data.frame( c(keys,var.list) )", con = fileConn, sep = "\n\n\n" )

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





#' Create Code Chunk for Relational Database Table
#'
#' Generates an R script that defines a function to build a 1:M relational database table.
#'
#' @param rdb.table Character. The name of the relational database table (default is "F9-P08-T01-REVENUE-PROGRAMS").
#' @param show Logical. If TRUE, opens the generated file for review. Default is FALSE.
#'
#' @details
#' This function dynamically generates an R script file containing a function to construct a specific 1:M table for a relational database. The generated function incorporates keys, retrieves variables using XPaths, and renames variables based on a provided map.
#'
#' The resulting R script includes roxygen-style comments, metadata, and operational code to read, process, and return the table.
#'
#' @return NULL. The function generates an R script file as a side effect.
#'
#' @examples
#' \dontrun{
#' create_code_chunk_rdb("F9-P08-T01-REVENUE-PROGRAMS", show = TRUE)
#' }
#'
#' @export
create_code_chunk_rdb <- function(rdb.table = "F9-P08-T01-REVENUE-PROGRAMS", show = FALSE) {

    # if( ! exists("concordance") ){ concordance <- get_concordance() }

    # CC.KEYS <- dplyr::filter(concordance, variable_name %in% RDB.KEYS )
    # names(CC.KEYS) <- toupper(names(CC.KEYS))

    # concordance <- concordance[concordance$rdb_table == rdb.table, ]
    # concordance <- concordance[!duplicated(concordance$xpath), ]
    # names(concordance) <- toupper(names(concordance))
    # concordance <- concordance[ !concordance$VARIABLE_NAME %in% RDB.KEYS, ]

    function.name <- paste0("BUILD_", gsub("-", "_", rdb.table))
    filename <- paste0(function.name, ".R")
    file.create(filename)

    fileConn <- file(filename, open = "a")

    writeLines("#' @title ", con = fileConn, sep = "\n")
    writeLines(paste0("#'   Build table ", rdb.table), con = fileConn, sep = "\n")  
    writeLines("#' ", con = fileConn, sep = "\n")
    writeLines("#' @description ", con = fileConn, sep = "\n")
    writeLines("#'   Generate a 1:M table for the relational database.", con = fileConn, sep = "\n")
    writeLines("#' ", con = fileConn, sep = "\n") 
    writeLines("#' @export ", con = fileConn, sep = "\n")

    writeLines(paste0(function.name, " <- function( doc, url ){ "), con = fileConn, sep = "\n\n")

    writeLines("keys <- get_keys( doc, url )", con = fileConn, sep = "\n")
    writeLines("dfk <- as.data.frame( keys )", con = fileConn, sep = "\n\n")

    fxline1 <- paste0("table.headers <- TABLE.HEADERS[[ '", rdb.table, "' ]]")
    fxline2 <- paste0("v.map <- get_var_map( '", rdb.table, "' )")

    writeLines(fxline1, con = fileConn, sep = "\n")    
    writeLines(fxline2, con = fileConn, sep = "\n")

    fxline3 <- paste0("df <- get_table_v2( doc, table.name='", rdb.table, "', table.headers  )")

    writeLines(fxline3, con = fileConn, sep = "\n")
    writeLines("if( is.null(df) ){ return( NULL ) }", con = fileConn, sep = "\n")
    writeLines("df <- re_name( df, v.map )", con = fileConn, sep = "\n\n")

    writeLines("rdb.table <- data.frame( dfk, df )", con = fileConn, sep = "\n")

    writeLines("return ( rdb.table )", con = fileConn, sep = "\n\n")
    writeLines("}", con = fileConn, sep = "\n\n")

    close(fileConn) 

    if (show == TRUE) {
        shell(filename)
    }

    return(NULL)
}


