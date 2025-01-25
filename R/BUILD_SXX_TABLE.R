###---------------------------------------------------
###   GET LIST OF SCHEDULES FILED 
###---------------------------------------------------

#' @title
#'  Retrieve list of filed schedules
#'
#' @description
#'  Check whether a specific organization has included any schedules with their return. 
#'
#' @details
#'  Create an index so that it is possible to identify which organizations 
#'  have filed which schedule each year. 
#'
#' @param doc A parsed XML document 
#' @param url AWS location of the XML doc
#' 
#' @return Returns a data frame with a table recording  
#'  the presence of each schedule in the tax filing.  
#'
#' @examples
#' \dontrun{
#' url <- tinyindex$URL[1]
#' doc <- xml2::read_xml( url )
#' xml2::xml_ns_strip( doc ) 
#' BUILD_SCHEDULE_TABLE( doc, url )
#' }
#' @export
BUILD_SCHEDULE_TABLE <- function( doc, url )
{

  keys <- get_keys( doc, url )

	#####  LIST OF SCHEDULES

	all.paths <- doc %>% xml2::xml_find_all( '//*') %>% xml2::xml_path()

	## SCHEDULE A FILED
	SCHEDA <- sum( grepl( "Return/ReturnData/IRS990ScheduleA", all.paths ) ) > 0

	## SCHEDULE B FILED
	SCHEDB <- sum( grepl( "Return/ReturnData/IRS990ScheduleB", all.paths ) ) > 0

	## SCHEDULE C FILED
	SCHEDC <- sum( grepl( "Return/ReturnData/IRS990ScheduleC", all.paths ) ) > 0

	## SCHEDULE D FILED
	SCHEDD <- sum( grepl( "Return/ReturnData/IRS990ScheduleD", all.paths ) ) > 0

	## SCHEDULE E FILED
	SCHEDE <- sum( grepl( "Return/ReturnData/IRS990ScheduleE", all.paths ) ) > 0

	## SCHEDULE F FILED
	SCHEDF <- sum( grepl( "Return/ReturnData/IRS990ScheduleF", all.paths ) ) > 0

	## SCHEDULE G FILED
	SCHEDG <- sum( grepl( "Return/ReturnData/IRS990ScheduleG", all.paths ) ) > 0

	## SCHEDULE H FILED
	SCHEDH <- sum( grepl( "Return/ReturnData/IRS990ScheduleH", all.paths ) ) > 0

	## SCHEDULE I FILED
	SCHEDI <- sum( grepl( "Return/ReturnData/IRS990ScheduleI", all.paths ) ) > 0

	## SCHEDULE J FILED
	SCHEDJ <- sum( grepl( "Return/ReturnData/IRS990ScheduleJ", all.paths ) ) > 0

	## SCHEDULE K FILED
	SCHEDK <- sum( grepl( "Return/ReturnData/IRS990ScheduleK", all.paths ) ) > 0
  
	## SCHEDULE L FILED
	SCHEDL <- sum( grepl( "Return/ReturnData/IRS990ScheduleL", all.paths ) ) > 0

	## SCHEDULE M FILED
	SCHEDM <- sum( grepl( "Return/ReturnData/IRS990ScheduleM", all.paths ) ) > 0

	## SCHEDULE N FILED
	SCHEDN <- sum( grepl( "Return/ReturnData/IRS990ScheduleN", all.paths ) ) > 0

	## SCHEDULE O FILED
	SCHEDO <- sum( grepl( "Return/ReturnData/IRS990ScheduleO", all.paths ) ) > 0

	## SCHEDULE R FILED
	SCHEDR <- sum( grepl( "Return/ReturnData/IRS990ScheduleR", all.paths ) ) > 0

	var.list <- 
	namedList( SCHEDA,SCHEDB,SCHEDC,SCHEDD,SCHEDE,SCHEDF,SCHEDG,SCHEDH,SCHEDI,SCHEDJ,SCHEDK,
	SCHEDL,SCHEDM,SCHEDN,SCHEDO,SCHEDR)
  
	df <- as.data.frame( c(keys,var.list) )
	return( df )

}

