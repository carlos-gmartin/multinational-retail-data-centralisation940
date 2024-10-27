SELECT 
    country AS country,
    COUNT(store_code) AS total_no_stores
FROM 
    store_details_table
GROUP BY 
    country
ORDER BY 
    total_no_stores DESC;
