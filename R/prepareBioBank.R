#' Prepare BioBank
#'
#' Preparing incoming BioBank batch file for upload to the database
#'
#' @param inFile a `tibble` from the file input
#' @param username a character of the current session user (ie, `USER$name`)
#' @return a `tibble` of the prepared `inFile`
#'
#' @export

prepareBioBank <- function(inFile, username)
{
  inFile <-
    inFile %>% dplyr::mutate(hash = bioBankHash(.)) %>% dplyr::mutate(userstamp = username, timestamp = as.character(Sys.time()))

  inFile$DateAdded <-
    as.character(as.Date(as.numeric(inFile$DateAdded), origin = '1970-01-01'))


  return(inFile)
}
