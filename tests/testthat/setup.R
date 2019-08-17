# Setup package options
# https://www.tidyverse.org/articles/2017/12/testthat-2-0-0/

# Get old options
op_old <- options()

# Restore previous options
teardown({
  options(op_old)
})