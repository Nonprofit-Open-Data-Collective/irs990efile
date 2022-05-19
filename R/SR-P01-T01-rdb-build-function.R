#very similar to build_rdb_table function
#can probably rework build_rdb_table table function for different case calls 
# depending on the table run, main changes are on lines 90-128

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
  all.xpaths <- doc %>% xml_get_paths()
  unique.xpaths <- all.xpaths %>% 
    unlist() %>% 
    unique()
  
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
  
  
  ##disregarded entity name
  V_SR_01_PC_DISREG_NApost2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/DisregardedEntityName"
  V_SR_01_PC_DISREG_NApre2013 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/NameOfDisregardedEntity"
  disreg.name.xpaths <- paste(V_SR_01_PC_DISREG_NApost2013,
                              V_SR_01_PC_DISREG_NApre2013,sep = "|")
  
  DISREGNAME <- paste(xml2::xml_text( xml2::xml_find_all( doc, disreg.name.xpaths )),
                      sep = " ")
  
  
  ##us address
  #strategy get all the xpaths with us or foreign address and concatenate them together
  V_SR_01_PC_ADDR_USpost2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/USAddress"
  V_SR_01_PC_ADDR_USpre2013 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/AddressUS"
  V_SR_01_PC_ADDR_FORpost2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/ForeignAddress"
  V_SR_01_PC_ADDR_FORpre2013 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/AddressForeign"
  address.xpaths <- paste(V_SR_01_PC_ADDR_USpost2013,V_SR_01_PC_ADDR_USpre2013,
                          V_SR_01_PC_ADDR_FORpost2013,V_SR_01_PC_ADDR_FORpre2013,
                          sep = "|")
  ADDRESS <- paste(xml2::xml_text(xml2::xml_find_all(doc,address.xpaths)))
  
  
  ##direct controlling entity name
  V_SR_01_PC_CTRL_NApost2013 <- "//Return/ReturnData/IRS990ScheduleR/
  IdDisregardedEntitiesGrp/DirectControllingEntityName"
  V_SR_01_PC_CTRL_NApre2013_1 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/DirectControllingEntityName"
  V_SR_01_PC_CTRL_NApre2013_2 <- "//Return/ReturnData/IRS990ScheduleR/
  Form990ScheduleRPartI/DirectControllingEntityNA"
  ctrl.name.xpaths <- paste(V_SR_01_PC_CTRL_NApost2013, V_SR_01_PC_CTRL_NApre2013_1,
                            V_SR_01_PC_CTRL_NApre2013_2, sep = "|")
  
  CTRLNAME <- paste(xml2::xml_text( xml2::xml_find_all( doc, ctrl.name.xpaths )), sep = " ")
  
  
  
  v.map <- get_var_map( table.name=table.name )
  df <- re_name( df, v.map )
  
  rdb.table <- data.frame( OBJECT_ID=OBJECTID, EIN=EIN, NAME=NAME, TAXYR=TAXYR, 
                           FORMTYPE=FORMTYPE, URL=URL, SR_01_DISREG_ENTITY_NAME = DISREGNAME,
                           SR_01_ADDR = ADDRESS, df, SR_01_DISREG_CTRL_NAME = CTRLNAME, 
                           stringsAsFactors=F )
  
  return ( rdb.table )
  
}