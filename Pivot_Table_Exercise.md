# Pivot Table Exercise

**Dataset:** Movie Data - 508 films with Budget, Box Office Revenue, Genre, Director
**Tool:** Google Sheets
**Course:** Google Data Analytics Certificate - Course 5
**Author:** Joe Passo | jpasso-data
**Date:** May 2026

---

## Objective
Use pivot tables to summarize and analyze a large movie dataset,
calculate averages, and visualize findings with a bar chart.

---

## Steps Completed

### Step 1 - Created Pivot Table
- Data range: 'Movie Data'!A1:N509
- Inserted into new sheet renamed "Summary"

### Step 2 - Average Box Office Revenue by Genre
- Rows: Genre (1)
- Values: AVERAGE of Box Office Revenue ($)
- Result: Adventure highest at $308,633,333

### Step 3 - Added Average Budget by Genre
- Added second value: AVERAGE of Budget ($)
- Allows side-by-side revenue vs budget comparison

### Step 4 - Calculated Average Profit Field
Formula used:
=AVERAGE('Box Office Revenue ($)')-AVERAGE('Budget ($)')
- Summarize by: Custom
- Column renamed to: Average Profit
- Sorted by Average Profit descending
- Result: Adventure most profitable at $225,804,761.90

### Step 5 - Created Bar Chart
- Chart type: Horizontal Bar chart
- Series: Average of Box Office Revenue ($) only
- Title: Average of Box Office Revenue ($) by Genre
- Sorted descending by revenue

### Step 6 - Switched Rows to Director
- Replaced Genre (1) with Director (1) in Rows
- Sorted by Average Box Office Revenue descending
- Result: Peter Jackson highest at $956,000,000

---

## Key Takeaways

- Pivot tables summarize large datasets instantly without complex formulas
- Calculated fields allow custom metrics derived from existing data
- Sorting by values rather than labels reveals ranked insights immediately
- Charts linked to pivot tables update automatically when data changes
- Filters can restrict pivot table results to specific subgroups

---

## Real World Application
Pivot tables are essential for rapid exploratory analysis in finance
and healthcare analytics — quickly answering "which group performs
best?" without writing a single formula from scratch.
