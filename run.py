# Import classes from relevant modules
from data_extraction import DataExtractor   # To extract data from the PDF
from data_cleaning import DataCleaning      # To clean the extracted data
from database_utils import DatabaseConnector # To upload cleaned data to the database

if __name__ == "__main__":
    # Step 1: Extract data from the PDF
    pdf_link = "https://data-handling-public.s3.eu-west-1.amazonaws.com/card_details.pdf"
    extractor = DataExtractor()
    raw_data = extractor.retrieve_pdf_data(pdf_link)
    
    # Step 2: Clean the extracted data
    if raw_data is not None:
        cleaner = DataCleaning()
        cleaned_data = cleaner.clean_card_data(raw_data)
        
        # Step 3: Upload the cleaned data to the database
        if cleaned_data is not None:
            db_connector = DatabaseConnector()
            db_connector.upload_dataframe_to_db(cleaned_data, 'dim_card_details')
