-- ==========================================
-- Subquery Exercises - FDA Food Events
-- Dataset: bigquery-public-data.fda_food.food_events
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: April 2026
-- ==========================================

-- ==========================================
-- STEP 2: Gather an Initial Overview
-- ==========================================

-- Query 1: Top 10 product industries by number of complaints
-- Purpose: Identify which food industries have the highest number of
--          FDA food event reports to prioritize further analysis
-- Notes:
--   - COUNT tallies total reports per industry
--   - GROUP BY organizes results under each industry name
--   - Results saved to destination table: demos.reports_by_industry
-- Returns: 10 rows ordered by count_reports DESC
SELECT
  products_industry_name,
  COUNT(report_number) AS count_reports
  --SELECT identifies product industries by name; COUNT tallies the number of reports
FROM bigquery-public-data.fda_food.food_events
GROUP BY products_industry_name
ORDER BY count_reports DESC
LIMIT 10;
--The query groups product industries by name so report results fall under each industry

-- ==========================================
-- STEP 3: Determine the Number of Hospitalizations
-- ==========================================

-- Query 2: Top 10 industries by hospitalization count (subquery)
-- Purpose: Filter the top 10 industries from Query 1 and further narrow
--          results to only complaints that resulted in hospitalizations
-- Notes:
--   - Outer query: counts hospitalizations per industry, orders DESC
--   - Subquery (WHERE IN): limits results to only the top 10 industries
--     by total report count from the food_events table
--   - AND outcomes LIKE '%Hospitalization%' filters for hospitalization outcomes
--   - The LIKE operator searches for a specified pattern in the outcomes column
--   - The AND operator requires all conditions to be TRUE for a record to display
-- Results saved to destination table: demos.hospitalizations_by_industry
-- Returns: 10 rows ordered by count_hospitalizations DESC
SELECT
  products_industry_name,
  COUNT(report_number) AS count_hospitalizations
FROM
  bigquery-public-data.fda_food.food_events
WHERE products_industry_name IN
  (SELECT
    products_industry_name
  FROM
    bigquery-public-data.fda_food.food_events
  GROUP BY products_industry_name
  ORDER BY COUNT(report_number) DESC LIMIT 10)
  AND outcomes LIKE '%Hospitalization%'
  --The AND operator displays a record if all the conditions are TRUE.
  --The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
GROUP BY products_industry_name
ORDER BY count_hospitalizations DESC;
