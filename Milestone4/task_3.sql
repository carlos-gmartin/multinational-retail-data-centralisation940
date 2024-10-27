SELECT 
    SUM(sale_amount) AS total_sales,   
    EXTRACT(MONTH FROM sale_date) AS month 
FROM 
    sales_table                           
GROUP BY 
    month
ORDER BY 
    total_sales DESC;                             
