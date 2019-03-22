context("Getting all datasets")

test_that("Sourcing data frame with all data", {
  dta_all_datasets <- get_available_datasets()
  expect_is(object = dta_all_datasets,
            class = "data.frame")
  # expect_gt(object = nrow(dta_all_datasets),
  #           expected = 3)
})
