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

test_that(desc = "Column removal works",
          code = {
            tst_dta <-
              data.frame(
                uri_col = rep.int(x = "uri", times = 10),
                colB = 1:10,
                colC = 11:20
              )
            res_obj_cols <- pre_process_data(x = tst_dta,
                                        remove_cols = TRUE)
            expect_length(object = res_obj_cols, n = 2)
            expect_is(object = res_obj_cols, class = class(tst_dta))
          })