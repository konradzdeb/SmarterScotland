context("SPARQL: Getting ToC")

test_that("TOC is a data.frame",
          expect_is(object = get_ToC(),
                    class = "data.frame"))

test_that("The data frame has a sensible number of rows",
          expect_gt(object = nrow(get_ToC()),
                    expected = 10))

test_that("Returned data has expected values",
          expect_true(object = any(
            grepl(
              pattern = "pupil",
              x = get_ToC(which = "pupil")[, 1],
              ignore.case = TRUE
            )
          )))