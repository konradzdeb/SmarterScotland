context("Sourcing data per hierarchy")

test_that(desc = "Errors on non-character data_set", {
  expect_error(object = get_geography_data(data_set = 1),
               regexp = "Assertion\\son\\s\\'data_set\\'\\sfailed.*")
})

test_that(desc = "Errors on non-character data_set", {
  expect_error(object = get_geography_data(data_set = "JSA", geography = NULL),
               regexp = "Assertion\\son\\s\\'geography\\'\\sfailed.*")
})

test_that("Erros on missing argument", {
  expect_error(object = get_geography_data(),
               regexp = "argument\\s\"data_set\"\\sis\\smissing")
})

# Write subsequnt tests for with mock
test_that(desc = "Not trying to run for more than one argument",
          code = {
            expect_error(get_geography_data(data_set = c("abc", "def")))
            expect_error(get_geography_data(data_set = "abc", geography = c("a", "b")))
          })

test_that
