-- Task 1: Alter the data types in orders_table
ALTER TABLE orders_table
    ALTER COLUMN date_uuid TYPE UUID USING date_uuid::UUID,
    ALTER COLUMN user_uuid TYPE UUID USING user_uuid::UUID,
    ALTER COLUMN card_number TYPE VARCHAR(19),  -- Assuming card numbers are up to 19 characters
    ALTER COLUMN store_code TYPE VARCHAR(10),   -- Adjust length based on data
    ALTER COLUMN product_code TYPE VARCHAR(15), -- Adjust length based on data
    ALTER COLUMN product_quantity TYPE SMALLINT USING product_quantity::SMALLINT;
