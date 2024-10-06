import yaml
from sqlalchemy import create_engine
from sqlalchemy import inspect
import psycopg2

class DatabaseConnector:

    def __init__(self):
        # Initialize db_creds by loading from YAML when the object is created
        self.db_creds = self.read_db_creds()

    # Connect to database
    def read_db_creds(self):
        with open("db_creds.yaml") as stream:
            try:
                return yaml.safe_load(stream)
            except yaml.YAMLError as exc:
                print(exc)

    def init_db_engine(self):
        engine = create_engine("postgresql+psycopg2://{0}:{1}@{2}:{3}/{4}".format(self.db_creds['RDS_USER'], self.db_creds['RDS_PASSWORD'], self.db_creds['RDS_HOST'], self.db_creds['RDS_PORT'], self.db_creds['RDS_DATABASE']))
        return engine
    
    def list_db_tables(self):
        engine = self.init_db_engine()
        engine.connect()
        inspector = inspect(engine)
        tables = inspector.get_table_names()
        print(f"Tables in the database: {tables}")
        return tables

    # Upload data to the database using psycopg2 directly
    def upload_to_db(self):
        conn = None  # Initialize conn as None to avoid UnboundLocalError
        try:
            conn = psycopg2.connect(
                host=self.db_creds['AIVEN_HOST'],
                user=self.db_creds['AIVEN_USER'],
                password=self.db_creds['AIVEN_PASSWORD'],
                dbname=self.db_creds['AIVEN_DB'],
                port=self.db_creds['AIVEN_PORT'],
                sslmode='require'
            )
            query_sql = 'SELECT VERSION()'
            with conn.cursor() as cur:
                cur.execute(query_sql)
                version = cur.fetchone()[0]
                print(f"PostgreSQL version: {version}")
        except Exception as e:
            print(f"Error during upload: {e}")
        finally:
            if conn:
                conn.close()
     
if __name__ == "__main__":
    db = DatabaseConnector()
    db.list_db_tables()
    db.upload_to_db()