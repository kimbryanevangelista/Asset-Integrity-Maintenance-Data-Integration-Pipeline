/*
=================================================
Create Database and Schemas
=================================================
SCRIPT PURPOSE:
	This script creates a new database named as 'AssetIntegrity_DW', after checking if it already exists.
	If the database exists, it will be dropped and and recreated.
	Additionaly, the scripts sets up three schemas within the database: 'bronze', 'silver' and 'gold'.

WARNING:
	Running this script will drop the entire 'AssetIntegrity_DW' database if it exists.
	All data in the database will be permananently deleted.
	Proceed with caution and ensure you have proper backups before running this script.
*/

USE master;
GO


-- Drop and recreate the 'AssetIntegrity_DW' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'AssetIntegrity_DW')
BEGIN
	ALTER DATABASE AssetIntegrity_DW SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE AssetIntegrity_DW;
END;
GO


-- Create the 'AssetIntegrity_DW' database
CREATE DATABASE AssetIntegrity_DW;
GO

USE AssetIntegrity_DW;
GO


-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
