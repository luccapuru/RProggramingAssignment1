pollutantmean <- function(directory, pollutant, id = 1:332){
      fullmonitor <- c()
      tamanho <- length(id)
      j <- 1:tamanho
      for (i in j){
      #for (i in id){
            if (id[i] > 99){
                  arquivo <- paste(directory, "\\", id[i], ".csv", sep = "")
            }
            else if(id[i] > 9){
                  arquivo <- paste(directory, "\\0", id[i], ".csv", sep = "")
                  }
            else {
                  arquivo <- paste(directory, "\\00", id[i], ".csv", sep = "")
                  }
            monitor <- read.csv(arquivo)
            fullmonitor <- c(fullmonitor, monitor[[pollutant]])
      }
     
      means <- mean(fullmonitor, na.rm = TRUE)
      means
}