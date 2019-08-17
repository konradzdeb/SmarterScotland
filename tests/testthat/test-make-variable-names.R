context("String manipulations")

test_that(desc = "Messy strings are cleaned",
          code = {
            test_str <- c(
              "Some^&%...Name",
              "   some other name",
              "1123_odd_name",
              "a*(____another",
              "another___name"
            )
            clean_str <- c("?some_name",
                           "?some_other_name",
                           "?odd_name",
                           "?a_another",
                           "?another_name")
            expect_identical(object = make_SPARQL_variable_names(test_str),
                             expected = clean_str)
          })

test_that(desc = "There are no duplictes",
          code = {
            tst_str <- c("var_name", "var_name", "some!!var", "some!!var")
            var_nms <- make_SPARQL_variable_names(x = tst_str)
            expect_false(any(duplicated(var_nms)))
          })
