corr <- function (directory, threshold = 0) {
      correlations <- c()
      complete_monitor <- complete("specdata", 1:332)
      #tamanho <- length(complete_monitor)
      j <- 1:332
      for (i in j){
            if (complete_monitor[i,2] > threshold){
                  if (complete_monitor[i,1] > 99){
                        arquivo <- paste(directory, "\\", complete_monitor[i,1], ".csv", sep = "")
                        #print(arquivo)
                  }
                  else if(complete_monitor[i,1] > 9){
                        arquivo <- paste(directory, "\\0", complete_monitor[i,1], ".csv", sep = "")
                        #print(arquivo)
                  }
                  else {
                        arquivo <- paste(directory, "\\00", complete_monitor[i,1], ".csv", sep = "")
                        #print(arquivo)
                  }
                  monitor <- read.csv(arquivo)
                  corr <- cor(monitor$nitrate, monitor$sulfate, use = "na.or.complete")
                  correlations <- c(correlations, corr)
            }
      }
      if(length(correlations) > 0){
            correlations
      }
      else {
            correlations <- numeric()
      }
}