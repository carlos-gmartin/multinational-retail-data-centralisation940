-- Task 2: Alter the data types in dim_users
ALTER TABLE dim_users
    ALTER COLUMN first_name TYPE VARCHAR(255),
    ALTER COLUMN last_name TYPE VARCHAR(255),
    ALTER COLUMN date_of_birth TYPE DATE USING to_date(date_of_birth, 'YYYY-MM-DD'),
    ALTER COLUMN country_code TYPE VARCHAR(3),  -- Assuming ISO-standard 2 or 3-character country codes
    ALTER COLUMN user_uuid TYPE UUID USING user_uuid::UUID,
    ALTER COLUMN join_date TYPE DATE USING to_date(join_date, 'YYYY-MM-DD');
