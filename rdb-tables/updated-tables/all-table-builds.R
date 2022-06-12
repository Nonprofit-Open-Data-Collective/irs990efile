#6/11/2022
#more general scripts for schedules (not sched h yet)
#general 990 rdb tables included too
library(dplyr)
library( irs990efile )
index <- read.csv("SCHEDULES.csv")
num.samples <- 50


################################################################################

table.list <- c("SA-P01-T01-PUBLIC-CHARITY-STATUS","SA-P99-T01-PUBLIC-CHARITY-STATUS",
                "SC-P01-T01-POLITICAL-ORGS-INFO","SD-P07-T01-INVESTMENTS-OTH-SECURITIES",
                "SD-P08-T01-INVESTMENTS-PROG-RLTD", "SD-P09-T01-OTH-ASSETS", "SD-P10-T01-OTH-LIABILITIES",
                "SF-P01-T01-FRGN-ACTS-BY-REGION","SF-P02-T01-FRGN-ORG-GRANTS", "SF-P03-T01-FRGN-INDIV-GRANTS",
                "SG-P01-T01-FUNDRAISERS-INFO","SG-P02-T01-FUNDRAISING-EVENTS",
                "SI-P02-T01-GRANTS-US-ORGS-GOVTS","SI-P03-T01-GRANTS-US-INDIV", "SJ-P02-T01-COMPENSATION-DTK",
                "SK-P01-T01-BOND-ISSUES","SK-P02-T01-BOND-PROCEEDS","SK-P03-T01-BOND-PRIVATE-BIZ-USE",
                "SK-P04-T01-BOND-ARBITRAGE","SK-P05-T01-PROCEDURE-CORRECTIVE-ACT",
                "SK-P99-T01-BOND-PRIVATE_BIZ_USE","SL-P02-T01-LOANS-INTERESTED-PERS",
                "SL-P03-T01-GRANTS-INTERESTED-PERS","SL-P04-T01-BIZ-TRANSAC-INTERESTED-PERS",
                "SM-P01-T01-NONCASH-CONTRIBUTIONS","SN-P01-T01-LIQUIDATION-TERMINATION-DISSOLUTION",
                "SN-P02-T01-DISPOSITION-OF-ASSETS","SR-P01-T01-ID-DISREGARDED-ENTITIES",
                "SR-P02-T01-ID-RLTD-TAX-EXEMPED-ORGS","SR-P03-T01-ID-RLTD-ORGS-TAXABLE-PARTNERSHIP",
                "SR-P04-T01-ID-RLTD-ORGS-TAXABLE-CORPORATION","SR-P05-T01-TRANSACTIONS-RLTD-ORGS",
                "SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP")

#creating indexes

#sched a-r tables (excluding b,e,h)

index.a <- dplyr::filter( index, SCHEDA )
sample.a <- dplyr::sample_n( index.a, num.samples )
dput( sample.a$URL, file = "schedule-a-sample-orgs-2.txt")
a.urls <- sample.a$URL

index.c <- dplyr::filter( index, SCHEDC )
sample.c <- dplyr::sample_n( index.c, num.samples )
dput( sample.c$URL, file = "schedule-c-sample-orgs-2.txt")
c.urls <- sample.c$URL

index.d <- dplyr::filter( index, SCHEDD )
sample.d <- dplyr::sample_n( index.d, num.samples )
dput( sample.d$URL, file = "schedule-d-sample-orgs-2.txt")
d.urls <- sample.d$URL

index.f <- dplyr::filter( index, SCHEDF )
sample.f <- dplyr::sample_n( index.f, num.samples )
dput( sample.f$URL, file = "schedule-f-sample-orgs-2.txt")
f.urls <- sample.f$URL

index.g <- dplyr::filter( index, SCHEDG )
sample.g <- dplyr::sample_n( index.g, num.samples )
dput( sample.g$URL, file = "schedule-g-sample-orgs-2.txt")
g.urls <- sample.g$URL

index.i <- dplyr::filter( index, SCHEDI )
sample.i <- dplyr::sample_n( index.i, num.samples )
dput( sample.i$URL, file = "schedule-i-sample-orgs-2.txt")  # save this so results can be replicated 
i.urls <- sample.i$URL

index.j <- dplyr::filter( index, SCHEDJ )
sample.j <- dplyr::sample_n( index.j, num.samples )
dput( sample.j$URL, file = "schedule-j-sample-orgs-2.txt")
j.urls <- sample.j$URL

index.k <- dplyr::filter( index, SCHEDK )
sample.k <- dplyr::sample_n( index.k, num.samples )
dput( sample.k$URL, file = "schedule-k-sample-orgs-2.txt")
k.urls <- sample.k$URL
index.k <- dplyr::filter( index, SCHEDK )
sample.k <- dplyr::sample_n( index.k, num.samples )
dput( sample.k$URL, file = "schedule-k-sample-orgs-2.txt")
k.urls <- sample.k$URL

index.l <- dplyr::filter( index, SCHEDL )
sample.l <- dplyr::sample_n( index.l, num.samples )
dput( sample.l$URL, file = "schedule-l-sample-orgs-2.txt")
l.urls <- sample.l$URL

index.m <- dplyr::filter( index, SCHEDM )
sample.m <- dplyr::sample_n( index.m, num.samples )
dput( sample.m$URL, file = "schedule-m-sample-orgs-2.txt")
m.urls <- sample.m$URL

index.n <- dplyr::filter( index, SCHEDN )
sample.n <- dplyr::sample_n( index.n, num.samples )
dput( sample.n$URL, file = "schedule-n-sample-orgs-2.txt")
n.urls <- sample.n$URL

index.r <- dplyr::filter( index, SCHEDR )
sample.r <- dplyr::sample_n( index.r, num.samples )
dput( sample.r$URL, file = "schedule-r-sample-orgs-2.txt")
r.urls <- sample.r$URL


for(i in 1:length(table.list)){
  updating.urls <- list()
  if(substr(table.list[i],2,2) == "K") updating.urls <- k.urls
  else if(substr(table.list[i],2,2) == "L") updating.urls <- l.urls
  else if(substr(table.list[i],2,2) == "M") updating.urls <- m.urls
  else if(substr(table.list[i],2,2) == "N") updating.urls <- n.urls
  else if(substr(table.list[i],2,2) == "R") updating.urls <- r.urls
  else if(substr(table.list[i],2,2) == "A") updating.urls <- a.urls
  else if(substr(table.list[i],2,2) == "C") updating.urls <- c.urls
  else if(substr(table.list[i],2,2) == "D") updating.urls <- d.urls
  else if(substr(table.list[i],2,2) == "F") updating.urls <- f.urls
  else if(substr(table.list[i],2,2) == "G") updating.urls <- g.urls
  else if(substr(table.list[i],2,2) == "I") updating.urls <- i.urls
  else if(substr(table.list[i],2,2) == "J") updating.urls <- j.urls
  results <- list()
  for(j in 1:length(updating.urls)){
    print(j)
    try(results[[j]] <- build_rdb_table_adapted(updating.urls[j],table.list[i]))
  }
  if(length(results) > 0){
    df <- dplyr::bind_rows( results )
    write.csv( df, paste0( table.list[i], "-new.csv"), row.names=F )
  }
  else{
    print(table.list[i])
  }
}

#then build out schedule h
#and then 990

#skipped a99,c01(just empty),k99,l03(just empty),sr06(prob no matches)
#rerunning just to check
table.list.nonworking <- c("SA-P99-T01-PUBLIC-CHARITY-STATUS", "SC-P01-T01-POLITICAL-ORGS-INFO",
                           "SK-P99-T01-BOND-PRIVATE_BIZ_USE", "SL-P03-T01-GRANTS-INTERESTED-PERS",
                           "SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP")

for(i in 1:length(table.list.nonworking)){
  updating.urls <- list()
  if(substr(table.list.nonworking[i],2,2) == "K") updating.urls <- k.urls
  else if(substr(table.list.nonworking[i],2,2) == "L") updating.urls <- l.urls
  else if(substr(table.list.nonworking[i],2,2) == "M") updating.urls <- m.urls
  else if(substr(table.list.nonworking[i],2,2) == "N") updating.urls <- n.urls
  else if(substr(table.list.nonworking[i],2,2) == "R") updating.urls <- r.urls
  else if(substr(table.list.nonworking[i],2,2) == "A") updating.urls <- a.urls
  else if(substr(table.list.nonworking[i],2,2) == "C") updating.urls <- c.urls
  else if(substr(table.list.nonworking[i],2,2) == "D") updating.urls <- d.urls
  else if(substr(table.list.nonworking[i],2,2) == "F") updating.urls <- f.urls
  else if(substr(table.list.nonworking[i],2,2) == "G") updating.urls <- g.urls
  else if(substr(table.list.nonworking[i],2,2) == "I") updating.urls <- i.urls
  else if(substr(table.list.nonworking[i],2,2) == "J") updating.urls <- j.urls
  results <- list()
  for(j in 1:length(updating.urls)){
    print(j)
    try(results[[j]] <- build_rdb_table(updating.urls[j],table.list.nonworking[i]))
  }
  print(table.list.nonworking[i])
  df <- dplyr::bind_rows( results )
  write.csv( df, paste0( table.list.nonworking[i], "-old-2.csv"), row.names=F )
}
#actual nonworking are a99 and k99 (rest are just sparse)


table.list.990 <- c("F9-P03-T01-PROGRAMS",
                    "F9-P07-T01-COMPENSATION",
                    "F9-P07-T01-COMPENSATION-HCE-EZ",
                    "F9-P99-T01-COMPENSATION",
                    "F9-P08-T01-REVENUE-PROGRAMS",
                    "F9-P08-T02-REVENUE-MISC",
                    "F9-P09-T01-EXPENSES-OTHER",
                    "F9-P07-T02-CONTRACTORS")
for (i in 1:length(table.list.990)){
  #using the large org's (with sched j's)
  updating.urls <- j.urls
  results <- list()
  for(j in 1:length(updating.urls)){
    print(j)
    try(results[[j]] <- build_rdb_table_adapted(updating.urls[j],table.list.990[i]))
  }
  if(length(results) > 0){
    df <- dplyr::bind_rows( results )
    write.csv( df, paste0( table.list.990[i], "-new.csv"), row.names=F )
  }
  else{
    print(table.list.990[i])
    #0701 COMP HCE EZ and 0799 COMP (just sparse)
  }
}

#likely just sparse
table.list.990.nonworking <- c("F9-P07-T01-COMPENSATION-HCE-EZ",
                               "F9-P99-T01-COMPENSATION")
for (i in 1:length(table.list.990.nonworking)){
  #using the large org's (with sched j's -- probably some downsides)
  updating.urls <- j.urls
  results <- list()
  for(j in 1:length(updating.urls)){
    print(j)
    try(results[[j]] <- build_rdb_table_adapted(updating.urls[j],table.list.990.nonworking[i]))
  }
  df <- dplyr::bind_rows( results )
  write.csv( df, paste0( table.list.990.nonworking[i], "-new-2.csv"), row.names=F )
}

