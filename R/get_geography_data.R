#' @title Get Geography Data
#'
#' @description The function fetches statistical data for a selected geography
#'   framework from: \href{http://statistics.gov.scot}{statistics.gov.scot}
#'   for a selected period for a chosen indicator.
#'
#' @param data_set \strong{Required.} A character vector with the name of
#'   indicator to be sourced from the
#'   \href{http://statistics.gov.scot}{statistics.gov.scot}.
#'
#' @param geography \strong{Required.} A character vector corresponding to
#'   geographies for which to derive the data or URI corresponding to a
#'   specific geography. Colloquial
#'
#' @param period \strong{Optional.} A character vector corresponding to period(s)
#'  for which the data should be sourced. This has to correspond to the
#'  available periods. For instance \code{c("2001Q2", "2010Q2")} would get the
#'  data for 2nd quarters of 2001 and 2010 respectively.
#'
#' @details The following function attempts to source all data available for
#'   specific geographies for the provided period periods. Colloquial
#'   geography names are matched with URI values in
#'   \emph{Standard Geography Code Register}. A well known locality name like
#'   \emph{Edinburgh} may match multiple URIs. Have a look at
#'   \code{\link[SmarterScotland]{available_data_sets}} documentations to
#'   explore data available in the package and
#'   \code{\link[SmarterScotland]{get_available_datasets}} function to get most
#'   recent list.
#'
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
get_geography_data <- function(data_set, geography, period) {
  # Check if all arguments were specified
  assert_string(x = data_set,
                na.ok = FALSE,
                null.ok = FALSE)
  assert_string(x = geography,
                na.ok = FALSE,
                null.ok = FALSE)

  # Import basic SPARQL query
  query_orig <-
    read_query_file(query_file("qry_get_geography_data"))

  # Check if period was provided and input in the query
  if (missing(period)) {
    period <- ""
  } else {
    # Expand query with the provided period data to filter per period.
    filter_st_time <- construct_filter(sparql_variable = "time",
                                       filter_values = period)
  }

  # Create a filter for geography
  if (missing(geography)) {
    geography <- ""
  } else {
    # Get list of URIs corresponding to the matched geographies
  }

  # Check data set properties and construct relevant SPARQL calls for each
  dta_properties <- get_data_properties(data_set = data_set)

  # Get data set URI
  data_set_URI <-
    paste0("<http://statistics.gov.scot/data/", data_set, ">")

  # Construct variable names
  var_nms <-
    paste(paste0("?", tolower(
      make.names(dta_properties$label.value, allow_ = TRUE)
    )))
  var_nms <-
    gsub(
      pattern = ".",
      replacement = "_",
      fixed = TRUE,
      x = var_nms
    )

  # Generate where clauses
  where_vars_call <- paste(
    mapply(
      FUN = function(x, y) {
        # If desired force x to return a label
        if (grepl(
          pattern = paste("refArea", "unitMeasure", "refPeriod", sep = "|"),
          x = x,
          ignore.case = TRUE
        )) {
          x <- paste0("<", x, ">/rdfs:label")
        } else {
          x <- paste0("<", x, ">")
        }
        paste("?x", x, y, ".")
      },
      dta_properties$property.value,
      var_nms,
      USE.NAMES = FALSE,
      SIMPLIFY = TRUE
    ),
    collapse = " "
  )

  # Replace ?data_set with the call to URI
  where_vars_call <-
    sub(
      pattern = "?data_set",
      replacement = data_set_URI,
      x = where_vars_call,
      fixed = TRUE
    )

  # Collapse variable names for SELECT statement
  var_nms <- paste(var_nms, collapse = " ")

  # Replace query content
  query <- glue(query_orig, .open = "[", .close = "]")

  # Query Scotstat
  response <- query_scotstat(query)

  # Prepare response
  results <- parse_response(response)

  # Return query results
  return(results)
}
