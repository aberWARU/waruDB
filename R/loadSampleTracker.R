#' Load Sample Tracker Data
#'
#' Load useful data from *SampleTracker* table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of sample details
#' @export

loadSampleTracker <- function(db_connection) {

  data <-
    db_connection %>% tbl('SampleTracker') %>% select(
      participant_id,
      sample_id,
      sample_type,
      date_recieved,
      recieved_by,
      tubes,
      study_code
    ) %>% collect()

  return(data)
}
