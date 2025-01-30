install.packages("devtools")
install.packages("tictoc")

devtools::install_github( 'ultinomics/xmltools' )
devtools::install_github( 'nonprofit-open-data-collective/irs990efile' )


dir.create("TESTBUILD")
setwd("TESTBUILD")

library( irs990efile )
library( tictoc )

index <- tinyindex
table( index$TaxYear )

# KEEP 10 CASES PER YEAR FOR QUICK TEST

set.seed( 1234 )
sL <- split( index, index$TaxYear )
dfL <- lapply( sL, dplyr::sample_n, 10 )
index10 <- dplyr::bind_rows( dfL )
table( index10$TaxYear )

dir.create("TEST10")
setwd("TEST10")

tic()
build_database( index10 )
toc()



# RUN TEST WITH ~8,000 RETURNS

setwd("..")
dir.create("TINYINDEX")
setwd("TINYINDEX")

tic()
build_database( index )
toc()
