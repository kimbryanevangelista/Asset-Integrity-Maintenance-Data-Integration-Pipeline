/*
==========================================================
DDL SCRIPT: Create Bronze Tables
==========================================================
SCRIPT PURPOSE:
	This script creates tables in the 'bronze' schema, dropping existing tables if they already exist.
	Run this script to re-define the DDL structure of 'bronze' tables.
==========================================================
*/

IF OBJECT_ID ('bronze.insp_insp_rec', 'U') IS NOT NULL
	DROP TABLE bronze.insp_insp_rec;
GO

CREATE TABLE bronze.insp_insp_rec (
	InspectionID INT,
	AssetID NVARCHAR (50),
	InspectionDate DATE,
	ThicknessMM INT,
	CorrosionRate FLOAT,
	Result NVARCHAR(50),
	Inspector NVARCHAR(50)
);
GO

IF OBJECT_ID ('bronze.mtce_mtce_rec', 'U') IS NOT NULL
	DROP TABLE bronze.mtce_mtce_rec;
GO

CREATE TABLE bronze.mtce_mtce_rec (
	WorkOrderID INT,
	ReportDate DATE,
	AssetID NVARCHAR(50),
	FailureMode NVARCHAR(50),
	Status NVARCHAR(50),
	Priority INT,
	CostUSD FLOAT,
	Department NVARCHAR(50)
);
GO
