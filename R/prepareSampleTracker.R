#' Prepare Sample Tracker Form
#'
#' Prepare incoming Sample Tracker form data for input into the database
#'
#' @param formData a character of the reactive output from the Sample Tracker form entry
#' @param username a character of the current session user (ie, `USER$name`)
#' @return a character for prepared `formData` or a list of urine formData and DBS formData
#'
#' @export

prepareSampleTracker <- function(formData, username)
{
  formData <- c(formData,
                timestamp = as.character(Sys.time()),
                userstamp = username)

  formData[['date_recieved']] <-
    as.Date(as.numeric(formData[['date_recieved']]), origin = '1970-01-01')

  formData[['tubes']] <- as.numeric(formData[['tubes']])

  formData <- c(formData, hash = sampleTrackerHash(formData))

  if (formData[['dbs_card']] == 'TRUE') {
    DBS_Input <- DBSform(formData)

    return(list(formData, DBS_Input))

  } else{
    return(formData)
  }

}
