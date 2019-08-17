context("String manipulations")

test_that(desc = "Create basic URI",
          code = expect_identical(
            object = create_URI(x = c("www.abc.com", "http://www.abc.com")),
            expected = rep.int(x = "<http://www.abc.com>", times = 2)
          ))

test_that(desc = "URI handles no prefix",
          code = expect_identical(
            object = create_URI(x = rep.int(x = "www.def.com", times = 3)),
            expected = paste0("<http://", rep.int(x = "www.def.com", times = 3), ">")
          ))

test_that(desc = "URI handles existing prefix",
          code = expect_identical(
            object = create_URI(x = rep.int(x = "http://www.def.com", times = 3)),
            expected = paste0("<http://", rep.int(x = "www.def.com", times = 3), ">")
          ))

test_that(desc = "rdfs:label materialises",
          code = expect_identical(
            object = create_URI(
              x = c(
                "http://www.abc.com/refArea",
                "www.abc.com/unitMeasure",
                "http://www.abc.com/refPeriod"
              )
            ),
            expected = c(
              "<http://www.abc.com/refArea>/rdfs:label",
              "<http://www.abc.com/unitMeasure>/rdfs:label",
              "<http://www.abc.com/refPeriod>/rdfs:label"
            )
          ))