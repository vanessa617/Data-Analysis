myCars <- mtcars
str(myCars)
maxIndexrd <- which.max(myCars$hp)
maxIndexrd
#Question 1- What is the highest hp? 
max(myCars$hp)
#Question 2 - Which car has the highest hp? 
row.names(myCars[maxIndexrd, ])
#Question 3 - What is the highest mpg? 
max(myCars$mpg)
#Question 4 - Which car has the highest mpg? 
maxIndexmpg <- which.max(myCars$mpg)
row.names(myCars[maxIndexmpg, ])
#Question 5 - Create a sorted dataframe, based on mpg 
mySortedmpgrd <- myCars[order(myCars$mpg), ]
mySortedmpgrd
#Which car has the “best” combination of mpg and hp
#Question 6 - What logic did you use?
myCars$Combohpmg <- myCars$hp / myCars$mpg
str(myCars)
#Question 7 - Which car? 
bestCombohpmg <- row.names(myCars[which.max(myCars$Combohpmg), ])
bestCombohpmg
#Question 8 - Which car has “best” car combination of mpg and hp, where mpg and hp must  be given equal weight? 
