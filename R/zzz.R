.onAttach <- function(...) {
  packageStartupMessage("Loaded SmarterScotland version:",
                        utils::packageVersion("SmarterScotland"))
}

.onLoad <- function(libname, pkgname) {
  op <- options()
  op.SmarterScotland <-
    list(SmarterScotland.endpoint = "http://statistics.gov.scot/sparql",
         SmarterScotland.response_check = "warn",
         # TODO: display warning formultiple matches
         SmarterScotland.geography_match_msg = TRUE,
         # FIXME: rdfs suffixs should be used when possble
         SmarterScotland.suffix_rdf = FALSE
         )
  toset <- !(names(op.SmarterScotland) %in% names(op))
  if (any(toset)) {
    options(op.SmarterScotland[toset])
  }
  backports::import(pkgname, c("isFALSE"))
}

# Clean up C++ code
.onUnload <- function(libpath) {
  library.dynam.unload("SmarterScotland", libpath)
}
