#' @title Getting Available Data Sets
#'
#' @description Function sources data sets available at
#'   \url{https://statistics.gov.scot/}.
#'
#' @details The functions executes simple SPARQL query to source distinct
#'   values for the objects of \code{rdf:type} defines as
#'   \code{<http://publishmydata.com/def/dataset#Dataset>}. The sourced
#'   values can be used in function 
#'   \code{\link[SmarterScotland]{get_geography_data}} and other functions to
#'   filter the query results to a specific data set.
#'
#' @param pattern A optional pattern to match data set name.
#' @param ... Other options passed to \code{\link[base:grep]{grepl}}
#'
#' @return A data frame with data set names and URIs. 
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

  # Silence R CMD check warning on using variables with no binding
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
