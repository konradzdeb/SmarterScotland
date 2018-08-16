library(SmarterScotland)
context("SPARQL: getting spatial frameworks")

# Create temporary object for tests
tmpDta <- get_available_hierarchies()

test_that("Sourced hierarchies are a data frame",
          expect_is(object = tmpDta,
                    class = "data.frame"))

test_that("Sourced hierarchies are with some content",
          expect_gt(dim(tmpDta)[1], 3))

rm(tmpDta)