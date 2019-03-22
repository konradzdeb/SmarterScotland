#' @title Get Available Data Sets
#'
#' @description Function sources data available at
#'   \url{https://statistics.gov.scot/}.
#'
#' @param pattern A optional pattern to match data set name.
#'
#' @return A data frame
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_available_datasets(pattern = "health")
#' }
get_available_datasets <- function(pattern,
                                   endpoint = "http://statistics.gov.scot/sparql.csv") {
  if (missing(pattern)) {
    # Source full list of data sets
    qry <-
      read_query_file(query_file("get_available_datasets.sparql"))
    dta_res <- SPARQL(url = endpoint,
                      query = qry,
                      format = "csv")
    return(dta_res)
  }
}