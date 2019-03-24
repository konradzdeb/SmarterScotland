#' @title Check SPARQL endpoint
#'
#' @description Function checks whether the provided endpoint is of online.
#'
#' @param endpoint A SPARQL enpoint as string.
#' @param check_mode For \code{stop, warn} or \code{ignore}, decides whether to
#'   stop, warn or do nothing in case of broken endpoint url. \code{ignore}
#'   option ignores checking.
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
check_endpoint <- function(check_mode = c("warn", "stop", "ignore"),
                           timeout = 1) {
  check_mode <- match.arg(check_mode)

  # Check if provided object is a string
  assertString(
    x = getOption("SmarterScotland.endpoint"),
    na.ok = FALSE,
    min.chars = 3,
    null.ok = FALSE
  )

  # Chek if url is accessible
  f_ping_fail <- function(timeout) {
    sink(tempfile())
    ping(
      destination = getOption("SmarterScotland.endpoint"),
      continuous = FALSE,
      verbose = FALSE,
      count = 1,
      timeout = timeout
    ) -> ping_fail
    sink()
    return(is.na(ping_fail))
  }

  switch(
    check_mode,
    warn = if (f_ping_fail(timeout)) {
      warning("Ping to ",
              getOption("SmarterScotland.endpoint"),
              " failed.")
      FALSE
    } else {
      TRUE
    },
    stop = if (f_ping_fail(timeout)) {
      stop("Ping to ",
           getOption("SmarterScotland.endpoint"),
           " failed.")
    } else {
      TRUE
    },
    ignore = return(TRUE)
  ) -> res

  return(invisible(res))

}