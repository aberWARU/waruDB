#' Validate E-Mail Address
#'
#' @param x a character string of an E-Mail address
#' @return a logical statement
#'
#' @keywords internal

validateEmail <- function(x)
{
  return(
    grepl(
      "\\<[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}\\>",
      as.character(x),
      ignore.case = TRUE
    )
  )
}


globalVariables(
  c(
    '.',
    'AccessLevel',
    'Active',
    'COMPONENT',
    'ContactNumber',
    'DASHBOARD',
    'DOB',
    'EmailAddress',
    'Forename',
    'NAME',
    'ParticipantID',
    'STATUS',
    'SampleID',
    'Surname',
    'Username',
    'date_received',
    'hash',
    'received_by',
    'sample_type',
    'study_code',
    'tubes'
  )
)
