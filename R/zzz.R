.onAttach <- function(...) {
  packageStartupMessage("Loaded SmarterScotland version:",
                        utils::packageVersion("SmarterScotland"))
}

.onLoad <- function(libname, pkgname) {
  # Source:
  # https://github.com/tidyverse/dplyr/blob/a4980700383ada4e4f0eb39e501105d9e261ec0a/R/zzz.r
  op <- options()
  op.SmarterScotland <-
    list(SmarterScotland.endpoint = "http://statistics.gov.scot/sparql",
         SmarterScotland.response_check = "warn")
  toset <- !(names(op.SmarterScotland) %in% names(op))
  if (any(toset)) {
    options(op.SmarterScotland[toset])
  }
}

# Clean up C++ code
.onUnload <- function(libpath) {
  library.dynam.unload("SmarterScotland", libpath)
}