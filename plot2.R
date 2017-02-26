plot2<-function(){
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
        
        with(result,plot(strptime(paste(Date,Time),"%d/%m/%Y %H:%M:%S"),Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

        dev.copy(png, file = "plot2.png")
        dev.off()
}
