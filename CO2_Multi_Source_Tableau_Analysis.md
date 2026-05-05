# CO2 Multi-Source Tableau Analysis
## Course: Google Data Analytics Certificate - Course 6
## Author: Joe Passo | jpasso-data
## Date: May 2026

## Overview
Used Tableau Public to join four separate datasets and create an 
interactive choropleth map visualizing CO2 Per Capita emissions by country.

## Datasets Joined
- **CO2 Data Cleaned** (primary) - World Bank CO2 emissions data
- **Energy** - Energy use (kg of oil equivalent per capita)
- **gdptotal** - Current GDP by country and year
- **totalpopulation** - Total population by country and year

## Join Structure
- All four tables joined to CO2 Data Cleaned
- Join keys: Year + Country Name (matched to equivalent fields in each table)
- Join type: Inner join
- Resulting dataset: 3,472 rows | Years 2000-2011

## Visualization
- **Chart Type:** Choropleth world map
- **Color:** SUM(CO2 Per Capita) — Red-Green Diverging, Reversed
- **Range:** 0 to 62 metric tons
- **Filter:** Year (2000-2011)
- **Key Insight:** Developed nations show significantly higher CO2 
  per capita than developing nations

## Skills Practiced
- Joining multiple data sources in Tableau
- Managing data type mismatches across tables
- Applying diverging color palettes to highlight contrast
- Adding interactive filters to visualizations
- Published to Tableau Public
