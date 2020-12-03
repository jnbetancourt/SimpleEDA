#' Title
#'
#' @param data_frame 
#' @param first_column_name 
#' @param second_column_name 
#' @param boxcox - A TRUE/FALSE value indicating whether or not to perform a boxcox transformation
#'                 and generate a plot
#'
#' @return
#'
#' @examples
#' The function is called with a data frame and the names of two columns that are
#' continuous/quantitative variables in the data frame. This function then performs 
#' a correlation analysis of the two variables. It also takes an optional variable 
#' called 'boxcox_transform'. If the variable is true, then it applies a Box Cox 
#' transform where the first column is the response and the second column is the 
#' predictor.
quantVarCorrelation <- function(data_frame, first_column_name, second_column_name, boxcox_transform = FALSE) {
  #TODO: Pairwise Scatter with Lowess Smooths (Robyn)
  #TODO: calculate correlation(Justin))
  cor(data_frame[,first_column_name],data_frame[,second_column_name])
  # To access first column, instead of using "data_frame$first_column_name", use:
  # data_frame[, first_column_name]
  
  if (boxcox_transform) {
    #TODO: Box-Cox transform (from MASS package) where the first column is the 
    #response and the second column is the predictor.
  }
}