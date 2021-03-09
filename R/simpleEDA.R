#' A function that performs an EDA for a regression model over columns of a 
#' data frame
#'
#' @param data_frame The data frame to analyze
#' @param response_column_name The name of the response variable column
#' @param predictor_column_names The names of all predictor variable columns
#'
#' @return
#' @export
#'
simpleEDA <- function(data_frame, response_column_name, predictor_column_names) {
  
  cat("SimpleEDA\n")
  cat(paste('Response:', response_column_name, "\n"))
  cat('Predictors:\n')
  cat(predictor_column_names)
  cat("\n\n\n")
  
  # Get a new data frame that only has the response and predictor columns
  data <- data_frame[, c(response_column_name, predictor_column_names), 
                     drop=FALSE]
  
  # Univariate Analysis
  cat("Univariate Analysis\n\n")
  
  ## Summary Statistics
  cat("Response Variable:\n")
  summary_stats(data, response_column_name)
  univariate_plots(data, response_column_name)
  cat("\n")
  
  cat("Predictor Variables:\n")
  for (predictor_column_name in predictor_column_names) {
    summary_stats(data, predictor_column_name)
    univariate_plots(data, predictor_column_name)
  }
  cat("\n\n\n")
  
  # Correlation Analysis
  
  cat("Correlations Between Response and Predictors\n")
  for (predictor_column_name in predictor_column_names) {
    cat(paste("Relationship between", predictor_column_name, "and", response_column_name, "\n"))
    analyzeCorrelation(data, response_column_name, predictor_column_name, boxcox_transform = TRUE)
    cat("\n\n\n")
  }
  
  if (length(predictor_column_names) > 1) {
    cat("Correlations Between Predictors\n\n")
    for (i in 1:(length(predictor_column_names)-1)) {
      for (j in (i+1):length(predictor_column_names)) {
        cat(paste("Relationship between", predictor_column_names[i], "and", predictor_column_names[j], "\n"))
        analyzeCorrelation(data, predictor_column_names[i], predictor_column_names[j])
        cat("\n\n\n")
      }
    }
  }
 
  is_factor <- sapply(data, is.factor)
  quantitative_variables <- data[, !is_factor, drop=FALSE]
  
  if (length(colnames(quantitative_variables)) > 1) {
    # Correlation matrix for quantitative variables
    cat("Correlation Matrix for Quantitative Variables\n")
    cor_mat <- stats::cor(quantitative_variables, 
                          use = "pairwise.complete.obs")
    print(cor_mat)
  }
}






