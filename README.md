# **Mitigating Risk to Unleash Maximum Value**

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/e9490508930d6b0a07d5a407b1f05d5ddf420102/images/powerbi_dashboard.png)

<img width="1348" height="759" alt="power_bi_dashboard" src="https://github.com/user-attachments/assets/6e28a0fa-9bfa-461e-a07a-2ee8ad40e7d2" />


## Project Summary

This project integrates asset integrity inspection data with maintenance cost metrics to evaluate long-term corrosion degradation and financial spend. The resulting insights enable data-driven decision-making to enhance asset reliability and optimize operational expenditures.

## Problem Statement

1. 31% unclassified work orders (17% unknown statuses and 14% unspecified priorities) against 5% monthly threshold, and
2. 22% inspection failure rate against zero-failure standard

## Project Requirements

### Objective

Enforce data entry controls to reduce unclassified work orders below the 5% threshold, establishing full visibility over maintenance spend while executing targeted inspection workflows to drive the 22% failure rate down toward zero.

### Specifications & Methodologies

1. **Data Source**: Synthetic dataset prompted from AI. The dataset covers inspection and maintenance records from 2024 to 2025 across 6 asset ids (equipment). It includes information on maintenance cost, failure mode and corrosion degradation. [Link to Dataset](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/datasets)
2. **Data Architecture**: Create modern data warehouse using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
3. **Analytics**: Create SQL-based (Microsoft SQL Server) queries for extracting, transforming, and loading data from source systems and develop fact and dimension tables for analytical queries. [Link to Scripts](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/scripts)
4. **Validation**: Create SQL-based (Microsoft SQL Server) queries for quality check. [Link to Test Scripts](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/tests)
5. **Reporting**: Create Power BI dashboards for visualization and identification of actionable insights. [Link to Power BI dashoard](

## Key Analysis & Visualization

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/3027377262b865c94b0a4c5bd9f8573f20c9b0d3/images/wo_status.png)

The 17% unknown work order statuses cover 337 work orders with a total of $61.97K untracked maintenance cost with spending peaked in January 2025 and October 2025.

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/db266afabeed93973b4a3395b8eab5d0f5f49314/images/wo_priority.png)

The 14% unspecified work order priorities cover 288 work orders with a total of $52.45K untracked maintenance cost with spending peaked in October 2024 and Dec 2025.

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/5649613b11b6fd0de04dc98fd2618acf358263f7/images/fail_insp_result.png)

The 22% failed inspection results cover 330 inspection activities with inspection effort peaked in April 2024 and December 2025. V-501 has the highest average corrosion rate of 0.70 mils per year (mpy), posing an elevated risk of accelerated wall thinning.

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/a54f00cf377bf3eeeb7da3afa3c37a2b13f1356d/images/P-102_m%26i_status.png)

Asset P-102 represents the highest overall operational and financial risk. The asset exhibits a 20% inspection failure rate, driven by aggressive activity spikes in February 2025 and September 2025. Financed with $60.89K in total maintenance spend across 324 work orders, spending peaked sharply in May 2025 and September 2025. Operational risk is further compounded by critical governance gaps: 38% of work orders remain unresolved (19% unknown and 19% in-progress), while 5% carry high-risk classification (3% critical priority and 2% unspecified).

## Recommendations
1. Standardize work order logging protocols to achieve a 100% weekly logging rate, successfully restoring and maintaining untracked maintenance activities and associated costs below the 5% monthly threshold.
2. Optimize inspection strategies by prioritizing high-risk assets with corrosion rates $\ge 0.60$ mils per year (mpy), improving risk mitigation and resource allocation.
3. Conduct in-depth Risk-Based Inspection (RBI) analysis on 'Leak' failure modes and optimize repair strategies to reduce failure trends by 50% over the next 12 months.
4. Strengthen inspection review processes and maintain a monthly backlog of $\le 3$ "pending review" status in inspection results.


## Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/7c238c4174c42c97ebc098e48c8b3ed167164526/images/AI%26M_Architecture_v2.png)

1. **Bronze Layer**: Stores raw data (as-is) from the source systems. Data is ingested from CSV Files into SQL Server Database.
2. **Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3. **Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

## License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## About Me

Hi there! I'm **Kim Bryan Evangelista** (you can call me **Kim**). I am an **Asset Integrity** professional transitioning into **Data Analytics**. Building on my background in asset management, I leverage hands-on SQL training and Python fundamentals to clean, query, and transform raw operational data into actionable business insights.

Currently learning: Advanced SQL techniques, Data Visualization, and Python for Data Analysis.

Let's stay in touch! Feel free to connect with me on the following platform:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kimbryanevangelista/)
