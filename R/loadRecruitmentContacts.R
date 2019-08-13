#' Load Recruitment Contacts
#'
#' Load all data from the `Participant Recruitment Database`
#'
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a `tibble` of the `Participant Recruitment Database`
#' @export

loadRecruitmentContacts <- function(db_connection)
  {
  recruitment_contacts <- db_connection %>% dplyr::tbl('ParticipantInterest') %>% dplyr::collect()
  return(recruitment_contacts)
  }
