#' @title Handy utility functions
#'
#' @description Small and handy utility functions usually not useful outside
#'   the package enviornment.
#'
#' @name utility_functions
NULL

#' @rdname utility_functions
#' @section query_file: Wrapper for the \code{system.file} function
#'   passing path to a given query file and taking care of potentially missing
#'   extensions.
#' @param query_file_name Name of query file
query_file <- function(query_file_name) {
  system.file("sparql",
              {
                # Check for extension and append if missing
                if (!grepl("\\.sparql$", x = query_file_name, ignore.case = TRUE)) {
                  paste0(query_file_name, ".sparql")
                } else {
                  query_file_name
                }
              },
              package = "SmarterScotland",
              mustWork = TRUE)
}
