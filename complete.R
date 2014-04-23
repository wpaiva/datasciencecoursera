complete <- function(directory, id = 1:322) {
        samples <- data.frame()
        
        for (i in id) {
                sampleRead <- read.csv(paste(directory,"/",as.character(sprintf("%03d", i)),".csv", sep=""))
                sampleRead <- sampleRead[complete.cases(sampleRead),]
                sampleVector <- c(i, length(sampleRead[[1]]))
                samples <- rbind(samples, sampleVector)
        }
        
        colnames(samples) <- c("id", "nobs")
        samples
}