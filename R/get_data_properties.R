#' @title Get Data Properties
#'
#' @description The queries sources properties for the desired data set and
#'   optionally values for those properties.
#'
#' @param data_set String corresponding to \code{subject} column derived via
#'   \code{\link[SmarterScotland]{get_available_datasets}}.
#' @param property_values A boolean. Defaults to \code{FALSE}. If \code{TRUE}
#'   the function will return values for each available property. The match
#'   is case sensitive
#'
#' @details Please note that for some of the data sets case is significant. For
#'   instance \code{life-expectancy} will match
#'   \url{http://statistics.gov.scot/data/life-expectancy} whereas
#'   \code{Life-Expectancy} will match
#'   \url{http://statistics.gov.scot/data/Life-Expectancy} the first data set
#'   is obsolete and maintained by The Scottish Government for the backward
#'   compatibility. If in doubt paste \code{dataset.value} \code{URI} obtained
#'   via the  \code{\link[SmarterScotland]{get_available_datasets}} function.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' get_data_properties(data_set = "Life-Expectancy")
#' get_data_properties(data_set = "Life-Expectancy", property_values = TRUE)
#' }
get_data_properties <- function(data_set, property_values = FALSE) {

  # Get data set URI
  available_data_sets <- get_available_datasets()

  # Get data set URI
  data_set_uri <- available_data_sets$dataset.value[
    available_data_sets$subject == data_set]

  # Prepare variables to construct query
  if (isFALSE(property_values)) {
    # Set properties to nothing
    where_props <- ""
    where_label <- ""
  } else {
    # Add elements to sparql
    where_props <- "?p rdfs:label ?value ."
    where_label <- "?value"
  }

  # Construct query
  query <- read_query_file(query_file("qry_get_data_properties"))
  query <- glue(query, .open = "[", .close = "]")

  # Query Scotstat
  response <- query_scotstat(query)

  # Parse response
  response_df <- parse_response(response)
  response_df <- as.data.frame(sapply(response_df, as.character),
                               stringsAsFactors = FALSE)

  # Return response object
  return(response_df)
}
