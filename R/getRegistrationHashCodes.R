#' Get Registration Hash Codes
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a character vector of hash codes
#'
#' @export

getRegistrationHashCodes <- function(db_connection)
{
  HashCodes <-
    db_connection %>% dplyr::tbl('ParticipantRegistration') %>% dplyr::select(hash) %>% dplyr::collect()

  return(HashCodes)
}
