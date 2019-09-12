#' Register New Participant
#'
#' @param formData the `list` output from `prepareRegistrationForm`
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' @return a character string of the allocated ParticipantID
#'
#' @export

saveRegistrationForm <- function(formData, db_connection)
{
  available_rows <-
    pool::dbReadTable(db_connection, 'ParticipantRegistration') %>% dplyr::filter(is.na(hash)) %>% dplyr::collect()

  new_allocation <- available_rows$ParticipantID[1]

  formPaste <- list()
  for (i in seq_along(formData)) {
    formPaste[[i]] <-
      paste0(names(formData)[i], ' = ', "'", formData[i], "'")
  }

  formPasteC <- paste(formPaste, collapse = ' , ')


  formQuery <-
    paste0(
      'UPDATE ParticipantRegistration SET ',
      formPasteC,
      ' WHERE ParticipantID = ',
      "'",
      new_allocation,
      "';"
    )

  pool::dbExecute(db_connection, formQuery)

  return(new_allocation)

}
