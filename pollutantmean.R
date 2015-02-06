pollutantmean<-function(directory, pollutant, id=1:332){
    currentWd<-getwd()
    setwd(directory)
    extFilename<-".csv"
    sum<-0
    num<-0
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
        data<-read.csv(filename, sep=",")[, pollutant]
        data<-data[!is.na(data)]
        sum<-sum+sum(data)
        num<-num+length(data)
    }
    setwd(currentWd)
    sum/num
}
