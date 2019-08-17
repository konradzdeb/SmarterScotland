#' @title Construct SPARQL filter
#'
#' @description This query derives \code{SPARQL} filter statement using the
#'   \code{IN} syntax.
#'
#' @details For instance, arguments \code{sparql_variable = "time"} and
#'   \code{filter_values = c(2011, 2012)} will result in a expression
#'   \code{FILTER (?time IN ( "2011, 2012" ))}.
#'
#' @param sparql_variable A character scalar to be used in \code{IN} clause,
#'   without ?.
#' @param filter_values A vector of filter values to be verified against in the
#'   filter statement.
#' @param use_str A logical, defaults to \code{FALSE}, if \code{TRUE} it
#'   produces \code{str(?variable)} instead of \code{?variable}.
#'
#' @return A character scalar corresponding to SPARQL filter expression.
#'
#' @examples
#' # This function is not exported from the package as it's mostly used
#' # internally.
#' SmarterScotland:::construct_filter(sparql_variable = "time", filter_values = c(2011, 2012))
construct_filter <-
  function(sparql_variable, filter_values, use_str = FALSE) {
    # Check that passed sparql variable is a scalar
    assertScalar(x = sparql_variable)

    assert_vector(
      x = filter_values,
      strict = TRUE,
      min.len = 1,
      all.missing = FALSE
    )

    # Collapse vector elements
    collapsed_filter_values <- Reduce(
      f = function(x, y) {
        paste(x, y,  sep = ", ")
      },
      x = sapply(
        X = filter_values,
        FUN = function(x) {
          paste("'", x, "'", sep = "")
        }
      ),
      accumulate = FALSE,
    )

    # Create proper SPARQL variable
    sparql_variable_w_q <- paste("?", sparql_variable, sep = "")
    # Add str function if needed
    if (use_str) {
      sparql_variable_w_q <- paste0("str(", sparql_variable_w_q, ")")
    }

    # Create query statement
    filter_st <- glue(
      "FILTER ([sparql_variable_w_q] IN ([collapsed_filter_values]))",
      .open = "[",
      .close = "]"
    )

    # Return filter statement
    return(unclass(filter_st))

  }
