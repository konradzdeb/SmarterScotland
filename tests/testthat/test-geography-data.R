context("Souring data per hierarchy")

test_that(desc = "Errors on non-character indicator", {
  expect_error(object = get_geography_data(indicator = 1),
               regexp = "Assertion\\son\\s\\'indicator\\'\\sfailed.*")
})

test_that(desc = "Errors on non-character indicator", {
  expect_error(object = get_geography_data(indicator = "JSA", geography = NULL),
               regexp = "Assertion\\son\\s\\'geography\\'\\sfailed.*")
})

test_that("Erros on missing argument", {
  expect_error(object = get_geography_data(),
               regexp = "argument\\s\"indicator\"\\sis\\smissing")
})

# Write subsequnt tests for with mock
test_that(desc = "Not trying to run for more than one argument",
          code = {
            expect_error(get_geography_data(indicator = c("abc", "def")))
            expect_error(get_geography_data(indicator = "abc", geography = c("a", "b")))
          })
