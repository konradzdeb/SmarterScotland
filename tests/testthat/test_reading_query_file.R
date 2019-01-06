context("Support Rcpp function reading query files")

test_that(
  "read_query_file function returns character vector",
  expect_is(object = read_query_file(query_file(
    "qry_get_topics.sparql"
  )),
  class = "character")
)

test_that(
  "Read query files have expected content",
  expect_match(object = read_query_file(
    query_file("qry_get_topics_regex.sparql")
  ),
  regexp = "FILTER")
)

if (requireNamespace("checkmate", quietly = TRUE)) {
  test_that(
    desc = "Read query files are of length 1 (one line)",
    code = checkmate::expect_scalar(
      x = read_query_file(query_file("qry_get_topics_regex.sparql")),
      na.ok = FALSE,
      null.ok = FALSE
    )
  )
}

test_that(desc = "Importedquery files has no line breaks",
          code = expect_true(!grepl(
            x = read_query_file(query_file("qry_get_topics_regex.sparql")),
            pattern = "\\n"
          )))