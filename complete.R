complete<-function(directory, id=1:332){
    currentWd<-getwd()
    setwd(directory)
    extFilename<-".csv"
    nobs=c()
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
        data<-data[!is.na(data[,1]) & !is.na(data[,2]),]
        nobs=c(nobs,nrow(data))
    }
    setwd(currentWd)
    data.frame(id=id, nobs=nobs)
}

