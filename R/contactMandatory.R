#' Mandatory Value Check (Contact Form)
#'
#' @param inputData list of input data from Participant Interest contact form
#' @return a numeric value either 0;missing mandatory values or  1; all values present
#'
#' @export

contactMandatory <- function(inputData)
{
  mandatoryValues <-
    tibble::as_tibble(inputData[[1]]) %>% dplyr::select(Forename,
                                                        Surname,
                                                        EmailAddress,
                                                        DOB)


  mandatoryCheck <- any(mandatoryValues == "")

  if (isTRUE(mandatoryCheck)) {
    return(0)
  } else{
    return(1)
  }

}


