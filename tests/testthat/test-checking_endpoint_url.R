library(SmarterScotland)
context("Endpoint checking")

test_that(desc = "Returns true for valid URL",
          code = {
            op_end_old <- getOption("SmarterScotland.endpoint")
            options(SmarterScotland.endpoint = "http://statistics.gov.scot/sparql.csv")
            expect_true(object = check_endpoint())
            options(SmarterScotland.endpoint = op_end_old)
          })


test_that(desc = "Returns warning for invalid URL.",
          code = {
            op_end_old <- getOption("SmarterScotland.endpoint")
            options(SmarterScotland.endpoint = "http://statistics.invalid.com/url.to/sparql")
            expect_warning(object = check_endpoint(check_mode = "warn"),
                           regexp = "^Ping.*failed\\.$")
            options(SmarterScotland.endpoint = op_end_old)
          })

test_that(desc = "Returns false for invalid URLs",
          code = {
            op_end_old <- getOption("SmarterScotland.endpoint")
            options(SmarterScotland.endpoint = "http://statistics.invalid.com/url.to/sparql")
            expect_false(object =  check_endpoint())
            options(SmarterScotland.endpoint = op_end_old)
          })

test_that(desc = "Stops for invalid URLs",
          code = {
            op_end_old <- getOption("SmarterScotland.endpoint")
            options(SmarterScotland.endpoint = "http://statistics.invalid.com/url.to/sparql")
            expect_error(object = check_endpoint(check_mode = "stop"),
                         regexp = "^Ping.*failed\\.$")
            options(SmarterScotland.endpoint = op_end_old)
          })

test_that(desc = "Returns TRUE for ignore",
          code = {
            op_end_old <- getOption("SmarterScotland.endpoint")
            options(SmarterScotland.endpoint = "http://statistics.invalid.com/url.to/sparql")
            expect_true(object = check_endpoint(check_mode = "ignore"))
            options(SmarterScotland.endpoint = op_end_old)
          })


