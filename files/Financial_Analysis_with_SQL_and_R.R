### Mini-Project - Financial Analysis with SQL and Linear Regression using R ###

# Loading libraries
library(dplyr)
library(sqldf)

# Loading dataset
data <- read.csv('dataset.csv')

# Checking dataset dimensions
dim(data)

# Visualizing the data
View(data)

# Checking occurrence of NA values
colSums(is.na(data))

# There was only 1 register with NA value. Let's remove it.
data <- na.omit(data)

# Checking occurrence of NA values again
colSums(is.na(data)) 

# Checking dataset dimensions
dim(data)

# Checking data type
str(data)

##### Exploratory analysis with SQL ##### 
data
# Columns name
names(data)

# 1- How many races are represented in the dataset?
?sqldf
num_races <- sqldf('SELECT RACE, COUNT(RACE) as Num_Races FROM data GROUP BY RACE')
num_races

# 2- What is the average age of patients?
mean_age <- sqldf('SELECT AVG(AGE) as mean_age FROM data')
mean_age

# 3- What is the age mode of the patients?
mode_age <- sqldf('SELECT AGE FROM 
                  (SELECT AGE, COUNT(AGE) AS count_age FROM data
                  GROUP BY AGE
                  ORDER BY count_age DESC)
                  LIMIT 1')
mode_age

# 4- What is the variance of the age column?
variance_age <- sqldf("SELECT SUM((AGE - (SELECT AVG(AGE) FROM data)) * (AGE - (SELECT AVG(AGE) FROM data))) / (COUNT(AGE) - 1) AS variance FROM data")
variance_age

# 5- What is the total expenditure on hospital admissions by age?
total_expenditure_age <- sqldf('SELECT AGE, 
                                SUM(TOTCHG) as Total_Expenditure 
                                FROM data 
                                GROUP BY AGE')
total_expenditure_age

# 6- What age generates the highest total expenditure on hospital admissions?
highest_total_expenditure <- sqldf('SELECT AGE, Total_Expenditure
                                    FROM total_expenditure_age
                                    ORDER BY Total_Expenditure DESC
                                    LIMIT 1')
highest_total_expenditure

# 7- What is the total expenditure on hospital admissions by gender?
total_expenditure_gender <- sqldf('SELECT FEMALE as Gender, 
                                   SUM(TOTCHG) as Total_expenditure 
                                   FROM data 
                                   GROUP BY FEMALE')
total_expenditure_gender
data

# 8- What is the average expenditure on hospital admissions by patient race?
mean_expenditure_race <- sqldf('SELECT RACE, 
                                 AVG(TOTCHG) as Mean_expenditure 
                                 FROM data 
                                 GROUP BY RACE')
mean_expenditure_race

# 9- What is the average total expenditure on hospitalizations, considering the patients over 10 years old?
mean_expenditure_age_above_10 <- sqldf('SELECT AGE, 
                                        AVG(TOTCHG) as mean_expenditure 
                                        FROM data 
                                        WHERE AGE > 10 
                                        GROUP BY AGE')
mean_expenditure_age_above_10

# 10- Considering the previous item, what age has an average expenditure greater than 3000?
mean_expenditure_above_3k_age_above_10 <- sqldf('SELECT AGE, 
                                                 AVG(TOTCHG) as mean_expenditure 
                                                 FROM data 
                                                 WHERE AGE > 10 
                                                 GROUP BY AGE 
                                                 HAVING AVG(TOTCHG) > 3000')
mean_expenditure_above_3k_age_above_10

##### Regression Analysis using R ##### 

# 11- What is the age distribution of patients attending the hospital?
hist(data$AGE, 
     main = "Age Distribution of Patients Attending the Hospital",
     xlab = "Age", 
     border = "black", 
     xlim = c(0,20), 
     ylim = c(0,350))

# Age summary
age_summary <- summary(as.factor(data$AGE))
age_summary

### Children between 0 and 1 year old are the ones who attend the hospital the most.


# 12- Which age group has the highest total hospital expenditure?
total_expenditure_based_on_age = aggregate(TOTCHG ~ AGE, 
                                      FUN = sum, 
                                      data = data)

View(total_expenditure_based_on_age)

total_expenditure_based_on_age[which.max(total_expenditure_based_on_age$TOTCHG),]

barplot(tapply(total_expenditure_based_on_age$TOTCHG, 
               total_expenditure_based_on_age$AGE, 
               FUN = sum))

### Children between 0 and 1 year old are the ones that generate the highest expenditure in the hospital.


# 13- Which diagnosis-based group (Aprdrg) has the highest total hospital expenditure?
total_expenditure_based_on_diag = aggregate(TOTCHG ~ APRDRG, 
                                            FUN = sum, 
                                            data = data)

View(total_expenditure_based_on_diag)

total_expenditure_based_on_diag[which.max(total_expenditure_based_on_diag$TOTCHG),]

### The 640 group has the highest total expenditure.


# 14- Is the patient's race related to the total amount expenditure on hospital admissions?

# We will use an ANOVA Test.
# Dependent variable in the ANOVA Test: TOTCHG
# Independent variable in the ANOVA Test: Race

# H0: There is no RACE effect on TOTCHG.
# H1: There is RACE effect on TOTCHG.

summary(as.factor(data$RACE))
anova_model_1 <- aov(TOTCHG ~ RACE, data = data)
summary(anova_model_1)

### The p-value is higher than 0.05. We failed to reject H0.
### Therefore, the patient's race does not influence the total cost of hospitalization.


# 15- The combination of age and gender of patients influences the total expenditure
# in hospital admissions?

# We will use an ANOVA Test.
# Dependent variable in the ANOVA Test: TOTCHG
# Independent variables in the ANOVA Test: AGE, FEMALE

# H0: There is no effect of AGE and FEMALE on TOTCHG.
# H1: There is effect of AGE and FEMALE in TOTCHG.

anova_model_2 <- aov(TOTCHG ~ AGE + FEMALE, data = data)
summary(anova_model_2)

### In both cases the p-value is less than 0.05. We reject the null hypothesis. 
### There is a significant effect of age and gender on hospital costs.


# 16- As length of stay is the crucial factor for inpatients, we want to find
# out if the dwell time can be predicted from age, gender and race.

#  We will use a Linear Regression model.
#  Dependent variable: LOS
#  Independent variables: AGE, FEMALE and RACE 

#  H0: There is no linear relationship between dependent and independent variables.
#  H1: There is a linear relationship between dependent and independent variables.

linear_model_1 <- lm(LOS ~ AGE + FEMALE + RACE, data = data)
summary(linear_model_1) 

# P-value greater than 0.05 in all cases, so we fail to reject H0.
# Length of stay cannot be predicted from the independent variables used.


# 17- Which variables have the greatest impact on hospitalization costs?

# We will use a Linear Regression model.
#  Dependent variable: TOTCHG
#  Independent variables: AGE, FEMALE, LOS, RACE and APRDRG

names(data)

#  H0: There is no linear relationship between dependent and independent variables.
#  H1: There is a linear relationship between dependent and independent variables.

linear_model_2 <- lm(TOTCHG ~ ., data = data)
summary(linear_model_2) 

# As we can see from the values of the coefficients, the variables age,
# length of stay (LOS) and refined patient diagnosis group (APRDRG) are
# the only ones with statistical significance. Moreover, RACE is not
# significant. Let's remove RACE and build another version of the model.

linear_model_3 <- lm(TOTCHG ~ AGE + FEMALE + LOS + APRDRG, data = data)
summary(linear_model_3) 

# Note that the variable representing gender has the least significance for the model.
# Let's remove it and create another version of the model.

linear_model_4 <- lm(TOTCHG ~ AGE + LOS + APRDRG, data = data)
summary(linear_model_4) 

# The 3 variables have high significance, but APRDRG has a negative t-value.
# Let's remove it and create another version of the model.

linear_model_5 <- lm(TOTCHG ~ AGE + LOS, data = data)
summary(linear_model_5) 

# Removing race and gender does not change the value of R2.
# Removing the APRDRG in the model increases the standard error. 
# Therefore, model linear_model_4 seems to be the best and we will use it for our conclusion.
summary(linear_model_4) 

### Conclusion:

# As is evident from the various models above, health care costs depend on age,
# length of stay and diagnosis group.
# These are the 3 most relevant variables to explain and predict expenses on hospital admissions.

### THE END ###