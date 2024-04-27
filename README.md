<h3>Title: Financial Analysis of Hospital Costs Using SQL and R</h3><br>

**Introduction:**

<p align="justify">This project, titled "Financial Analysis of Hospital Costs Using SQL and R" was conducted to perform a very basic analysis of hospital cost data sourced from a national survey by the US Agency for Healthcare. The study specifically focused on inpatient records of individuals aged 0 to 17 years from hospitals in Wisconsin.</p>

**Objective:**

<p align="justify">The principal aim of this project was to illustrate the use of SQL integrated with R for answering a few questions related to descriptive statistics and to use R to create simple hypothesis tests and linear models.</p>

**Exploratory Data Analysis using SQL (step 1):**

<p align="justify">This initial phase involved the use of SQL to explore key business questions around patient demographics, hospital expenditure, and racial disparities in healthcare utilisation. This helped lay the groundwork for more detailed statistical analysis.</p>

**Statistical Analysis using R (step 2):**

<p align="justify">The second phase included the use of statistical methods such as ANOVA Tests and Linear Regression to delve deeper into the data, addressing complex questions regarding expenditure patterns and the predictive modelling of hospitalisation costs.</p>

**Data Sources:**

<p align="justify">The dataset utilised in this project originates from two primary sources: the Medicare Provider Cost Report Hospital Cost PUF (Public Use File) and <a href="https://www. healthdata.gov/" target="_blank"> HealthData.gov</a>. These sources provide a rich and diverse dataset, enabling a thorough examination of hospital costs and patient demographics.</p>

**Conclusion:**

<p align="justify">The project successfully demonstrated how SQL and R can be combined to conduct a comprehensive financial analysis in the healthcare domain.</p>

<h4>Below are the questions that were answered in the exploratory data analysis with SQL Language:</h4>
<ol type="1">
  <li>How many races are represented in the dataset?</li>
  <li>What is the average age of patients?</li>
  <li>What is the age mode of the patients?</li>
  <li>What is the variance of the age variable?</li>
  <li>What is the total expenditure on hospital admissions by age?</li>
  <li>What age generates the highest total expenditure on hospital admissions?</li>
  <li>What is the total expenditure on hospital admissions by gender?</li>
  <li>What is the average expenditure on hospital admissions by patient race?</li>
  <li>For patients over 10 years old, what is the average total expenditure on hospitalizations?</li>
  <li>Considering the previous item, which age has an average spending greater than 3000?</li>
</ol>

<h4>Below are the questions that were answered in the statistical analysis using R:</h4>
<ol type="1">
  <li>Which group based on diagnosis (Aprdrg) has the highest total expenditure in the hospital?</li>
  <li>Is the patient's race related to the total amount spent on hospital admissions?</li>
  <li>The combination of age and gender of patients influences the total expenditure on hospitalizations?</li>
  <li>As the length of stay is a crucial factor for hospitalized patients, we wish to find out whether length of stay can be predicted from age, gender, and race.</li>
  <li>Which variables have the greatest impact on hospitalization costs?</li>
</ol>

