context("Support Rcpp function reading query files")

test_that(
  "read_query_file returns character vector",
  expect_is(object = read_query_file(query_file(
    "qry_get_topics.sparql"
  )),
  class = "character")
)

test_that(
  "read_query_file vector has right content",
  expect_match(object = read_query_file(
    query_file("qry_get_topics_regex.sparql")
  ),
  regexp = "FILTER")
)


test_that(
  desc = "read_query_file are of length 1 (one line)",
  code = checkmate::expect_scalar(
    x = read_query_file(query_file("qry_get_topics_regex.sparql")),
    na.ok = FALSE,
    null.ok = FALSE,
    info = "Read query is not scalar"
  )
)

test_that(desc = "Importedquery files has no line breaks",
          code = expect_true(!grepl(
            x = read_query_file(query_file("qry_get_topics_regex.sparql")),
            pattern = "\\n"
          )))