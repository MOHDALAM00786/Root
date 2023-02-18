import psycopg2
import json
from Utility.Config import dbConfig

class HomeRepository():
    def __init__(self):
        self.con = psycopg2.connect(host=dbConfig['hostname'], dbname=dbConfig['database'],
                                    user=dbConfig['username'], password=dbConfig['password'], port=dbConfig['port'])
        self.con.autocommit = True
        self.cursor = self.con.cursor()

    def GetAllStockCompanies(self):
        self.cursor.execute('select "CompanyName" from "StockCompanies"')
        return json.loads(self.cursor.fetchall())
