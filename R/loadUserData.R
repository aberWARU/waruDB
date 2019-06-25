#' Load User Data
#'
#' Load all active users from *Users* table. Active refers to users who are currently registered for use on the system; not user who are currently active within a session.
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of active users
#' @export

loadUserData <- function(db_connection) {
  users <-
    db_connection %>% tbl('Users') %>% filter(Active == 1) %>% collect()

  return(users)
}
