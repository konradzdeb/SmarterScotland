README
================

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

# Installation

``` r
if (isFALSE("remotes" %in% rownames(installed.packages()))) {
  install.packages("remotes")
}
remotes::install_github(repo = "konradzdeb/SmarterScotland", build_vignettes = TRUE,
                        dependencies = TRUE)
```

# Example

``` r
library(SmarterScotland)
dta_Glasgow_Crime <- get_geography_data(data_set = "recorded-crime",
                                        geography = "Glasgow City",
                                        measure = "count",
                                        pre_process_results = TRUE)
```

``` r
knitr::kable(x = head(dta_Glasgow_Crime, n = 10))
```

| count | reference\_area | unit\_of\_measure           | reference\_period | measure\_type | crime\_or\_offence                        |
| :---- | :-------------- | :-------------------------- | :---------------- | :------------ | :---------------------------------------- |
| 90211 | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | all-crimes                                |
| 4110  | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | all-group-1-non-sexual-crimes-of-violence |
| 1755  | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | all-group-2-sexual-crimes                 |
| 57603 | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | all-group-3-crimes-of-dishonesty          |
| 14093 | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | \-vandalism-etc                           |
| 12650 | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | all-group-5-other-crimes                  |
| 24    | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | crimes-group-1-homicide-etc               |
| 1609  | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | crimes-group-1-att-murder-serious-assault |
| 2004  | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | crimes-group-1-robbery                    |
| 473   | S12000049       | crimes-or-offences-recorded | 1996-1997         | count         | crimes-group-1-other-violence             |

## Other similar projects

  - [SmarterPoland](https://cran.r-project.org/web/packages/SmarterPoland/index.html)
  - [Eurostat](https://cran.r-project.org/web/packages/eurostat/index.html)
