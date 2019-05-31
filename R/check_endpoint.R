#' @title Check SPARQL endpoint
#'
#' @description Function checks whether the provided endpoint is of online.
#'
#' @param check_mode For \code{stop, warn} or \code{ignore}, decides whether to
#'   stop, warn or do nothing in case of broken endpoint url. \code{ignore}
#'   option ignores checking.
#'
#' @param timeout Timeout for a ping response,
#'   as in \code{\link[pingr]{ping}}
#'
#' @endpoit Corresponds to \url{http://statistics.gov.scot/sparql.csv}
#'   that is set up on package load and sourced via
#'   \code{getOption("SmarterScotland.endpoint")}.
#'
#' @return A logical.
#'
#' @export
#'
#' @importFrom pingr ping
#' @importFrom iptools hostname_to_ip
#' @importFrom urltools domain
#' @importFrom checkmate assertString
#'
#' @examples
#' \dontrun{
#'   check_endpoint()
#' }
check_endpoint <- function(check_mode = c("warn", "stop", "ignore"),
                           timeout = 1,
                           endpoint = getOption("SmarterScotland.endpoint")) {
  # FIXME: take fromoptions if missing
  check_mode <- getOption("SmarterScotland.endpoint_check")
  check_mode <- match.arg(arg = check_mode)

  # Read package option with endpoint URL
  endpoint_domain <- urltools::domain(endpoint)

  # Check if provided object is a string
  assertString(
    x = endpoint_domain,
    na.ok = FALSE,
    min.chars = 3,
    null.ok = FALSE
  )

  # Chek if url is accessible
  f_ping_fail <- function(timeout) {
    if (unlist(iptools::hostname_to_ip(endpoint_domain)) != "Not resolved") {
      ping_fail <- pingr::ping(
        destination = endpoint_domain,
        continuous = FALSE,
        verbose = FALSE,
        count = 1,
        timeout = timeout
      )
      return(is.na(ping_fail))
    } else {
      return(TRUE)
    }
  }

  switch(
    check_mode,
    warn = if (f_ping_fail(timeout)) {
      warning("Ping to ", endpoint_domain, " failed.")
      FALSE
    } else {
      TRUE
    },
    stop = if (f_ping_fail(timeout)) {
      stop("Ping to ", endpoint_domain, " failed.")
    } else {
      TRUE
    },
    ignore = return(TRUE)
  ) -> res

  return(invisible(res))

}