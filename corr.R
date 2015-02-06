corr<-function(directory, threshold=0){
    currentWd<-getwd()
    setwd(directory)
    extFilename<-".csv"
    id<-1:332
    SulNitCor<-numeric()
    for(i in id){
        if(i<10){
            filename<-paste(0, 0, i, extFilename, sep="")
        }
        else if(i<100){
            filename<-paste(0, i, extFilename, sep="")
        }
        else{
            filename<-paste(i, extFilename, sep="")
        }
        data<-read.csv(filename, sep=",")[, c("sulfate", "nitrate")]
        data <- data[!is.na(data[,1]) & !is.na(data[,2]),]
        if(nrow(data)>threshold){
            sulfate<-data[,1]
            nitrate<-data[,2]
            SulNitCor<-c(SulNitCor,  cor(sulfate, nitrate))
        }
    }
    setwd(currentWd)
    SulNitCor
}
