/*
==========================================================
DDL SCRIPT: Create Silver Tables
==========================================================
SCRIPT PURPOSE:
	This script creates tables in the 'silver' schema, dropping existing tables if they already exist.
	Run this script to re-define the DDL structure of 'silver' tables.
==========================================================
*/

IF OBJECT_ID ('silver.insp_insp_rec', 'U') IS NOT NULL
	DROP TABLE silver.insp_insp_rec;
GO

CREATE TABLE silver.insp_insp_rec (
	inspection_id INT,
	asset_id	NVARCHAR (50),
	inspection_date DATE,
	thickness_in_mm	INT,
	inspection_type NVARCHAR(50),
	corrosion_rate FLOAT,
	corrosion_status NVARCHAR(50),
	result NVARCHAR(50),
	inspector NVARCHAR(50),
	aim_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID ('silver.mtce_mtce_rec', 'U') IS NOT NULL
	DROP TABLE silver.mtce_mtce_rec;
GO

CREATE TABLE silver.mtce_mtce_rec (
	work_order_id	INT,
	report_date	DATE,
	asset_id	NVARCHAR(50),
	failure_mode	NVARCHAR(50),
	status	NVARCHAR(50),
	priority INT,
	cost_in_usd	FLOAT,
	department NVARCHAR(50),
	aim_create_date DATETIME2 DEFAULT GETDATE()
);
GO
