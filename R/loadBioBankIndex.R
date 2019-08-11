#' Load BioBank Index
#'
#' Load the BioBank Index table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of BioBank box descriptions
#' @export

loadBioBankIndex <- function(db_connection) {
  biobank_info <-
    db_connection %>% tbl('BioBankIndex') %>% collect()

  return(biobank_info)
}
