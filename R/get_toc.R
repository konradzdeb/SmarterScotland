#' @title Get TOC from statistics.gov.scot
#'
#' @description Sources list of data available through statistics.gov.scot
#'
#' @details
#' Sources list of available data sets from statistics.gov.uk and returns
#'   a data frame accounting for the available data sets, timespan and
#'   geographies.
#'
#' @param which Defaults to \code{NULL} and returns all subjects, a character
#'   value is passed to \code{FILTER} in SPARQL query performing case insensitive
#'   regex on filter categories.
#'
#' @return
#' A \code{data.frame} with columns corresponding to table name,
#'   available geographies and time series intervals.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Get list of themes with 'pupil' keyword
#' head(get_ToC(which = "pupil"), n = 5)
#' # Get full list
#' head(get_ToC(which = "pupil"), n = 5)
#' }
get_ToC <- function(which = NULL) {
    # Depending on the which value use default or query with regex
    if (missing(which)) {
      query <- read_query_file(query_file("qry_get_topics"))
    } else {
      query <- gsub(
        pattern = "replaceWithKeyword",
        replacement = which,
        x = read_query_file(query_file("qry_get_topics_regex.sparql"))
      )
    }

    res <- query_scotstat(query = query)

    dta_res <- parse_response(x = res)

    # Return results
    return(dta_res)

  }
