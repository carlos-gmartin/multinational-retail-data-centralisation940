-- Task 4.1: Remove £ symbol from product_price and convert to NUMERIC
UPDATE dim_products
SET product_price = REPLACE(product_price, '£', '')::NUMERIC;

-- Task 4.2: Add the weight_class column and set values based on weight range
ALTER TABLE dim_products
ADD COLUMN weight_class VARCHAR(20);

UPDATE dim_products
SET weight_class = CASE
    WHEN weight::NUMERIC < 2 THEN 'Light'
    WHEN weight::NUMERIC >= 2 AND weight::NUMERIC < 40 THEN 'Mid_Sized'
    WHEN weight::NUMERIC >= 40 AND weight::NUMERIC < 140 THEN 'Heavy'
    ELSE 'Truck_Required'
END;
