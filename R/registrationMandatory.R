#' Mandatory Value Check (Participant Registration Form)
#'
#' @param inputData list of input data from Participant Registration form
#' @return a numeric value either 0;missing mandatory values or  1; all values present
#'
#' @export

registrationMandatory <- function(inputData)
{
  if (length(inputData$DOB) == 0) {
    inputData$DOB <- ""
  }

  if (length(inputData$DateAdded) == 0) {
    inputData$DOB <- ""
  }


  clean_data <- unlist(inputData) %>% data.frame()
  mandatoryValues <-
    t(clean_data) %>% tibble::as_tibble() %>% dplyr::select(-ContactNumber)

  mandatoryCheck <- any(mandatoryValues == "")

  if (isTRUE(mandatoryCheck)) {
    return(0)
  } else{
    return(1)
  }

}
