#' DBS Form Data
#'
#' Extract Sample Tracker data for Dried Blood Spot (DBS) cards
#'
#' @param formData a character of the reactive output from the Sample Tracker form entry
#' @return return a character of `formData` for DBS cards
#'
#' @export

DBSform <- function(formData)
{
  if (formData[['dbs_card']] == FALSE) {
    return(invisible(NULL))
  }

  formData_DBS <- formData[-4]
  formData_DBS[['tubes']] <- 1
  formData_DBS[['sample_type']] <- 'Dried Blood Spot'

  formData_DBS_Hash <- sampleTrackerHash(formData_DBS)

  formData_DBS <- c(formData_DBS, hash = formData_DBS_Hash)

  return(formData_DBS)
}
