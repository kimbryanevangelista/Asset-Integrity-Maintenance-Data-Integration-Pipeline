/*
===========================================================
DDL SCRIPT: Create Gold Tables
===========================================================
SCRIPT PURPOSE:
    This script creates tables in the 'gold' schema, dropping existing tables if they already exists.
    Thsese dimension and fact tables are created in preparation for PowerBI visualization.
    Run this script to re-define the DDL structure of 'gold' tables.
===========================================================
*/

-- ========================================================
-- Create dimension table for asset ID
-- ========================================================
IF OBJECT_ID ('gold.dim_asset', 'U') IS NOT NULL
	DROP TABLE gold.dim_asset;
GO

CREATE TABLE gold.dim_asset (
	asset_id NVARCHAR(50) PRIMARY KEY
);
GO

-- ========================================================
-- Create dimension table for department
-- ========================================================
IF OBJECT_ID ('gold.dim_department', 'U') IS NOT NULL
	DROP TABLE gold.dim_department;
GO

CREATE TABLE gold.dim_department (
	department NVARCHAR(50) PRIMARY KEY
);
GO

-- ========================================================
-- Create dimension table for the date range
-- ========================================================
IF OBJECT_ID ('gold.dim_date', 'U') IS NOT NULL
    DROP TABLE gold.dim_date;
GO

CREATE TABLE gold.dim_date (
    full_date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month_number INT NOT NULL,
    month_name NVARCHAR(50) NOT NULL,
    day_of_week NVARCHAR(50) NOT NULL 
);
GO

-- ========================================================
-- Create fact table for inspection
-- ========================================================
IF OBJECT_ID('gold.fact_inspection', 'U') IS NOT NULL
    DROP TABLE gold.fact_inspection;
GO

CREATE TABLE gold.fact_inspection (
    inspection_id NVARCHAR(50) PRIMARY KEY,
    asset_id NVARCHAR(50) NOT NULL,
    inspection_date DATE NOT NULL,
    thickness_in_mm DECIMAL(10,2),
    inspection_type NVARCHAR(50),
    corrosion_rate DECIMAL(10,1),
    corrosion_status NVARCHAR(50),
    result NVARCHAR(50),
    inspector NVARCHAR(100)
);
GO

-- ========================================================
-- Create fact table for maintenance
-- ========================================================
IF OBJECT_ID('gold.fact_maintenance', 'U') IS NOT NULL
    DROP TABLE gold.fact_maintenance;
GO

CREATE TABLE gold.fact_maintenance (
    work_order_id NVARCHAR(50) PRIMARY KEY,
    report_date DATE NOT NULL,
    asset_id NVARCHAR(50) NOT NULL,
    failure_mode NVARCHAR(100),
    status NVARCHAR(50),
    priority NVARCHAR(50),
    cost_in_usd DECIMAL(12,2),
    department NVARCHAR(50)
);
GO
