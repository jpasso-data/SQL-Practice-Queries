-- ========================================
-- Sales Inventory Analysis
-- Dataset: sales.sales_info
-- Tables: sales_info (contains sales transaction data)
-- Author: Joe Passo | jpasso-data
-- Course: Google Data Analytics Certificate - Course 5
-- Date: May 2026
-- Note: Query extracts Year, Month, ProductId, max UnitPrice, 
--       and total UnitsSold. Results exported to Google Sheets
--       and joined with Inventory and Products CSVs.
-- ========================================

SELECT 
    EXTRACT(YEAR FROM date) AS Year,
    EXTRACT(MONTH FROM date) AS Month,
    ProductId,
    ROUND(MAX(UnitPrice), 2) AS UnitPrice,
    SUM(Quantity) AS UnitsSold
FROM sales.sales_info
GROUP BY Year, Month, ProductId
ORDER BY Year, Month, ProductId;
