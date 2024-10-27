# Data Centralisation Project

In this project, we create a local PostgreSQL database. We upload data from various sources, process it, create a database schema, and run SQL queries.

## Key Technologies Used
- **PostgreSQL**: For the local database.
- **AWS (S3)**: For storing and retrieving data.
- **boto3**: AWS SDK for Python, used to interact with S3.
- **REST API**: For fetching data from external sources.
- **CSV**: For handling data files.
- **Python (Pandas)**: For data manipulation and processing.

## Project Structure
The project contains two folders with code related to different milestones:
- **Milestone3**: Contains code and tasks completed for the third milestone of the project.
- **Milestone4**: Contains code and tasks completed for the fourth milestone of the project.

## Project Utils

1. **Data Extraction**: In `data_extraction.py`, we store methods responsible for the upload of data into pandas DataFrames from different sources.
2. **Data Cleaning**: In `data_cleaning.py`, we develop the `DataCleaning` class that cleans different tables uploaded in `data_extraction.py`.
3. **Uploading Data into the Database**: We write the `DatabaseConnector` class in `database_utils.py`, which initiates the database engine based on credentials provided in the `.yml` file.
4. **Main Script**: `run.py` contains methods that allows PDFs to be downloaded and directly uploaded to the database.

## Step-by-Step Data Processing

We have six sources of data:

1. **Remote PostgreSQL Database in AWS Cloud**: The `order_table` is of most interest for the client as it contains actual sales information. Key fields include:
   - `date_uuid`, `user_uuid`, `card_number`, `store_code`, `product_code`, `product_quantity`.
   - The first five fields will become foreign keys in our database; hence we clean these columns of any NaNs and missing values. The `product_quantity` field must be an integer.

2. **Remote PostgreSQL Database in AWS Cloud**: User data from the `dim_users` table is also stored in the remote database, using the same upload techniques as in the previous case. The primary key here is the `user_uuid` field.

3. **Public Link in AWS Cloud**: The `dim_card_details` table is accessible via a link from the S3 server and stored as a `.pdf` file. We handle reading the `.pdf` using the `tabula` package. The primary key is the card number, which must be converted into a string to avoid issues and cleaned of "?" artifacts.

4. **AWS S3 Bucket**: The `dim_product` table is downloaded using the `boto3` package. The primary key is the `product_code` field. The `product_price` field must be converted into a float, and the `weight` field must be converted into grams (handling units like "kg", "oz", "l", "ml").

5. **RESTful API**: The `dim_store_details` data is available via a GET method. The `.json` response is converted into a pandas DataFrame. The primary key field is `store_code`.

6. **Dim Date Times Data**: This data is available by link. The `.json` response is converted into a pandas DataFrame, with `date_uuid` as the primary key.

## General Data Cleaning Notes

- All data cleaning must be performed concerning the primary key field. Rows are only removed if duplicates (NaNs, missing values, etc.) appear in this field. This prevents issues with foreign keys in the `orders_table`.
