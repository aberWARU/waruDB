#' Load Project Index
#'
#' Load the Project Index table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of WARU projets
#' @export

loadProjectIndex <- function(db_connection) {
  projects <-
    db_connection %>% tbl('ProjectIndex') %>% collect()

  return(projects)
}
