README
================

***The package is in an early development stage and was posted to
facilitate collaboration.***

[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![Build
Status](https://travis-ci.org/konradzdeb/SmarterScotland.svg?branch=master)](https://travis-ci.org/konradzdeb/SmarterScotland)
[![codecov](https://codecov.io/gh/konradzdeb/SmarterScotland/branch/master/graph/badge.svg)](https://codecov.io/gh/konradzdeb/SmarterScotland)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/konradzdeb/SmarterScotland?branch=master&svg=true)](https://ci.appveyor.com/project/konradzdeb/SmarterScotland)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
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

For better and more mature, similar projects have a look at:

  - [SmarterPoland](https://cran.r-project.org/web/packages/SmarterPoland/index.html)
  - [eurostat](https://cran.r-project.org/web/packages/eurostat/index.html)
