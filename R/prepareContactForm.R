#' Prepare Contact Infomation Form
#'
#' Prepare incoming Contact Form data for input into the database
#'
#' @param formData a character of the reactive output from the Contact Form entry
#' @param username a character of the current session user (ie, `USER$name`)
#' @return a list of prepared form data
#'
#' @export

prepareContactForm <- function(formData, username)
  {

  formData <- as.list(formData)

  formData$timestamp = as.character(Sys.time())
  formData$userstamp = username
  formData$UID <- uuid::UUIDgenerate()

  formData$DOB <-
    as.character(as.Date(as.numeric(formData$DOB), origin = '1970-01-01'))


  return(formData)

  }
