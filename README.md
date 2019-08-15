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

## Overview

The SmarterScotland package provides a convenient interface for sourcing
and interrogating data available through the
[statistics.gov.scot](http://statistics.gov.scot).

## Installation

``` r
if ("devtools" %in% rownames(installed.packages())) {
  devtools::install_github(repo = "konradedgar/SmarterScotland", build_vignettes = TRUE)
} else {
  install.packages("devtools")
  devtools::install_github(repo ="konradedgar/SmarterScotland", build_vignettes = TRUE)
}
```

## Other projects

  - [SmarterPoland](https://cran.r-project.org/web/packages/SmarterPoland/index.html)
  - [eurostat](https://cran.r-project.org/web/packages/eurostat/index.html)
