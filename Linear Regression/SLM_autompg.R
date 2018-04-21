# Simple Linear Regression with autompg data
#
# Summarized after studying:
#     Book "따라하며 배워는 데이터 과학" p. 143 ~ 153
#
# Data: autompg.csv

# Step 0: Read autompg data
car<-read.csv("autompg.csv")
head(car)
str(car)
summary(car)
attach(car)


# Step 1: Explanatory Data Analysis
## Check Scatter Plot
ggplot(mpg, aes(cty,hwy))+ geom_jitter() + geom_smooth(mothod="lm")

# Check Correlation Coefficient
# always check statistics and visual together!

cor(mpg$cty, mpg$hwy)
with(mpg, cor(cty, hwy))


# If there is some outlier, also check robust statistics
with(mpg, cor(cty, hwy, meothod = "kendal")) #robust
with(mpg, cor(cty, hwy, method = "spearman")) #robust
