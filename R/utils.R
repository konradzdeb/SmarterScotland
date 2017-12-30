#' @title Handy utility functions
#'
#' @description Small and handy utility functions usually not useful outside
#'   the package enviornment.
#'
#' @keywords internal
#' @name utility_functions
NULL

#' @describeIn utility_functions Wrapper for the \code{system.file} function
#'   passing path to a given query file and taking care of potentially missing
#'   extensions.
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
