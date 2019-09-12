#' Load All Sample Tracker
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of the entire `SampleTracker` table
#'
#' @export

loadSampleTrackerAll <- function(db_connection)
{
  all_data <-
    db_connection %>% dplyr::tbl('SampleTracker') %>% dplyr::collect()

  return(all_data)
}
