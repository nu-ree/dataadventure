# Multiple Linear Regression
# Summarized after studying:
#     "Advanced R Programming" Week9 Lecture from POSTECH MOOC

# Step 0: Read autompg data
car<-read.csv("autompg.csv")
head(car)
str(car)
summary(car)
attach(car)




# Step 1: Explanatory Data Analysis - Draw pariwise plot
var1<-c("mpg","disp","hp","wt", "accler")
pairs(car[var1], main ="Autompg", cex=1, col=car$cyl)
# colored points by a categorical variable(cyl)
# looks like disp & wt have strong positive correlation
# looks like mpg & hp has two clusters

summary(lm(hp~mpg)) # coefficient is positive
plot(hp, mpg) 
# however, seems like it could be seperated into two groups(hp>=50 and hp<50)

car_sub1<-subset(car, hp>=50)
plot(car_sub1$hp, car_sub1$mpg, main="hp>=50")
summary(lm(car_sub1$hp~car_sub1$mpg)) # coefficient is negative

car_sub2<-subset(car, hp<50)
plot(car_sub2$hp, car_sub2$mpg, main="hp<50")
summary(lm(car_sub2$hp~car_sub2$mpg)) # coefficient is negative




# Step 2: Model development - Multiple Linear Regression(MLR)
# 1st Full Model 
r1<-lm(mpg ~ disp+hp+wt+accler, data=car)
summary(r1)

# 2nd Model: Using variable selection method
# Stepwise Selection
step(r1, direction="both") 
#step(r1, direction="backward")
#step(r1, direction="forward")
# recommand to drop hp. 

# Final Model
r2<-lm(mpg ~ disp+wt+accler, data=car)
summary(r2)




# Check point 1: coefficient & R-squared
summary(r2)

# Check point 2: multicollinearity 
cor(car[var1]) # check correlation 
# correlation between hisp and wt is 0.933. 
# variance inflation factor(VIF)
install.packages("car")
library(car)
vif(lm(mpg ~ disp+hp+wt+accler, data=car))
# VIF<10 is acceptable
# VIF of disp and wt are both less than 10


# Check point 3: residual plot
# Check point 4: outlier or suspicious trend
layout(matrix(c(1,2,3,4),2,2))  
plot(r2)


