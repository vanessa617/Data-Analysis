#install.packages("RCurl")
#install.packages("sqldf")
#install.packages("jsonlite")
#install.packages("RJSONIO")

library(RCurl)
library(RJSONIO)
library(sqldf)
library(jsonlite)

link <- "http://data.maryland.gov/api/views/pdvh-tf2u/rows.json?accessType=DOWNLOAD"
document <- fromJSON(txt=link)
head(document)
str(document)
#
finalmatrix <- document$data #unfold list into matrix
str(finalmatrix)
myfinal <- data.frame(finalmatrix, stringsAsFactors = FALSE)
#
typeof(myfinal)
#
str(myfinal)
#document_df <-data.frame(document)
#document_df <-data.frame(matrix(unlist(document)))
#typeof(document_df)
document[1]
myfinal_clean <- myfinal[, c(9:26)]
head(myfinal_clean)                        
colnames(myfinal_clean) <- c("CASE_NUMBER","BARRACK","ACC_DATE","ACC_TIME","ACC_TIME_CODE","DAY_OF_WEEK","ROAD","INTERSECT_ROAD","DIST_FROM_INTERSECT","DIST_DIRECTION","CITY_NAME","COUNTY_CODE","COUNTY_NAME","VEHICLE_COUNT","PROP_DEST","INJURY","COLLISION_WITH_1","COLLISION_WITH_2")
head(myfinal_clean)

sqldf('select COUNT(DAY_OF_WEEK) from myfinal_clean WHERE DAY_OF_WEEK LIKE "SUNDAY%"')
head(myfinal_clean$INJURY)#return the first few rows to see what type of data is in that column

sqldf('SELECT COUNT(INJURY) FROM myfinal_clean WHERE INJURY = "YES"') #count all instances of "yes" in INJURY column 
sqldf('SELECT COUNT (INJURY), DAY_OF_WEEK FROM myfinal_clean WHERE INJURY = "YES" GROUP BY DAY_OF_WEEK') #checking for injury and count if "yes" then grouping by day of the week
tapply(myfinal_clean$DAY_OF_WEEK,myfinal_clean$DAY_OF_WEEK,length) #how many accidents on sunday
tapply(myfinal_clean$INJURY, myfinal_clean$INJURY, length)#how many injuries
tapply(myfinal_clean$INJURY, list(myfinal_clean$DAY_OF_WEEK, myfinal_clean$INJURY), length)#how many injuries, list by day
