Data Centralization Project
Table of Contents

    Project Description
    Technologies Used
    Installation Instructions
    Usage Instructions
    File Structure
    License

Project Description

The Data Centralization Project is a comprehensive solution for centralizing data from various sources into a local PostgreSQL database. The goal of the project is to efficiently extract, clean, process, and store data from remote databases, AWS S3, REST APIs, and more. Once the data is loaded and cleaned, SQL queries are used to generate insights, such as sales performance, store distribution, and product details.
Key Objectives:

    Extract data from multiple sources.
    Clean and transform data to ensure integrity and accuracy.
    Store the data in PostgreSQL with a properly defined schema.
    Run SQL queries to analyze sales data and other metrics.

What I Learned:

    Efficiently extracting data from diverse sources, including AWS S3, APIs, and remote databases.
    Data cleaning techniques using Python (Pandas) to handle missing values and inconsistent data formats.
    Database schema design and using SQL for data querying.
    Integration of PostgreSQL with Python for dynamic data processing.

Technologies Used

    PostgreSQL – For the local database.
    AWS S3 – For storing and retrieving data from cloud storage.
    boto3 – AWS SDK for Python, used to interact with S3.
    Pandas – For data extraction, cleaning, and transformation.
    REST APIs – To fetch data from remote servers.
    Tabula – For extracting data from PDFs.

Installation Instructions
Prerequisites:

    Python 3.x installed on your local machine.
    PostgreSQL installed and running locally.
    pip for installing required Python packages.
    An AWS account (if working with AWS services).

Steps:

    Clone the repository:
    

git clone https://github.com/your-username/data-centralization-project.git
cd data-centralization-project

Install the required Python packages:

    pip install -r requirements.txt

    Configure your PostgreSQL credentials in the config.yml file.

    Ensure you have the necessary AWS credentials set up (for S3 interaction via boto3).

Usage Instructions
Step 1: Data Extraction

    Run the data_extraction.py script to extract data from various sources like remote databases, AWS S3, and REST APIs.

    bash

    python data_extraction.py

Step 2: Data Cleaning

    Clean the extracted data using the data_cleaning.py script.

    bash

    python data_cleaning.py

Step 3: Upload Data to Database

    Use the main.py script to upload the cleaned data to the local PostgreSQL database.

    bash

    python main.py

Step 4: Running SQL Queries

    You can now perform SQL queries on the centralized data to derive insights, such as total sales per location, store performance, and more.

File Structure

data-centralization-project/
│
├── data_extraction.py      # Handles data extraction from various sources
├── data_cleaning.py        # Cleans the extracted data
├── database_utils.py       # Contains the DatabaseConnector class for handling DB connections
├── main.py                 # Orchestrates the uploading of data to PostgreSQL
├── config.yml              # Contains PostgreSQL and AWS configuration details
├── requirements.txt        # Lists the required Python packages
├── README.md               # Project documentation

License

This project is licensed under the MIT License. See the LICENSE file for more details.