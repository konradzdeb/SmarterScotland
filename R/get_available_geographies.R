#' @title Get Available Geographies
#'
#' @description The function sources available goegraphies from
#'   \emph{Standard Geography Code Register} so it cab be loaded in the package
#'   using \code{data(available_geographies)} command.
#'
#' @details For structure of the data look at
#'   \code{\link[SmarterScotland]{standard_geography_code_register}}.
#'
#' @return A data frame.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_available_geographies()
#' }
get_available_geographies <- function() {
  geography_code_register_nt <-
    tempfile(pattern = "standard_geo_code_register",
             fileext = ".nt")
  url_geography_code_register = paste(
    "https://statistics.gov.scot",
    "downloads",
    "graph?uri=http:/",
    "statistics.gov.scot",
    "graph",
    "standard-geography-code-register",
    sep = "/"
  )

  httr::GET(url = url_geography_code_register,
            config = httr::write_disk(geography_code_register_nt))

  rdf_standard_geo_code_register <-
    rdflib::rdf_parse(geography_code_register_nt, format = "ntriples")

  # Selected desired elemets
  queryString <-
    read_query_file(query_file("get_geography_register"))

  standard_geography_code_register <-
    rdflib::rdf_query(rdf = rdf_standard_geo_code_register,
                      query = queryString,
                      data.frame = TRUE)

  # Remove duplicated rows where official name and label point to one URI
  standard_geography_code_register <-
    standard_geography_code_register[!duplicated(standard_geography_code_register[, c("geography", "value")]), ]

  # Only keep geogrphies need for filter
  standard_geography_code_register <-
    standard_geography_code_register[grepl(
      pattern = paste("officialname", "label", "notation", sep = "|"),
      x = standard_geography_code_register$property,
      ignore.case = TRUE
    ), ]

  # Remove duplicates
  return(standard_geography_code_register)

}