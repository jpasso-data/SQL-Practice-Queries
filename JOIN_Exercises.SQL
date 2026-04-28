-- ==========================================
-- JOIN Exercises - World Bank & NCAA Data
-- Dataset: bigquery-public-data.world_bank_intl_education
--          bigquery-public-data.ncaa_basketball
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: April 2026
-- ==========================================

-- ==========================================
-- STEP 4: Query the Dataset and Incorporate Aliases
-- ==========================================

-- Query 1: Basic INNER JOIN (No Aliases)
-- Purpose: Join country_summary and international_education tables
--          on country_code to return country name, code, and value
SELECT
  `bigquery-public-data.world_bank_intl_education.international_education`.country_name,
  `bigquery-public-data.world_bank_intl_education.country_summary`.country_code,
  `bigquery-public-data.world_bank_intl_education.international_education`.value
FROM `bigquery-public-data.world_bank_intl_education.international_education`
INNER JOIN `bigquery-public-data.world_bank_intl_education.country_summary`
  ON `bigquery-public-data.world_bank_intl_education.country_summary`.country_code =
     `bigquery-public-data.world_bank_intl_education.international_education`.country_code;

-- Query 2: Same INNER JOIN Using Aliases
-- Purpose: Rewrite Query 1 using table aliases for readability
--          'edu' = international_education, 'summary' = country_summary
SELECT
  edu.country_name,
  summary.country_code,
  edu.value
FROM `bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
  ON edu.country_code = summary.country_code;

-- ==========================================
-- STEP 5: Use a JOIN to Answer a Question
-- ==========================================

-- Query 3: Secondary Education Population by Region (2015)
-- Purpose: Answer the question - In 2015, how many people were of
--          official secondary education age, broken down by world region?
-- Notes:
--   - Excludes rows where region is NULL
--   - Filters to the specific secondary education population indicator
--   - Groups and sums by region
--   - Orders by highest population first
SELECT
  summary.region,
  SUM(edu.value) AS secondary_edu_population
FROM `bigquery-public-data.world_bank_intl_education.international_education` AS edu
INNER JOIN `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
  ON edu.country_code = summary.country_code
WHERE summary.region IS NOT NULL
  AND edu.indicator_name = 'Population of the official age for secondary education, both sexes (number)'
  AND edu.year = 2015
GROUP BY summary.region
ORDER BY secondary_edu_population DESC;

-- ==========================================
-- STEP 6: INNER JOIN vs LEFT JOIN
-- ==========================================

-- Query 4: NCAA Division 1 Wins by Team - LEFT JOIN (320 rows)
-- Purpose: Return all Division 1 teams and their mascots (if available)
--          with average wins, losses, and ties in the 1990s.
--          LEFT JOIN is used because not all teams have a mascot record.
--          Teams without mascots are included with NULL in team_mascot.
SELECT
  seasons.market AS university,
  seasons.name AS team_name,
  mascots.mascot AS team_mascot,
  AVG(seasons.wins) AS avg_wins,
  AVG(seasons.losses) AS avg_losses,
  AVG(seasons.ties) AS avg_ties
FROM `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons
LEFT JOIN `bigquery-public-data.ncaa_basketball.mascots` AS mascots
  ON seasons.team_id = mascots.id
WHERE seasons.season BETWEEN 1990 AND 1999
  AND seasons.division = 1
GROUP BY 1, 2, 3
ORDER BY avg_wins DESC, university;

-- Query 5: Same Query Using INNER JOIN (317 rows)
-- Purpose: Demonstrate the difference between LEFT JOIN and INNER JOIN.
--          INNER JOIN excludes 3 teams that have no matching mascot record,
--          reducing the result from 320 rows (LEFT JOIN) to 317 rows.
SELECT
  seasons.market AS university,
  seasons.name AS team_name,
  mascots.mascot AS team_mascot,
  AVG(seasons.wins) AS avg_wins,
  AVG(seasons.losses) AS avg_losses,
  AVG(seasons.ties) AS avg_ties
FROM `bigquery-public-data.ncaa_basketball.mbb_historical_teams_seasons` AS seasons
INNER JOIN `bigquery-public-data.ncaa_basketball.mascots` AS mascots
  ON seasons.team_id = mascots.id
WHERE seasons.season BETWEEN 1990 AND 1999
  AND seasons.division = 1
GROUP BY 1, 2, 3
ORDER BY avg_wins DESC, university;
