#' Get Dashboard Name
#'
#' Retrieve the name of the correct login dashbaord to source based the User's access level
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param username a character string of a valid `username`
#' @return a character string of the dashbaord to source
#'
#' @export

getDashboardName <- function(db_connection, username)
{
  user_access_level <-
    db_connection %>% dplyr::tbl('Users') %>% dplyr::filter(Username == !!username) %>%
    dplyr::select(AccessLevel) %>% dplyr::pull()


  DasboardName <-
    db_connection %>% dplyr::tbl('DashboardSource') %>% dplyr::filter(AccessLevel == user_access_level) %>% dplyr::select(DASHBOARD) %>% dplyr::pull()

  return(DasboardName)

}
