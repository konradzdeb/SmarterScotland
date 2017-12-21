#' @title Get Data
#'
#' @description This is a workhorse function of this package and it's used to
#'   source a data frame from the \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @param indicator A character vector with the name of indicator to be sourced from the
#'   \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @details In effect, the following function works as a wraper for a SPARQL query
#'   sourcing data across desired geographies. The query requires a number of dimensions
#'   concerned with the indicator, value and geography to be specified.
#'
#' @return
#' @export
#'
#' @examples
get_data <- function(indicator, geography) {
  # Check if all arguments were specificed
  stopifnot()

  return(NULL)
}