#' A function that determines whether or not a column in a data frame is a
#' factor variable
#'
#' @param data_frame The data frame
#' @param column_name The name of a column in the data frame
#'
#' @return TRUE/FALE
#'
is_factor_column <- function(data_frame, column_name) {
  return(is.factor(data_frame[, column_name]))
}

#' Performs univariate analysis of a single column in a data frame
#'
#' @param data_frame The data frame to analyze
#' @param column_name The name of the column in the data frame
#'
#' @return
#'
#' This is an example of how to read the columns from a data frame when the name 
#' of the column is stored as a variable.
summary_stats <- function(data_frame, column_name) {
  # For factor variables, print a table of counts and their percentages
  if (is_factor_column(data_frame, column_name)) {
    print(table(data_frame[, column_name], 
                dnn = paste('Frequency table: ', column_name)))
  } else {
    cat(paste("Distribution of:", column_name, '\n'))
    stats <- data.frame('min' = min(data_frame[, column_name], na.rm = T),
                        'median' = stats::median(data_frame[, column_name], na.rm = T),
                        'mean' = mean(data_frame[, column_name], na.rm = T),
                        'max' = max(data_frame[, column_name], na.rm = T),
                        'sdev' = stats::sd(data_frame[, column_name], na.rm = T))
    print(stats)
    cat('\n')
    # Shapiro Wilk Normality Test (only apply to sample sizes below 5000)
    if ((dim(data_frame)[1]) < 5000) {
      s <- stats::shapiro.test(data_frame[, column_name])
      shapiro.statistic <- data.frame(W = s$statistic, pvalue = s$p.value)
    
      cat(paste0("Shapiro-Wilk Normality test for ", column_name, "\n"))
      print(shapiro.statistic)
    }
  }
}

#' A function that generates a set of distribution plots for a single column in 
#' a data frame
#'
#' @param data_frame The data frame to analyze
#' @param column_name The name of the column to generate plots for
#'
#' @return
#'
#' This is an example of how to use ggplot when the column names are stored in variables
#' Note: If you call ggplot inside a function, you also need to call print to make 
#' it show up
univariate_plots <- function(data_frame, column_name) {
  # This is needed so that ggplot's aes() function can read the actual string
  # value stored in column_name
  column_name_sym <- rlang::sym(column_name)
  
  coldata <- na.omit(data_frame[, column_name])
  
  if (is_factor_column(data_frame, column_name)) {
    # Bar plots for factor vars
    print(ggplot2::ggplot(data = data_frame, ggplot2::aes_string(x = column_name)) + 
            ggplot2::geom_bar())
  } else {
    # If the quantitative distribution can easily be log-transformed, also
    # show the results of applying a log-transform
    
    hist <- ggplot2::ggplot(data = data_frame, ggplot2::aes(x = !!column_name_sym)) +
      ggplot2::geom_histogram(bins = numbins(coldata))
    box <- ggplot2::ggplot(data = data_frame, ggplot2::aes(y = !!column_name_sym)) +
      ggplot2::geom_boxplot()
    
    if (min(coldata) > 0) {
      
      hist_log <- ggplot2::ggplot(data = data_frame, ggplot2::aes(x = log(!!column_name_sym))) +
              ggplot2::geom_histogram(bins = numbins(log(coldata)))
      
      box_log <- ggplot2::ggplot(data = data_frame, ggplot2::aes(y = log(!!column_name_sym))) +
              ggplot2::geom_boxplot()
      
      gridExtra::grid.arrange(hist, hist_log, nrow = 1)
      gridExtra::grid.arrange(box, box_log, nrow = 1)
            
    } else if (min(coldata) > -1) {
      hist_log <- ggplot2::ggplot(data = data_frame, ggplot2::aes(x = log(1 + !!column_name_sym))) +
                          ggplot2::geom_histogram(bins = numbins(log(1 + coldata)))
      
      box_log <- ggplot2::ggplot(data = data_frame, ggplot2::aes(y = log(1 + !!column_name_sym))) +
        ggplot2::geom_boxplot()
      
      gridExtra::grid.arrange(hist, hist_log, nrow = 1)
      gridExtra::grid.arrange(box, box_log, nrow = 1)
    } else {
      print(hist)
      print(box)
    }
  }
}


#' Generates the number of bins to use for a histogram
#'
#' @param x A vector of data points
#'
#' @return
numbins <- function(x) {
  grDevices::nclass.FD(x)
} 
