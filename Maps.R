packages = c("maps", "zipcode", "mapproj", "ggmap", "ggplot2", "gdata", "sqldf") #packages of interest
package.check <- lapply(packages, FUN = function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
})
search()
setwd("/Users/Vanessa/Documents")#point to the exact PATH
mydata <- read.csv("Median.csv")#read in csv file
str(mydata)#get the structure of the date (i.e. # of obs = rows, and variables=cols)
colnames(mydata) <- c("Zip", "Median", "Mean", "Population")#rename the columns
head(mydata)
mydata <- mydata[-1,] #delete the first row
head(mydata)
#gsub function replaces matches determined by reg. expression matching
mydata$Median <- gsub(",", "", mydata$Median) #replaces the comma with nothing in referenced col.
head(mydata)
mydata$Mean <- gsub(",", "", mydata$Mean)#replaces the comma with nothing in referenced col.
head(mydata)
mydata$Population <- gsub(",", "", mydata$Population)#replaces the comma with nothing in referenced col.
data("zipcode")
head(zipcode)
mydata$Zip <- clean.zipcodes(mydata$Zip)#cleans zipcodes
zipcode[1,]
mydata$Zip[2]
#install.packages("zipcode")
#library(zipcode)
data("zipcode")
mydata$Zip <- clean.zipcodes(mydata$Zip)#cleans zipcodes
zipcode[1,]
head(mydata)
head(zipcode)
colnames(mydata) <- c("zip", "Median", "Mean", "Population")#rename the columns
head(mydata)
dfNew <- merge(mydata,zipcode, by="zip")#create a new df w/ merge mydata df and zipcode match/merge by zip col.
str(dfNew)
dfSub <- sqldf('select * from dfNew where state not in ("NY", "AK")')
str(dfSub)
sqldf('select * from dfSub where state in ("NY", "AK")')
#subset(dfNew, state != "HI" & "AK")
#str(dfNew)
#df_new
