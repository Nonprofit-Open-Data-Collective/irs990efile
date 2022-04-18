setwd( "C:/Users/jdlec/Dropbox (Personal)/00 - Nonprofit Open Data/14 - Revisions to Concordance/SUMMERGRANT/concordance-revisions/concordance-files/csv2/r-package/csv/create-chunks-code" )

library( dplyr )

source( "rdb-keys.R" )
source( "concordance.R" )
source( "create-code-chunks-v3.R" )

# TEST IT
create_code_chunks(  rdb.table="F9-P01-T00-SUMMARY", show=TRUE )



# GET ALL ONE-TO-ONE TABLES 

d <- concordance
t <- sort( unique( d$rdb_table ) )
t00 <- t[ grepl( "-T00-", t ) ]



# CREATE CODE CHUNKS FOR ALL ONE-TO-ONE TABLES

dir.create( "chunks" )
setwd( "chunks" )

for( i in t00 )
{
   create_code_chunks(  rdb.table=i, show=FALSE )
}

setwd( ".." )







files <- 
c("f990-part-00.csv", "f990-part-01.csv", "f990-part-02.csv", 
"f990-part-03.csv", "f990-part-04.csv", "f990-part-05.csv", "f990-part-06.csv", 
"f990-part-07.csv", "f990-part-08.csv", "f990-part-09.csv", "f990-part-10.csv", 
"f990-part-11.csv", "f990-part-12.csv", "schedule-a.csv", "schedule-c.csv", 
"schedule-d.csv", "schedule-e.csv", "schedule-f.csv", "schedule-g.csv", 
"schedule-h.csv", "schedule-i.csv", "schedule-j.csv", "schedule-k.csv", 
"schedule-l.csv", "schedule-m.csv", "schedule-n.csv", "schedule-o.csv", 
"schedule-r.csv")




d <- NULL 

for( i in files )
{
   d.temp <- read.csv( i )
   d <- bind_rows( d, d.temp )
}

concordance <- d
dump( "concordance", file = "concordance.R" )










