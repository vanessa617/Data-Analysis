library(e1071)
library(moments)
#Create a function called printVecInfo that returns the mean, median, min, max, standard dev., quantile .05-.95, and the skewness of a vector.
#cat() - Outputs the objects, concatenating the representations
printVecInfo <- function(vec){
  cat("mean is:", mean(vec), "/n") 
  cat("median is:", median(vec), "/n") 
  cat("minimum value is:", min(vec), "/n") 
  cat("maximum value is:", max(vec), "/n") 
  cat("standard deviation is:", sd(vec), "/n")
  cat("quantile(0.05 - 0.95):", quantile(vec, probs = 0.05), "--", quantile(vec, probs = 0.95), "/n")
  cat("skewness is:", skewness(vec), "/n")
}
test_vec <- c(1,2,3,4,5,6,7,8,9,10,50)
printVecInfo(test_vec)
#print("quantile(0.05 - 0.95):")
#quantile(test_vec, probs = 0.05)
#quantile(test_vec, probs = 0.95)
#Q.4
redMarble <- rep("red", 50)#redMarble is a vector that has "red" in it 50 times
blueMarble <- rep("blue", 50)#blueMarble is a vector that has "blue" in it 50 times
jar <- c(redMarble, blueMarble) #put red and blue marbles in a variable "jar"
#Q.5 - Confirm how many reds are in jar
#grep(): searches for matches to argument w/in each element of a character vector
length(grep("red", jar))
#Q.6 Sample 10 marbles in jar, How many are red? What is the percentage of reds?
jarSample <- sample(jar, size = 10, replace = TRUE)#pull 10 marbles from jar, replace = T makes sure no element occurs twice.
numRed <- length(grep("red", jarSample)) #stores the count of red in jarSample in a variable
percentRed <- numRed/length(jarSample) #divide the amount of reds in sample by the sample population
numRed
percentRed
#Q.7 - Sample 10 marbles twenty times, return the mean of reds in each of the 20 sample, run printVecInfo function on the samples and generate histogram
sampleTwenty <- replicate(20, mean(replicate(20, length(grep("red", sample(jar, size = 10, replace = TRUE))))))
printVecInfo(sampleTwenty)#run the function on sampleTwenty
hist(sampleTwenty)
#Q.8 - Law of large numbers, central limit theorem
sampleTwenty100 <- replicate(20, mean(replicate(100, length(grep("red", sample(jar, size = 100, replace = TRUE))))))
printVecInfo(sampleTwenty100)
hist(sampleTwenty100)
#Q.9 sampling 100 samples 100 times
sampleHundred <- replicate(100, mean(replicate(100, length(grep("red", sample(jar, size = 100, replace = TRUE))))))
printVecInfo(sampleHundred)
hist(sampleHundred)
myAir <- airquality #storing airquality dataset in a variable
#clean the data
any(is.na(myAir))#return boolean checking for na's "is there any na's?"
length(myAir[myAir == 'NA'])#how many "NA" are in the myAir dataset
str(myAir) #return the structure of the dataset
myAir <- na.omit(myAir)#removes row with NA present
str(myAir)#view the change in observations
printVecInfo(myAir$Ozone)
printVecInfo(myAir$Wind)
printVecInfo(myAir$Temp)
