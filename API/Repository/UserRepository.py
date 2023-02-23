import psycopg2
import json
from Utility.Config import dbConfig


class UserRepository():
    def __init__(self):
        self.con = psycopg2.connect(host=dbConfig['hostname'], dbname=dbConfig['database'],
                                    user=dbConfig['username'], password=dbConfig['password'], port=dbConfig['port'])
        self.con.autocommit = True
        self.cursor = self.con.cursor()

    def GetAllUsers(self):
        self.cursor.execute('SELECT * FROM "Users"')
        return json.dumps(self.cursor.fetchall())

    def AddUser(self, userData):
        try:
            self.cursor.execute('INSERT INTO "Users" ("Name", "MobileNo","Email","Password")'
                                'VALUES (%s, %s, %s, %s)',
                                (userData['Name'], userData['MobileNo'],
                                 userData['Email'], userData['Password'])
                                )
            self.con.commit()
        except (Exception, psycopg2.Error) as error:
            print("Failed to insert record", error)
        finally:
            # closing database connection.
            # if self.con:
            #     self.cursor.close()
            #     self.con.close()
            return "Success"

    def UpdateUser(self, userData):
        print(userData)
        try:
            self.cursor.execute(""" 
            UPDATE "Users" set 
             "Name"=%s,
             "MobileNo"=%s
             Where "Id"=%s""",
                                (userData['Name'], userData['MobileNo'], userData['Id']))
            self.con.commit()
        except (Exception, psycopg2.Error) as error:
            print("Failed to update record", error)
        finally:
            # closing database connection.
            # if self.con:
            #  self.cursor.close()
            #  self.con.close()
            return "user updated"

    def DeleteUser(self, Id):
        self.cursor.execute('Delete from "Users" where "Id"= {0}'.format(Id))
        self.con.commit()
        return "user deleted"

    def Login(self, loginDetails):
        self.cursor.execute(f"""SELECT * FROM "Users" WHERE "Email" = %s and "Password"= %s""",
                            (loginDetails['Email'], loginDetails['Password']))
        allData = self.cursor.fetchall()
        if len(allData) == 0:
            return "error"
        else:
            return allData
        
