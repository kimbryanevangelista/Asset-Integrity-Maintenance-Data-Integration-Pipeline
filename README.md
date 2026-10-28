# Asset Reliability & Cost Optimization Analysis

## Project Summary

The **Asset Reliability & Cost Optimization Analysis** is designed to bridge the gap between asset health through inspection and maintenance financial expenditure. The primary goal is to analyze maintenance costs over time, asset corrosion degradation evaluation, and work order prioritization to generate actionable insights to optimize asset reliability and cost efficiency.

## Problem Statement

Maintenance supports inspection activities reactively, which makes inefficient costing/budgeting due to integrity-related findings after inspection assessment. 

## Project Requirements

### Objective

Identify which asset to prioritize based on current corrosion rate and failure modes. Develop cost-efficient maintenance plans based on inspection results and assessments.

### Specifications

1. **Data Source**: The dataset, sourced thru AI prompting in the form of CSV files, covers inspection and maintenance records from 2024 to 2025 across 6 asset ids (equipment). It includes information on maintenance cost, failure mode and corrosion degradation. [View Dataset Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/datasets)
2. **Data Architecture**: Design a modern data warehouse using Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.
3. **Analytics**: Create SQL-based (SQL Server) queries for extracting, transforming, and loading data from source systems and to develop fact and dimension tables for analytical queries. [View Script Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/scripts) Create queries for quality check (data validation), refer to this folder. [View Tests Folder](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/tree/main/tests)
4. **Reporting** Create Power BI dashboards for visualization and identification of actionable insights.

## BI: Analytics & Reporting (Data Analytics)

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/e4abfc73fd7c2431edd84cb9710c577b2b4d9df4/images/portfolio_powerbi_dashboard.png)

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
