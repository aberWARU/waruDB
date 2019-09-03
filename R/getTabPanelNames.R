#' Get tabPanel Names
#'
#' Retrieve the names of `tabPanel` and `uiOutputs` for each component based the User's access level
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @param username a character string of a valid `username`
#' @return a vector of components to source at login
#'
#' @export

getTabPanelNames <- function(db_connection, username)
{

  user_access_level <-
    db_connection %>% dplyr::tbl('Users') %>% dplyr::filter(Username == !!username) %>%
    dplyr::select(AccessLevel) %>% dplyr::pull()


  TabPanelNames <-
    db_connection %>% dplyr::tbl('AccessLevel') %>% dplyr::select(tabName, uiName, !!user_access_level) %>% dplyr::collect() %>%
  dplyr::filter_at(dplyr::vars(user_access_level), dplyr::any_vars(. == 1)) %>% dplyr::filter(tabName != 'NA') %>% dplyr::select(-!!user_access_level)

  return(TabPanelNames)

}
