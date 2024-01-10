# irs990efile

R package for building a research database from IRS 990 nonprofit efiler tax returns. 

The full set of tables is available in the [**DATA DICTIONARY**](https://nonprofit-open-data-collective.github.io/irs990efile/data-dictionary/data-dictionary.html).

The Master Concordance File provides the crosswalk architecture for moving from XML files to rectangular tables. 

https://github.com/Nonprofit-Open-Data-Collective/irs-efile-master-concordance-file

Several dozen one-to-many tables exist on Form 990 (one unique 990 filing to a table with many entries, such as many board members serving a single nonprofit). Documentation about the XML table structure can be useful when attempting to parse XML nodes into well-behaved relational tables.  

https://nonprofit-open-data-collective.github.io/efile-rdb-tables/


## IRS Efile XML Docs

**Update:** The IRS is no longer hosting efile data on AWS. Files must be downloaded from the IRS site directly.

The irs990efile package now pulls from the [Data Commons Data Lake](https://990data.givingtuesday.org/):  

Download their full efile index file (check their site for newer versions): 

https://gt990datalake-rawdata.s3.amazonaws.com/Indices/990xmls/index_all_years_efiledata_xmls_created_on_2023-10-29.csv

The legacy IRS S3 bucket (https://www.irs.gov/charities-non-profits/form-990-series-downloads) is available at: 

https://nccs-efile.s3.us-east-1.amazonaws.com/xml/

The URLs will thus look like: 

https://nccs-efile.s3.us-east-1.amazonaws.com/xml/201020793492001120_public.xml

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

### Preview the index file:

tictoc::tic( )  #---------------------------
index <- build_index( tax.years=2008:2010 )
tictoc::toc()   #---------------------------

tictoc::tic( )  #---------------------------
index <- build_index( tax.years=2008:2022 )
tictoc::toc()   #---------------------------
```

```r
###   BUILD THE DATABASE
# test on random sample of 10,000 cases
index <- tinyindex  
build_database( index )
```

```
###   BUILD THE FULL DATABASE (~5.4 million 990 & 990EZ filers)
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

**Documentation**

All of the files share the following meta-fields: 

* OBJECTID  
* URL                         
* ORG_EIN  
* ORG_NAME_L1                 
* ORG_NAME_L2  
* RETURN_TYPE  
* RETURN_VERSION               
* TAX_YEAR  





