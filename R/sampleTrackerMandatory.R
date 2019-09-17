#' Mandatory Value Check (Sample Tracker)
#'
#' @param inputData list of input data from Sample Tracker form
#' @return a numeric value either 0;missing mandatory values or  1; all values present
#'
#' @export

sampleTrackerMandatory <- function(inputData)
{
  mandatoryValues <-
    tibble::as_tibble(inputData[[1]]) %>% dplyr::select(ParticipantID,
                                                        SampleID,
                                                        date_received,
                                                        sample_type,
                                                        study_code)


  mandatoryCheck <- any(mandatoryValues == "")

  if (isTRUE(mandatoryCheck)) {
    return(0)
  } else{
    return(1)
  }

}
