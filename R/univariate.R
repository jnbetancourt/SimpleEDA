#' Title
#'
#' @param data_frame 
#' @param column_name 
#'
#' @return
#'
#' @examples
is_factor_column <- function(data_frame, column_name) {
  return(is.factor(data_frame[, column_name]))
}

#' Title
#'
#' @param data_frame 
#' @param column_name 
#'
#' @return
#'
#' @examples
#' This is an example of how to read the columns from a data frame when thte name 
#' of the column is stored as a variable.
summary_stats <- function(data_frame, column_name) {
  # For factor variables, print a table of counts and their percentages
  if (is_factor_column(data_frame, column_name)) {
    print(table(data_frame[, column_name], 
                dnn = paste('Frequency table: ', column_name)))
  } else {
    print(paste("Distribution of:", column_name))
    stats <- data.frame('min' = min(data_frame[, column_name]),
                        'median' = median(data_frame[, column_name]),
                        'mean' = mean(data_frame[, column_name]),
                        'max' = max(data_frame[, column_name]),
                        'sdev' = sd(data_frame[, column_name]))
    print(stats)
    
    #TODO: Shapiro-Wilk normality test (Jenn)
  }
}

#' Title
#'
#' @param data_frame 
#' @param column_name 
#'
#' @return
#'
#' @examples
#' This is an example of how to use ggplot when the column names are stored in variables
#' Note: If you call ggplot inside a function, you also need to call print to make 
#' it show up
univariate_plots <- function(data_frame, column_name) {
  # This is needed so that ggplot's aes() function can read the actual string
  # value stored in column_name
  column_name_sym <- sym(column_name)
  
  if (is_factor_column(data_frame, column_name)) {
    # Bar plots for factor vars
    print(ggplot2::ggplot(data = data_frame, aes_string(x = column_name)) + 
            ggplot2::geom_bar())
  } else {
    # If the quantitative distribution can easily be log-transformed, also
    # show the results of applying a log-transform
    
    # TODO: Use an auto-binning algorithm for the histogram breaks (Jenn)
    hist <- ggplot2::ggplot(data = data_frame, aes(x = !!column_name_sym)) +
      ggplot2::geom_histogram()
    box <- ggplot2::ggplot(data = data_frame, aes(y = !!column_name_sym)) +
      ggplot2::geom_boxplot()
    
    if (min(data_frame[, column_name]) > 1) {
      
      # TODO: Use an auto-binning algorithm for the histogram breaks (Jenn)
      hist_log <- ggplot2::ggplot(data = data_frame, aes(x = log(!!column_name_sym))) +
              ggplot2::geom_histogram()
      
      box_log <- ggplot2::ggplot(data = data_frame, aes(y = log(!!column_name_sym))) +
              ggplot2::geom_boxplot()
      
      gridExtra::grid.arrange(hist, hist_log, nrow = 1)
      gridExtra::grid.arrange(box, box_log, nrow = 1)
            
    } else if (min(data_frame[, column_name]) > 0) {
      # TODO: Use an auto-binning algorithm for the histogram breaks (Jenn)
      hist_log <- ggplot2::ggplot(data = data_frame, aes(x = log(1 + !!column_name_sym))) +
                          ggplot2::geom_histogram()
      
      box_log <- ggplot2::ggplot(data = data_frame, aes(y = log(1 + !!column_name_sym))) +
        ggplot2::geom_boxplot()
      
      gridExtra::grid.arrange(hist, hist_log, nrow = 1)
      gridExtra::grid.arrange(box, box_log, nrow = 1)
    } else {
      print(hist)
      print(box)
    }
  }
}
