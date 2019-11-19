#' Add new Component
#'
#' Add a new component to the Access Level table
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param componentTibble a `tibble` of the component information to upload
#' @export

addComponent <- function(db_connection, componentTibble)
{
  name_check <- c(
    'COMPONENT',
    'admin',
    'superuser',
    'standard',
    'sample_tracker',
    'biobank',
    'tracking_only',
    'recruitment_only'
  )

  name_check_bool <- names(componentTibble) == name_check

  if (any(name_check_bool == FALSE)) {
    stop('Validation failed, check column names of input', call. = FALSE)
  }

  pool::dbWriteTable(db_connection, 'AccessLevel', componentTibble, append = TRUE)

  return(invisible(NULL))

}
