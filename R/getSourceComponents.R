#' Get Source Components
#'
#' Retrieve the components to source at login based on the User's access level
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param username a character string of a valid `username`
#' @return a vector of components to source at login
#'
#' @export

getSourceComponents <- function(db_connection, username)
{
  user_access_level <-
    db_connection %>% dplyr::tbl('Users') %>% dplyr::filter(Username == !!username) %>%
    dplyr::select(AccessLevel) %>% dplyr::pull()

  srcComponents <-
    db_connection %>% dplyr::tbl('AccessLevel') %>% dplyr::select(COMPONENT,!!user_access_level) %>% dplyr::collect() %>%
    dplyr::filter_at(dplyr::vars(user_access_level), dplyr::any_vars(. == 1)) %>% dplyr::select(COMPONENT) %>% dplyr::pull()

  return(srcComponents)

}
