-- ==========================================
-- Subquery Exercises - NYC Citibike Trips
-- Dataset: bigquery-public-data.new_york_citibike.citibike_trips
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: April 2026
-- ==========================================

-- ==========================================
-- STEP 2: Subquery to Find Average Trip Duration by Station
-- ==========================================

-- Query 1: Average trip duration per station ordered by longest first
-- Purpose: Use a subquery in the FROM clause to calculate the average
--          trip duration grouped by start station, then order results
--          by highest average duration descending
-- Returns: 882 rows - one per station with avg_duration
SELECT
  subquery.start_station_id,
  subquery.avg_duration
FROM
  (
    SELECT
      start_station_id,
      AVG(tripduration) AS avg_duration
    FROM bigquery-public-data.new_york_citibike.citibike_trips
    GROUP BY start_station_id
  ) AS subquery
ORDER BY avg_duration DESC;

-- ==========================================
-- STEP 3: Subquery to Compare Trip Duration by Station to Overall Average
-- ==========================================

-- Query 2: Compare each trip's duration to its station's average duration
-- Purpose: For each trip, calculate:
--   1. The average trip duration for that specific station (avg_duration_for_station)
--   2. The difference between that trip and its station average (difference_from_avg)
-- Uses correlated subqueries in the SELECT clause referencing outer_trips alias
-- Returns: Top 25 trips with the largest positive difference from their station average
SELECT
  starttime,
  start_station_id,
  tripduration,
  (
    SELECT ROUND(AVG(tripduration), 2)
    FROM bigquery-public-data.new_york_citibike.citibike_trips
    WHERE start_station_id = outer_trips.start_station_id
  ) AS avg_duration_for_station,
  ROUND(tripduration - (
    SELECT AVG(tripduration)
    FROM bigquery-public-data.new_york_citibike.citibike_trips
    WHERE start_station_id = outer_trips.start_station_id), 2) AS difference_from_avg
FROM bigquery-public-data.new_york_citibike.citibike_trips AS outer_trips
ORDER BY difference_from_avg DESC
LIMIT 25;

-- ==========================================
-- STEP 4: Nested Subquery to Find the Five Stations with Longest Mean Trip Duration
-- ==========================================

-- Query 3: All trips from the top 5 stations by average trip duration
-- Purpose: Use a nested subquery (query within a query within a query) to:
--   1. Inner subquery: Calculate avg trip duration per station, grouped by station
--   2. Middle subquery: Select only the top 5 station IDs ordered by avg duration DESC
--   3. Outer query: Return all trips WHERE the station is IN that top 5 list
-- Returns: 1,768 rows - all trips from only the 5 highest avg duration stations
SELECT
  tripduration,
  start_station_id
FROM bigquery-public-data.new_york_citibike.citibike_trips
WHERE start_station_id IN
  (
    SELECT
      start_station_id
    FROM
      (
        SELECT
          start_station_id,
          AVG(tripduration) AS avg_duration
        FROM bigquery-public-data.new_york_citibike.citibike_trips
        GROUP BY start_station_id
      ) AS top_five
    ORDER BY avg_duration DESC
    LIMIT 5
  );

-- Query 4: Modification - Find trips from the five stations with LOWEST avg duration
-- Purpose: Demonstrate how changing ORDER BY DESC to ASC reverses the filter
--          to return the bottom 5 stations instead of the top 5
-- Change: ORDER BY avg_duration ASC (was DESC in Query 3)
SELECT
  tripduration,
  start_station_id
FROM bigquery-public-data.new_york_citibike.citibike_trips
WHERE start_station_id IN
  (
    SELECT
      start_station_id
    FROM
      (
        SELECT
          start_station_id,
          AVG(tripduration) AS avg_duration
        FROM bigquery-public-data.new_york_citibike.citibike_trips
        GROUP BY start_station_id
      ) AS bottom_five
    ORDER BY avg_duration ASC
    LIMIT 5
  );
