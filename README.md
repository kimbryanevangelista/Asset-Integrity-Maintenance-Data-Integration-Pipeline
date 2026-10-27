# Asset-Integrity-Maintenance-Data-Integration-Pipeline
Building a modern data warehouse with SQL Server, including ETL process, data modelling, and analytics.


## 📖 Project Overview
This project demonstrates a comprehensive data warehousing and analytics solution to generate actionable insights & recommendation to the given problem.


## 🛠️ Important Links & Tools


## 🚀 Project Summary


## Problem Statement
Plant operations lacked centralized visibility into asset degradation, leading to reactive maintenance, unplanned downtime, and unmonitored maintenance spending across departments.

## Project Requirements





## 📈 BI: Analytics & Reporting (Data Analytics)


![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/e4abfc73fd7c2431edd84cb9710c577b2b4d9df4/images/portfolio_powerbi_dashboard.png)

## 🏗️ Data Architecture

The data architecture for this project follows Medallion Architecture **Bronze**, **Silver**, and **Gold** layers.

![image alter](https://github.com/kimbryanevangelista/Asset-Integrity-Maintenance-Data-Integration-Pipeline/blob/0fde80c425f2be9a788cdb1206f3b8ea262c6304/images/AI%26M_Architecture.png)

**Bronze Layer**: Stores raw data (as-is) from the source systems. Data is ingested from CSV Files into SQL Server Database.

**Silver Layer**: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.

**Gold Layer**: Houses business-ready data modeled into a star schema required for reporting and analytics.

## 📂 Repository Structure

data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data\\\\\\\\\\\\\\\_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data\\\\\\\\\\\\\\\_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data\\\\\\\\\\\\\\\_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data\\\\\\\\\\\\\\\_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project


















## 🛡️ License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

## 🌟 About Me

Hi there! I'm **Kim Bryan Evangelista** (you can call me **Kim**). I am an **Asset Integrity** professional transitioning into **Data Analytics**. Building on my background in asset management, I leverage hands-on SQL training and Python fundamentals to clean, query, and transform raw operational data into actionable business insights.

🌱 Currently learning: Advanced SQL techniques, Data Visualization, and Python for Data Analysis.

📬 Let's stay in touch! Feel free to connect with me on the following platform:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/kimbryanevangelista/)
