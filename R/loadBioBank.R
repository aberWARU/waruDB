#' Load BioBank
#'
#' Load the BioBak table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of the complete BioBank table
#' @export

loadBioBank <- function(db_connection) {
  biobank <-
    db_connection %>% tbl('BioBank') %>% collect()

  return(biobank)
}
