#' Save BioBank Data
#'
#' Save BioBank records to the database
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param inFile the `tibble` output from `prepareBioBank`
#' @export

saveBioBank <- function(db_connection, inFile)
{
  db_connection %>% pool::dbWriteTable(., 'BioBank', inFile, append = TRUE)
  return(invisible(NULL))
}
