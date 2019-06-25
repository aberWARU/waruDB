#' Save Sample Tracker
#'
#' Save data captured from a form entry reactive into the *SampleTracker* table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param data the reactive output from `formData`
#' @return a numeric value of either 0 (failure) or 1 (success)
#' @export

saveSampleTracker <- function(db_connection, data) {
  sample_tracker_tbl <-
    db_connection %>% tbl('SampleTracker') %>% collect()

  if (data[[1, 'hash']] %in% sample_tracker_tbl$hash) {
    return(0)

  } else{
    query <- sprintf(
      "INSERT INTO %s (%s) VALUES ('%s')",
      'SampleTracker',
      paste(names(data), collapse = ", "),
      paste(data, collapse = "', '")
    )

    dbExecute(db_connection, query)

    return(1)
  }

}
