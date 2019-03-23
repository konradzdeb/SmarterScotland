#' @title Check SPARQL endpoint
#'
#' @description Function checks whether the provided endpoint is of online.
#'
#' @param endpoint A SPARQL enpoint as string.
#' @param stop_on_bad A logical, if \code{TRUE} function will
#'   call \code{\link[base]{stop}} if endpoint is not accessible.
#' @param timeout Timeout for a ping response,
#'   as in \code{\link[pingr]{timeout}}
#'
#' @return A logical.
#'
#' @export
#'
#' @importFrom pingr ping
#' @importFrom checkmate assertString
#'
#' @examples
#' \dontrun{
#'   check_endpoint("http://statistics.gov.scot/sparql")
#' }
check_endpoint <- function(endpoint, stop_on_bad = FALSE, timeout = 1) {
  # Check if provided object is a string
  assertString(
    x = endpoint,
    na.ok = FALSE,
    min.chars = 3,
    null.ok = FALSE
  )

  # Chek if url is accessible
  ping(
    destination = endpoint,
    continuous = FALSE,
    verbose = FALSE,
    count = 1,
    timeout = timeout
  ) -> ping_res

  if (stop_on_bad) {
    if (any(is.na(ping_res))) {
      stop(paste("Endpoint", endpoint, "is not accessible."))
    }
  }

  # Return T/F value showing if endpoint was accessible
  return(!any(is.na(ping_res)))

}