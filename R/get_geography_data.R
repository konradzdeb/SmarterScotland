#' @title Get Geography Data
#'
#' @description The function fetches statistical data for a selected geography
#'   framework from: \href{http://statistics.gov.scot}{statistics.gov.scot}
#'   for a selected period for a selected indicator.
#'
#' @param indicator \strong{Required.} A character vector with the name of indicator to be sourced from the
#'   \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @param hierarchy \strong{Required.} A character corresponding to geography framework.
#'   The list of available frameworks can be obtained through
#'   \code{\link{get_available_hierarchies}}.
#'
#' @param period \strong{Optional.} A character vector corresponding to period(s)
#'  for which the data should be sourced. This has to correspond to the
#'  available periods. For instance \code{c("2001Q2", "2010Q2")} would get the
#'  data for 2nd quarters of 2001 and 2010 respectively.
#'
#' @details In effect, the following function attempts to source all data
#'   available for a specific spatial framework for all periods for
#'   selected spatial hierarchy.
#'
#' @return A data framewith indicator values per selected geography.
#'
#' @importFrom checkmate assert_string
#' @importFrom checkmate test_character
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_geography_data(indicator = "JSA", geography = "datazones")
#' }
get_geography_data <- function(indicator, hierarchy, period) {
  # Check if all arguments were specificed
  assert_string(x = indicator, na.ok = FALSE, null.ok = FALSE)
  assert_string(x = hierarchy, na.ok = FALSE, null.ok = FALSE)

  # Check if period was provided and source relevant query
  if (missing(period)) {
    sparql_query <- read_query_file(query_file())
  } else {
    # Check if period is character, if not convert
    if (!test_character(x = period)) {
      period <- as.character(period)
    }
    # Import SPARQL query with logic for period
    sparql_query <- read_query_file(query_file())
  }

  # TODO: Query and corresponding mechanism
  return(NULL)
}