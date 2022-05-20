# irs990efile

R package for building a research database from IRS 990 nonprofit efiler tax returns. 


## Installation

*Note that **xmltools** is not available on CRAN so has to be installed remotely before installing the **irs990efiler** package.*

```r
devtools::install_github( 'ultinomics/xmltools' )
devtools::install_github( 'nonprofit-open-data-collective/irs990efile' )
```



## Use

```r
library( irs990efile )
library( dplyr )

# pre-loaded demo index of efilers from AWS:
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


# create index of 10 organizations from 2018  
index.2018 <-
  tinyindex %>% 
  filter( FormType %in% c("990","990EZ") ) %>%
  filter( TaxYear == 2018 ) %>% 
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

for( i in years )
{
  dir.create( as.character(i) )
  setwd( as.character(i) )
  index.i <- dplyr::filter( index, TaxYear == i )
  groups <- split_index( index.i, group.size = 100 )
  build_tables_parallel( groups=groups, year=i, table.names=tables )
  setwd( ".." ) # return to main directory 
}

bind_data( years )    # compile all chunks into a single table



###   BUILD THE FULL DATABASE
###   (note: this can take days) 

# build the full index from AWS (~3.4 million 990 & 990EZ filers)
index <- build_index( years=2011:2021 )
build_database( index ) 

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





