#' @title Get Available Spatial Frameworks
#'
#' @description The following function takes no arguments other than the optional
#'   endpoint and sources available spatial hierarchies. The returned hierarchies
#'   correspond to the available best-fit geographies and can be used to aggregate
#'   data zone level data.
#'
#' @details In practice, the function can be used to to inform arguments in
#'   \code{\link[SmarterScotland]{get_geography_data}}.
#'
#' @return A data frame containing list of available hierarchies.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' head(get_available_hierarchies())
#' #   hierarchy                                                           label
#' # 1 http://statistics.gov.scot/def/hierarchy/best-fit#health-board-area Best fit health board area
#' # 2      http://statistics.gov.scot/def/hierarchy/best-fit#council-area Best fit council area
#' }
get_geography_hierarchies <- function() {

  # Get relevant query
  query <- read_query_file(query_file("get_available_frameworks"))

  # Query Scotstat
  response <- query_scotstat(query)

  # Parse response
  response_df <- parse_response(response)

  # Return data frame
  return(response_df)
}
