#' Check Sample Tracker Hash
#'
#' Check if the incoming Sample Tracker entry already exists in the database
#'
#' @param formData a character of the reactive output from the Sample Tracker form entry
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a numeric value either 0 (hash already exists) 1 (incoming hash is new)
#'
#' @importFrom magrittr %>%
#' @export

checkSampleTrackerHash <- function(formData, db_connection)
{
  incomingHash <- sampleTrackerHash(formData)

  sampleTrackerHashVec <-
    db_connection %>% dplyr::tbl('SampleTracker') %>% dplyr::select(hash) %>% dplyr::pull()

  if (incomingHash %in% sampleTrackerHashVec) {
    return(0)
  } else{
    return(1)
  }

}
