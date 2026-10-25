/*
===============================================================================
Quality Checks
===============================================================================
Script Purpose:
    This script performs quality checks to validate the integrity, consistency, 
    and accuracy of the Gold Layer. These checks ensure:
    - Uniqueness of primary keys in dimension tables.
    - Referential integrity between fact and dimension tables.
    - Validation of relationships in the data model for analytical purposes.

Usage Notes:
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ====================================================================
-- Checking 'gold.dim_asset'
-- ====================================================================
-- Check for uniqueness of asset ID in gold.dim_asset
-- Expectation: No results 
SELECT 
    asset_id,
    COUNT(*) AS duplicate_count
FROM gold.dim_asset
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.dim_department'
-- ====================================================================
-- Check for Uniqueness of department in gold.dim_department
-- Expectation: No results 
SELECT 
    department,
    COUNT(*) AS duplicate_count
FROM gold.dim_department
GROUP BY department
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.dim_date'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT
*
FROM gold.dim_date
-- Check for invalid dates and NULL
SELECT
full_date
FROM gold.dim_date
WHERE full_date <'1900-01-01' OR full_date > '2027-01-01' OR full_date IS NULL
-- Check for consitency and standardization
SELECT DISTINCT
month_number
FROM gold.dim_date;
SELECT DISTINCT
month_name
FROM gold.dim_date;
SELECT DISTINCT
day_of_week
FROM gold.dim_date;

-- ====================================================================
-- Checking 'gold.fact_inspection'
-- ====================================================================
-- Check foreign key integrity (Dimensions)
SELECT
*
FROM gold.fact_inspection fi
LEFT JOIN gold.dim_asset da
ON fi.asset_id = da.asset_id
WHERE fi.asset_id IS NULL

SELECT
*
FROM gold.fact_inspection fi
LEFT JOIN gold.dim_date dd
ON fi.inspection_date = dd.full_date
WHERE fi.inspection_date IS NULL

-- ====================================================================
-- Checking 'gold.fact_maintenance'
-- ====================================================================
SELECT
*
FROM gold.fact_maintenance fm
LEFT JOIN gold.dim_asset da
ON fm.asset_id = da.asset_id
WHERE fm.asset_id IS NULL

SELECT
*
FROM gold.fact_maintenance fm
LEFT JOIN gold.dim_date dd
ON fm.report_date = dd.full_date
WHERE fm.report_date IS NULL

SELECT
*
FROM gold.fact_maintenance fm
LEFT JOIN gold.dim_department ddp
ON fm.department = ddp.department
WHERE fm.department IS NULL
