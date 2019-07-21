context("API response parsing")

with_mock_api({
  test_that(desc = "Obtains data frame",
            code = {
              r <-
                query_scotstat(read_query_file(query_file("get_available_frameworks")))
              pr <- parse_response(r)
              expect_is(object = pr, class = "data.frame")
              expect_length(object = pr, n = 4)
              expect_named(object = pr)
            })
})
