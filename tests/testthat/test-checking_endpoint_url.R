context("Test checking enpoint")

test_that("Errores on no-scalars", {
  expect_error(object = check_endpoint(
    endpoint = c("http://www.google.com/", "http://www.google.co.uk/"),
    stop_on_bad = TRUE
  ))
})
