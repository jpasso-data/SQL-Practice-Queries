# CONCATENATE Function Exercise

**Dataset:** US Presidents - First Name, Last Name, Month, Day, Year  
**Tool:** Google Sheets  
**Course:** Google Data Analytics Certificate - Course 5  
**Author:** Joe Passo | jpasso-data  
**Date:** April 2026  

---

## Objective
Practice combining data from multiple cells into a single value using 
CONCAT and CONCATENATE functions in Google Sheets.

---

## Concepts Covered

### CONCAT - Basic two-cell combination
=CONCAT(A2,B2)
**Result:** `GeorgeWashington` (no space — combines cells directly)

---

### CONCATENATE - Multiple values with custom separator
=CONCATENATE(A2," ",B2)
**Result:** `George Washington` (space inserted between names)

---

### CONCATENATE - Three cells with separators
=CONCATENATE(C2,", ",D2,", ",E2)
**Result:** `April, 30, 1789` (combines Month, Day, Year into a date string)

---

## Key Takeaways

- **CONCAT** joins two cells directly with no separator
- **CONCATENATE** allows multiple values and custom text between them
- Any text placed inside quotes `" "` is inserted literally between values
- Use the **click-and-drag fill handle** to apply formulas to entire columns
- Raw data often stores related values in separate columns — 
  CONCATENATE lets you combine them for reporting and analysis

---

## Real World Application
In analytics roles, source data rarely arrives in the exact format 
needed for reporting. CONCATENATE is a core data wrangling tool for 
reshaping and formatting data before analysis.
