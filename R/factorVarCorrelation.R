#' A function that analyzes the correlation between two factor variable columns
#'
#' @param data_frame The data frame to analyze
#' @param first_column_name The name of the first column to analyze
#' @param second_column_name The name of the second column to analyze
#'
#' @return
#'
#' 
#' The function is called with a data frame and the names of two columns that are
#' factor variables in the data frame. This function then performs a correlation 
#' analysis of the two factor variables. 
#' 
factorVarCorrelation <- function(data_frame, first_column_name, second_column_name) {
  #TODO: Contingency tables w/ Chi-Square and Fisher's Exact Test
  
  # To access first column, instead of using "data_frame$first_column_name", use:
  # data_frame[, first_column_name]
  
}