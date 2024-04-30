knitr::opts_chunk$set(echo = TRUE, warning = FALSE, message = FALSE)

library(dplyr)
library(sqldf)
library(ggplot2)

data <- read.csv('../data/dataset.csv')
head(data)

dim(data)
colSums(is.na(data)) 

data <- na.omit(data)
str(data)

data$RACE <- as.factor(data$RACE)
data$FEMALE <- as.factor(data$FEMALE)
str(data)

names(data)

num_races <- sqldf('SELECT RACE, COUNT(RACE) as Num_Races FROM data GROUP BY RACE')
num_races

mean_age <- sqldf('SELECT AVG(AGE) as mean_age FROM data')
mean_age

num_age <- sqldf('SELECT AGE, COUNT(AGE) as Num_Age FROM data GROUP BY AGE')
num_age

mode_age <- sqldf('SELECT AGE FROM 
                  (SELECT AGE, COUNT(AGE) AS count_age FROM data
                  GROUP BY AGE
                  ORDER BY count_age DESC)
                  LIMIT 1')
mode_age

variance_age <- sqldf("SELECT SUM((AGE - (SELECT AVG(AGE) FROM data)) * (AGE - (SELECT AVG(AGE) FROM data))) / (COUNT(AGE) - 1) AS variance FROM data")
variance_age

total_expenditure_age <- sqldf('SELECT AGE, 
                                SUM(TOTCHG) as Total_Expenditure 
                                FROM data 
                                GROUP BY AGE')
total_expenditure_age

total_expenditure_percapta_age <- sqldf('SELECT AGE, 
                                SUM(TOTCHG)/COUNT(TOTCHG) as Total_Expenditure_PerCapta
                                FROM data 
                                GROUP BY AGE')
total_expenditure_percapta_age

highest_total_expenditure <- sqldf('SELECT AGE, Total_Expenditure
                                    FROM total_expenditure_age
                                    ORDER BY Total_Expenditure DESC
                                    LIMIT 1')
highest_total_expenditure

total_expenditure_gender <- sqldf('SELECT FEMALE as Gender, 
                                   SUM(TOTCHG) as Total_expenditure 
                                   FROM data 
                                   GROUP BY FEMALE')
total_expenditure_gender

mean_expenditure_race <- sqldf('SELECT RACE, 
                                 AVG(TOTCHG) as Mean_expenditure 
                                 FROM data 
                                 GROUP BY RACE')
mean_expenditure_race

mean_expenditure_age_above_10 <- sqldf('SELECT AGE, 
                                        AVG(TOTCHG) as mean_expenditure 
                                        FROM data 
                                        WHERE AGE > 10 
                                        GROUP BY AGE')
mean_expenditure_age_above_10

mean_expenditure_above_3k_age_above_10 <- sqldf('SELECT AGE, 
                                                 AVG(TOTCHG) as mean_expenditure 
                                                 FROM data 
                                                 WHERE AGE > 10 
                                                 GROUP BY AGE 
                                                 HAVING AVG(TOTCHG) > 3000')
mean_expenditure_above_3k_age_above_10

total_expenditure_based_on_diag = aggregate(TOTCHG ~ APRDRG, 
                                            FUN = sum, 
                                            data = data)

total_expenditure_based_on_diag[which.max(total_expenditure_based_on_diag$TOTCHG),]

anova_model_1 <- aov(TOTCHG ~ RACE, data = data)
summary(anova_model_1)

anova_model_2 <- aov(TOTCHG ~ AGE + FEMALE, data = data)
summary(anova_model_2)

linear_model_1 <- lm(LOS ~ AGE + FEMALE + RACE, data = data)
summary(linear_model_1)

names(data)

linear_model_2 <- lm(TOTCHG ~ ., data = data)
summary(linear_model_2) 

linear_model_3 <- lm(TOTCHG ~ AGE + LOS + APRDRG, data = data)
summary(linear_model_3) 
