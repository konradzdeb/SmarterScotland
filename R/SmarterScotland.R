#' @title SmarterScotland: Accessing opendata.gov.scot
#'   \if{html}{\figure{logo.png}{options: alt="SmarterScotland logo" align="right"}}
#'   \if{latex}{\figure{logo.png}{options: right}}
#' @description SmarterScotland provides a suite of convenience functions
#'   facilitating sourcing data from the
#'   \href{http://statistics.gov.scot}{statistics.gov.scot} portal.
#'
#' @details For sample usage see \code{vignette("basic-usage", package = "SmarterScotland")}.
#'   For other usage, including charting and more advanced functionalities see
#'  \code{vignette("other-functions", package = "SmarterScotland")}.
#'
#' @author \itemize{
#' \item Maintainer/Author: Konrad Zdeb \email{konrad.zdeb@@me.com}
#' }
#'
#' @section Acknowledgements:
#' The following package is written in the open (both metaphorically and literally as I tend do undertake this development as a leisure reactivity while working on the Glasgow - Edinburgh commuter train), with big thanks to the whole Open Source community that contributed useful input through their questions, answers, discussions and comments via StackOverflow, GitHub and R-Help.
#'
#' @section Package options:
#' \describe{
#' \item{\code{SmarterScotland.endpoint}}{Defaults to
#'   \code{http://statistics.gov.scot/sparql}. If need can be changed by
#'   modyfying \code{options(SmarterScotland.endpoint = "new_value")}. It's
#'   highly unlikely that you will ever need to change this option.}
#'
#' \item{\code{SmarterScotland.response_check}}{Defaults to \code{warn}
#'   which results in warning if endpoint is not accessible. Other options are
#'   \code{stop} and \code{ignore} which respectively stop on errors or
#'   ignore checks.}
#'
#' \iten{\code{SmarterScotland.geography_match_msg}}{Shows geography URIs for
#'   which there is match in the stored data set.}
#' }
#'
#' @useDynLib SmarterScotland, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#' @importFrom checkmate assert_string test_character assertScalar assert_vector
#' @importFrom httr POST accept_json warn_for_status stop_for_status content
#' @importFrom stats var setNames
#' @importFrom glue glue
#' @importFrom gtools smartbind
"_PACKAGE"
