
#' @export
simpleEDA <- function(data_frame, response_column_name, predictor_column_names) {
  
  print('SimpleEDA')
  print(paste('Response:', response_column_name))
  print('Predictors:')
  print(predictor_column_names)
  
  # Get the column indices for the predictor and response columns
  column_names <- names(data_frame)
  response_index <- match(response_column_name, column_names)
  predictor_indices <- match(predictor_column_names, column_names)
  
  data <- data_frame[, c(response_index, predictor_indices)]
  
  # Subset the predictor and response columns
  response <- data_frame[, c(response_index)]
  predictors <- data_frame[, predictor_indices]
  
  # Divide the predictor 
  is_factor <- sapply(predictors, is.factor)
  quantitative_predictors <- predictors[, !is_factor]
  factor_predictors <- predictors[, is_factor]
  
  
  # Univariate Analysis
  ## Summary Statistics
  ## Histograms for quantitative vars
  ### Show side by side with log-transforms
  ## Box plots for quantitative vars
  ## Bar plots for factor vars
  
  # Correlation Analysis
  ## Factor - Factor
  ### Contingency tables w/ Chi-Square and Fisher's Exact Test
  
  ## Factor -- Quantitative
  ### CD Plots
  ### Box plots by factor
  ### Cohen's D Test
  ### Anova t-test
  
  
  ## Quantitative -- Quantitative
  ### Full Correlation Matrix
  ### Pairwise Scatters with Lowess Smooths
  ### Box-Cox transforms for all vars vs predictor
}






