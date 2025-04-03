

library( dplyr )        # data wrangling
library( xmltools )     # xml utilities
library( xml2 )         # xml utilities
library( XML )          # xml utilities 
library( knitr )        # formatting 


url <- "https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201300879349300235_public.xml"
doc <- xml2::read_xml( file(url) )
xml2::xml_ns_strip( doc )

doc %>% xmltools::xml_get_paths()

xx <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_path()


tt <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_text()


get_path_depth <- function( xpaths )
{
   xpath_depth <- function(x)
   { 
     x <- unlist( strsplit( x, "" ) )
     sum( x == "/" ) 
   }

   xpd <- sapply( xpaths, xpath_depth )
   return(xpd)
}

table( get_path_depth( xx ) )



# x <- "/Return/ReturnData/IRS990ScheduleO/GeneralExplanation[1]/ReturnReference"
# grepl( "\\[[0-9]{1,3}\\]", x )


get_table_n <- function( xpaths )
{
  get_n <- function(x)
  {
    start <- regexpr( "\\[", x )
    stop  <- regexpr( "\\]", x )
    n <- substr( x, start+1, stop-1 )
    return(n)
  }

  table.n <- sapply( xpaths, get_n, USE.NAMES=F )
  table.n <- ifelse( table.n=="", 0, table.n )
  table.n <- sprintf( "%05.0f", as.numeric(table.n) )
  table.n <- paste0( "tid-", table.n )
  return( table.n )
}

table( get_table_n(xx) )
table.n <- get_table_n(xx)



get_table_id <- function( xpaths )
{
   get_table_name <- function(x)
   {
     # position number brackets
     end  <- regexpr( "\\[", x ) - 1
     end <- ifelse( end > 0, end, nchar(x) )
     

     # position last xpath level 
     positions <- gregexpr( "/", x ) %>% unlist()
     last <- positions[ length(positions) ]

     end <- ifelse( end < 0, last, end )
     end <- ifelse( end == 1, nchar(x), end )

     t.name <- substr( x, 1, end )

     # get last two levels
     positions <- gregexpr( "/", t.name ) %>% unlist()
     last <- positions[ length(positions) ]


   # > working here 

     start.table.name <- positions[ length(positions)-2 ]
     start.table.name <- ifelse( length(start.table.name) == 0, 1, start.table.name )

     t.name <- substr( t.name, start.table.name, end )

     # position last xpath level 
     positions <- gregexpr( "/", x ) %>% unlist()
     end2 <- positions[ length(positions) ]

     end <- ifelse( end < 0, end2, end )

     # get last two levels
     start.table.name <- positions[ length(positions)-2 ]


     t.name <- gsub( "^/", "", t.name )
     t.name <- gsub( "/", "-", t.name )

     # t.name <- gsub( "\\[", "-", t.name )
     # t.name2 <- paste0( t.name, "-000" )
     # t.name[ end < 0 ] <- t.name2[ end < 0 ]

     return(t.name)
   }

   table.name <- sapply( xpaths, get_table_name, USE.NAMES=F )
   table.n <- get_table_n( xpaths )
   table.id <- paste0( table.name, "-", table.n )
   return( table.id )
   
}




xx <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_path()


tt <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_text()

d <- data.frame( xpath=xx )

d$depth    <- get_path_depth( xx )
d$table.n  <- get_table_n( xx )
d$table.id <- get_table_id( xx )

d$value <- tt

node <- rep( "", length(xx) )
node[ xx %in% parent_xpaths ] <- "parent"
node[ xx %in% leaf_xpaths ] <- "leaf"

cbind( xx, node ) |> head( 50 )

d$node <- node

write.csv( d, "xml-simple.csv" )

 
head(d,25) |> knitr::kable()



x1 <- "/Return/ReturnData/IRS990ScheduleO/GeneralExplanation[1]/ReturnReference"
x <- "/Return/ReturnData/IRS990ScheduleO/GeneralExplanation/ReturnReference"

get_id( x1 )
get_id( x2 )

get_table_id <- function( xpaths )
{
   get_table_name <- function(x)
   {
     # position number brackets
     end  <- regexpr( "\\[", x ) - 1
     end <- ifelse( end > 0, end, nchar(x) )
     

     # position last xpath level 
     positions <- gregexpr( "/", x ) %>% unlist()
     last <- positions[ length(positions) ]

     end <- ifelse( end < 0, last, end )
     end <- ifelse( end == 1, nchar(x), end )

     t.name <- substr( x, 1, end )

     # get last two levels
     positions <- gregexpr( "/", t.name ) %>% unlist()
     last <- positions[ length(positions) ]


   # > working here 

     start.table.name <- positions[ length(positions)-2 ]
     start.table.name <- ifelse( length(start.table.name) == 0, 1, start.table.name )

     t.name <- substr( t.name, start.table.name, end )

     # position last xpath level 
     positions <- gregexpr( "/", x ) %>% unlist()
     end2 <- positions[ length(positions) ]

     end <- ifelse( end < 0, end2, end )

     # get last two levels
     start.table.name <- positions[ length(positions)-2 ]


     t.name <- gsub( "^/", "", t.name )
     t.name <- gsub( "/", "-", t.name )

     # t.name <- gsub( "\\[", "-", t.name )
     # t.name2 <- paste0( t.name, "-000" )
     # t.name[ end < 0 ] <- t.name2[ end < 0 ]

     return(t.name)
   }

   table.name <- sapply( xpath, get_table_name, USE.NAMES=F )
   table.n <- get_table_n( xpaths )
   table.id <- paste0( table.name, "-", table.n )
   return( table.id )
   
}

table.id <- get_table_id( xx )
head( table.id, 50 )




