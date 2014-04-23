pollutantmean <- function(directory, pollutant, id = 1:332) {
        samples <- numeric()
        
        for (i in id) {
                sampleRead <- read.csv(paste(directory,"/",as.character(sprintf("%03d", i)),".csv", sep=""))
                sampleVector <- sampleRead[pollutant]
                sampleVectorNoNA <- sampleVector[!is.na(sampleVector)]
                samples <- c(samples,sampleVectorNoNA) 
        }
        
        mean(samples)
}
