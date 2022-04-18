#' @title 
#'   Build table SC-P01-T00-LOBBY
#' 
#' @description 
#'   Generate a 1:1 table for the relational database.
#' 
#' @export 
BUILD_SC_P01_T00_LOBBY <- function( doc, url )
{


####----------------------------------------------------
####     KEYS
####----------------------------------------------------


## OBJECT ID

OBJECTID <- get_object_id( url )


## URL

URL <- url


## RETURN VERSION

RETURN_VERSION <- xml2::xml_attr( doc, attr='returnVersion' )


## VARIABLE NAME:  ORG_EIN
## DESCRIPTION:  Orgainization Employer Identification Number (EIN)
## LOCATION:  F990-PC-PART-00-SECTION-D
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

ORG_EIN <- xml_text( xml_find_all( doc, '/Return/ReturnHeader/Filer/EIN' ) )



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
ORG_NAME_L1 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L1 ) )



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
ORG_NAME_L2 <- xml_text( xml_find_all( doc, TEMP_ORG_NAME_L2 ) )



## VARIABLE NAME:  RETURN_TYPE
## DESCRIPTION:  Return type
## LOCATION:  F990-PC-PART-00-LINE-00
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  text
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/ReturnType'
V2 <- '//Return/ReturnHeader/ReturnTypeCd'
TEMP_RETURN_TYPE <- paste( V1, V2 , sep='|' )
RETURN_TYPE <- xml_text( xml_find_all( doc, TEMP_RETURN_TYPE ) )



## VARIABLE NAME:  TAX_YEAR
## DESCRIPTION:  Tax year
## LOCATION:  F990-PC-PART-00-SECTION-A
## TABLE:  F9-P00-T00-HEADER
## VARIABLE TYPE:  date
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnHeader/TaxYear'
V2 <- '//Return/ReturnHeader/TaxYr'
TEMP_TAX_YEAR <- paste( V1, V2 , sep='|' )
TAX_YEAR <- xml_text( xml_find_all( doc, TEMP_TAX_YEAR ) )



######----------------------------------------------------
######
######    1:1 TABLE VARIABLES
######
######----------------------------------------------------


## VARIABLE NAME:  SC_01_POLI_EXP
## DESCRIPTION:  Political expenditures
## LOCATION:  SCHED-C-PART-01-A-LINE-02
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/PoliticalExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleC/PoliticalExpenditures'
V3 <- '//Return/ReturnData/IRS990ScheduleC/PoliticalExpendituresAmt'
V_POLI_EXP <- paste( V1, V2, V3 , sep='|' )
SC_01_POLI_EXP <- xml_text( xml_find_all( doc, V_POLI_EXP ) )




## VARIABLE NAME:  SC_01_POLI_VOL_HOURS
## DESCRIPTION:  Volunteer hours
## LOCATION:  SCHED-C-PART-01-A-LINE-03
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/VolunteerHours'
V2 <- '//Return/ReturnData/IRS990ScheduleC/VolunteerHours'
V3 <- '//Return/ReturnData/IRS990ScheduleC/VolunteerHoursCnt'
V_POLI_VOL_HOURS <- paste( V1, V2, V3 , sep='|' )
SC_01_POLI_VOL_HOURS <- xml_text( xml_find_all( doc, V_POLI_VOL_HOURS ) )




## VARIABLE NAME:  SC_01_AMT_EXCISE_TAX_4955_ORG
## DESCRIPTION:  Enter the amount of any excise tax incurred under section 4955
## LOCATION:  SCHED-C-PART-01-B-LINE-01
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtOf4955Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtOf4955Tax'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Section4955OrganizationTaxAmt'
V_AMT_EXCISE_TAX_4955_ORG <- paste( V1, V2, V3 , sep='|' )
SC_01_AMT_EXCISE_TAX_4955_ORG <- xml_text( xml_find_all( doc, V_AMT_EXCISE_TAX_4955_ORG ) )




## VARIABLE NAME:  SC_01_AMT_EXCISE_TAX_4955_MGR
## DESCRIPTION:  Enter the amount of any excise tax incurred by organization managers under section 4955
## LOCATION:  SCHED-C-PART-01-B-LINE-02
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtOf4955TaxOnManagers'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtOf4955TaxOnManagers'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Section4955ManagersTaxAmt'
V_AMT_EXCISE_TAX_4955_MGR <- paste( V1, V2, V3 , sep='|' )
SC_01_AMT_EXCISE_TAX_4955_MGR <- xml_text( xml_find_all( doc, V_AMT_EXCISE_TAX_4955_MGR ) )




## VARIABLE NAME:  SC_01_4955_FORM4720_FILED_X
## DESCRIPTION:  If the filing organization incurred in a section 4955 tax; did it file Form 4720 for this year?
## LOCATION:  SCHED-C-PART-01-B-LINE-03
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form4720Filed4955Tax'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form4720FiledSection4955TaxInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/Form4720Filed4955Tax'
V_4955_FORM4720_FILED_X <- paste( V1, V2, V3 , sep='|' )
SC_01_4955_FORM4720_FILED_X <- xml_text( xml_find_all( doc, V_4955_FORM4720_FILED_X ) )




## VARIABLE NAME:  SC_01_4955_FORM4720_CORRECTED_X
## DESCRIPTION:  Was a correction made?
## LOCATION:  SCHED-C-PART-01-B-LINE-04A
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/CorrectionMade'
V2 <- '//Return/ReturnData/IRS990ScheduleC/CorrectionMadeInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/CorrectionMade'
V_4955_FORM4720_CORRECTED_X <- paste( V1, V2, V3 , sep='|' )
SC_01_4955_FORM4720_CORRECTED_X <- xml_text( xml_find_all( doc, V_4955_FORM4720_CORRECTED_X ) )




## VARIABLE NAME:  SC_01_ORG_AMT_EXPENDED_527_ACT
## DESCRIPTION:  Enter the amount directly expended by the filing organization for section 527 exempt function activities
## LOCATION:  SCHED-C-PART-01-C-LINE-01
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtExpendedFor527Activities'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Expended527ActivitiesAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtExpendedFor527Activities'
V_ORG_AMT_EXPENDED_527_ACT <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_AMT_EXPENDED_527_ACT <- xml_text( xml_find_all( doc, V_ORG_AMT_EXPENDED_527_ACT ) )




## VARIABLE NAME:  SC_01_ORG_AMT_FUND_CONTR_527_ACT
## DESCRIPTION:  Enter the amount of the filing organization's own internal funds contributed to other organizations for section 527 exempt function activities
## LOCATION:  SCHED-C-PART-01-C-LINE-02
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/AmtOfInternalFundsContributed'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/AmtOfInternalFundsContributed'
V3 <- '//Return/ReturnData/IRS990ScheduleC/InternalFundsContributedAmt'
V_ORG_AMT_FUND_CONTR_527_ACT <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_AMT_FUND_CONTR_527_ACT <- xml_text( xml_find_all( doc, V_ORG_AMT_FUND_CONTR_527_ACT ) )




## VARIABLE NAME:  SC_01_ORG_TOT_EXEMPT_FUNC_EXP
## DESCRIPTION:  Total of direct and indirect exempt function expenditures. Add lines 1 and 2
## LOCATION:  SCHED-C-PART-01-C-LINE-03
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  numeric
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/TotalExmptFunctionExpenditures'
V2 <- '//Return/ReturnData/IRS990ScheduleC/TotalExemptFunctionExpendAmt'
V3 <- '//Return/ReturnData/IRS990ScheduleC/TotalExmptFunctionExpenditures'
V_ORG_TOT_EXEMPT_FUNC_EXP <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_TOT_EXEMPT_FUNC_EXP <- xml_text( xml_find_all( doc, V_ORG_TOT_EXEMPT_FUNC_EXP ) )




## VARIABLE NAME:  SC_01_ORG_FORM1120_FILED_X
## DESCRIPTION:  Did the filing organization file Form 1120-POL for this year?
## LOCATION:  SCHED-C-PART-01-C-LINE-04
## TABLE:  SC-P01-T00-LOBBY
## VARIABLE TYPE:  checkbox
## PRODUCTION RULE:  NA

V1 <- '//Return/ReturnData/IRS990ScheduleC/Form1120PolFiled'
V2 <- '//Return/ReturnData/IRS990ScheduleC/Form1120POLFiledInd'
V3 <- '//Return/ReturnData/IRS990ScheduleC/Form990ScheduleCPartI/Form1120PolFiled'
V_ORG_FORM1120_FILED_X <- paste( V1, V2, V3 , sep='|' )
SC_01_ORG_FORM1120_FILED_X <- xml_text( xml_find_all( doc, V_ORG_FORM1120_FILED_X ) )




var.list <- 
namedList(OBJECTID,URL,ORG_EIN,ORG_NAME_L1,ORG_NAME_L2,RETURN_TYPE,TAX_YEAR,SC_01_POLI_EXP,SC_01_POLI_VOL_HOURS,SC_01_AMT_EXCISE_TAX_4955_ORG,SC_01_AMT_EXCISE_TAX_4955_MGR,SC_01_4955_FORM4720_FILED_X,SC_01_4955_FORM4720_CORRECTED_X,SC_01_ORG_AMT_EXPENDED_527_ACT,SC_01_ORG_AMT_FUND_CONTR_527_ACT,SC_01_ORG_TOT_EXEMPT_FUNC_EXP,SC_01_ORG_FORM1120_FILED_X)
df <- as.data.frame( var.list )


return( df )


}


