#' @title Query Scotstat Repository
#'
#' @description Send query to statistics.gov.scot.
#'
#' @details Query Scotstat data using \code{\link[httr]{POST}} function
#'  available in \code{\link[httr]{httr}} package. The functions reads the
#'  \code{SmarterScotland.endpooint} option values and uses the provided
#'  endpoint to send query to statistics.gov.scot.
#'
#' @param query A character scalar corresponding to SPARQL query string.
#'
#' @return A response object derived via \code{\link[httr]{POST}} function.
#'
#' @examples
#' \dontrun{query_scotstat(read_query_file(query_file("get_available_frameworks")))}
#'
#'
query_scotstat <- function(query) {
  # Run query
  response <- POST(
    url = getOption("SmarterScotland.endpoint"),
    config = accept_json(),
    body = list(query = query)
  )

  switch(getOption("SmarterScotland.response_check"), {
    warn = warn_for_status(response)
    stop = stop_for_status(response)
  })

  return(response)
}
