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
#' get_schedules( doc, url )
#' }
#' @export
get_schedules <- function( doc, url )
{

	## OBJECT ID

	OBJECTID <- get_object_id( url )


	## URL

	URL <- url


	## VARIABLE NAME:  ORG_EIN
	## DESCRIPTION:  Orgainization Employer Identification Number (EIN)
	## LOCATION:  F990-PC-PART-00-SECTION-D
	## TABLE:  F9-P00-T00-HEADER
	## VARIABLE TYPE:  numeric
	## PRODUCTION RULE:  NA

	ORG_EIN <- xml2::xml_text( xml2::xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )


	## VARIABLE NAME:  ORG_NAME_L1
	## DESCRIPTION:  Name of Filing Organization (line 1)
	## LOCATION:  F990-PC-PART-00-SECTION-C
	## TABLE:  F9-P00-T00-HEADER
	## VARIABLE TYPE:  text
	## PRODUCTION RULE:  NA

	V1 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine1'
	V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1'
	V3 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine1Txt'
	TEMP_ORG_NAME_L1 <- paste( V1, V2, V3 , sep='|' )
	ORG_NAME_L1 <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



	## VARIABLE NAME:  ORG_NAME_L2
	## DESCRIPTION:  Name of Filing Organization (line 2)
	## LOCATION:  F990-PC-PART-00-SECTION-C
	## TABLE:  F9-P00-T00-HEADER
	## VARIABLE TYPE:  text
	## PRODUCTION RULE:  NA

	V1 <- '//Return/ReturnHeader/Filer/Name/BusinessNameLine2'
	V2 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2'
	V3 <- '//Return/ReturnHeader/Filer/BusinessName/BusinessNameLine2Txt'
	TEMP_ORG_NAME_L2 <- paste( V1, V2, V3 , sep='|' )
	ORG_NAME_L2 <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



	## VARIABLE NAME:  RETURN_TYPE
	## DESCRIPTION:  Return type
	## LOCATION:  F990-PC-PART-00-LINE-00
	## TABLE:  F9-P00-T00-HEADER
	## VARIABLE TYPE:  text
	## PRODUCTION RULE:  NA

	V1 <- '//Return/ReturnHeader/ReturnType'
	V2 <- '//Return/ReturnHeader/ReturnTypeCd'
	TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
	RETURN_TYPE <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_RETURN_TYPE ) )



	## VARIABLE NAME:  TAX_YEAR
	## DESCRIPTION:  Tax year
	## LOCATION:  F990-PC-PART-00-SECTION-A
	## TABLE:  F9-P00-T00-HEADER
	## VARIABLE TYPE:  date
	## PRODUCTION RULE:  NA

	V1 <- '//Return/ReturnHeader/TaxYear'
	V2 <- '//Return/ReturnHeader/TaxYr'
	TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
	TAX_YEAR <- xml2::xml_text( xml2::xml_find_all( doc, TEMP_TAX_YEAR ) )



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
	namedList( OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,
	SCHEDA,SCHEDB,SCHEDC,SCHEDD,SCHEDE,SCHEDF,SCHEDG,SCHEDH,SCHEDI,SCHEDJ,SCHEDK,
	SCHEDL,SCHEDM,SCHEDN,SCHEDO,SCHEDR)
	df <- as.data.frame( var.list )

	return( df )

}

