/*
===============================================================================
QUALITY CHECKS
===============================================================================
SCRIPT PURPOSE:
    This script performs various quality checks for data consistency, accuracy, 
    and standardization across the 'silver' layer. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

USAGE NOTES:
    - Run these checks after data loading Silver Layer.
    - Investigate and resolve any discrepancies found during the checks.
===============================================================================
*/

-- ============================================================================
-- Checking 'silver.insp_insp_rec'
-- ============================================================================
-- Column inspection_id (primary key)
-- Check for NULLS or DUPLICATES
-- Expectation: NO RESULT
SELECT
inspection_id,
COUNT(*)
FROM silver.insp_insp_rec
GROUP BY inspection_id
HAVING COUNT(*) > 1 OR inspection_id is NULL

-- Column asset_id
-- Check for NULLS
-- Expectation: NO RESULT
SELECT
asset_id,
COUNT(*)
FROM silver.insp_insp_rec
GROUP BY asset_id
HAVING asset_id IS NULL
--Check for unwanted spaces
SELECT
asset_id
FROM silver.insp_insp_rec
WHERE asset_id != TRIM(asset_id)

-- Column inspection_date
-- Check for NULLS
-- Expectation: NO RESULT
SELECT
inspection_date,
COUNT(*)
FROM silver.insp_insp_rec
GROUP BY inspection_date
HAVING inspection_date IS NULL

-- Column thickness_in_mm
--Check for Negative Numbers (NULL is acceptable)
SELECT
thickness_in_mm
FROM silver.insp_insp_rec
WHERE thickness_in_mm < 0

-- Column corrosion_rate
-- Data Standardization & Consistency (NULL is acceptable)
SELECT DISTINCT
corrosion_rate
FROM silver.insp_insp_rec

-- Column result
-- Data Standardization & Consistency
SELECT DISTINCT
result
FROM silver.insp_insp_rec

-- Column inspector
-- Data Standardization & Consistency
SELECT DISTINCT
inspector
FROM silver.insp_insp_rec


-- ============================================================================
-- Checking 'silver.mtce_mtce_rec'
-- ============================================================================
-- Column work_order_id
-- Check for NULLS or DUPLICATES
-- Expectation: NO RESULT
SELECT
work_order_id,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY work_order_id
HAVING COUNT(*) > 1 OR work_order_id is NULL

-- Column report_date
-- Check for NULLS and invalid dates
-- Expectation: NO RESULT
SELECT
report_date,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY report_date
HAVING report_date IS NULL OR 
	report_date < '1900-01-01' OR 
	report_date > '2050-01-01'

-- Column asset_id
-- Check for NULLS
-- Expectation: NO RESULT
SELECT
asset_id,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY asset_id
HAVING asset_id IS NULL
-- Check for unwanted spaces
SELECT
asset_id
FROM silver.mtce_mtce_rec
WHERE asset_id != TRIM(asset_id)

-- Column failure_mode
-- Check for NULLS
-- Expectation: NO RESULT
SELECT
failure_mode,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY failure_mode
HAVING failure_mode IS NULL
-- Check for unwanted spaces
SELECT
failure_mode
FROM silver.mtce_mtce_rec
WHERE failure_mode != TRIM(failure_mode)
-- Check for standardization & cosistency
SELECT DISTINCT
failure_mode
FROM silver.mtce_mtce_rec

-- Column status
-- Check for NULLS
-- Expectation: NO RESULT
SELECT
status,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY status
HAVING status IS NULL
-- Check for unwanted spaces
SELECT
status
FROM silver.mtce_mtce_rec
WHERE status != TRIM(status)
-- Check for standardization & cosistency
SELECT DISTINCT
status
FROM silver.mtce_mtce_rec

-- Column priority
-- Check for NULLS
-- Expectation: NO RESULT
SELECT
priority,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY priority
HAVING priority IS NULL
-- Check for standardization & cosistency
SELECT DISTINCT
priority
FROM silver.mtce_mtce_rec

-- Column cost_in_usd
-- Check for negative values (NULL is accepted)
-- Expectation: NO RESULT
SELECT
cost_in_usd,
COUNT(*)
FROM silver.mtce_mtce_rec
GROUP BY cost_in_usd
HAVING cost_in_usd IS NULL OR cost_in_usd < 0

-- Column department
-- Data Standardization & Consistency
SELECT DISTINCT
department
FROM silver.mtce_mtce_rec
