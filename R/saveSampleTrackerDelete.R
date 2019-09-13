#' Save Sample Tracker (Delete)
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param inFile the `tibble` output from `loadSampleTracker`
#' @param username a character of the current session user (ie, `USER$name`)
#'
#' @export

saveSampleTrackerDelete <- function(db_connection, inFile, username)
{

  inFile$timestamp <- as.character(Sys.time())
  inFile$userstamp <- username

  db_connection %>% pool::dbWriteTable(., 'SampleTrackerDelete', inFile, append = TRUE)
  return(invisible(NULL))

}

