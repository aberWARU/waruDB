#' Delete Sample Tracker
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param hash a character stirng of the `hash` for the entry to delete
#'
#' @export

deleteSampleTracker <- function(db_connection, hash)
{
  deleteQuery <- paste0('DELETE FROM SampleTracker WHERE hash = ',
                        "'",
                        hash,
                        "';")


  pool::dbExecute(db_connection, deleteQuery)

  return(invisible(NULL))

}
