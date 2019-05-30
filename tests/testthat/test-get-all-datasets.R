context("Getting all datasets")

test_that("Sourcing data frame with all data", {
  dta_all_datasets <- get_available_datasets()
  expect_is(object = dta_all_datasets,
            class = "data.frame")
})

test_that(desc = "Getting only health-related datasets",
          code = expect_true(object = all(
            with(data = get_available_datasets(pattern = "health"), expr = {
              grepl(pattern = "health", x = dataset)
            })
          )))
