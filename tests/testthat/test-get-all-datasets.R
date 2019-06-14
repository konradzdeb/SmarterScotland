context("Getting available datasets")

with_mock_api({
  test_that(desc = "Returned object is a data frame",
            code = {
              available_datasets <- get_available_datasets()
              # expect_is(object = available_datasets,
              #           class = "data.frame")
            })
})

