# HAVING Clause Practice

**Focus:** Strengthening core SQL skills through self-directed practice exercises.

**Today's Topic:** `HAVING` clause

---

## Concepts Covered

- Using `HAVING` to filter groups after aggregation
- Understanding the difference between `WHERE` (row-level filter) and `HAVING` (group-level filter)
- Combining `GROUP BY` with `HAVING` to answer business questions like "show only regions where total sales exceed 500"
- Updated SQL clause order: `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`

## Exercises Completed

| Exercise | Query Focus |
|---|---|
| Customers with 1+ Orders | `SELECT customer, COUNT(*) FROM orders GROUP BY customer HAVING COUNT(*) > 1` |
| Regions Exceeding 500 | `SELECT region, SUM(amount) FROM orders GROUP BY region HAVING SUM(amount) > 500` |
| Avg Salary by Department | `SELECT department, AVG(salary) FROM employees GROUP BY department` |

## Key Takeaway

> `WHERE` filters rows before grouping. `HAVING` filters groups after aggregating. You can't use `WHERE` on an aggregate function — that's what `HAVING` is for.

---
*Part of ongoing SQL self-study alongside the Google Data Analytics Certificate.*
