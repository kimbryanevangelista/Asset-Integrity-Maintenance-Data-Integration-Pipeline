/*
===============================================================================
STORED PROCEDURE: Load Silver Layer (Bronze -> Silver)
===============================================================================
SCRIPT PURPOSE:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	ACTIONS PERFORMED:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
PARAMETERS:
    None. 
	This stored procedure does not accept any parameters or return any values.

USAGE EXAMPLE:
    EXEC Silver.load_silver;
===============================================================================
*/
CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Silver Layer';
        PRINT '================================================';

		PRINT '------------------------------------------------';
		PRINT 'Loading INSP Tables';
		PRINT '------------------------------------------------';

		-- Loading silver.insp_insp_rec
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.insp_insp_rec';
		TRUNCATE TABLE silver.insp_insp_rec;
		PRINT '>> Inserting Data Into: silver.insp_insp_rec';
		INSERT INTO silver.insp_insp_rec (
			inspection_id,
			asset_id,
			inspection_date,
			thickness_in_mm,
			inspection_type,
			corrosion_rate,
			corrosion_status,
			result,
			inspector
		)
		SELECT
			InspectionID AS inspection_id,
			UPPER(TRIM(AssetID)) AS asset_id, -- DATA CLEANSING:Trimming/Removing unwanted space
			InspectionDate AS inspection_date,
			ThicknessMM AS thickness_in_mm,
			CASE WHEN ThicknessMM IS NULL THEN 'Visual Inspection Only'
				ELSE 'UT Measurement'
			END AS inspection_type, -- IMPUTATION: Handle NULL thickness values AND derived new column
			CAST(CorrosionRate AS DECIMAL (10,1)) AS corrosion_rate,
			CASE WHEN CorrosionRate IS NULL THEN 'Baseline Inspection'
				ELSE 'Active Rate'
			END AS corrosion_status,-- IMPUTATION: Handle NULL corrosion rate values AND derived new column
			CASE WHEN Result IS NULL THEN 'Pending Review'
				ELSE UPPER(LEFT(LOWER(TRIM(Result)),1)) + LOWER(SUBSTRING(TRIM(Result),2,LEN(Result)))
			END AS result, -- DATA NORMALIZATION/STANDARDIZATION: Normalize 'result' values to standardized format/string
			UPPER(LEFT(LOWER(TRIM(Inspector)),1)) + 
				LOWER(SUBSTRING(TRIM(Inspector),2,9)) + 
				RIGHT(UPPER(TRIM(Inspector)),1) AS inspector -- DATA NORMALIZATION/STANDARDIZATION: Normalize 'inspector' values to standardized format/string
		FROM bronze.insp_insp_rec;
		SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '------------------------------------------------';

		PRINT '------------------------------------------------';
		PRINT 'Loading MTCE Tables';
		PRINT '------------------------------------------------';

		-- Loading silver.mtce_mtce_rec
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: silver.mtce_mtce_rec';
		TRUNCATE TABLE silver.mtce_mtce_rec;
		PRINT '>> Inserting Data Into: silver.mtce_mtce_rec';
		INSERT INTO silver.mtce_mtce_rec (
			work_order_id,
			report_date,
			asset_id,
			failure_mode,
			status,
			priority,
			cost_in_usd,
			department
		)
		SELECT
			WorkOrderID AS work_order_id,
			ReportDate AS report_date,
			UPPER(TRIM(AssetID)) AS asset_id, -- DATA CLEANSING:Trimming/Removing unwanted space
			CASE WHEN UPPER(LEFT(LOWER(TRIM(FailureMode)),1)) + 
					  SUBSTRING(LOWER(TRIM(FailureMode)),2,LEN(FailureMode)) = 'Sensor fail' THEN 'Sensor Fail'
				ELSE UPPER(LEFT(LOWER(TRIM(FailureMode)),1)) + SUBSTRING(LOWER(TRIM(FailureMode)),2,LEN(FailureMode))
			END AS failure_mode, -- DATA NORMALIZATION/STANDARDIZATION: Normalize 'FailureMode' values to standardized format/string
			UPPER(LEFT(LOWER(TRIM(ISNULL(Status, 'Unknown'))),1)) + 
				SUBSTRING(LOWER(TRIM(ISNULL(Status, 'Unknown'))),2,LEN(ISNULL(Status, 'Unknown'))) AS status,
			ISNULL(Priority,99) AS priority, -- DATA NORMALIZATION/STANDARDIZATION: Normalize 'status' values to standardized format/string
			CAST(CostUSD AS DECIMAL(10,2)) AS cost_in_usd, -- DATA TRANSFORMATION: Casting data type
			CASE WHEN UPPER(LEFT(LOWER(TRIM(Department)),1)) + 
					  SUBSTRING(LOWER(TRIM(Department)),2,LEN(Department)) = 'Ops' THEN 'Operations'
				 ELSE UPPER(LEFT(LOWER(TRIM(Department)),1)) + SUBSTRING(LOWER(TRIM(Department)),2,LEN(Department))
			END AS department -- DATA NORMALIZATION/STANDARDIZATION: Normalize 'department' values to standardized format/string
		FROM bronze.mtce_mtce_rec;
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '------------------------------------------------';

		SET @batch_end_time = GETDATE();
		PRINT '================================================'
		PRINT 'Loading Silver Layer is Completed';
        PRINT '   - Total Load Duration: ' + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '================================================'
		
	END TRY
	BEGIN CATCH
		PRINT '================================================'
		PRINT 'ERROR OCCURED DURING LOADING SILVER LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '================================================'
	END CATCH
END
