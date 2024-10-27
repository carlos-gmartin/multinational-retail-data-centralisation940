SELECT 
    SUM(total_sales) AS total_sales,
    store_type,
    country_code
FROM 
    orders_table
JOIN 
    dim_store_details
ON 
    orders_table.store_code = dim_store_details.store_code
WHERE 
    dim_store_details.country_code = 'DE'
GROUP BY 
    store_type, country_code
ORDER BY 
    total_sales DESC;
