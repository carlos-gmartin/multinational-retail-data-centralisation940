-- Task 6: Update the data types for dim_date_times table
ALTER TABLE dim_date_times
    ALTER COLUMN month TYPE VARCHAR(9),      -- Longest month is September
    ALTER COLUMN year TYPE VARCHAR(4),       -- Year is typically 4 characters
    ALTER COLUMN day TYPE VARCHAR(9),        -- Longest day name is Wednesday
    ALTER COLUMN time_period TYPE VARCHAR(2),-- AM or PM, so VARCHAR(2)
    ALTER COLUMN date_uuid TYPE UUID USING date_uuid::UUID;
