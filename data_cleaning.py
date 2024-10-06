import pandas as pd
import sqlalchemy

class DataCleaning:
    # Methods to clean data from different sources.
    def clean_user_data(self, df):
        # Remove empty cells
        df.dropna(inplace = True)
        # Remove error of dates
        pd.to_datetime(df['date_of_birth'])
        pd.to_datetime(df['join_date'])

    def clean_card_data(self, df: pd.DataFrame) -> pd.DataFrame:
        """
        This method cleans the card data by removing erroneous values, NULL values, 
        and fixing any formatting issues.
        :param df: The pandas DataFrame containing the card data.
        :return: A cleaned pandas DataFrame.
        """
        try:
            # Drop rows with NULL values
            df_cleaned = df.dropna()

            # Remove duplicate rows, if any
            df_cleaned = df_cleaned.drop_duplicates()

            # Strip any leading/trailing whitespace in string columns
            df_cleaned = df_cleaned.applymap(lambda x: x.strip() if isinstance(x, str) else x)

            # Ensure that card numbers and other relevant fields are in correct format (e.g., remove non-numeric chars)
            if 'card_number' in df_cleaned.columns:
                df_cleaned['card_number'] = df_cleaned['card_number'].apply(lambda x: ''.join(filter(str.isdigit, str(x))))
            
            return df_cleaned
        
        except Exception as e:
            print(f"Error occurred during data cleaning: {e}")
            return None

    def remove_char_from_string(self,value):
        return re.sub(r'\D', '',value)

    def clean_card_data(self,df):
        df['card_number'] = df['card_number'].apply(str)
        df['card_number'] = df['card_number'].str.replace('?','')
        df = self.clean_invalid_date(df,'date_payment_confirmed')  
        df.dropna(how='any',inplace= True)
        return df

    def clean_date_time(self,df):
        df['month']         =  pd.to_numeric( df['month'],errors='coerce', downcast="integer")
        df['year']          =  pd.to_numeric( df['year'], errors='coerce', downcast="integer")
        df['day']           =  pd.to_numeric( df['day'], errors='coerce', downcast="integer")
        df['timestamp']     =  pd.to_datetime(df['timestamp'], format='%H:%M:%S', errors='coerce')
        df.dropna(how='any',inplace= True)
        df.reset_index(inplace=True)       
        return df

    def clean_products_data(self,df):
        df =  self.clean_invalid_date(df,'date_added')
        #df['product_price'] = df['product_price'].apply(str)
        #df['product_price'] = df['product_price'].str.replace('£','')
        #df['product_price'] = pd.to_numeric(df['product_price'])
        df.dropna(how='any',inplace= True)
        df.reset_index(inplace=True)       
        return df

    def convert_product_weights(self,df,column_name):
        df[column_name] = df[column_name].apply(self.get_grams)
        return df

    def get_grams(self,value):
        value = str(value)
        value = value.replace(' .','')
        if value.endswith('kg'):
            value = value.replace('kg','')
            value = self.check_math_operation(value)
            return 1000*float(value) if self.isfloat(value) else np.nan
        elif value.endswith('g'):   
            value = value.replace('g','')
            value = self.check_math_operation(value)
            return float(value) if self.isfloat(value) else np.nan
        elif value.endswith('ml'):   
            value = value.replace('ml','')
            value = self.check_math_operation(value)
            return float(value) if self.isfloat(value) else np.nan
        elif value.endswith('l'):   
            value = value.replace('l','')
            value = self.check_math_operation(value)
            return 1000*float(value) if self.isfloat(value) else np.nan
        elif value.endswith('oz'):   
            value = value.replace('oz','')
            value = self.check_math_operation(value)
            return 28.3495*float(value) if self.isfloat(value) else np.nan
        else:
            np.nan

    def check_math_operation(self,value):
        if 'x' in value:
            value.replace(' ','')
            lis_factors = value.split('x')
            return str(float(lis_factors[0])*float(lis_factors[1]))
        return value

    def isDigits(self,num):
        return str(num) if str(num).isdigit() else np.nan

    def isfloat(self,num):
        try:
            float(num)
            return True
        except ValueError:
            return False
            
    def clean_invalid_date(self,df,column_name):
        df[column_name] = pd.to_datetime(df[column_name], format='%Y-%m-%d', errors='ignore')
        df[column_name] = pd.to_datetime(df[column_name], format='%Y %B %d', errors='ignore')
        df[column_name] = pd.to_datetime(df[column_name], format='%B %Y %d', errors='ignore')
        df[column_name] = pd.to_datetime(df[column_name], errors='coerce')
        df.dropna(subset = column_name,how='any',inplace= True)
        return df
