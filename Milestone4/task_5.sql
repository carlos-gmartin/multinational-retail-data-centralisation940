SELECT 
    store_type, 
    SUM(total_sales) AS total_sales, 
    ROUND(SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) OVER (), 2) AS sales_made_percent
FROM 
    sales_table
GROUP BY 
    store_type
ORDER BY 
    total_sales DESC;
