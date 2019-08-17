#' @title Query File Utilities
#'
#' @description Utility functions to handle frequent string operations.
#'
#' @param x A character vector.
#'
#' @details The functions take character vector and are used to accomplish
#'   simple string operations, such as replacement of undesired characters
#'   or other simple transformations. The functions are not exported as it's
#'   unlikely that anyone would found them useful outside the package
#'   environment.
#'
#' @name string_utilities
NULL

#' @rdname string_utilities
#' @section make_SPARQL_variable_names: Wrapper for the
#'   \code{\link[base]{gsub}} function that replaces special characters with
#'   underscore. Collections of special characters are replaced with one
#'   underscore character.
make_SPARQL_variable_names <- function(x) {
  assert_character(x = x,
                   min.chars = 4,
                   all.missing = FALSE)
  x <- gsub(pattern = "[^[:alnum:]]|[[:digit:]]+",
            replacement = "_",
            x = tolower(x))

  x <- gsub(pattern = "_{2,}",
            replacement = "_",
            x = x)

  x <- sub(pattern = "^_",
           replacement = "",
           x = x)

  x <- make.names(names = x,
                  unique = TRUE,
                  allow_ = TRUE)

  x <- paste0("?", x)
  x
}

#' @rdname string_utilities
#' @section make_SPARQL_variable_names: Wrapper for the
#'   \code{\link[base]{gsub}} function that replaces special characters with
#'   underscore. Collections of special characters are replaced with one
#'   underscore character. By default, selected strings will be suffixed with
#'   \code{/rdfs:label}. This behaviour can be controlled via
#'   \code{SmarterScotland.suffix_rdf} option.
create_URI <- function(x) {

  assert_character(x = x,
                   min.chars = 4,
                   all.missing = FALSE)

  suffix_rdf <- getOption("SmarterScotland.suffix_rdf")

  x <- trimws(x = x)

  missing_prefix <-
    grep(
      pattern = "^http",
      x = x,
      ignore.case = TRUE,
      invert = TRUE
    )
  x[missing_prefix] <- paste0("http://", x[missing_prefix])
  x <- sub(
    pattern = "(^http.*)(/[a-zA-Z].*$)",
    replacement = "\\L\\1\\E\\2",
    x = trimws(x),
    perl = TRUE,
    ignore.case = TRUE
  )
  x <- paste0(intToUtf8(60), x, intToUtf8(62))
  if (suffix_rdf) {
    add_sufix <-
      grep(
        pattern = paste("refArea", "unitMeasure", "refPeriod", sep = "|"),
        x = x,
        ignore.case = TRUE
      )
    x[add_sufix] <- paste(x, "rdfs:label", sep = intToUtf8(47))
  }
  x
}