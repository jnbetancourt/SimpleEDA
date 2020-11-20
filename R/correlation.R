#' Title
#'
#' @param data_frame 
#' @param first_column_name 
#' @param second_column_name 
#' @param boxcox 
#'
#' @return
#'
#' @examples
analyzeCorrelation <- function(data_frame, first_column_name, second_column_name, boxcox_transform = FALSE) {
  if (is_factor_column(data_frame, first_column_name)) {
    if (is_factor_column(data_frame, second_column_name)) {
      # Both columns are factor variables
      factorVarCorrelation(data_frame, first_column_name, second_column_name)
    } else {
      # First column is a factor variable, second column is a quantitative
      # variable
      factorVarQuantVarCorrelation(data_frame, 
                                   factor_column_name = first_column_name,
                                   quant_column_name = second_column_name)
    }
  } else {
    if (is_factor_column(data_frame, second_column_name)) {
      # First column is a quantitative variable, second column is a factor variable
      factorVarQuantVarCorrelation(data_frame, 
                                   factor_column_name = second_column_name,
                                   quant_column_name = first_column_name)
    } else {
      # Both columns are quantitative variables
      quantVarCorrelation(data_frame, first_column_name, second_column_name, boxcox_transform)
    }
  }
}