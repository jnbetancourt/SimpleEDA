#' Title
#'
#' @param data_frame 
#' @param factor_column_name 
#' @param quant_column_name 
#'
#' @return
#'
#' @examples
#' 
#'  The function is called with a data frame and the names of two columns one of 
#' which is a factor variable and the other of which is a continuous/quantiative 
#' variable in the data frame. This function then performs a correlation analysis 
#' of the two variables. 
factorVarQuantVarCorrelation <- function(data_frame, factor_column_name, quant_column_name) {
  #TODO: Conditional Density Plot (Robyn)
  #TODO: Box plots by factor column (Robyn)
  #TODO: Cohen's D Test (Robyn)
  #TODO: Shapiro-Wilk Test by factor column
  #TODO: Anova t-test(Justin.)
  anova(data_frame)
  #TODO: Kruskal-Wallis test
  
  # To access first column, instead of using "data_frame$first_column_name", use:
  # data_frame[, first_column_name]
}