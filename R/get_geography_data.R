#' @title Get Geography Data
#'
#' @description The function fetches statistical data for a selected geography
#'   framework from: \href{http://statistics.gov.scot}{statistics.gov.scot}
#'   for a selected period for a chosen indicator.
#'
#' @param indicator \strong{Required.} A character vector with the name of
#'   indicator to be sourced from the
#'   \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @param hierarchy \strong{Required.} A character corresponding to geography framework.
#'   The list of available frameworks can be obtained through
#'   \code{\link{get_geography_hierarchies}}.
#'
#' @param period \strong{Optional.} A character vector corresponding to period(s)
#'  for which the data should be sourced. This has to correspond to the
#'  available periods. For instance \code{c("2001Q2", "2010Q2")} would get the
#'  data for 2nd quarters of 2001 and 2010 respectively.
#'
#' @details The following function attempts to source all data
#'   available for a specific spatial framework for all periods for
#'   selected spatial hierarchy or only for the selected period if the
#'   \code{period} argument is provided.
#'
#' @return A data frame.
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

  # Import basic SPARQL query
  sparql_query <- read_query_file(query_file("qry_get_geography_data"))

  # Check if period was provided and source relevant query
  if (!missing(period)) {
    # Convert period to character if passed as an integer
    if (!test_character(x = period)) {
      period <- as.character(period)
    }
    # Expand query with the provided period data to filter per period.
  }

  # TODO: Query and corresponding mechanism
  return(NULL)
}