library( dplyr )        # data wrangling
library( xmltools )     # xml utilities
library( xml2 )         # xml utilities
library( XML )          # xml utilities 
library( knitr )        # formatting 
library( data.table )

url <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201300879349300235_public.xml"
doc <- xml2::read_xml( file(url) )
xml2::xml_ns_strip( doc )


parse_xml_to_table <- function( url ) {
  # Read XML file
  xml_data <- read_xml( file(url) )
  xml2::xml_ns_strip( xml_data )

  # Extract records using XPath
  records <- xml_find_all(xml_data, "//*")

  # Convert XML records to a data.table
  dt <- data.table(
    id = xml_text(xml_find_all(records, "id")),
    name = xml_text(xml_find_all(records, "name")),
    value = xml_text(xml_find_all(records, "value"))
  )

  return(dt)
}

parse_xml_to_table(url)


