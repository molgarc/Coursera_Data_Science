#how to subset
library(datasets)
data(iris)
irisVirg <- iris[iris$Species == "virginica",]
head(irisVirg)
irisVirgColSepalLength <- irisVirg[,1] 
mean(irisVirgColSepalLength)
irisVirgColSepalLength2 <- irisVirg[,"Sepal.Length"] 
mean(irisVirgColSepalLength2)

apply(iris[,1:4],2,mean)
apply(iris[,1:4],1,mean)
apply(iris[,1:4],1,mean)
apply(iris,1,mean)
apply(iris,2,mean)
colMeans(iris)
rowMeans(iris[,1:4])

library(datasets)
data(mtcars)
head(mtcars)
apply(mtcars,2,mean)
with(mtcars,tapply(mpg,cyl,mean))
tapply(mtcars$cyl,mtcars$mpg,mean)
sapply(mtcars,cyl,mean)
split(mtcars,mtcars$cyl)
sapply(split(mtcars$mpg,mtcars$cyl),mean)
lapply(mtcars,mean)
tapply(mtcars$mpg,mtcars$cyl,mean)
mean(mtcars$mpg,mtcars$cyl)

tapply(mtcars$hp,mtcars$cyl,mean)




