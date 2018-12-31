.onAttach <- function(...) {
  packageStartupMessage("Loaded SmarterScotland version:",
                        utils::packageVersion("SmarterScotland"))
}