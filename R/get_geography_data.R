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
#' @param geography \strong{Required.} A character corresponding to geography framework.
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
#' get_geography_data(data_set = "alcohol-related-discharge",
#'                    geography = "datazones")
#' }
get_geography_data <- function(indicator, geography, period) {
  # Check if all arguments were specified
  assert_string(x = indicator,
                na.ok = FALSE,
                null.ok = FALSE)
  assert_string(x = geography,
                na.ok = FALSE,
                null.ok = FALSE)

  # Import basic SPARQL query
  query <- read_query_file(query_file("qry_get_geography_data"))

  # Check if period was provided and input in the query
  if (!missing(period)) {
    # Convert period to character if passed as an integer
    if (!test_character(x = period)) {
      period <- as.character(period)
    }
    # Expand query with the provided period data to filter per period.
    period <-
      paste("FILTER (?time IN (",
            paste(paste0("\"", period, "\""), collapse = ", "),
            "))",
            collapse = "")
  } else {
    period <- ""
  }

  # Check data set properties and construct relevant SPARQL calls for each
  dta_properties <- get_data_properties(data_set = data_set)

  # Construct variable names
  var_nms <-
    paste(paste0("?", tolower(
      make.names(dta_properties$label.value, allow_ = TRUE)
    )))
  var_nms <- gsub(pattern = ".", replacement = "_", fixed = TRUE, x = var_nms)

  # Generate where clauses
  where_call <- paste(
    mapply(
      FUN = function(x, y) {
        paste("?x",
              paste(paste0("<", x, ">/rdfs:label"), y), ".")
      },
      dta_properties$property.value,
      var_nms,
      USE.NAMES = FALSE,
      SIMPLIFY = TRUE
    ),
    collapse = " "
  )

  # Collapse names to insert in select statement
  var_nms <- paste(var_nms, collapse = " ")

  # Replace query content
  query <- glue(query, .open = "[", .close = "]")

  # Query Scotstat
  response <- query_scotstat(query)

  # TODO: Query and corresponding mechanism
  return(NULL)
}
