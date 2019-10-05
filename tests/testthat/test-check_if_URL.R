context("Check if given string is an URL")

test_that(desc = "Returns correct values",
          code =  {
            test_string <- c("abc", "http://www.google.com", NA)
            expect_identical(object = is_URL(x = test_string),
                             expected = c(FALSE, TRUE))
            expect_identical(
              object = is_URL(x = test_string, narm = FALSE),
              expected = c(FALSE, TRUE, NA)
            )
            expect_identical(object = is_URL(x = "https://www.google.com"),
                             expected = TRUE)
            expect_identical(object = is_URL(x = c("https://www.google.com", NA)),
                             expected = TRUE)
          })
