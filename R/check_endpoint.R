#' @title Check SPARQL endpoint
#'
#' @description Function checks whether the provided endpoint is of online.
#'
#' @param endpoint A SPARQL enpoint as string.
#' @param stop_on_bad A logical, if \code{TRUE} function will call \code{\link[base]{stop}}.
#'
#' @return A logical.
#'
#' @export
#'
#' @importFrom RCurl url.exists
#' @importFrom checkmate testString
#'
#' @examples
#' \dontrun{
#'   check_endpoint("http://statistics.gov.scot/sparql")
#' }
check_endpoint <- function(endpoint, stop_on_bad) {

  # Check if provided object is a string
  testString(x = endpoint, na.ok = FALSE, min.chars = 3, null.ok = FALSE) -> tst_strning

  # Chek if url is accessible
  url.exists(
    url = endpoint,
    ...
  )

}