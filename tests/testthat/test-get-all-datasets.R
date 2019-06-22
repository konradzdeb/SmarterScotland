context("Getting available datasets")

with_mock_api({
  test_that(desc = "Obtains data frame",
            code = {
              dta_av_datasets <- get_available_datasets()
              expect_is(object = dta_av_datasets, class = "data.frame")
              expect_length(object = dta_av_datasets, n = 3)
              expect_named(
                object = dta_av_datasets,
                expected = c("dataset.type", "dataset.value", "subject")
              )
              # Expect all subjects (not filtered)
              expect_false(object = all(grepl(
                pattern = "life",
                dta_av_datasets$subject
              )))
            })
  test_that(desc = "Obtaines filtered data frame",
            code = {
              dta_av_datasets_fltrd <- get_available_datasets(pattern = "life")
              expect_is(object = dta_av_datasets_fltrd, class = "data.frame")
              expect_length(object = dta_av_datasets_fltrd, n = 3)
              expect_named(
                object = dta_av_datasets_fltrd,
                expected = c("dataset.type", "dataset.value", "subject")
              )
              # Expect subjects with 'life' keyword
              expect_true(object = all(grepl(
                pattern = "life",
                dta_av_datasets_fltrd$subject
              )))
            })
})
