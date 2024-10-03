# irs990efile

R package for building a research database from IRS 990 nonprofit efiler tax returns. 

The full set of tables is available in the [**DATA DICTIONARY**](https://nonprofit-open-data-collective.github.io/irs990efile/data-dictionary/data-dictionary.html).

Preprocessed CSV files are available on the NCCS website: [**DOWNLOAD TABLES**](https://nccs.urban.org/nccs/catalogs/catalog-efile.html).

The Master Concordance File provides the crosswalk architecture for moving from XML files to rectangular tables. 

https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file

Several dozen one-to-many tables exist on Form 990 (one unique 990 filing to a table with many entries, such as many board members serving a single nonprofit). Documentation about the XML table structure can be useful when attempting to parse XML nodes into well-behaved relational tables.  

https://nonprofit-open-data-collective.github.io/efile-rdb-tables/

## Installation

*Note that **xmltools** is not available on CRAN so has to be installed remotely before installing the **irs990efiler** package.*

```r
# install.packages( 'devtools' )  
devtools::install_github( 'ultinomics/xmltools' )
devtools::install_github( 'nonprofit-open-data-collective/irs990efile' )
```

## Use

```r
library( irs990efile )
library( dplyr )

index <- build_index( tax.years=2018 )
index.small <- dplyr::sample_n( index, 1000 )
build_database( index.small )

# download the 2018 index file
# build all one-to-one tables
# for a sample of 1,000 nonprofits
```

## IRS Efile XML Docs

**Update:** The IRS is no longer hosting efile data on AWS. Files must be downloaded from the IRS site directly.

The irs990efile package now pulls from the [Data Commons Data Lake](https://990data.givingtuesday.org/):  

Download their full efile index file (check their site for newer versions): 

[DataCommons Efile Index (5,598,994 records)](https://gt990datalake-rawdata.s3.amazonaws.com/Indices/990xmls/index_all_years_efiledata_xmls_created_on_2024-01-19.csv)

[Index Data Dictionary](https://acrobat.adobe.com/id/urn:aaid:sc:AP:f83b004b-7f77-4c8a-8d96-ea301721aabe)

```
c("BuildTs", "DAF", "DateSigned", "DocStatus", "EIN", "FileSha256", 
"FileSizeBytes", "FormType", "GrossReceipts", "GroupAffiliatesIncluded", 
"GroupExemptionNumber", "GroupReturnForAffiliates", "IndexedOn", 
"LegalDomicileCountry", "LegalDomicileState", "ObjectId", "OrgType", 
"OrganizationName", "ReturnTs", "ReturnVersion", "SubmittedOn", 
"TaxPeriod", "TaxPeriodBeginDate", "TaxPeriodEndDate", "TaxStatus", 
"TaxYear", "TotalAssetsBkEOY", "TotalExpensesCY", "TotalLiabilitiesBkEOY", 
"TotalNetAssetsBkEOY", "TotalRevenueCY", "URL", "Website", "YearFormed", 
"ZipFile")

URL <- "https://nccs-efile.s3.us-east-1.amazonaws.com/index/index_all_years_efiledata_xmls_created_on_2024-01-19.csv"
download.file( URL, destfile="index.csv" )
d <- data.table::fread( "index.csv", colClasses=c( "ObjectId"="character" ) )
table( d$TaxYear, d$FormType ) |> knitr::kable()
d |>dplyr::filter( TaxYear == 2021 ) |> dplyr::count( TaxStatus ) |> knitr::kable()
```

**990 Efile Returns by FormType and TaxYear**

|     |    990|  990EZ|  990PF|  990T|
|:----|------:|------:|------:|-----:|
|2007 |     17|     17|      0|     0|
|2008 |     87|    114|     20|     0|
|2009 |  33311|  15470|   2345|     0|
|2010 | 123026|  63326|  25249|     0|
|2011 | 159504|  82048|  34597|     0|
|2012 | 179688|  93750|  39933|     0|
|2013 | 198856| 104375|  45887|     0|
|2014 | 218620| 116417|  53442|     0|
|2015 | 233520| 124894|  58815|     0|
|2016 | 243903| 130485|  62988|     0|
|2017 | 261612| 139146|  68950|     0|
|2018 | 271442| 149384|  80138|     0|
|2019 | 283649| 152579|  87773|     0|
|2020 | 318850| 169296| 114605| 22616|
|2021 | 319445| 192642| 116404| 22469|
|2022 | 158730| 135775|  81631|  7154|


**TaxStatus for 2021 Cases**

|Var1   |   Freq|
|:------|------:|
|       | 138873|
|501c2  |   2578|
|501c3  | 391557|
|501c4  |  23639|
|501c5  |  16901|
|501c6  |  32008|
|501c7  |  16548|
|501c8  |   6577|
|501c9  |   4803|
|501c10 |   1808|
|501c11 |      5|
|501c12 |   3687|
|501c13 |   2917|
|501c14 |   1920|
|501c15 |    139|
|501c16 |     11|
|501c17 |     71|
|501c18 |      4|
|501c19 |   6265|
|501c20 |      1|
|501c23 |      4|
|501c25 |    358|
|501c26 |      6|
|501c27 |      3|
|501c29 |     14|
|4947a1 |    263|



## More Examples

```r
library( irs990efile )
library( dplyr )

### Preview the index file:
index <- build_index( tax.years=2018 )
head( index3[ , c(1:2) ] ) %>% knitr::kable()
head( index3[ , c(3:4,6:7) ] ) %>% knitr::kable()
```


|OrganizationName                                                 |EIN       |
|:----------------------------------------------------------------|:---------|
|ANCIENT & ACCEPTED SCOTTISH RITE OF FREEMASONRY VALLEY OF MONROE |237144224 |
|THE EDUCATIONAL AND SCIENTIFIC RESEARCH ESR FOUNDATION INC       |814680405 |
|THE LITERARY CLASSICS OF THE US INC D/B/A LIBRARY OF AMERICA     |132986916 |
|RAPID CITY SOFTBALL LEAGUE ASSOS                                 |460410637 |
|CENTRO CAMPESINO FARMWORKER CENTER INC                           |591460598 |
|HAITIAN PEOPLES SUPPORT PROJECT INC                              |141755401 |

|FormType | TaxYear|OrgType  |TaxStatus |
|:--------|-------:|:--------|:---------|
|990      |    2018|Corp     |501c10    |
|990PF    |    2018|ExemptPF |NA        |
|990      |    2018|Corp     |501c3     |
|990      |    2018|Corp     |501c4     |
|990      |    2018|Corp     |501c3     |
|990EZ    |    2018|Corp     |501c3     |


```r
# FULL INDEX LOAD TIME 
tictoc::tic( )  #---------------------------
index <- build_index( tax.years=2008:2022 )
tictoc::toc()   #---------------------------
# 798.84 sec elapsed
# ~ 15 minutes to read full index

table( index$FormType ) %>% knitr::kable()

# |Var1  |    Freq|
# |:-----|-------:|
# |990   | 2886557|
# |990EZ | 1597025|
# |990PF |  836034|
# |990T  |   46023|
```

```r
###   BUILD THE DATABASE
# test on random sample of 10,000 cases
index <- tinyindex  
build_database( index )
```

```
###   BUILD THE FULL DATABASE (~4.5 million 990 & 990EZ filers)
###   (note: this can take days) 
###   (test on a sample first) 

# build the Data Commons index 
index <- build_index( tax.years=2008:2022 )
build_database( index ) 
```

```r
###
###  WORKING WITH SPECIFIC TABLES OR SAMPLES
###

# pre-loaded demo index of 10,000 random efilers from AWS:
tinyindex %>% 
  select( OrganizationName, EIN, TaxYear, FormType ) %>% 
  head()

#                              OrganizationName       EIN TaxYear FormType
# 1                    MASTOCYTOSIS SOCIETY INC 521959601    2018      990
# 2                            MCKINLEY III INC 364165018    2018      990
# 3                           REAL SERVICES INC 351157606    2013      990
# 4 GREATER KANSAS CITY FRIENDS OF FISHER HOUSE 842359546    2019    990EZ
# 5                           THUMBNAIL THEATER 510563980    2014    990EZ
# 6     BERNARD M AND CARYL H SUSMAN FOUNDATION 208068788    2010    990PF


# index files from 2009 to 2020 are preloaded: 
data( index2009 )
head( index2009 )

# combine index files for all years 2009-2020 ehre forms available: 
index <- build_index()  # build_index( tax.years=2009:2020 )

# create index of 10 organizations from 2018  
index.2018 <-
  index2018 %>% 
  filter( FormType %in% c("990","990EZ") ) %>%
  sample_n( 10 )

# build all one-to-one tables for the sample
dir.create( "EFILE" )
setwd( "./EFILE" )
build_tables( url=index.2018$URL, year=2018 )


###  TEST SPECIFIC TABLES

index <- tinyindex  # random sample of 10,000 cases

# split index file into smaller chunks (for parallelization) and build tables 

years <- 2017:2019

tables <- c( "F9-P00-T00-HEADER","F9-P01-T00-SUMMARY",
             "F9-P08-T00-REVENUE","F9-P09-T00-EXPENSES",
             "F9-P11-T00-ASSETS" )

# TABLE NAME:          'F9-P00-T00-HEADER' 
# FUNCTION NAME: 'BUILD_F9_P00_T00_HEADER'

tables <- gsub( "-", "_", tables )
tables <- paste0( "BUILD_", tables )


for( i in years )
{
  dir.create( as.character(i) )
  setwd( as.character(i) )                               # creates folders for each year
  index.i <- dplyr::filter( index, TaxYear == i )        # create index for one year 
  groups <- split_index( index.i, group.size = 100 )     # parser builds temporary tables then combines them at the end
  build_tables_parallel( 
    groups=groups, year=i, table.names=tables )          # processing many small groups keep memory usage low
  setwd( ".." ) # return to main directory 
}

bind_data( years )    # compile all temp tables into one table
```

## Details

The full set of tables is available in the [**DATA DICTIONARY**](https://nonprofit-open-data-collective.github.io/irs990efile/data-dictionary/data-dictionary.html).

**Background**

The IRS started processing electronic filings for nonprofit 990 tax forms in 2010 and releasing [990 efile returns via AWS](https://registry.opendata.aws/irs990/) in 2016. For more details on the history and current status of nonprofit efiling see this [recent report](www/pubs/Stories-from-the-Frontier-April-2022.pdf). 

All electronic tax returns have been released as XML documents currently stored in an AWS bucket (though soon migrating to the IRS website). 

XML forms can be rendered using an [efile viewer](https://github.com/betson/irs-efile-viewer) so that they look the same as a PDF of a regular 990 filing (you can [see examples](https://projects.propublica.org/nonprofits/organizations/237315236) on ProPublica's Nonprofit Explorer). They are NOT, however, in a convenient format for statistical analysis.

The **irs990efile** package was created to convert XML files into a relational database: normal rectangular data tables linked by a set of keys. 

**RDB Key Fiels:**

All of the files share the following meta-fields: 

* OBJECTID  
* URL                         
* ORG_EIN  
* ORG_NAME_L1                 
* ORG_NAME_L2  
* RETURN_TYPE  
* RETURN_VERSION               
* TAX_YEAR

Intuitively we would expect that the EIN-TAX_YEAR combination could serve as a unique key for table joins. That is not the case because the same nonprofit can file multiple 990 returns in a single year due to (1) ammendments, (2) group filings where the parent organization files a single 990 for themselves and another group filing for all of the related entities, (3) a change in fiscal year results in a partial return. 

In theory the ObjectID should work as the join key but it is error prone because of a well-known precision loss problem that occurs when reading or recasting large numbers. 

```r
options( scipen=16)
x <- c(  "202301529349200315", 
         "202301529349200316", 
         "202301529349200317"   )
y <- x |> as.numeric()
cbind(x,y) |> knitr::kable()

|x                  |y                  |
|:------------------|:------------------|
|202301529349200315 |202301529349200320 |
|202301529349200316 |202301529349200320 |
|202301529349200317 |202301529349200320 |
```

As a result the ObjectId may get corrupted unexpectedly and the joins are no longer valid. The problem is specific to columns that contain only numbers, as many functions that read CSV formats or other file types that lack explicit data types will automatically cast them as numeric variable types, at which time the precision loss occurs during the conversion. You can assert more control over the default behavior of some functions: 

```r
d <- read.csv( filename, colClasses = "character" )
d <- readr::read_csv( filename, col_types = cols(.default = col_character()) )
d <- data.table::fread( filename, colClasses=c( "ObjectId"="character" ) )
```

Alternatively, the URL field includes characters so it is by default loaded as a character vector. Note that the URL contains the original ObjectId: 

```r
x <- head(d$ObjectId, 3 )
y <- head(d$URL, 3 )
cbind(x,y) |> knitr::kable()

|x                  |y                                                                                               |
|:------------------|:-----------------------------------------------------------------------------------------------|
|202301529349200315 |https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/202301529349200315_public.xml |
|201921359349311872 |https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/201921359349311872_public.xml |
|201410859349300511 |https://gt990datalake-rawdata.s3.amazonaws.com/EfileData/XmlFiles/201410859349300511_public.xml |
```

You will find it to be a safe and reliable key for table joins. 


**Legacy XML Files from the Original IRS S3 Bucket:**

All of the XML efile returns have been archived on the Data Commons. 

If you need to access the original legacy IRS S3 bucket (previously at https://www.irs.gov/charities-non-profits/form-990-series-downloads) for reproducibility purposes, it is available at: https://nccs-efile.s3.us-east-1.amazonaws.com/xml/

The Index files are available at: 

```
https://nccs-efile.s3.us-east-1.amazonaws.com/index/index-PX.csv  # 990 and 999EZ returns
https://nccs-efile.s3.us-east-1.amazonaws.com/index/index-PF.csv  # 990PF returns 
```

The URLs can be constructed with the object ID and will thus look like: https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201020793492001120_public.xml





