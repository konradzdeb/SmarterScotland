context("Getting available datasets")

with_mock_api({
  test_that(desc = "Obtains data frame",
            code = {
              dta_av_datasets <- get_available_datasets()
            })
})
