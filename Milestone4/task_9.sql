SELECT 
    dim_date_times.year,
    CONCAT(
        '"hours": ', 
        FLOOR(AVG(EXTRACT(EPOCH FROM dim_date_times.time_diff)) / 3600), 
        ', "minutes": ', 
        FLOOR((AVG(EXTRACT(EPOCH FROM dim_date_times.time_diff)) % 3600) / 60), 
        ', "seconds": ', 
        ROUND(AVG(EXTRACT(EPOCH FROM dim_date_times.time_diff)) % 60, 2)
    ) AS actual_time_taken
FROM 
    dim_date_times
GROUP BY 
    dim_date_times.year
ORDER BY 
    AVG(EXTRACT(EPOCH FROM dim_date_times.time_diff)) DESC;
