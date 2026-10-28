# Asset Reliability & Cost Optimization Analysis

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/e9490508930d6b0a07d5a407b1f05d5ddf420102/images/powerbi_dashboard.png)

## Project Summary

The **Asset Reliability & Cost Optimization Analysis** is designed to bridge the gap between asset health through inspection and maintenance financial expenditure. The primary goal is to analyze maintenance costs over time and asset corrosion degradation evaluation to generate actionable insights to optimize asset reliability and maintenance spending.

## Problem Statement

Operational cost control and asset reliability are severely compromised by untracked maintenance activities with corresponding costs (17% unknown statuses, 14% unspecified priorities) and an unacceptable 22% inspection failure rate, far breaching our 5% logging limit and zero-failure standard.

## Project Requirements

### Objective

Enforce data entry controls to reduce unclassified work orders below the 5% threshold, establishing full visibility over maintenance spend while executing targeted inspection workflows to drive the 22% failure rate down toward zero.

### Specifications

1. **Data Source**: The dataset, sourced thru AI prompting in the form of CSV files, covers inspection and maintenance records from 2024 to 2025 across 6 asset ids (equipment). It includes information on maintenance cost, failure mode and corrosion degradation. [View Dataset Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/datasets)
2. **Data Architecture**: Design a modern data warehouse using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
3. **Analytics**: Create SQL-based (SQL Server) queries for extracting, transforming, and loading data from source systems and to develop fact and dimension tables for analytical queries. [View Script Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/scripts) Create queries for quality check (data validation), refer to this folder. [View Tests Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/tests)
4. **Reporting** Create Power BI dashboards for visualization and identification of actionable insights.

## Key Analysis & Visualization

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/3027377262b865c94b0a4c5bd9f8573f20c9b0d3/images/wo_status.png)

The 17% unknown work order status covers 337 work orders with a total of $61.97K untracked maintenance cost with spending spike on January 2025 and October 2025.

![image alter](

The 14% unspecified work order priority covers 288 work orders with a total of $52.45K untracked maintenance cost with spending spike on October 2024.

![image alter](

The 22% failed inspection results cover 330 inspection activities with inspection effort spike in April 2024 and Oct 2025. V-501 has the highest average corrosion rate of 0.70 mills per year that could result to faster thickness thinning.

![image alter](

Overall, P-102 is the highest asset at risk with combined 20% inspection failure trend (spiking inspection effort in July 2024 and April 2025) and $60.89K total maintenance cost (spiking in April 2025) covering 324 total work orders with 19% unknown and 19% in-progress work order status and 2% unspecified & 3% critical work order priority.

## Recommendations
1. Standardize work order logging standards to restore and maintain the 5% monthly threshold for untracked maintenance activities and it's corresponding cost.
2. Optimize inspection strategies and prioritize assets with highest corrosion rate to minimize and eliminate recurring inspection failures.
3. Allocate more maintenance budget and inspection efforts for assets with high corrosion rate and those with high failure trend.


## Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/0fde80c425f2be9a788cdb1206f3b8ea262c6304/images/AI%26M_Architecture.png)

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
