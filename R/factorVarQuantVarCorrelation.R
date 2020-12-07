#' A function that analyzes the correlation between a factor variable column
#' and a quantitative variable column
#'
#' @param data_frame The data frame to analyze
#' @param factor_column_name The name of the factor variable column
#' @param quant_column_name The name of the quantitative variable column
#'
#' @return
#'
#' 
#'  The function is called with a data frame and the names of two columns one of 
#' which is a factor variable and the other of which is a continuous/quantiative 
#' variable in the data frame. This function then performs a correlation analysis 
#' of the two variables. 
factorVarQuantVarCorrelation <- function(data_frame, factor_column_name, quant_column_name) {
  
  # Create boxplots for each level of factor_column_name
  print(ggplot2::ggplot(data = data_frame, 
        ggplot2::aes_string(group = factor_column_name, x = factor_column_name, y = quant_column_name)) + 
        ggplot2::geom_boxplot())
  
  # create conditional density plot
  graphics::cdplot(data_frame[,factor_column_name]~data_frame[,quant_column_name], xlab = quant_column_name, ylab = factor_column_name)
  
  # compute Cohen's d
  if (nlevels(data_frame[,factor_column_name]) == 2){
    cohen <- effsize::cohen.d(data_frame[,quant_column_name], data_frame[,factor_column_name])
    print(cohen)
  }
  
  # Shapiro-Wilk normality test for each level of the factor variable
  n <- nlevels(factor(data_frame[,factor_column_name]))
  
  for (i in 1:n){
    s <- stats::shapiro.test((data_frame[,quant_column_name])[levels(data_frame[,factor_column_name]) == levels(data_frame[,factor_column_name])[i]])
    shapiro.statistic <- data.frame(W = s$statistic, pvalue = s$p.value)
    
    cat(paste0("Shapiro-Wilk Normality test for ", quant_column_name, " when ", factor_column_name, " = ", levels(data_frame[,factor_column_name])[i]), "\n")
    print(shapiro.statistic)
  }
  
  # ANOVA t-test
  cat("\nANOVA t-test\n")
  ttest <- stats::aov(stats::as.formula(paste(quant_column_name, "~", factor_column_name)), data = data_frame)
  print(summary(ttest))

  
  #Kruskal-Wallis test
  cat('\n')
  print(stats::kruskal.test(stats::as.formula(paste(quant_column_name, "~", factor_column_name)), data = data_frame))
  
}
