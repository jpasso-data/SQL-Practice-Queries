# GROUP BY Practice

**Focus:** Strengthening core SQL skills through self-directed practice exercises.

**Today's Topic:** `GROUP BY` queries

---

## Concepts Covered

- Using `GROUP BY` to split data into groups and apply aggregate functions per group
- Combining `GROUP BY` with `SUM()`, `COUNT()`, `MAX()`, and `AVG()`
- Understanding SQL clause order: `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `ORDER BY` → `LIMIT`

## Exercises Completed

| Exercise | Query Focus |
|---|---|
| Sales by Region | `SELECT region, SUM(amount) FROM orders GROUP BY region` |
| Orders Per Customer | `SELECT customer, COUNT(*) FROM orders GROUP BY customer` |
| Max Price by Category | `SELECT category, MAX(price) FROM products GROUP BY category` |
| Avg Salary by Department | `SELECT department, AVG(salary) FROM employees GROUP BY department` |

## Key Takeaway

> Every column in `SELECT` must either appear in `GROUP BY` or be wrapped in an aggregate function.

---
*Part of ongoing SQL self-study alongside the Google Data Analytics Certificate.*
