#' @title Get Available Data Sets
#'
#' @description Function sources data available at
#'   \url{https://statistics.gov.scot/}.
#'
#' @param pattern A optional pattern to match data set name.
#'
#' @return A data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_available_datasets(pattern = "health")
#' }
get_available_datasets <- function(pattern) {
  # Source full list of data sets
  query <- read_query_file(query_file("get_available_datasets.sparql"))

  # Query Scotstat
  response <- query_scotstat(query)

  # Parse response
  response_df <- parse_response(response)

  # Convert all columns to character
  response_df <- as.data.frame(sapply(response_df, as.character),
                               stringsAsFactors = FALSE)

  # Sileence R CMD check warning on using variables with no binding
  dataset.value <- NULL

  # Clean and prepare results data frame
  results <- within(data = response_df,
                    expr = {
                      subject = substr(
                        x = dataset.value,
                        start = max(unlist(
                          gregexpr(
                            pattern = "/",
                            text = dataset.value,
                            fixed = TRUE
                          )
                        )) + 1,
                        stop = nchar(dataset.value)
                      )
                    })

  results$dataset.type <- NULL

  # Clean names
  results <-
    setNames(
      object = results,
      nm = sub(
        pattern = ".",
        replacement = "_",
        x = names(results),
        fixed = TRUE
      )
    )

  if (missing(pattern)) {
    return(results)
  } else {
    return(subset.data.frame(
      x = results,
      subset = grepl(pattern = pattern, x = results$subject)
    ))
  }
}