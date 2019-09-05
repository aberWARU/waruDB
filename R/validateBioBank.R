#' Validate Sample Tracker (Batch Upload)
#'
#' Validate the BioBank batch upload file
#'
#' @param inFile a `tibble` from the file input
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a numeric value either 0;validation failed or  1; validation successful
#'
#' @export

validateBioBank <- function(inFile, db_connection)
{
  hashCodes <- bioBankHash(inFile)

  if (length(unique(hashCodes)) != length(hashCodes)) {
    return(0)
  }


  BioBankHash <-
    db_connection %>% dplyr::tbl('BioBank') %>% dplyr::select(hash) %>% dplyr::pull()

  if (isTRUE(any(hashCodes %in% BioBankHash))) {
    return(0)
  }


  if (any(is.na(inFile$SampleID) == TRUE)) {
    return(0)
  }

  if (any(is.na(inFile$ParticipantID) == TRUE)) {
    return(0)
  }

  if (any(is.na(inFile$Biofluid) == TRUE)) {
    return(0)
  }

  if (any(is.na(inFile$Volume) == TRUE)) {
    return(0)
  }

  if (!is.numeric(inFile$Volume)) {
    return(0)
  }

  if (any(is.na(inFile$Study) == TRUE)) {
    return(0)
  }

  if (!is.numeric(inFile$Aliquots)) {
    return(0)
  }

  if (any(is.na(inFile$FreezerBox) == TRUE)) {
    return(0)
  }

  if (any(is.na(inFile$Position) == TRUE)) {
    return(0)
  }

  if (!lubridate::is.Date(inFile$DateAdded)) {
    return(0)
  }


  return(1)
}
