#' Load Sample Tracker (Deleted) Data
#'
#' Load useful data from *SampleTrackerDelete* table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of deleted sample details
#' @export

loadSampleTrackerDelete <- function(db_connection) {

  data <-
    db_connection %>% dplyr::tbl('SampleTrackerDelete') %>% dplyr::select(
      ParticipantID,
      SampleID,
      sample_type,
      date_recieved,
      recieved_by,
      tubes,
      study_code
    ) %>% dplyr::collect()

  return(data)
}
