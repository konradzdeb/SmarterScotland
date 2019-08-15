#' @title Match Geography URI
#'
#' @description Matches passed string with URI available in
#'   the \emph{Standard Geography Code Register}.For URI's function returned
#'   passed values.
#'
#' @details The functionnn is mostly used internally to make useing
#'   \code{\link[SmarterScotland]{get_geography_data}} more user friendly. The
#'   function can be used in isolation to convenintely get URIs for the
#'   colloquial geography names.
#'
#' @param geography A character vector of geography names. URIs starting with
#'   \code{http} are returned as such without searching the data set.
#'
#' @param database Can be one of the following \emph{internal, scotstat, both.}
#'   Dafults to \emph{internal} that reflects an exteract of Standard Geography
#'   Code Register. Option \emph{scotstat} searches acroess the
#'   \url{https://statistics.gov.scot/}.
#'
#' @return A named character vector of unique geography URIs. For multiple
#'   matches names will be numbered - string \emph{'Edinburgh'} will
#'   match multiple geographies that will be naned
#'   \emph{'Edinburgh1', 'Edinburgh2', ...}
#'
#' @export
#'
#' @examples
#' find_geography_URI(geography = c("Edinburgh", "Glasgow"))
find_geography_URI <- function(geography, database = "internal") {
  # Determine search type
  chosen_search_type <-
    match.arg(arg = database,
              choices = c("internal", "scotstat", "both"))

  # Silence R CMD check warning
  # geography <- NULL
  value <- NULL
  f_internal_match <- function(x) {
    res_sbst <- subset.data.frame(x = standard_geography_code_register,
                                  subset = value == x,
                                  select = geography)
    unname(res_sbst)
  }

  f_scotstat_match <- function(x) {
    geo_name <- x
    qry_search_geo <-  read_query_file(query_file("qry_find_geography_URI"))
    qry_search_geo <- glue(qry_search_geo, .open = "[", .close = "]")
    response <- query_scotstat(qry_search_geo)
    results <- parse_response(response)
    setNames(object = results$geography.value,
             nm = make.names(results$value.value, unique = TRUE))
  }

  # Create search function
  f_search <- function(x, search_type = chosen_search_type) {
    # Remove extra spaces and bring to lower case firt part of the URL
    x <- sub(
      pattern = "(^h.*)(/S.*$)",
      replacement = "\\L\\1\\U\\2",
      x = trimws(x),
      perl = TRUE,
      ignore.case = TRUE
    )
    # Check if geography is an URI and return self if True
    if (grepl(pattern = "^http[s]?\\:",
              x = x,
              perl = TRUE)) {
      return(x)
    } else {
      res_search <- switch(
        search_type,
        internal = f_internal_match(x),
        scotstat = f_scotstat_match(x),
        both = c(f_internal_match(x),
                 f_scotstat_match(x))
      )
    }
    res_search
  }


  # Vectorise search
  res <- mapply(
    FUN = f_search,
    geography,
    MoreArgs = list(search_type =  chosen_search_type),
    SIMPLIFY = TRUE,
    USE.NAMES = TRUE
  )

  # Return values in order
  res <- unlist(x = res, use.names = TRUE)
  res <- res[!duplicated(res)]
  return(res[order(res, na.last = NA)])
}