# Data Exploration in SQL
#  Project Name: COVID-19 Data Exploration using SQL


----
# Project Objective: 
The objective of this project is to perform an exploratory data analysis on COVID-19 data, focusing on the COVIDDeaths and COVIDVaccinations datasets. The analysis will provide insights into COVID-19 deaths and vaccinations in different locations, explore the relationship between COVID-19 cases and deaths, and identify countries with the highest infection rates and death counts per population.



-----
# Data Sourcing
The project utilizes two datasets:
1. COVIDDeaths: This dataset contains information about COVID-19 deaths for different locations (countries and regions). The dataset includes metrics such as the total number of COVID-19 cases, new cases, total deaths, population, and other relevant data.
2. COVIDVaccinations: This dataset contains information about COVID-19 vaccinations for different locations (countries and regions). The dataset includes metrics such as the total number of vaccinations, people vaccinated, people fully vaccinated, and new vaccinations.



----
# Data Transformation:

COVIDDeaths Dataset Columns:
1. Location: Country or region name.
2. Date: Date of data recording.
3. total_cases: Total number of COVID-19 cases reported.
4. new_cases: Number of new COVID-19 cases reported on the given date.
5. total_deaths: Total number of deaths attributed to COVID-19.
6. population: Population of the country or region.

COVIDVaccinations Dataset Columns:
1. iso_code: ISO code of the country.
2. continent: Continent the country belongs to.
3. location: Country name.
4. Date: Date of data recording.
5. total_vaccinations: Total number of COVID-19 vaccinations administered.
6. people_vaccinated: Total number of individuals vaccinated (at least one dose).
7. people_fully_vaccinated: Total number of individuals fully vaccinated (all required doses).
8. new_vaccinations: Number of new COVID-19 vaccinations administered.




----
# Findings & Recommendation:
 Findings:
The SQL queries have been executed on the COVIDDeaths and COVIDVaccinations datasets to gain insights into COVID-19 deaths and vaccinations, as well as related metrics:
The SQL queries have been executed on the COVIDDeaths and COVIDVaccinations datasets to gain insights into COVID-19 deaths and vaccinations, as well as related metrics:

1. COVID-19 Deaths Analysis:
    The analysis of COVID-19 deaths provides data on the total number of deaths attributed to COVID-19, new deaths reported, and death percentages based on the total number of cases.
    The exploration helps identify trends in COVID-19 mortality and assesses the likelihood of dying if infected with COVID-19 in different countries.
2. COVID-19 Vaccinations Analysis:
   The analysis of COVID-19 vaccinations provides data on the total number of vaccinations administered, new vaccinations, and the percentage of the population vaccinated in different countries.
   The exploration helps identify trends in vaccination progress and coverage in different regions.
3. Infection Rates and Death Counts Analysis:
   This project examines the relationship between total COVID-19 cases and population, allowing us to calculate the percentage of the population that contracted COVID-19.
   Additionally, countries with the highest infection rates and death counts per population are identified, providing insights into regions with a high COVID-19 burden.

   Recommendations:
   
   Based on the findings from the data analysis, we propose the following recommendations:
1  Strengthen Healthcare Systems: Countries with high infection rates and death counts per population should prioritize strengthening their healthcare systems to cope with the pandemic's impact. This 
   includes increasing hospital capacities, ensuring sufficient medical supplies, and implementing effective treatment protocols.
2  Implement Preventive Measures: To reduce the likelihood of COVID-19 transmission and mitigate the severity of the pandemic, governments should continue to implement and enforce preventive measures such 
   as social distancing, mask-wearing, and promoting hygiene practices.
3  Monitor High-Risk Locations: Special attention should be given to countries with high infection rates and death percentages to monitor the situation closely and implement targeted interventions in 
   high- risk areas.
4  Vaccination Campaigns: Vaccination efforts should be intensified to increase population immunity against COVID-19. Governments should prioritize vaccination campaigns, especially in regions with high 
   infection rates, to protect public health.

   
        SQL Queries and Dataset Files:
The SQL queries used for data exploration can be found in the attached SQL file. The dataset files used for analysis are "COVIDDeaths.xls" and "COVIDVaccinations.xls," both of which are included in this repository.
Please note that the provided SQL queries have been utilized to extract and analyze the data, and the documentation summarizes the key findings and recommendations based on the analysis.
For any further analysis or specific insights required, additional SQL queries or data visualization techniques can be applied. 
By analyzing the COVID-19 deaths and vaccinations data, this project aims to contribute insights into the impact of the pandemic and vaccination progress, helping inform public health strategies to combat COVID-19 effectively.




