context("Findging geography URI")

test_that(desc = "Passed URI returns self", code = {
  test_URIs <- c(
    "http://statistics.gov.scot/id/statistical-geography/S01011122",
    "http://statistics.gov.scot/id/statistical-geography/S13000442",
    "http://statistics.gov.scot/id/statistical-geography/s13002136",
    "https://statistics.gov.scot/id/statistical-geography/s19001473",
    "   http://statistics.gov.scot/id/statistical-geography/S01011122",
    "HTTP://STATISTICS.GOV.SCOT/ID/STATISTICAL-GEOGRAPHY/S01009180",
    "  HTTP://STATISTICS.GOV.SCOT/ID/STATISTICAL-GEOGRAPHY/S13000310"
  )
  cleaned_URIs <- c(
    "http://statistics.gov.scot/id/statistical-geography/S01011122",
    "http://statistics.gov.scot/id/statistical-geography/S13000442",
    "http://statistics.gov.scot/id/statistical-geography/S13002136",
    "https://statistics.gov.scot/id/statistical-geography/S19001473",
    "http://statistics.gov.scot/id/statistical-geography/S01009180",
    "http://statistics.gov.scot/id/statistical-geography/S13000310"
  )
  expect_equivalent(object = find_geography_URI(geography = test_URIs),
                    expected = cleaned_URIs[order(cleaned_URIs, na.last = NA)])
})

test_that(
  desc = "'Edinburgh' and 'Glasgow' strings matche unique URIs",
  code = expect_equal(
    object = find_geography_URI(
      geography = c("Edinburgh", "Glasgow"),
      database = "internal"
    ),
    expected = {
      res <- subset.data.frame(
        x = standard_geography_code_register,
        subset = value %in% c("Edinburgh", "Glasgow"),
        select = "geography",
        drop = TRUE
      )
      res[order(res, na.last = NA)]
    },
    check.attributes = FALSE
  )
)

test_that(
  desc = "Message for multiple URIs",
  code = expect_message(
    object = find_geography_URI(geography = "Edinburgh", database = "internal"),
    regexp = "Geography\\s'Edinburgh.*"
  )
)

with_mock_api({
  res_geo_search_scotstat <-
    find_geography_URI(geography = c("Edinburgh", "Glasgow"),
                       database = "online")
  expect_length(object = res_geo_search_scotstat,
                n = length(unique(res_geo_search_scotstat)))
  expect_named(object = res_geo_search_scotstat)
})

with_mock_api({
  res_geo_search_scotstat_both <-
    find_geography_URI(geography = c("Edinburgh", "Glasgow"),
                       database = "both")
  expect_length(object = res_geo_search_scotstat_both,
                n = length(unique(res_geo_search_scotstat_both)))
  expect_named(object = res_geo_search_scotstat_both)
})

without_internet({
  expect_error(object = find_geography_URI(
    geography = c("Edinburgh", "Glasgow"),
    database = "online"
  ))
})

with_mock_api({
  test_that(
    desc = "Message is returned",
    code =
      expect_message(
        object =     find_geography_URI(
          geography = c("Edinburgh", "Glasgow"),
          database = "both"
        ),
        regexp = "^Geography.*"
      )
  )
})
test_that(
  desc = "Errores on no Internet",
  code = expect_error(
    object = find_geography_URI(
      geography = c("Edinburgh", "Glasgow"),
      database = "wrong"
    ),
    regexp = "^\\'arg\\'\\sshould\\sbe.*"
  )
)
