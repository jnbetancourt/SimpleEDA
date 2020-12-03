#' Title
#'
#' @param data_frame 
#' @param response_column_name 
#' @param predictor_column_names 
#'
#' @return
#' @export
#'
#' @examples
simpleEDA <- function(data_frame, response_column_name, predictor_column_names) {
  
  print('SimpleEDA')
  print(paste('Response:', response_column_name))
  print('Predictors:')
  print(predictor_column_names)
  
  # Get a new data frame that only has the response and predictor columns
  data <- data_frame[, c(response_column_name, predictor_column_names), 
                     drop=FALSE]
  
  # Univariate Analysis
  print("Univariate Analysis")
  
  ## Summary Statistics
  print("Response Variable:")
  summary_stats(data, response_column_name)
  univariate_plots(data, response_column_name)
  
  print("Predictor Variables:")
  for (predictor_column_name in predictor_column_names) {
    summary_stats(data, predictor_column_name)
    univariate_plots(data, predictor_column_name)
  }
  
  # Correlation Analysis
  
  print("Correlations Between Response and Predictors")
  for (predictor_column_name in predictor_column_names) {
    analyzeCorrelation(data, response_column_name, predictor_column_name, boxcox_transform = TRUE)
  }
  
  
  print("Correlations Between Predictors")
  for (i in 1:(length(predictor_column_names)-1)) {
    for (j in (i+1):length(predictor_column_names)) {
      analyzeCorrelation(data, predictor_column_names[i], predictor_column_names[j])
    }
  }
  
  
  # TODO: Compute correlation matrix and highlight any multicollinearity{Justin.}
  cor(data_frame)
  
  is_factor <- sapply(data, is.factor)
  quantitative_variables <- data[, !is_factor, drop=FALSE]
}






