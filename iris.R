library(tidyverse)
library(ggplot2)

df <- read_csv("MEGA/datasets/iris-data.csv")
df <- janitor::clean_names(df)
iris_setosa <- filter(.data=df, class=="Iris-setosa")
iris_versicolor <- filter(.data=df, class=="Iris-versicolor")
iris_virginica <- filter(.data=df, class=="Iris-virginica")

df %>% ggplot(aes(class, sepal_length)) + geom_jitter(aes(colour=class)) + stat_summary(fun.y=mean, geom="crossbar", width=0.2) + geom_segment(aes(x=1, xend=2, y=mean(iris_setosa$sepal_length), yend=mean(iris_versicolor$sepal_length)), linetype="dashed") + geom_segment(aes(x=2, xend=3, y=mean(iris_versicolor$sepal_length), yend=mean(iris_virginica$sepal_length)), linetype="dashed")

lsmodel1 <- lm(sepal_length ~ class, data=df)
summary(lsmodel1)

report::report(lsmodel1)

