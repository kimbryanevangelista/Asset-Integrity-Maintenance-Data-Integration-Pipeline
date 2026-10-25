/*
===========================================================
DDL SCRIPT: Create Gold Tables
===========================================================
SCRIPT PURPOSE:
    This script creates tables in the 'gold' schema, dropping existing tables if they already exists.
    Thsese dimension tables are created in preparation for PowerBI visualization.
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
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL,
    month_number INT NOT NULL,
    month_name NVARCHAR(50) NOT NULL,
    day_of_week NVARCHAR(50) NOT NULL 
);
GO
