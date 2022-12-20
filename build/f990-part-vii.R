library( dplyr )
library( irs990efile )
library( jsonlite )


# LOAD NCCS INDEX, EXCLUDE 990PF FILERS

index <- readRDS( "index-nccs.rds" )
index <- dplyr::filter( index, FormType %in% c("990","990EZ") )




#######################

# RDB TABLES ARE EMBEDDED IN XML DOCS
# WHERE ALL OF THE VARIABLES IN A TABLE
# SHARE A COMMON GROUP NAME

# find_group_names() IDENTIFIES THESE 
# FIELDS FROM THE XPATHS IN THE TABLE 

# TABLE F9-P07-T01-COMPENSATION


find_group_names( table.name="F9-P07-T01-COMPENSATION" )

# map to standardize variable names across table versions 
v.map <- get_var_map( table.name="F9-P07-T01-COMPENSATION" )

# TWO ARE MISSING - ADDED MANUALLY HERE 

x1 <- c("F9_07_COMP_DTK_COMP_OTH","F9_07_COMP_DTK_COMP_OTH")
x2 <- c("ExpenseAccountOtherAllwncAmt","ExpenseAccountOtherAllowances")
d.add <- data.frame( VARIABLE=x1, XSD_VARNAME=x2 )
v.map <- bind_rows( v.map, d.add )


# ADAPT THIS FUNCTION 

# NORMALLY THE VARIABLE MAP (v.map) IS 
# GENERATED DYNAMICALLY: NEED TO PASS IT
# AS AN ARGUMENT HERE SO WE CAN SEND
# THE TEMP VERSION ABOVE 

build_rdb_table <- function (url, table.name, v.map) 
{
    doc <- NULL
    try(doc <- xml2::read_xml(url), silent = T)
    if (is.null(doc)) {
        return(NULL)
    }
    xml2::xml_ns_strip(doc)
    OBJECTID <- get_object_id(url)
    URL <- url
    EIN <- xml2::xml_text(xml2::xml_find_all(doc, "//Return/ReturnHeader/Filer/EIN"))
    V_990NAMEpost2014 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt"
    V_990NAME_2013 <- "//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1"
    V_990NAMEpre2013 <- "//Return/ReturnHeader/Filer/Name/BusinessNameLine1"
    name.xpath <- paste(V_990NAME_2013, V_990NAMEpre2013, V_990NAMEpost2014, 
        sep = "|")
    NAME <- xml2::xml_text(xml2::xml_find_all(doc, name.xpath))
    V_990TFpost2013 <- "//Return/ReturnHeader/ReturnTypeCd"
    V_990TFpre2013 <- "//Return/ReturnHeader/ReturnType"
    tax.form.xpath <- paste(V_990TFpost2013, V_990TFpre2013, 
        sep = "|")
    FORMTYPE <- xml2::xml_text(xml2::xml_find_all(doc, tax.form.xpath))
    V_990FYRpost2013 <- "//Return/ReturnHeader/TaxYr"
    V_990FYRpre2013 <- "//Return/ReturnHeader/TaxYear"
    fiscal.year.xpath <- paste(V_990FYRpost2013, V_990FYRpre2013, 
        sep = "|")
    TAXYR <- xml2::xml_text(xml2::xml_find_all(doc, fiscal.year.xpath))
    group.names <- find_group_names(table.name = table.name)
    df <- get_table(doc, group.names, table.name)
    if (is.null(df)) {
        return(NULL)
    }
    # v.map <- get_var_map(table.name = table.name)
    df <- re_name(df, v.map)
    rdb.table <- data.frame(OBJECT_ID = OBJECTID, EIN = EIN, 
        NAME = NAME, TAXYR = TAXYR, FORMTYPE = FORMTYPE, URL = URL, 
        df, stringsAsFactors = F)
    return(rdb.table)
}



# TEST IT: 

test.index <- dplyr::sample_n( index, 25 ) 
test.urls <- test.index$URL 

table.name <- "F9-P07-T01-COMPENSATION"

results.list <- list()

for( i in 1:length(test.urls) )
{
  url <- test.urls[i]
  try( results.list[[i]] <- build_rdb_table( url, table.name, v.map ) )
}


df <- dplyr::bind_rows( results.list )





##########################
##########################




split_index <- function( index, group.size=1000 )
{
  urls <- index$URL
  f <- ( ( 1 : length(urls) ) + group.size - 1 ) %/% group.size
  f <- paste0( "g", f )
  f <- factor( f, levels=unique(f) )
  url.list <- split( urls, f )
  return( url.list )
}




# 1. SPLIT INDEX INTO YEARS
# 2. SPLIT A YEAR INTO PARTS
# 3. BUILD TABLES FOR EACH PART
# 4. SAVE IN FILE TO COMBINE LATER

build_year <- function( year, table.name, v.map )
{

  dir.create( year )
  setwd( year )

  total.start.time <- Sys.time()

  index.sub <- dplyr::filter( index, TaxYear == year )
  split.index <- split_index( index.sub )

  results.list <- list()
  failed.urls <- NULL


  for( i in 1:length(split.index) )
  {


    urls <- split.index[[i]]
    
    start.time <- Sys.time()

    for( j in 1:length(urls) )
    {
      url <- urls[j]

      try( temp.table <- build_rdb_table( url, table.name, v.map ) )

      results.list[[j]] <- temp.table 

      if( is.null(temp.table) )
      {
         failed.urls[[ length(failed.urls) + 1 ]] <- url
      }


    }


    end.time <- Sys.time()

    print( paste0( "Batch ", i ) )
    print( end.time - start.time )
    print( paste( "There are ", length(failed.urls), " failed XML URLs to re-try." ) )
  
    ## add random string so filenames not duplicated
    ## when using parallelization 
    # time <- format(Sys.time(), "%b-%d-%Y-%Hh-%Mm")
    # rand <- paste( sample(LETTERS,5), collapse="" )
    # time <- paste0( "time-", time, "-", rand  )

    b.num <- substr( 10000 + i, 2, 5 ) 

    df <- dplyr::bind_rows( results.list )
    saveRDS( df, paste0( "batch", "-", b.num, ".rds" ) )
    write.csv( df, paste0( "batch", "-", b.num, ".csv" ), row.names=F )
  }


  total.end.time <- Sys.time()

  failed.urls2 <- unlist( failed.urls )
  dump( list="failed.urls2", file="FAILED-URLS.R" )  

  setwd( ".." )

  print( paste0( "YEAR ", year, " COMPLETE" ) )
  print( "TOTAL RUN TIME:" )
  print( difftime( total.start.time, total.end.time, units="hours") )

  # return( failed.urls2 )

}



find_group_names( table.name="F9-P07-T01-COMPENSATION" )
v.map <- get_var_map( table.name="F9-P07-T01-COMPENSATION" )
x1 <- c("F9_07_COMP_DTK_COMP_OTH","F9_07_COMP_DTK_COMP_OTH")
x2 <- c("ExpenseAccountOtherAllwncAmt","ExpenseAccountOtherAllowances")
d.add <- data.frame( VARIABLE=x1, XSD_VARNAME=x2 )
v.map <- bind_rows( v.map, d.add )

table.name <- "F9-P07-T01-COMPENSATION"

years <- c( 2009:2020 ) %>% as.character()

for( k in years )
{
  build_year( k, table.name, v.map )
}


savehistory(file = ".Rhistory")




