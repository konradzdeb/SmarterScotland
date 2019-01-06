#' @title Get Geography Data
#'
#' @description The function fetches statistical data for a selected geography
#'   framework from: \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @param indicator A character vector with the name of indicator to be sourced from the
#'   \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @param geography A character corresponding to geographies for which to source
#'   the data.
#'
#' @details In effect, the following function works as a wraper for a SPARQL query
#'   sourcing data across desired geography for selected indicator. The function
#'   sources the full time series data set as
#'
#' @return A data framewith indicator values per selected geography.
#'
#' @import assertthat
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_geography_data(indicator = "JSA", geography = "datazones")
#' }
get_geography_data <- function(indicator, geography) {
  # Check if all arguments were specificed
  assert_that(is.string(indicator), is.string(geography),
              msg = "Both indicator name and geography name have to be strings.")

  # TODO: Query and corresponding mechanism
  return(NULL)
}