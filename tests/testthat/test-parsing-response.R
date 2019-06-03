context("API response parsing")

with_mock_api({
  test_that(desc = "Obtains data frame",
            code = {
              r <- query_scotstat(read_query_file(query_file("get_available_frameworks")))
              pr <- parse_response(r)
              expect_is(object = pr, class = "data.frame")
              expect_length(object = pr, n = 4)
              expect_named(object = pr)
            })
  test_that(desc = "Failed object returns warning",
            code = {
              r <- query_scotstat(query = "SELECT * { ?s ?p ?o } LIMIT 10")
              expect_warning(object = parse_response(r),
                             regexp = "Filed to create a data frame. Returning parsed response content")
            })
})
