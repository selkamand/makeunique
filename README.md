
<!-- README.md is generated from README.Rmd. Please edit that file -->

# makeunique

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/makeunique)](https://CRAN.R-project.org/package=makeunique)
[![R-CMD-check](https://github.com/selkamand/makeunique/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/makeunique/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/selkamand/makeunique/branch/master/graph/badge.svg)](https://app.codecov.io/gh/selkamand/makeunique?branch=master)
<!-- badges: end -->

R package for making all elements of a vector unique. Differs from
‘make.unique’ by starting at 1 and allowing users to customise suffix
format.

## Installation

You can install the development version of makeunique like so:

``` r
# install.packages('remotes')
remotes::install_github('selkamand/makeunique')
```

## Usage

``` r
library(makeunique)

make_unique(c('Bob', 'Bob', 'Bob', 'Billy', 'Billy', 'Sven'))
#> [1] "Bob (1)"   "Bob (2)"   "Bob (3)"   "Billy (1)" "Billy (2)" "Sven"

make_unique(c('Bob', 'Bob', 'Bob', 'Billy', 'Billy', 'Sven'), sep = '-', wrap_in_brackets = FALSE)
#> [1] "Bob-1"   "Bob-2"   "Bob-3"   "Billy-1" "Billy-2" "Sven"
```
