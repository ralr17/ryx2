#' @title Calculate Correlations Between Selected Variable and Other Variables
#' @description Calculates the correlations between a selected numeric variable
#'  and other numeric variables in a dataset. Users can specify which numeric
#'  variables to include in the comparison. If no numeric variable is specified
#'  the function will compare the selected variable with all of the other variables
#'  in the data set. The function also evaluates the statistical significance of each correlation.
#' @param data A data frame containing the dataset to be analyzed.
#' @param y A character string specifying the variable (must be numeric) for correlation analysis.
#' @param x An optional character string specifying the variable that the user wants to compare variable y to.
#' If not provided, all numeric variables in the dataset except `y` will be used.
#' @returns The function returns an object of class `ryx`, which includes `y`,`x` ,
#' `df` which is a data frame with the variables of interest, `variable` is the column name of the variable,
#' `r` is the correlation coefficient, `p` is the p-value for the correlation test
#' and `sigif` is the significance level indicators.
#' @examples
#' # Example usage with the MASS package
#' library(MASS)
#' object <- ryx(Boston, y = "medv")
#'
#' # Example usage with the mtcars dataset
#' library(datasets)
#' object2 <- ryx(mtcars, y = "mpg")
#' @export
ryx <- function(data, y, x){
  if(missing(x)){
    x <- names(data)[sapply(data, class)=="numeric"]
    x <- setdiff(x, y)
  }
  df <- data.frame()
  for (var in x){
    res <- cor.test(data[[y]], data[[var]])
    df_temp <- data.frame(variable = var,
                          r = res$estimate,
                          p = res$p.value)
    df <- rbind(df, df_temp)
    df <- df[order(-abs(df$r)),]
  }

  df$sigif <- ifelse(df$p < .001, "***",
                     ifelse(df$p < .01, "**",
                            ifelse(df$p < .05, "*", " ")))
  results <- list(y=y, x=x, df=df)
  class(results) <- "ryx"
  return(results)
}
