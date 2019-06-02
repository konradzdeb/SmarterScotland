context("Querying Scotstat")

with_mock_api({
  test_that(desc = "Returns correct response",
            code = {
              r <- query_scotstat(query = "SELECT * { ?s ?p ?o } LIMIT 10")
              expect_is(object = r, class = "response")
              expect_equal(object = r$status_code, expected = 200)
            })
})

test_that(
  desc = "Error on wrong query",
  code =
    expect_condition(
      query_scotstat(query = "SELECTTTTT * { ?s ?p ?o } LIMIT 10"),
      regexp = "Bad\\s[rR]equest.*",
      class = "http_400"
    )
)

without_internet({
  test_that(
    desc = "Error on no connection",
    code = expect_error(
      object = query_scotstat(query = "SELECT * { ?s ?p ?o } LIMIT 10"),
      regexp = "POST\\shttp\\://.*"
    )
  )
})