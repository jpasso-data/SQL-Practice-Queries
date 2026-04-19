-- ============================================
-- CDC Births Data Analysis
-- Dataset: bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: April 2026
-- ============================================

-- Query 1: Basic Exploration
-- Purpose: Examine the dataset structure by retrieving the first 1,000 rows
SELECT
  *
FROM
  bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
LIMIT 1000;

-- Query 2: ORDER BY Ascending (default)
-- Purpose: Find the 10 counties with the fewest births
SELECT
  *
FROM
  bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
ORDER BY
  Births
LIMIT 10;

-- Query 3: ORDER BY Explicit ASC
-- Purpose: Same as above with explicit ascending sort - results identical to Query 2
SELECT
  *
FROM
  bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
ORDER BY
  Births ASC
LIMIT 10;

-- Query 4: ORDER BY Descending
-- Purpose: Find the 10 counties with the MOST births
-- Finding: Los Angeles County, CA had the highest births (123,092 in 2016)
SELECT
  *
FROM
  bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
ORDER BY
  Births DESC
LIMIT 10;

-- Query 5: WHERE with multiple OR conditions + ORDER BY two columns
-- Purpose: Filter to three specific NY counties and sort by county and year
-- to analyze birth trends over time (2016-2018)
SELECT
  *
FROM
  bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
WHERE
  County_of_Residence = 'Erie County, NY'
  OR County_of_Residence = 'Niagara County, NY'
  OR County_of_Residence = 'Chautauqua County, NY'
ORDER BY
  County_of_Residence,
  Year;

-- Query 6: WHERE + ORDER BY Births DESC
-- Purpose: Identify the highest single-year birth count among the three counties
-- Finding: Erie County, NY had the most births in 2016 (9,916)
-- Observation: All three counties show a declining birth trend from 2016-2018
SELECT
  *
FROM
  bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
WHERE
  County_of_Residence = 'Erie County, NY'
  OR County_of_Residence = 'Niagara County, NY'
  OR County_of_Residence = 'Chautauqua County, NY'
ORDER BY
  Births DESC;
