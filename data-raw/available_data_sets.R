library(SmarterScotland)
available_data_sets <- get_available_datasets()
usethis::use_data(available_data_sets, version = 2)
