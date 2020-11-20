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
quantVarCorrelation <- function(data_frame, first_column_name, second_column_name, boxcox_transform = FALSE) {
  #TODO: Pairwise Scatter with Lowess Smooths
  #TODO: calculate correlation
  
  # To access first column, instead of using "data_frame$first_column_name", use:
  # data_frame[, first_column_name]
  
  if (boxcox_transform) {
    #TODO: Box-Cox transform (from MASS package) for all vars vs predictor
  }
}