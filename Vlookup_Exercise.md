# VLOOKUP Exercise - Employee Payroll Analysis

**Dataset:** Employee Timesheet - Hours Worked and Pay Rates  
**Tool:** Google Sheets  
**Course:** Google Data Analytics Certificate - Course 5  
**Author:** Joe Passo | jpasso-data  
**Date:** April 2026  

---

## Objective
Use VLOOKUP to combine employee timesheet data from two separate 
sheets, clean the data, calculate total pay, and summarize results 
in a pivot table.

---

## Functions Used

### TRIM - Remove extra spaces
=TRIM(B2)
**Purpose:** Cleans employee names that contain extra spaces imported 
from source data. Extra spaces cause VLOOKUP to fail if not removed.

---

### VALUE - Convert text to numbers
=VALUE(C2)
**Purpose:** Converts hours stored as text into numeric values so 
they can be used in calculations.

---

### SUM - Total hours per employee
=SUM(C15:H15)
**Purpose:** Adds up all hours worked across 6 days for each employee.

---

### VLOOKUP - Import pay rate from Sheet2
=VLOOKUP(A2, Sheet2!A$2:
D$6, 4, false)
**Purpose:** Looks up each employee by ID in Sheet2 and returns 
their hourly pay rate.

**Syntax breakdown:**
- A2 = lookup value (Employee ID)
- Sheet2!$A$2:$D$6 = table range (locked with $ to allow dragging)
- 4 = column number to return (Pay Rate is in column 4)
- false = exact match required

---

### PRODUCT - Calculate total pay
=PRODUCT(I15, J15)
**Purpose:** Multiplies total hours × pay rate to calculate 
each employee's total pay.

---

## Results Summary (Pivot Table)

| Employee | Pay Rate | Total Pay |
|---|---|---|
| Ali, Dana | $75.00 | $3,450.00 |
| Chan, Daniel | $100.50 | $3,919.50 |
| Fischer, Wolfgang | $65.00 | $2,730.00 |
| Patel, Anika | $3,000.00 | $88,500.00 |
| Sanchez, Alexis | $150.00 | $6,600.00 |
| **Grand Total** | **$3,390.50** | **$105,199.50** |

---

## Key Takeaways

- **VLOOKUP** is essential for combining data from multiple tables
- The **$** symbol locks cell references so formulas work when dragged
- Always use **false** for exact matches in VLOOKUP
- **TRIM** and **VALUE** are critical data cleaning steps before analysis
- **Pivot tables** summarize large datasets into readable reports
- Real world data rarely comes clean — preparation before analysis 
  is a core analyst responsibility

---

## Real World Application
This exercise simulates a common HR/payroll analytics scenario — 
combining timesheet data with compensation data from separate systems 
to calculate total payroll. The same VLOOKUP pattern applies to 
financial, healthcare, and compliance datasets where related data 
lives in separate tables.
