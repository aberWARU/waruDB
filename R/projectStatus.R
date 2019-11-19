#' Change Project Status
#'
#' Set the project status in the Proejct Index table to eiher **Ongoing** or **Completed**
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param projectCode a character string of the Project Code/Name
#' @param projectStatus a character string of either `Ongoing` or `Completed`
#' @export

projectStatus <- function(db_connection,
                          projectCode,
                          projectStatus)
{
  ProjectIndex <-
    db_connection %>% dplyr::tbl('ProjectIndex') %>% dplyr::select(NAME) %>%
    dplyr::pull()

  if (!projectCode %in% ProjectIndex) {
    stop('Project Code not found in Index table', call. = FALSE)
  }

  project_sataus_check <- c('Ongoing', 'Completed')

  if (!projectStatus %in% project_sataus_check) {
    stop('Project Status must be either Ongoing or Completed', call. = FALSE)
  }

  replace_cmd <-
    paste0(
      'UPDATE ProjectIndex SET STATUS = ',
      "'",
      projectStatus,
      "'",
      ' WHERE NAME = ',
      "'",
      projectCode,
      "'"
    )

  pool::dbExecute(db_connection, replace_cmd)

  return(invisible(NULL))

}
