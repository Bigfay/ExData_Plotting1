plot3<-function(){
#open file in chunks of 10.000 lines
         result<-data.frame()
        j=0
        for (i in 1:208){
                temp<-read.table("household_power_consumption.txt",nrows = 10000,skip=1+j*10000,sep=";",dec=".")
                temp<-temp[temp$V1=="1/2/2007"|temp$V1=="2/2/2007",]
                result<-rbind(result,temp)
                j=i
        }
        #get the columns names
        temp<-read.table("household_power_consumption.txt",header=TRUE,nrows = 1,sep=";",dec=".")
        names(result)=names(temp)
        
        with(result,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
        with(result,points(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Sub_metering_2,type="l",col="red",ylab="Energy sub metering"))
        with(result,points(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Sub_metering_3,type="l",col="blue",ylab="Energy sub metering"))
        legend("topright", lty=c(1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
        
        dev.copy(png, file = "plot3.png")
        dev.off()
}
