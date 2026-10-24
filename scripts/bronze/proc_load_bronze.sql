/*
================================================================
STORED PROCEDURE: Load Bronze Layer (Source -> Bronze)
================================================================
SCRIPT PURPOSE:
	This stored procedure loads data into the 'bronze' schema from external CSV files.
	It performs the following actions:
	- Truncates the bronze tables before loading the data.
	- Uses the 'BUL INSERT' command to load data from CSV files to bronze tables.

PARAMETERS:
	None.
	This stored procedure does not accept any parameters or return any values.

USAGE EXAMPLE:
EXEC bronze.load_bronze
================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '================================================='
		PRINT 'Loading Bronze Layer'
		PRINT '================================================='

		PRINT'--------------------------------------------------'
		PRINT 'Loading INSP table'
		PRINT'--------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.insp_insp_rec'
		TRUNCATE TABLE bronze.insp_insp_rec;

		PRINT '>> Inserting Data Into: bronze.insp_insp_rec'
		BULK INSERT bronze.insp_insp_rec
		FROM 'C:\Users\kimbr\OneDrive\Desktop\Brave_Analytics_Bootcamp\Datasets\source_insp\insp_rec.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT'--------------------------------------------------'

		PRINT '================================================='
		PRINT 'Loading Bronze Layer'
		PRINT '================================================='

		PRINT'--------------------------------------------------'
		PRINT 'Loading MTCE table'
		PRINT'--------------------------------------------------'

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.mtce_mtce_rec'
		TRUNCATE TABLE bronze.mtce_mtce_rec;

		PRINT '>> Inserting Data Into: bronze.mtce_mtce_rec'
		BULK INSERT bronze.mtce_mtce_rec
		FROM 'C:\Users\kimbr\OneDrive\Desktop\Brave_Analytics_Bootcamp\Datasets\source_mtce\mtce_rec.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT'--------------------------------------------------'

		SET @batch_end_time = GETDATE();
		PRINT '================================================='
		PRINT 'Loading Bronze Layer is Completed'
		PRINT ' - Total Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
		PRINT '================================================='
	END TRY
	BEGIN CATCH
		PRINT '================================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '================================================='
	END CATCH
END
