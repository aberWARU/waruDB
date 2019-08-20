#' Sample Tracker Hash Code
#'
#' A simple generation of a hash code which is used to check if an incoming sample already has an existing entry in the database.
#'
#' The hash code is simply the base64 encoded concatantion of; `Sample ID`, `Date Received` and `Sample Type`
#'
#' @param formData a character of the reactive output from the Sample Tracker form entry
#' @return a character of the base64 encoded sample hash code
#'
#' @export

sampleTrackerHash <- function(formData)
{
  sampleHash <- paste0(formData$sample_id,
                       formData$date_received,
                       formData$sample_type)

  sampleHashEnc <- openssl::base64_encode(charToRaw(sampleHash))

  return(sampleHashEnc)
}
