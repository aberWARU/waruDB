#' Validate Contact Form (Batch Upload)
#'
#' Validator function for when batch upload is used instead of standard form entry
#'
#' @param inFile a `tibble` from the file input
#' @return a numeric value either 0;validation failed or  1; validation successful
#'
#' @export

validateContactForm <- function(inFile)
{
  if (any(!is.character(inFile$Forename))) {
    return(0)
  }

  if (any(!is.character(inFile$Surname))) {
    return(0)
  }

  Gender <- unique(inFile$Gender)
  Gender_dict <- c('M', 'F')

  gender_check <- list()
  for (i in seq_along(Gender)) {
    gender_check[[i]] <-
      Gender[i] %in% Gender_dict
  }

  gender_check2 <- unlist(gender_check)

  if (FALSE %in% gender_check2) {
    return(0)
  }


  if (!lubridate::is.Date(inFile$DOB)) {
    return(0)
  }

  return(1)

}
