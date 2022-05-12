#very similar to build_rdb_table function
#can probably rework build_rdb_table table function for different case calls 
# depending on the table run, main changes are on lines 86-119

#custom function for sr-p01-t01 rdb build

#' @title some title text 
#'
#' @description some description text  
#'
#' @details some additional details 
#'
#' @export
build_rdb_table_SR_P01_T01 <- function(url)
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
  table.name <- "SR-P01-T01-ID-DISREGARDED-ENTITIES"
  
  
  group.names <- find_group_names( table.name=table.name )
  df <- get_table( doc, group.names, table.name  )
  
  if( is.null(df) ){ return( NULL ) }
  
  
  
  ##disregarded entity name SR_01_PC_IDEDCENBNLIN1 and lin2
  V_SR_01_PC_IDEDENBNLINE1pre2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/DisregardedEntityName/BusinessNameLine1"
  V_SR_01_PC_IDEDENBNLINE1post2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/DisregardedEntityName/BusinessNameLine1Txt"
  V_SR_01_PC_IDEDENBNLINE1pre2013_2 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/NameOfDisregardedEntity/BusinessNameLine1"
  business.name.l1.xpath <- paste(V_SR_01_PC_IDEDENBNLINE1pre2013
                                  ,V_SR_01_PC_IDEDENBNLINE1post2013,
                                  V_SR_01_PC_IDEDENBNLINE1pre2013_2,sep = "|")
  
  V_SR_01_PC_IDEDENBNLINE2pre2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/DisregardedEntityName/BusinessNameLine2"
  V_SR_01_PC_IDEDENBNLINE2post2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/DisregardedEntityName/BusinessNameLine2Txt"
  V_SR_01_PC_IDEDENBNLINE2pre2013_2 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/NameOfDisregardedEntity/BusinessNameLine2"
  business.name.l2.xpath <- paste(V_SR_01_PC_IDEDENBNLINE2pre2013
                                  ,V_SR_01_PC_IDEDENBNLINE2post2013,
                                  V_SR_01_PC_IDEDENBNLINE2pre2013_2, sep = "|")
  
  BUSINESSNAME <- paste(xml2::xml_text( xml2::xml_find_all( doc, business.name.l1.xpath )),
                        xml2::xml_text( xml2::xml_find_all( doc, business.name.l2.xpath )),
                        sep = "")
  SR_01_PC_IDEDEN <- c(BUSINESSNAME)
  
  #address to do?
  
  
  v.map <- get_var_map( table.name=table.name )
  df <- re_name( df, v.map )
  
  #bind the name row to what we already have
  df <- cbind(SR_01_PC_IDEDEN,df)
  
  rdb.table <- data.frame( OBJECT_ID=OBJECTID, EIN=EIN, NAME=NAME, TAXYR=TAXYR, 
                           FORMTYPE=FORMTYPE, URL=URL, df, stringsAsFactors=F )
  
  return ( rdb.table )
  
}