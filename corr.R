corr <- function(directory, threshold = 0) {
        
        result <- c()
        
        for (i in 1:332) {
                sampleRead <- read.csv(paste(directory, '/',sprintf("%03d.csv", i), sep=""));
                sampleCleaned <- complete.cases(sampleRead);
                total_completes <- sum(sampleCleaned);
                
                if(total_completes > threshold){
                        sampleCleaned <- sampleRead[sampleCleaned,];
                        nitrate <- as.vector(sampleCleaned$nitrate);
                        sulfate <- as.vector(sampleCleaned$sulfate);
                        
                        result <- c(result, cor(nitrate, sulfate));
                }
        }
        result
}