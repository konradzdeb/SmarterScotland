context("Pre-processing SPARQL results data")

test_that(desc = "Errores on wrong object",
          code = {
            expect_error(object = pre_process_data(x = 1))
            expect_error(object = pre_process_data(x = data.frame()))
          })

test_that(desc = "URI strings are removed",
          code = {
            expect_false(object = any(
              grepl(pattern =  "http://purl.org/linked-data/cube",
                    x = pre_process_data(x = data.frame(
                      column_w_URIs = c(
                        "http://purl.org/linked-data/cube#Observation",
                        "http://purl.org/linked-data/cube#Observation",
                        "http://purl.org/linked-data/cube#Observation",
                        "http://purl.org/linked-data/cube#Observation"
                      )
                    )))
            ))
          })