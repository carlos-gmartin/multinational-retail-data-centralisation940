SELECT 
    COUNT(*) AS numbers_of_sales,                       
    SUM(product_quantity) AS product_quantity_count,   
    sale_location AS location                           
FROM 
    sales_table                                         
GROUP BY 
    sale_location                                        
ORDER BY 
    location;                                          
