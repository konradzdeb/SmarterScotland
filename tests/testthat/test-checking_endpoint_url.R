context("Test checking enpoint")

test_that(desc = "Errores on no-scalars", code = {
  expect_error(object = check_endpoint(
    endpoint = c("http://www.google.com/", "http://www.google.co.uk/"),
    stop_on_bad = TRUE
  ))
})

test_that(desc = "Returns true for valid URL",
          code = {
            expect_true(object = check_endpoint(endpoint = "www.google.com"))
          })
