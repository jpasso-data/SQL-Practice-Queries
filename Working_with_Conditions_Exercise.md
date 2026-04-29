# Working with Conditions Exercise

**Dataset:** Salesperson data — Name, State, Clients, Sales, Max Item Value  
**Tool:** Google Sheets  
**Course:** Google Data Analytics Certificate - Course 5  
**Author:** Joe Passo | jpasso-data  
**Date:** April 2026  

---

## Objective
Practice using conditional functions to extract specific insights from 
a dataset based on one or more criteria.

---

## Functions Covered

### COUNTIF — Count rows matching one condition
=COUNTIF(B2:B21, "NY")
**Result:** 6 — six salespeople are based in New York

---

### COUNTIFS — Count rows matching multiple conditions
=COUNTIFS(B2:B21, "NY", C2:C21, "1")
**Result:** 4 — four NY salespeople have exactly 1 client

---

### SUMIF — Sum values matching one condition
=SUMIF(G2:G21, ">500", G2:G21)
**Result:** 19007.61 — total commissions over $500

---

### AVERAGEIF — Average values matching one condition
=AVERAGEIF(B2:B21, "NY", D2:D21)
**Result:** 902.88 — average sales for NY salespeople

---

### MAXIFS — Maximum value matching one or more conditions
=MAXIFS(D2:D21, B2:B21, "NY")
**Result:** 1666.61 — highest sales among NY salespeople

=MAXIFS(D2:D21, B2:B21, "NY", E2:E21, "<400")
**Result:** 964.69 — highest NY sales where max item value was under $400

---

## Key Takeaways

- **COUNTIF/SUMIF/AVERAGEIF** take one range and one condition
- **COUNTIFS/MAXIFS** support multiple ranges and conditions
- Argument order matters — max_range always comes first in MAXIFS
- Text conditions go in quotes; numeric comparisons use operators like "<400"
- Each additional condition must be satisfied simultaneously

---

## Real World Application
Conditional functions allow analysts to slice datasets without 
filtering or pivot tables — essential for quick, inline analysis 
of subgroups within a larger dataset.
