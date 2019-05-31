context("Souring data per hierarchy")

test_that("Errors on non-character indicator", {
  expect_error(object = get_geography_data(indicator = 1),
               regexp = "Assertion\\son\\s\\'indicator\\'\\sfailed.*")
})

test_that("Errors on non-character indicator", {
  expect_error(object = get_geography_data(indicator = "JSA", hierarchy = NULL),
               regexp = "Assertion\\son\\s\\'hierarchy\\'\\sfailed.*")
})

test_that("Erros on missing argument", {
  expect_error(object = get_geography_data(),
               regexp = "argument\\s\"indicator\"\\sis\\smissing")
})