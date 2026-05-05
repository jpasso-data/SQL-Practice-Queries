# CO2 Emissions Tableau Visualization
## Course: Google Data Analytics Certificate - Course 6
## Author: Joe Passo | jpasso-data
## Date: May 2026

## Overview
Used Tableau Public to create an interactive bubble map visualizing 
CO2 emissions by country using the World Bank CO2 dataset.

## Dataset
- **Source:** World Bank CO2 Dataset (bigquery-public-data)
- **Sheet Used:** CO2 Data Cleaned
- **Records:** 11,127 rows | 6 fields

## Fields Used
- Country Name (Dimension)
- CO2 (kt) (Measure - controls bubble size)

## Visualization
- **Chart Type:** Bubble Map
- **X/Y Axis:** Longitude/Latitude (generated)
- **Size:** SUM(CO2 kt) — larger bubbles = higher emissions
- **Key Finding:** USA and China show significantly higher CO2 
  emissions compared to all other countries

## Skills Practiced
- Connecting data sources in Tableau Public
- Understanding dimensions vs. measures
- Customizing marks (color, size, label)
- Editing chart titles
