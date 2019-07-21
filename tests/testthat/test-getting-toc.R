context("Getting ToC")

with_mock_api({
  test_that(desc = "Obtained data frame",
            code = {
              dta_toc <- get_ToC()
              expect_is(object = dta_toc,
                        class = "data.frame")

              expect_named(
                object = dta_toc,
                expected = c(
                  "dimension.type",
                  "dimension.value",
                  "theme.type",
                  "theme.value"
                )
              )
              expect_length(object = dta_toc,
                            n = 4)
              # Expect all subjects returned
              expect_false(object = all(apply(
                X = dta_toc,
                MARGIN = 1,
                FUN = function(res_row) {
                  any(grepl(pattern = "pupil", x = res_row))
                }
              )))
            })
  test_that(desc = "Obtains filtered data frame",
            code = {
              dta_toc_fltrd <- get_ToC(which = "pupil")
              expect_is(object = dta_toc_fltrd,
                        class = "data.frame")
              expect_named(
                object = dta_toc_fltrd,
                expected = c(
                  "dimension.type",
                  "dimension.value",
                  "theme.type",
                  "theme.value"
                )
              )
              expect_length(object = dta_toc_fltrd,
                            n = 4)
              # Expect only matching values are returned
              expect_true(object = all(apply(
                X = dta_toc_fltrd,
                MARGIN = 1,
                FUN = function(res_row) {
                  any(grepl(pattern = "pupil", x = res_row))
                }
              )))
            })
})

without_internet({
  test_that(desc = "Returns error for no Internet",
            code = expect_error(object = get_ToC()))
})