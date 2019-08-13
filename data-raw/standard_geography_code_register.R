library(SmarterScotland)
standard_geography_code_register <- get_available_geographies()
usethis::use_data(standard_geography_code_register,
                  version = 2,
                  overwrite = TRUE)