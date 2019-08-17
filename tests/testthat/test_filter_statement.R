context("Filter statement development")

test_that(desc = "Errores on non-scalar variable",
          code = expect_error(object = construct_filter(
            sparql_variable = c("abc", "def"),
            filter_values = 1:10
          )))

test_that(desc = "Errores on NULLS",
          code = expect_error(object = construct_filter(
            sparql_variable = NULL,
            filter_values = NULL
          )))

test_that(
  desc = "Produces character vector",
  code = expect_vector(
    object = construct_filter(sparql_variable = "abc",
                              filter_values = 2001:2010),
    ptype = character(),
    size = 1
  )
)

test_that(
  desc = "Filter content is OK",
  code = expect_equal(
    object = construct_filter(sparql_variable = "time",
                              filter_values = 2001:2002),
    expected = "FILTER (?time IN ('2001', '2002'))"
  )
)

test_that(
  desc = "Filter content contains str",
  code = expect_equal(
    object = construct_filter(sparql_variable = "time",
                              filter_values = 2001:2002,
                              use_str = TRUE),
    expected = "FILTER (str(?time) IN ('2001', '2002'))"
  )
)