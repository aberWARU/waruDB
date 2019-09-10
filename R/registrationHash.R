#' Registration Form Hash Code
#'
#'  A simple generation of a hash code which is used to check if newly registered participant has an existing entry in the database.
#'
#' @param formData a character of the reactive output from the Registration Form entry
#' @return a character string of the base64 encoded hash
#'
#' @export

registrationHash <- function(formData)
{
  formData <- as.list(formData)

  hashRaw <-
    paste0(formData$Forename, '+', formData$Surname, '+', formData$DOB)


  hashEnc <- openssl::base64_encode(charToRaw(hashRaw))

  return(hashEnc)
}
