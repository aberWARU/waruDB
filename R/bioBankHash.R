#' BioBank Hash Code
#'
#' A simple generation of a hash code which is used to check if a new BioBank record already has an existing entry in the database.
#'
#' The hash code is simply the base64 encoded concatantion of; `Sample ID`, `BioFluid` and `SampleContainer`
#'
#' @param inFile a `tibble` from the file input of BioBank batch upload
#' @return a character vector of the base64 encoded BioBank hash codes
#'
#' @export

bioBankHash <- function(inFile)
{
  biobank_hash <-
    paste0(inFile$SampleID, inFile$Biofluid, inFile$Container)

  biobank_hash_enc <-
    purrr::map_chr(biobank_hash, ~ {
      openssl::base64_encode(charToRaw(.))
    })

  return(biobank_hash_enc)
}
