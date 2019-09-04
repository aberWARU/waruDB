#' Prepare Contact Infomation Form (Batch Mode)
#'
#' Prepare incoming Contact Form data for batch input into the database
#'
#' @param inFile a `tibble` from the file input
#' @param username a character of the current session user (ie, `USER$name`)
#' @return a list of prepared form data
#'
#' @export

prepareContactFormBatch <- function(inFile, username)
{

  inFile$timestamp = as.character(Sys.time())
  inFile$userstamp = username
  # this needs to be length of input for unique
  inFile$UID <- uuid::UUIDgenerate()

  inFile$DOB <-
    as.character(as.Date(as.numeric(inFile$DOB), origin = '1970-01-01'))

  inFile$Newsletter <- gsub('Y', 1, inFile$Newsletter)
  inFile$Newsletter <- gsub('N', 0, inFile$Newsletter)

  return(inFile)

}
