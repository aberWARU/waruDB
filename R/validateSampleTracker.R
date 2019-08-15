#' Validate Sample Tracker (Batch Upload)
#'
#' Validator function for when batch upload is used instead of standard form entry
#'
#' @param inFile a `tibble` from the file input
#' @param db_connection a `dbPool` or `RMariaDB` database connection
#' #' @return a numeric value either 0;validation failed or  1; validation successful
#'
#' @export

validateSampleTracker <- function(inFile, db_connection)
{
  # first generate the hash's and check they are all unique

  batchHash <- list()
  for (i in 1:nrow(inFile)) {
    batchHash[[i]] <-
      paste0(inFile$sample_id[i],
             inFile$date_received[i],
             inFile$sample_type[i])
  }

  batchHash2 <- purrr::map_chr(batchHash, ~ {
    openssl::base64_encode(charToRaw(.))
  })

  if (length(unique(batchHash2)) != length(batchHash2)) {
    return(0)
  }

  sampleTrackerHashVec <-
    db_connection %>% dplyr::tbl('SampleTracker') %>% dplyr::select(hash) %>% dplyr::pull()

  if(isTRUE(any(batchHash2 %in% sampleTrackerHashVec))){
    return(0)
  }

  if (!is.numeric(inFile$tubes)) {
    return(0)
  }


  if (!lubridate::is.Date(inFile$date_received)) {
    return(0)
  }


  unique_sample_type <- unique(inFile$sample_type)

  sample_type_dict <-
    c('Urine Mail Pack', 'Urine Bag', 'Dried Blood Spot')

  sample_type_check <- list()
  for (i in seq_along(unique_sample_type)) {
    sample_type_check[[i]] <-
      unique_sample_type[i] %in% sample_type_dict
  }

  sample_type_check2 <- unlist(sample_type_check)

  if (FALSE %in% sample_type_check2) {
    return(0)
  }

  StudyChoices <-
    waruDB::loadProjectIndex(db_connection) %>%
    dplyr::filter(STATUS == 'Ongoing') %>% dplyr::select(NAME) %>%
    dplyr::arrange() %>%
    dplyr::pull()


  study_unique <- unique(inFile$study_code)


  study_check <- list()
  for (i in seq_along(study_unique)) {
    study_check[[i]] <-
      study_unique[i] %in% StudyChoices
  }


  study_check2 <- unlist(study_check)

  if (FALSE %in% study_check2) {
    return(0)
  }


  Receivers <-
    waruDB::loadUserData(db_connection) %>%
    dplyr::filter(Active == 1) %>%
    dplyr::mutate(NAME = stringr::str_c(Forename, ' ', Surname)) %>%
    dplyr::arrange(Surname) %>%
    dplyr::select(NAME) %>%
    dplyr::pull()

  receiver_unique <- unique(inFile$received_by)


  receiver_check <- list()
  for (i in seq_along(receiver_unique)) {
    receiver_check[[i]] <-
      receiver_unique[i] %in% Receivers
  }

  receiver_check2 <- unlist(receiver_check)

  if (FALSE %in% receiver_check2) {
    return(0)
  }

  collection_unique <- unique(inFile$collection_method)

  collection_dict <- c('Mail', 'Collection', 'Participant Drop-Off')

  collection_check <- list()
  for (i in seq_along(collection_unique)) {
    collection_check[[i]] <-
      collection_unique[i] %in% collection_dict
  }

  collection_check2 <- unlist(collection_check)

  if (FALSE %in% collection_check2) {
    return(0)
  }

  return(1)


}
