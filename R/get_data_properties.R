#' @title Get Data Properties
#'
#' @description The queries sources properties for the desired data set and
#'   optionally values for those properties.
#'
#' @param data_set String corresponding to \code{subject} column derived via
#'   \code{\link[SmarterScotland]{get_available_datasets}}.
#' @param property_values A boolean. Defults to \code{FALSE}. If \code{TRUE}
#'   the function will return values for each available property.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' get_data_properties(data_set = "life-expectancy")
#' get_data_properties(data_set = "life-expectancy", property_values = TRUE)
#' }
get_data_properties <- function(data_set, property_values = TRUE) {

  # Get data set URI
  available_data_sets <- get_available_datasets()
  # Sileence R CMD check warning on using variables with no binding
  dataset.value <- NULL
  subject <- NULL
  # Get data set URI
  data_set_uri <-
    subset.data.frame(
      x = available_data_sets,
      subset = subject == data_set,
      select = dataset.value,
      drop = TRUE
    )

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