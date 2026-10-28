# Asset Reliability & Cost Optimization Analysis

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/e14fb52d1972241067b0628d125425dc7e296c32/images/portfolio_powerbi_dashboard.png)

## Project Summary

The **Asset Reliability & Cost Optimization Analysis** is designed to bridge the gap between asset health through inspection and maintenance financial expenditure. The primary goal is to analyze maintenance costs over time and asset corrosion degradation evaluation to generate actionable insights to optimize asset reliability and maintenance spending.

## Problem Statement

Operational cost control and asset reliability are severely compromised by untracked maintenance activities (17% unknown statuses, 14% unspecified priorities) and an unacceptable 22% inspection failure rate, far breaching our 5% logging limit and zero-failure standard.

## Project Requirements

### Objective

Enforce data entry controls to reduce unclassified work orders below the 5% threshold, establishing full visibility over maintenance spend while executing targeted inspection workflows to drive the 22% failure rate down toward zero.

### Specifications

1. **Data Source**: The dataset, sourced thru AI prompting in the form of CSV files, covers inspection and maintenance records from 2024 to 2025 across 6 asset ids (equipment). It includes information on maintenance cost, failure mode and corrosion degradation. [View Dataset Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/datasets)
2. **Data Architecture**: Design a modern data warehouse using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
3. **Analytics**: Create SQL-based (SQL Server) queries for extracting, transforming, and loading data from source systems and to develop fact and dimension tables for analytical queries. [View Script Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/scripts) Create queries for quality check (data validation), refer to this folder. [View Tests Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/tests)
4. **Reporting** Create Power BI dashboards for visualization and identification of actionable insights.

## BI: Analytics & Reporting (Data Analytics)

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/105a035f7c1ac599dd2bdd1a72a767a61d376d20/images/work_order_status.png)

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/d2f206f355abfa2436037933088bd575be19bb31/images/work_order_priority.png)

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/116869296dc3286d31aeb1c64197caaa28970986/images/fail_inspection_result.png)

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/c092eb3235b822a14e3dca77cf61ff9d7b2dd3c9/images/P-102_overall_status.png)


## Business Insights & Recommendations
1. **Risk Mitigation**: Pinpoints high corrosion rates early to trigger automated alerts and prevent critical asset failures.
2. **Cost Management**: Shifts maintenance teams from reactive fixing to planned, data-driven inspection schedules.
3. **Operational Efficiency**: Moves teams from reactive fixing to planned, data-driven inspection schedules.
4. **Data Governance**: Enforces mandatory priority tagging in CMMS/ERP software to eliminate unassigned work orders.


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
