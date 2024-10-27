-- Task 9: Create foreign key constraints in orders_table

ALTER TABLE orders_table
    ADD CONSTRAINT fk_date_uuid
    FOREIGN KEY (date_uuid)
    REFERENCES dim_date_times(date_uuid);

ALTER TABLE orders_table
    ADD CONSTRAINT fk_user_uuid
    FOREIGN KEY (user_uuid)
    REFERENCES dim_users(user_uuid);

ALTER TABLE orders_table
    ADD CONSTRAINT fk_card_number
    FOREIGN KEY (card_number)
    REFERENCES dim_card_details(card_number);

ALTER TABLE orders_table
    ADD CONSTRAINT fk_product_code
    FOREIGN KEY (product_code)
    REFERENCES dim_products(product_code);

ALTER TABLE orders_table
    ADD CONSTRAINT fk_store_code
    FOREIGN KEY (store_code)
    REFERENCES store_details_table(store_code);
