context("Endpoint checking")

# Function retruns TRUE for a valid endpoint sourced from options
test_that(desc = "Returns true for valid URL", code = {
  expect_true(object = check_endpoint())
})

test_that(desc = "Returns warning for invalid URL.", code = {
  stub(check_endpoint, 'f_ping_fail', TRUE)
  # Warning is generated for an invalid URL
  expect_warning(object = check_endpoint(check_mode = "warn", endpoint = "invalid.address.jhhk"),
                 regexp = "^Ping.*failed\\.$")
  # False is returned for a check on wrong URL
  expect_false(object = suppressWarnings(check_endpoint(endpoint = "invalid.address.jhhk")))
  # TRUE is returned if forced to ignore
  expect_true(object = check_endpoint(check_mode = "ignore"))
})