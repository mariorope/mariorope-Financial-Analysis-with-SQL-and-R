<h3>Title: Comprehensive Financial Analysis: Leveraging SQL and R for Hospital Cost Evaluation</h3><br>

**Introduction:**

<p align="justify">This project undertakes a comprehensive analysis of hospital cost data derived from a national survey conducted by the US Agency for Healthcare. Focused on hospital records of inpatient samples in the city of Wisconsin, specifically targeting patients aged 0 to 17 years, the project employs a two-step approach. Step 1 entails exploratory data analysis using SQL language to address pertinent business questions, while Step 2 involves statistical analysis using R language, employing techniques such as ANOVA Test and Linear Regression to derive insights and answer additional business questions.</p>

**Data Sources:**

<p align="justify">The dataset utilised in this project originates from two primary sources: the Medicare Provider Cost Report Hospital Cost PUF (Public Use File) and <a href="https://www. healthdata.gov/" target="_blank"> HealthData.gov</a>. These sources provide a rich and diverse dataset, enabling a thorough examination of hospital costs and patient demographics.</p>

**Exploratory Data Analysis with SQL Language (step 1):**

<p align="justify">Step 1 of the project involves exploring the dataset using SQL language to answer ten key business questions. These questions encompass various aspects of patient demographics, expenditure on hospital admissions, and racial disparities in healthcare utilisation. The insights gleaned from this exploratory analysis serve as a foundation for further statistical analysis in Step 2.</p>

**Statistical Analysis using R (step 2):**

<p align="justify">In Step 2, statistical analysis is conducted using R language, employing techniques such as ANOVA Test and Linear Regression to delve deeper into the dataset and address additional business questions. These questions encompass diverse aspects of patient demographics, expenditure patterns, and predictive modelling of hospitalisation costs based on demographic factors.</p>

**Key Findings and Business Insights:**

<p align="justify">The analysis yields valuable insights into the distribution of patient demographics, expenditure patterns across different age groups, diagnoses, racial disparities in healthcare spending, and predictive modelling of hospitalisation costs. These insights are instrumental in informing decision-making processes within the healthcare sector, facilitating resource allocation, and addressing disparities in healthcare delivery.</p>

**Conclusion:**

<p align="justify">In conclusion, this project demonstrates the power of combining SQL and R for comprehensive financial analysis in the healthcare domain. By leveraging advanced analytical techniques, valuable insights are derived, contributing to a deeper understanding of hospital cost dynamics and patient demographics. Moving forward, these insights can inform strategic decision-making processes aimed at enhancing healthcare delivery and optimising resource allocation in hospital settings.</p>

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
  <li>What is the age distribution of patients attending the hospital?</li>
  <li>Which age group has the highest total expenditure in the hospital?</li>
  <li>Which group based on diagnosis (Aprdrg) has the highest total expenditure in the hospital?</li>
  <li>Is the patient's race related to the total amount spent on hospital admissions?</li>
  <li>The combination of age and gender of patients influences the total expenditure on hospitalizations?</li>
  <li>As the length of stay is a crucial factor for hospitalized patients, we wish to find out whether length of stay can be predicted from age, gender, and race.</li>
  <li>Which variables have the greatest impact on hospitalization costs?</li>
</ol>

