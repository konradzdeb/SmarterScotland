context("Getting data properties")

with_mock_api({
  test_that(desc = "Obtaines data with properties",
            code = {
              life_expectancy_properties <-
                get_data_properties(data_set = "Life-Expectancy")
              expect_is(object = life_expectancy_properties, class = "data.frame")
              expect_length(object = life_expectancy_properties, n = 5)
              expect_named(
                object = life_expectancy_properties,
                expected = c(
                  "property.type",
                  "property.value",
                  "label.type",
                  "label.value",
                  "label.xml.lang"
                )
              )
            })
  test_that(desc = "Addittional properties are sourced",
            code = {
              life_expectancy_all_properties <-
                get_data_properties(data_set = "Life-Expectancy", property_values = TRUE)
              expect_is(object = life_expectancy_all_properties, class = "data.frame")
              expect_length(object = life_expectancy_all_properties, n = 8)
              expect_named(
                object = life_expectancy_all_properties,
                expected = c(
                  "property.type",
                  "property.value",
                  "label.type",
                  "label.value",
                  "value.xml.lang",
                  "value.type",
                  "value.value",
                  "label.xml.lang"
                )
              )
            })
})

without_internet({
  test_that(desc = "Errors on no connection",
            code = expect_error(get_data_properties(data_set = "Life-Expectancy")))
})