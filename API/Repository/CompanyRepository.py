import psycopg2
import json
from Utility.Config import dbConfig

class CompanyRepository():
    def __init__(self):
        conn_string = "host='localhost' dbname='Finance' user='postgres' password=12345 port=12345"
        self.con = psycopg2.connect(conn_string)
        self.con.autocommit = True
        self.cursor = self.con.cursor()

    def GetAllStockCompany(self):
        self.cursor.execute('SELECT * FROM "StockCompanies"')
        return json.dumps(self.cursor.fetchall())

