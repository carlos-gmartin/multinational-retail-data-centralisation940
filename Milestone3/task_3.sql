-- Task 3.1: Merge two latitude columns
UPDATE store_details_table
SET latitude = COALESCE(latitude_1, latitude_2);

-- Drop the unnecessary latitude column (assumed to be latitude_2)
ALTER TABLE store_details_table
DROP COLUMN latitude_2;

-- Task 3.2: Alter the data types in store_details_table
ALTER TABLE store_details_table
    ALTER COLUMN longitude TYPE NUMERIC USING longitude::NUMERIC,
    ALTER COLUMN locality TYPE VARCHAR(255),
    ALTER COLUMN store_code TYPE VARCHAR(10),   -- Adjust length based on data
    ALTER COLUMN staff_numbers TYPE SMALLINT USING staff_numbers::SMALLINT,
    ALTER COLUMN opening_date TYPE DATE USING to_date(opening_date, 'YYYY-MM-DD'),
    ALTER COLUMN store_type TYPE VARCHAR(255),
    ALTER COLUMN latitude TYPE NUMERIC USING latitude::NUMERIC,
    ALTER COLUMN country_code TYPE VARCHAR(3),  -- Assuming 2- or 3-character country codes
    ALTER COLUMN continent TYPE VARCHAR(255);

-- Task 3.3: Change 'N/A' to NULL in the location column
UPDATE store_details_table
SET location = NULL
WHERE location = 'N/A';
