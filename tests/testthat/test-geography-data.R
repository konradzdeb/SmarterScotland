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

with_mock_api({
  options(SmarterScotland.suffix_rdf = FALSE)
  geo_dta_res <-
    get_geography_data(data_set = "alcohol-related-discharge",
                       geography = "East Lothian")
  expect_is(object = geo_dta_res, class = "data.frame")
  expect_length(object = geo_dta_res, n = 13)

})

# Test pre process function
with_mock_api({
  tst_proc_res <- get_geography_data(
    data_set = "recorded-crime",
    geography = "Glasgow City",
    measure = "count",
    pre_process_results = TRUE
  )
  expect_is(object = tst_proc_res, class = "data.frame")
  # Check that all columns are removed
  expect_null(object = Find(
    f = function(x) {
      any(x %in% c("uri", "literal", "Observation"))
    },
    x = tst_proc_res
  ))
})

without_internet({
  test_that(desc = "Errores on no net",
            code = expect_error(
              object =  get_geography_data(data_set = "alcohol-related-discharge",
                                           geography = "East Lothian")
            ))
})
