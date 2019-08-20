#' Prepare Sample Tracker Form
#'
#' Prepare incoming Sample Tracker form data for input into the database
#'
#' @param formData a character of the reactive output from the Sample Tracker form entry
#' @param username a character of the current session user (ie, `USER$name`)
#' @return a one or two element list of prepared `formData`. One list element for each sample type (Urine & DBS)
#'
#' @export

prepareSampleTracker <- function(formData, username)
{

  formData <- as.list(formData)

  formData$timestamp = as.character(Sys.time())
  formData$userstamp = username

  formData$date_received <-
    as.character(as.Date(as.numeric(formData$date_received), origin = '1970-01-01'))

  formData$tubes <- as.numeric(formData$tubes)

  formData2 <- c(formData, hash = sampleTrackerHash(formData))
  formData2$dbs_card <- NULL

  if (formData$dbs_card == 'TRUE') {
    DBS_Input <- DBSform(formData)

    return(list(formData2, DBS_Input))

  } else{
    return(list(formData2))
  }

}


