
## Overview

`"binomial"` is an implementation for for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.
Also there is plot and print implemented so the users can easily visualize the distribution.

  - `bin_choose()` calculates the number of combinations in which k successes can occur in n trials.
  - `bin_probability()` calculates the binomial probability
  - `bin_distribution()` calculates probability distribution
  - `plot()` method to plot binomial distribution or cumulation.
  - `bin_variable()` create a varible that has its own description and summary.

## Motivation

This package has been developed to create my first own R packages. Also it has been developed for any binomial calculation and distribution visualization.

## Usage

``` r
library(cointoss)

# binomial probability
bin_choose(5,0.5)
bin_probability(1, 5, 0.5)

# calculate binomial distribution and plot it
bin <- bin_distribution(5,0.5)
bin
plot(bin)

# calculate binomial probability's cumulation and plot it
bin1 <- bin_cumulative(5,0.5)
bin1
plot(bin1)

# create a variable, display its description and summary
var <- bin_variable(5,0.5)
var
varsum <- summary(var)
varsum

# there is also other fundamental functions available to use
bin_mean(10, 0.3)
bin_variance(10, 0.3)
bin_mode(10, 0.3)
bin_skewness(10, 0.3)
bin_kurtosis(10, 0.3)

```
