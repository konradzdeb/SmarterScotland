#' @title Get Available Spatial Frameworks
#'
#' @description The following function takes no arguments other than the optional
#'   endpoint and sources available spatial hierarchies. The returned hierarchies
#'   correspond to the available best-fit geographies and can be used to aggregate
#'   data zone level data.
#'
#' @details In practice, the function can be used to to inform aguments in
#'   \code{\link[SmarterScotland]{get_geography_data}}.
#'
#' @return A data frame containing list of available hierarchies.
#'
#' @export
#'
#' @importFrom SPARQL SPARQL
#'
#' @examples
#' \dontrun{
#' head(get_available_hierarchies())
#' #   hierarchy                                                           label
#' # 1 http://statistics.gov.scot/def/hierarchy/best-fit#health-board-area Best fit health board area
#' # 2      http://statistics.gov.scot/def/hierarchy/best-fit#council-area Best fit council area
#' }
get_available_hierarchies <-
  function() {
    # Validate endpoint
    check_endpoint(endpoint = getOption("SmarterScotland.endpoint"), stop_on_bad = TRUE)

    query <- read_query_file(query_file("get_available_frameworks"))


    dta_res <- SPARQL(url = getOption("SmarterScotland.endpoint"),
                      query = query,
                      format = "csv")

    return(dta_res$results)

  }