# irs990efile

R package for building a research database from IRS 990 nonprofit efiler tax returns. Please cite as: 

```
Lecy, J. (2025). The irs990efile Package for R (v.1.0.0). Zenodo: https://doi.org/10.5281/zenodo.14736813
Lecy, J. (2024). IRS 990 Efiler Concordance File (v1.0.0) [Data set]. Zenodo: https://doi.org/10.5281/zenodo.14544301
```

The [**Concordance File**](https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file) provides the crosswalk architecture for moving from XML files to rectangular tables. 

The full set of table descriptions is available in the [**DATA DICTIONARY**](https://nonprofit-open-data-collective.github.io/irs990efile/data-dictionary/data-dictionary.html).

Preprocessed CSV files are available on the NCCS website: [**DOWNLOAD TABLES**](https://nccs.urban.org/nccs/catalogs/catalog-efile.html).

## Installation

*Note that **xmltools** is not available on CRAN so has to be installed remotely before installing the **irs990efile** package.*

```r
# install.packages( 'devtools' )  
devtools::install_github( 'ultinomics/xmltools' )
devtools::install_github( 'nonprofit-open-data-collective/irs990efile' )
```

## Use

The package is designed to make IRS 990 Efiler XML files accessible to the research community by converting them into rectangular CSV formats that will be more familiar to data analysts. The code is designed to make file retrieval and translation straight-forward: 

```r
###################################################
###                                             ###
###      library( irs990efile )                 ###        DO NOT RUN THIS VERSION FIRST
###      build_database( years=2020:2022 )      ###        (IT CAN TAKE DAYS TO BUILD)
###                                             ###
###################################################
```

The code is simple, but the computing time is not. To understand the package and make sure it's working in your local environment start with this simple example (a toy database of ~500 990 returns: 

```r
library( irs990efile )
test_build()

# Roughly equivalent to:
# index <- build_index( tax.years=2018:2022 )
# index.small <- dplyr::sample_n( index, 500 )
# build_database( index.small )
```

You will see the following messaging: 

```
# Building a small database (~500 990 returns).
# Average build time 5-10 minutes.
# Check BUILD-LOG.txt for progress.
#
# (1) Create directory structure.
# (2) Split the index into BATCHFILES, one for each year.
# (3) Parse XML batches into tables and save as CSV files in the YEAR folders.
# (4) Combine all batched CSV files into compiled tables in the COMPILED folder.
# (5) Combine all logfiles of missing xpaths into the FIX folder for review.
#
#  DATABASE BUILD START TIME: 2025-01-30 13:44:29.551851
#  You have 16 cores available for parallel processing.
#  There are 530 returns in this build.
#
#     |Var1 | Freq|
#     |:----|----:|
#     |2018 |  107|
#     |2019 |  113|
#     |2020 |  105|
#     |2021 |   96|
#     |2022 |  109|
# 
#  ###########################
#  ###########################
#  STARTING YEAR 2018
#  There are 107 returns in 2018.
#  There are 11 groups being sent for parallel collection.
#  >> 1:44:57 PM -- Jan 30 2025 -- COMPLETED {G1} {G2} {G3} {G4} {G5} {G6} {G7} {G8} {G9} {G10}
#  There were 0 failed URLS
#  Time for the 2018 loop: 0.61 minutes
#  ###########################
#  ###########################
#  ...
#  DATABASE BUILD FINISH TIME: 2025-01-30 13:47:43.788732 
#  TOTAL BUILD TIME: 0.05 HOURS
```

Upon execution the following directory structure will be created and populated with data as XML files are parsed. 

```r
└── NEW FOLDER (the name will be 5 random letters: QBWJH)
    ├── BUILD-LOG.txt (reports build progress)
    ├── HIST (replication files)
    │   ├── system-info.txt
    │   ├── rhistory
    │   └── index.rds
    ├── FIX (catalog of concordance issues)
    │   ├── missing xpaths.csv
    │   └── collapsed fields.txt
    ├── 2019
    │   ├── BATCHFILE.RDS (all 2019 urls split into batches)
    │   ├── 2019-F9-P00-T00-HEADER-batch-01.CSV
    │   ├── 2019-F9-P00-T00-HEADER-batch-02.CSV
    │   ├── 2019-F9-P01-T00-SUMMARY-batch-01.CSV
    │   ├── 2019-F9-P01-T00-SUMMARY-batch-02.CSV
    │   ├── 2019-F9-P12-T00-FINANCIAL-REPORTING-batch-01.CSV
    │   ├── 2019-F9-P12-T00-FINANCIAL-REPORTING-batch-02.CSV
    │   └── ... all tables x batches 
    ├── 2020
    │   ├── BATCHFILE.RDS (all 2020 urls split into batches)
    │   ├── 2020-F9-P00-T00-HEADER-batch-01.CSV
    │   ├── 2020-F9-P00-T00-HEADER-batch-02.CSV
    │   └── ... all tables x batches
    ├── 2021
    │   ├── BATCHFILE.RDS (all 2021 urls split into batches)
    │   ├── 2021-F9-P00-T00-HEADER-batch-01.CSV
    │   ├── 2021-F9-P00-T00-HEADER-batch-02.CSV
    │   └── ... all tables x batches 
    └── COMPILED (batches compiled into single file)
        ├── 2019-F9-P00-T00-HEADER.CSV
        ├── 2019-F9-P01-T00-SUMMARY.CSV
        ├── 2019-F9-P12-T00-FINANCIAL-REPORTING.CSV
        ├── 2020-F9-P00-T00-HEADER.CSV
        ├── 2020-F9-P01-T00-SUMMARY.CSV
        ├── 2020-F9-P12-T00-FINANCIAL-REPORTING.CSV
        ├── 2021-F9-P00-T00-HEADER.CSV
        ├── 2021-F9-P01-T00-SUMMARY.CSV
        └── 2021-F9-P12-T00-FINANCIAL-REPORTING.CSV
```

CSV files created in YYYY (year) folders are split into batches to enable parallel computing and to keep track of progress so the process can be paused and restarted as necessary using the resume_build_database() feature. Once all XML files have been parsed the batches are combined in the COMPILED folder. There are approximately 110 tables defined in the _**concordance**_ plus a SCHEDULE-TABLE-YEAR.CSV that consists of TRUE/FALSE indicators for whether a nonprofit has filed each of the [sixteen 990 schedules](https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file/blob/master/f990-parts-and-schedules.md) in a given year. 

```r
get_table_names()
#  [1] "F9-P00-T00-HEADER"                             
#  [2] "F9-P01-T00-SUMMARY"                            
#  [3] "F9-P01-T00-SUMMARY-EZ"                         
#  [4] "F9-P02-T00-SIGNATURE"                          
#  [5] "F9-P03-T00-MISSION"   
#  ...
#  [111] "SR-P05-T01-TRANSACTIONS-RLTD-ORGS"             
#  [112] "SR-P06-T01-UNRLTD-ORGS-TAXABLE-PARTNERSHIP"
```

- The BUILD-LOG.txt will record progress (similar to what is printed in the console) and any errors that occur. 
- Files archived in the HIST folder are useful for replication purposes (the index file used for the build, system settings, and the Rhistory file). 
- Files in the FIX folder are logs of xpaths currently missing from the concordance but encountered in XML files, and fields that were supposed to be single values (part of one-to-one tables) but were returned as vectors. They are collapsed into a quasi-JSON format in the CSV files so they can be stored in a single cell: "{AK};{MT};{NY}". 

The files in the FIX folder are mainly to help package developers track any schema changes that might impact existing variables or identify XML pathologies that break parsing routines. 


## XML Files on the 990 Data Commons

The irs990efile package pulls XML 990 returns from the [Giving Tuesday Data Lake](https://990data.givingtuesday.org/), an AWS S3 bucket that contains the full universe (as close as possible) of Efile 990 returns, along with clean and accurate index files.   

[Index Data Dictionary](https://acrobat.adobe.com/id/urn:aaid:sc:AP:f83b004b-7f77-4c8a-8d96-ea301721aabe)

You can access index files using the following package functions: 

```r
index <- get_current_index_batch()  # the most recent batch of files added to the S3 bucket                             
index <- get_current_index_full()   # the full list of all files in the S3 bucket
download_current_index_full()       # creates a local download instead of reading as a data frame
```

## Visualizing XML Structure

```r
plot_table_str( "PF-P08-T01-PROG-RLTD-INV" )
```

![image](https://github.com/user-attachments/assets/9ed11e3f-c691-40de-83f5-bd725a0de174)


```r
print_table_str( "PF-P08-T01-PROG-RLTD-INV" ) 
```

```
1  Return                                      
2   °--ReturnData                              
3       °--IRS990ScheduleL                    
4           ¦--Form990ScheduleLPartIII        
5           ¦   ¦--AmountOfGrant              
6           ¦   ¦--AmtOfGrantOrTypeOfAssistance
7           ¦   ¦   ¦--AmountOfGrant          
8           ¦   ¦   °--TypeOfAssistance        
9           ¦   ¦--NameOfInterestedBusiness    
10          ¦   ¦   ¦--BusinessNameLine1      
11          ¦   ¦   °--BusinessNameLine2      
12          ¦   ¦--NameOfInterestedPerson      
13          ¦   ¦   ¦--NameBusiness            
14          ¦   ¦   ¦   ¦--BusinessNameLine1  
15          ¦   ¦   ¦   °--BusinessNameLine2  
16          ¦   ¦   °--NamePerson              
17          ¦   ¦--PurposeOfAssistance        
18          ¦   ¦--RelationshipWithOrganization
19          ¦   °--TypeOfAssistance            
20          °--GrntAsstBnftInterestedPrsnGrp  
21              ¦--AssistancePurposeTxt        
22              ¦--BusinessName                
23              ¦   ¦--BusinessNameLine1      
24              ¦   ¦--BusinessNameLine1Txt    
25              ¦   ¦--BusinessNameLine2      
26              ¦   °--BusinessNameLine2Txt    
27              ¦--CashGrantAmt                
28              ¦--PersonNm                    
29              ¦--RelationshipWithOrgTxt      
30              °--TypeOfAssistanceTxt
```

We can use these visual representation to identify the grouping variables or "table headers" that are used to parse 1:M tables (group nodes are extracted and each is flattened into a unique row of the table). 

```
/ IRS990ScheduleL / Form990ScheduleLPartIII 
/ IRS990ScheduleL / GrntAsstBnftInterestedPrsnGrp
```

```r
TABLE.HEADERS <- get_table_headers()
TABLE.HEADERS[[ "SL-P03-T01-GRANTS-INTERESTED-PERS" ]]
$`SL-P03-T01-GRANTS-INTERESTED-PERS`
[1] "//IRS990ScheduleL/Form990ScheduleLPartIII"      
[2] "//IRS990ScheduleL/GrntAsstBnftInterestedPrsnGrp"
```

## The build_database() Function

The workhorse function in the package is the **build_database()** function, which is a wrapper for the primary data workflow: 

```r
build_database( index=NULL, years=NULL, group.size=200 )
```

1. If no index is provided (=NULL), download the most recent version from the Data Commons.
2. Limit the build to the specified years and only include 990 and 990EZ return types.
3. Activate logging via BUILD-LOG.txt.
4. Split the index into batches using the **group.size** argument (more RAM allows for larger groups, which minimizes the number of read/write steps).
5. Build all tables for each batch and write them to temporary CSV files.
6. Once all batches are complete, compile the temporary files into a one table for year for each table.
7. Log all of the anomolies and save a history file from the session.

If we walk through these steps manually it would look something like: 

```r
TABLES <- get_table_names()           # list tables defined in the concordance
FX.NAMES <- get_fx_names( TABLES )    # return the corresponding build functions

YEAR <- 2020
index2020 <- dplyr::filter( tinyindex, TaxYear == YEAR )  # built in index file for testing
index100 <- dplyr::sample_n( index2020 )
url <- index100$URL[1]

### CUSTOM TABLE SELECTION

TABLES <- c( "F9-P00-T00-HEADER",
             "F9-P03-T00-PROGRAM-ONE",
             "F9-P03-T00-PROGRAM-TWO",
             "F9-P03-T00-PROGRAM-THREE",
             "F9-P03-T01-PROGRAMS-OTHER" )

get_fx_names( TABLES )
 
### PARSE DATA FOR ONE NONPROFIT

one.npo <- parse_npo( url, FX.NAMES, logXP=F )        # returns a list containing all tables as data frames

### PARSE DATA FOR A LIST OF NONPROFITS

URLS      <- index100$URL
TIMESTAMP <- format(Sys.time(), "%b-%d-%Y-%Hh-%Mm")

all.npos <- purrr::map( URLS, parse_npo, FX.NAMES )   # parse tables for all orgs in URLS
df.expenses <-
  "BUILD_F9_P09_T00_EXPENSES" %>%                     # compile table F9-P09-T00-EXPENSES from the list
  get_fxdf( all.npos, TIMESTAMP, YEAR )               # and save a CSV to file with TABLE NAME + TIMESTAMP (unique batch)

### ALL TABLES TOGETHER

build_tables( urls=URLS, year=YEAR )                  # write all to CSV, returns failed URLS if any
```

These functions are useful for testing purposes, but once you surpass a minimal batch size (the number of returns processed together) you will eventually run out of RAM. Large samples need to be split into smaller parts so collection can be serialized. Each batch is saved as a set of CSV files (one for each table), and once finished the batched CSV files are compiled. 

```r
### SPLIT INDEX INTO BATCHES

YEAR <- 2020
create_batchfiles( index100, years=YEAR, group.size=20 )   # creates "2020/BATCHFILE.RDS"

get_batch_ids( 2020 )                                      # group_id {batch_size}

# "G1{20}"   "G2{20}"  "G3{20}"
# "G4{20}"   "G5{20}"

### ACCESS THE BATCHFILE

bf <- get_batchfile( 2020 )

URLS.01 <- bf[[ "G1" ]]   # BATCH 01
build_tables( urls=URLS.01, year=2021, fx.names=FX.NAMES  )

URLS.02 <- bf[[ "G2" ]]   # BATCH 02
build_tables( urls=URLS.02, year=2021, fx.names=FX.NAMES  )

### ALL BATCHES IN PARALLEL

BIDS <- get_batch_ids( 2020 )
build_tables_parallel( batch.ids=BIDS, year=2020, fx.names=FX.NAMES )
```

Again, these steps are all wrapped into a single workflow function. This one line would be equivalent to the steps covered above: 

```r
build_database( index100, years=2020, batch.size=20 )
```

Since large builds can take a long time (several days without a large processor) they may get interrupted when a computer shuts down or freezes. The BATCHFILES keep track of which batches are complete and which are remaining, so you can restart a process at any time by navigating back to the project directory (the folder where BUILD-LOG.txt is stored) and resume data collection: 

```r
resume_build_database()
```

## Package Updates

Any time the concordance file is updated it can impact the package. As a result, the build functions need to be updated. 

```r
create_code_chunk( "F9-P03-T00-PROGRAM-ONE" )        # updates BUILD_F9_P03_T00_PROGRAM_ONE()
create_code_chunk_rdb( "F9-P07-T01-COMPENSATION" )   # updates BUILD_F9_P07_T01_COMPENSATION()
```

Or all together: 

```r
build_all_chunks()    # update functions in /R
update_tinyindex()    # update objects in /data
update_concordance()  # update objects in /data
update_xpaths()       # update objects in /data
```




