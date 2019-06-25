context("Getting spatial frameworks.")

with_mock_api({
  test_that(desc = "Return object is a data frame",
            code = {
              r_geo_hrh <- get_geography_hierarchies()
              expect_is(object = r_geo_hrh, class = "data.frame")
              expect_named(object = r_geo_hrh)
              expect_length(r_geo_hrh, 4)
            })
})

without_internet({
  test_that(
    desc = "Errors on no connection",
    code = expect_error(object = get_geography_hierarchies(),
                        regexp = "POST\\s.*")
  )
})