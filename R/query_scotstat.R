#' @title Query Scotstat Repository
#'
#' @description Send query to Scotat data.
#'
#' @details Query Scotstat data using via \code{\link[httr]{POST}} function.
#'
#' @param query SPARQL query string
#'
#' @return A response object derived via \code{\link[httr]{POST}} function.
#'
#' @examples
#' \dontrun{query_scotstat(read_query_file(query_file("get_available_frameworks")))}
#'
#' @rdname utility_functions
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