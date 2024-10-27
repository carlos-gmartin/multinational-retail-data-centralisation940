SELECT 
    SUM(total_sales) AS total_sales,
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month
FROM 
    sales_table 
GROUP BY 
    year, month
ORDER BY 
    total_sales DESC;
