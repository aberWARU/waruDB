#' Load Participant Registration Data
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of registered participants
#'
#' @export

loadParticipantRegistration <- function(db_connection)
{
  participant_register <-
    db_connection %>% dplyr::tbl('ParticipantRegistration') %>%
    dplyr::filter(hash != 'NA') %>% dplyr::collect()

  return(participant_register)
}
