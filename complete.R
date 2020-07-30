complete <- function (directory, id = 1:332) {
      results <- data.frame(matrix(ncol = 2, nrow = 0))
      names(results) <- c('id', 'nobs')
      tamanho <- length(id)
      j <- 1:tamanho
      count <- 0
      for (i in j) {
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
            k <- 1:nrow(monitor)
            for (l in k) {
                  if(!is.na(monitor[l,1]) & !is.na(monitor[l,2])){
                        count <- count + 1
                  }
            }
            results[i,1] <- id[i]
            results[i,2] <- count
            count <- 0
      }
      results
}