-- ============================================
-- NOAA Weather Data Analysis
-- Dataset: bigquery-public-data.noaa_gsod.gsod2020
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: April 2026
-- ============================================

-- Query 1: Main Weather Data Query with Data Cleaning
-- Purpose: Retrieve temperature, wind speed, and precipitation for
-- La Guardia (725030) and JFK (744860) airports for all of 2020
-- Key concept: IF function replaces placeholder values with NULL
-- to clean missing data before analysis
SELECT
  stn,
  date,
  IF(temp = 9999.9, NULL, temp) AS temperature,
  IF(wdsp = "999.9", NULL, CAST(wdsp AS Float64)) AS wind_speed,
  IF(prcp = 99.99, 0, prcp) AS precipitation
FROM
  `bigquery-public-data.noaa_gsod.gsod2020`
WHERE
  stn = "725030" -- La Guardia
  OR stn = "744860" -- JFK
ORDER BY
  date DESC,
  stn ASC;

-- Query 2: Save results to permanent table
-- Purpose: Same query saved as nyc_weather table in demos dataset
-- Benefit: Avoids repeatedly querying the large public dataset
-- Results saved to: project.demos.nyc_weather

-- Query 3: Average Temperature - June 2020
-- Purpose: Answer meteorologist question about average June temperature
-- Finding: Average temperature was 72.883°F across both stations
SELECT
  AVG(temperature)
FROM
  `project-54c8fc5a-f6ff-479d-b1e.demos.nyc_weather`
WHERE
  date BETWEEN '2020-06-01' AND '2020-06-30';

-- Query 4: Average Wind Speed - June 2020
-- Purpose: Answer meteorologist question about average wind speed
-- Finding: Average wind speed was 8.25 mph in June 2020
SELECT
  AVG(wind_speed)
FROM
  `project-54c8fc5a-f6ff-479d-b1e.demos.nyc_weather`
WHERE
  date BETWEEN '2020-06-01' AND '2020-06-30';
