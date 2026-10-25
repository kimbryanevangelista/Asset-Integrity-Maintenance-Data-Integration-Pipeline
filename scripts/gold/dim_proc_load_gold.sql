/*
===============================================================================
STORED PROCEDURE: Load Gold Layer (Silver -> Gold)
===============================================================================
SCRIPT PURPOSE:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'gold' schema tables from the 'silver' schema.
	ACTIONS PERFORMED:
		- Truncates Gold tables.
		- Inserts transformed and cleansed data from Silver into Gold tables.
		
PARAMETERS:
    None. 
	This stored procedure does not accept any parameters or return any values.

USAGE EXAMPLE:
    EXEC Gold.load_gold;
===============================================================================
*/

CREATE OR ALTER PROCEDURE Gold.load_gold AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME; 
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '================================================';
        PRINT 'Loading Gold Layer';
        PRINT '================================================';
        
        PRINT '------------------------------------------------';
		PRINT 'Loading Dimension Tables';
		PRINT '------------------------------------------------';

        -- Loading gold.dim_asset
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: gold.dim_asset';
        TRUNCATE TABLE gold.dim_asset;
        PRINT '>> Inserting Data Into: gold.dim_asset';
        INSERT INTO gold.dim_asset (asset_id)
        SELECT DISTINCT
	        asset_id
        FROM silver.insp_insp_rec
        UNION
        SELECT DISTINCT
	        asset_id
        FROM silver.mtce_mtce_rec;
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '------------------------------------------------';
        

        -- Loading gold.dim_department
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: gold.dim_department';
        TRUNCATE TABLE gold.dim_department;
        PRINT '>> Inserting Data Into: gold.dim_department';
        INSERT INTO gold.dim_department (department)
        SELECT DISTINCT
	        department
        FROM silver.mtce_mtce_rec;
        SET @end_time = GETDATE();
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
        PRINT '------------------------------------------------';

        -- Loading gold.dim_date
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: gold.dim_date';
        TRUNCATE TABLE gold.dim_date;
        PRINT '>> Inserting Data Into: gold.dim_date';
        WITH DateRange AS (
            SELECT CAST('2024-01-01' AS DATE) AS CalendarDate
            UNION ALL
            SELECT DATEADD(day, 1, CalendarDate)
            FROM DateRange
            WHERE CalendarDate < '2026-12-31'
        )
        INSERT INTO gold.dim_date (date_key, full_date, year, quarter, month_number, month_name, day_of_week)
        SELECT 
            CAST(FORMAT(CalendarDate, 'yyyyMMdd') AS INT) AS date_key,
            CalendarDate AS full_date,
            YEAR(CalendarDate) AS year,
            DATEPART(quarter, CalendarDate) AS quarter,
            MONTH(CalendarDate) AS month_number,
            DATENAME(month, CalendarDate) AS month_name,
            DATENAME(weekday, CalendarDate) AS day_of_week
        FROM DateRange
        OPTION (MAXRECURSION 1100);
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
