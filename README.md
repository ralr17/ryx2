
# ryx

<!-- badges: start -->
<!-- badges: end -->

The goal of correlationryx is to provide tools for exploring and analyzing the correlations between
    a selected variable and other numeric variables in a dataset. Users can choose specific numeric
    variables to include in the comparison. If none are specified, the selected variable will be
    compared to all other numeric variables in the dataset, excluding itself. The plot function
    generates visualizations to clearly represent these correlations, highlighting their direction
    and magnitude. The summary function returns a comprehensive summary, including the variables
    being compared, the median absolute correlation, the range of correlation values, and the count
    of variables that are statistically significant at below the 0.05 level. Additionally, the print
    function outputs the correlation values between the selected variable and the other variables in
    the dataset for easy review.
    

## Installation

You can install the development version of correlationryx like so:

``` r
# install.packages("remotes")
remotes::install_github("https://github.com/ralr17/Assignment4.git")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(correlationryx)
## basic example code
library(MASS)
object <- ryx(Boston, y = "medv")
summary(object)
print(object)
plot(object)

```

