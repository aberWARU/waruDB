#' Save Sample Tracker
#'
#' Save data captured from a form entry reactive into the *SampleTracker* table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param formData the reactive output from `formData`
#' @export

saveSampleTracker <- function(formData, db_connection) {
  query <- sprintf(
    "INSERT INTO %s (%s) VALUES ('%s')",
    'SampleTracker',
    paste(names(formData), collapse = ", "),
    paste(formData, collapse = "', '")
  )

  pool::dbExecute(db_connection, query)
  return(invisible(NULL))
}
