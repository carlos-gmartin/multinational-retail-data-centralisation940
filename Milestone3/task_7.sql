-- Task 7: Update the data types for dim_card_details table
ALTER TABLE dim_card_details
    ALTER COLUMN card_number TYPE VARCHAR(19),              -- Card number length
    ALTER COLUMN expiry_date TYPE VARCHAR(7),               -- Expiry date length
    ALTER COLUMN date_payment_confirmed TYPE DATE USING to_date(date_payment_confirmed, 'YYYY-MM-DD');
