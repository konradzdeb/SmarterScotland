.onAttach <- function(...) {
  packageStartupMessage("Loaded SmarterScotland version:",
                        utils::packageVersion("SmarterScotland"))
}

# Clean up C++ code
.onUnload <- function(libpath) {
  library.dynam.unload("SmarterScotland", libpath)
}