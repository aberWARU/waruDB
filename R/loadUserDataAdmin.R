#' Load User Data (Admin View)
#'
#' Load all users from *Users* table for displaying in the Adminisaton tab.
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of all users.
#' @export

loadUserDataAdmin <- function(db_connection) {
  users_admin <- db_connection %>% tbl('Users') %>% collect()

  return(users_admin)

}
