#990 partvii build-full-year comp table
library(dplyr)
library( irs990efile )
library(jsonlite)

#basic process:
#1) iterate through index
#2) build out part vii comp table
#3) save to csv

res <- read_json("https://s3.amazonaws.com/irs-form-990/index_2018.json")
resFilings <- res$Filings2018

results <- list() #list to save results to

#takes about an hour to iterate through 10,000 filers
for(i in 1:10000){
  if(i/1000 == 0) print(paste0(i," org's completed"))
  url <- resFilings[[i]]$URL
  type <- resFilings[[i]]$FormType
  
  #helpful for debugging
  # print(i)
  # print(url)
  # print(type)
  
  # only need to check 990EZ and 990
  if(type != '990PF'){
    try(results[[i]] <- build_rdb_table(url,"F9-P07-T01-COMPENSATION"))
  }
}

#save results as CSV file
df <- dplyr::bind_rows( results )
write.csv(df,"2018-PART-VII-TABLE-01-FIRST10k.csv")
