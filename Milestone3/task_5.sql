-- Task 5.1: Rename 'removed' column to 'still_available'
ALTER TABLE dim_products
RENAME COLUMN removed TO still_available;

-- Task 5.2: Change the data types of the columns in dim_products
ALTER TABLE dim_products
    ALTER COLUMN product_price TYPE NUMERIC USING product_price::NUMERIC,
    ALTER COLUMN weight TYPE NUMERIC USING weight::NUMERIC,
    ALTER COLUMN EAN TYPE VARCHAR(13),       -- Assuming 13-character EAN
    ALTER COLUMN product_code TYPE VARCHAR(15),  -- Adjust based on data
    ALTER COLUMN date_added TYPE DATE USING to_date(date_added, 'YYYY-MM-DD'),
    ALTER COLUMN uuid TYPE UUID USING uuid::UUID,
    ALTER COLUMN still_available TYPE BOOL USING (still_available = 'true'),
    ALTER COLUMN weight_class TYPE VARCHAR(20);
