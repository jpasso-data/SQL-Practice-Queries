-- NYC Subway Ridership Analysis
-- Dataset: bigquery-public-data.new_york_subway.subway_ridership_2013_present
-- Course: Google Data Analytics Certificate - Course 5
-- Author: Joe Passo | jpasso-data
-- Date: May 2026

-- =============================================
-- Step 3: Single operator calculation
-- Find the change in weekly ridership from 2013 to 2014
-- =============================================

SELECT
    station_name,
    ridership_2013,
    ridership_2014,
    ridership_2014-ridership_2013 AS change_2014_raw
FROM
    `bigquery-public-data.new_york_subway.subway_ridership_2013_present`

-- =============================================
-- Step 4: Multiple operators calculation
-- Find the average weekly ridership for 2013-2016
-- Parentheses ensure sum happens before division
-- =============================================

SELECT
    station_name,
    ridership_2013,
    ridership_2014,
    ridership_2015,
    ridership_2016,
    (ridership_2013 + ridership_2014 + ridership_2015 + ridership_2016) / 4 AS average
FROM
    `bigquery-public-data.new_york_subway.subway_ridership_2013_present`
