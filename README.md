# irs990efile

R package for building a research database from IRS 990 efiler tax returns. 

## Usage 

The IRS started processing electronic filings for nonprofit 990 tax forms in 2010 and releasing [990 efile returns via AWS](https://registry.opendata.aws/irs990/) in 2016. For more details on the history and current status of nonprofit efiling see this [recent report](www/pubs/Stories-from-the-Frontier-April-2022.pdf). 

All electronic tax returns have been released as XML documents currently stored in an AWS bucket (though soon migrating to the IRS website). 

XML forms can be rendered using an [efile viewer](https://github.com/betson/irs-efile-viewer) so that they look the same as a PDF of a regular 990 filing ([you can see examples on ProPublica's Nonprofit Explorer](https://projects.propublica.org/nonprofits/organizations/237315236)). They are NOT, however, a convenient format for statistical analysis.

The **irs990efile** package was created to convert XML files into normal rectangular data tables that comprise a relational database. 




## Required Packages

The **irs990efile** package leverages several R packages that have helpful functions for working with XML formats and large files (XML,xml2,xmltools,httr,jsonlite,R.utils,dplyr,purrr). 

Note that **xmltools** is not available on CRAN so has to be installed remotely before installing the **irs990efiler** package. 

```r
devtools::install_github( 'ultinomics/xmltools' )
devtools::install_github( 'nonprofit-open-data-collective/irs990efile' )
```


