README
================

# SmarterScotland <img src="man/figures/logo.png" align="right" />

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Build
Status](https://travis-ci.org/konradzdeb/SmarterScotland.svg?branch=master)](https://travis-ci.org/konradzdeb/SmarterScotland)
[![codecov](https://codecov.io/gh/konradzdeb/SmarterScotland/branch/master/graph/badge.svg)](https://codecov.io/gh/konradzdeb/SmarterScotland)
[![Build
status](https://ci.appveyor.com/api/projects/status/i3mfbvchkyah6gmf?svg=true)](https://ci.appveyor.com/project/konradedgar/smarterscotland-yhq6y)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)
[![develVersion](https://img.shields.io/badge/devel%20version-0.0.09-yellow.svg?style=flat)](https://github.com/konradzdeb/SmarterScotland)
[![CRAN
status](https://www.r-pkg.org/badges/version/SmarterScotland)](https://cran.r-project.org/package=SmarterScotland)

# Overview

The SmarterScotland package provides a convenient interface for sourcing
and interrogating data available through the
[statistics.gov.scot](http://statistics.gov.scot).

# Example

``` r
# Data
library(SmarterScotland)
# Visuals and data manipulation
suppressPackageStartupMessages(library(tidyverse))
# Data sourcing
dta_Glasgow_Crime <- get_geography_data(data_set = "recorded-crime",
                                        geography = "Glasgow City",
                                        measure = "count",
                                        pre_process_results = TRUE)
# Summary chart
dta_Glasgow_Crime %>% 
  filter(crime_or_offence == "all-crimes") %>%
  select(count, reference_period) %>% 
  arrange(desc(reference_period)) %>% 
  ggplot(aes(x = reference_period, y = count, group = 1)) +
  geom_line() +
  labs(x = "Reference Period",
       y = "Count",
       title = "Total Crime in Glasgow City") +
  scale_y_continuous(labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
  theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

![](man/figures/example_sourcing_and_chart-1.png)<!-- -->

# Installation

``` r
if (isFALSE("remotes" %in% rownames(installed.packages()))) {
  install.packages("remotes")
}
remotes::install_github(repo = "konradzdeb/SmarterScotland", build_vignettes = TRUE,
                        dependencies = TRUE)
```

# Similar projects

  - [SmarterPoland](https://cran.r-project.org/web/packages/SmarterPoland/index.html)
  - [Eurostat](https://cran.r-project.org/web/packages/eurostat/index.html)
