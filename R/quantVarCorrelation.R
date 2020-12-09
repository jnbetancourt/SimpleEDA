#' A function that analyzes the correlation between two quantitative variable columns
#'
#' @param data_frame The data frame to analyze
#' @param first_column_name The name of the first column to analyze
#' @param second_column_name The name of the second column to analyze
#' @param boxcox_transform - A TRUE/FALSE value indicating whether or not to perform a boxcox transformation
#'                 and generate a plot
#'
#' @return
#'
#' The function is called with a data frame and the names of two columns that are
#' continuous/quantitative variables in the data frame. This function then performs 
#' a correlation analysis of the two variables. It also takes an optional variable 
#' called 'boxcox_transform'. If the variable is true, then it applies a Box Cox 
#' transform where the first column is the response and the second column is the 
#' predictor.
quantVarCorrelation <- function(data_frame, first_column_name, second_column_name, boxcox_transform = FALSE) {
  #Pairwise Scatter with Lowess Smooths
  graphics::plot(data_frame[,second_column_name], data_frame[,first_column_name], xlab = second_column_name, ylab = first_column_name)
  graphics::lines(stats::lowess(data_frame[,second_column_name], data_frame[,first_column_name]), col="green") 
  
  # calculate correlation
  cat("Correlation:\n")
  cat(stats::cor(data_frame[,first_column_name],data_frame[,second_column_name]))
  
  if (boxcox_transform) {
    cat("\n\nBox-Cox Transform:\n")
    frm <<- stats::as.formula(paste0(first_column_name, "~", second_column_name))
    model <- stats::lm(formula = frm, data = data_frame)
    b <- MASS::boxcox(model, data = data_frame, xlab = paste0(second_column_name, expression(lambda)))
    rm(frm, envir = .GlobalEnv)
    cat('Maximum Likelihood Lambda: ')
    cat(b$x[which.max(b$y)])
    
  }
}