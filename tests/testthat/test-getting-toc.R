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
              expect_length(
                object = dta_toc,
                n = 4
              )
            })
})