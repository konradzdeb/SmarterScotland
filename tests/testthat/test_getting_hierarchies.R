context("Test getting spatial hierarchies.")

test_that("Sourced hierarchies are a data frame",
          expect_is(object = get_available_hierarchies(),
                    class = "data.frame"))