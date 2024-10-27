-- Task 8: Add primary keys to each of the dimension tables
ALTER TABLE dim_date_times
    ADD CONSTRAINT pk_date_uuid PRIMARY KEY (date_uuid);

ALTER TABLE dim_users
    ADD CONSTRAINT pk_user_uuid PRIMARY KEY (user_uuid);

ALTER TABLE dim_card_details
    ADD CONSTRAINT pk_card_number PRIMARY KEY (card_number);

ALTER TABLE dim_products
    ADD CONSTRAINT pk_product_code PRIMARY KEY (product_code);

ALTER TABLE store_details_table
    ADD CONSTRAINT pk_store_code PRIMARY KEY (store_code);
