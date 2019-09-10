#' Prepare New Participant Registration Form
#'
#' Prepare incoming New Participant Registration Form data for input into the database
#'
#' @param formData a character of the reactive output from the Registration Form entry
#' @param username a character of the current session user (ie, `USER$name`)
#' @return a list of prepared form data
#'
#' @export


prepareRegistrationForm <- function(formData, username)
{
  formData <- as.list(formData)

  formData$timestamp <- as.character(Sys.time())
  formData$userstamp <- username

  formData$DOB <-
    as.character(as.Date(as.numeric(formData$DOB), origin = '1970-01-01'))

  formData$DateAdded <-
    as.character(as.Date(as.numeric(formData$DateAdded), origin = '1970-01-01'))


  formData$hash <- registrationHash(formData)


  return(formData)
}
