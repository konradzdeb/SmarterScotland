#' @title Convert \code{response} object to data frame
#'
#' @description The function converts response object obtained via
#'  \code{\link{query_scotstat}} function and returns a data frame.
#'
#' @param x A response object.
#'
#' @return A data frame.
#'
#' @examples
#' \dontrun{
#' parse_response(x = query_scotstat(query = "SELECT * { ?s ?p ?o } LIMIT 10"))
#' }
parse_response <- function(x) {
  # Check that passed object is of response class
  stopifnot(class(x) == "response")
  # Get and parse response content
  response_content <- content(x = x, as = "parsed")
  # Extract results and convert to data frames
  lst_results <- lapply(X = response_content$results$bindings,
                        FUN = as.data.frame)
  results <-  try(do.call("smartbind", lst_results))
  if (class(results) == "try-error") {
    warning("Failed to create data frame, returning response content.")
    return(response_content)
  } else {
    return(results)
  }
}