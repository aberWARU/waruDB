#' Add new Project
#'
#' Add a new project to the Project Index table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param projectTibble a `tibble` of the pfoject information to upload
#' @export

newProject <- function(db_connection, projectTibble)
{
  name_check <- c(
    'NAME',
    'DESCRIPTION',
    'STATUS',
    'FUNDER',
    'PI',
    'PrimaryContact',
    'ETHICS',
    'SIZE',
    'TYPE'
  )

  name_check_bool <- names(projectTibble) == name_check

  if (any(name_check_bool == FALSE)) {
    stop('Validation failed, check column names of input', call. = FALSE)
  }

  RMariaDB::dbWriteTable(db_connection, 'ProjectIndex', projectTibble, append = TRUE)


  return(invisible(NULL))
}
