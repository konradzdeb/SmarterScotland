context("Cpp for reading queries")

test_that(desc = "Returns character vector",
          code = expect_is(object = read_query_file(query_file(
            "qry_get_topics.sparql"
          )),
          class = "character"))

test_that(desc = "Has right content",
          code = expect_match(object = read_query_file(
            query_file("qry_get_topics_regex.sparql")
          ), regexp = "FILTER"))


test_that(desc = "Queries are of length 1",
          code = expect_length(object = read_query_file(
            query_file("qry_get_topics_regex.sparql")
          ), n = 1))

test_that(desc = "Query string files has no line breaks",
          code = expect_true(!grepl(
            x = read_query_file(query_file("qry_get_topics_regex.sparql")),
            pattern = "\\n"
          )))

test_that(desc = "Query does not start with '#'",
          code = expect_false(object = grepl(
            pattern = "^#|^\\s+#",
            x = read_query_file(query_file("get_available_frameworks")),
            fixed = FALSE
          )))

test_that(desc = "No starting from space",
          code = expect_false(object = grepl(
            pattern = "^\\s+",
            x = read_query_file(query_file("get_available_frameworks"))
          )))

test_that(desc = "Does not end with space",
          code = expect_false(object = grepl(
            pattern = "\\s+&",
            x = read_query_file(query_file("get_available_frameworks"))
          )))