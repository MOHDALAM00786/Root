import psycopg2
import json


class UserModel():
    def __init__(self):
        conn_string = "host='localhost' dbname='Finance' user='postgres' password=12345 port=12345"
        self.con = psycopg2.connect(conn_string)
        self.con.autocommit = True
        self.cursor = self.con.cursor()

    def GetAllUsers(self):
        self.cursor.execute('SELECT * FROM "Users"')
        return json.dumps(self.cursor.fetchall())

    def AddUser(self, userData):
        try:
            self.cursor.execute('INSERT INTO "Users" ("Name", "MobileNo")'
                                'VALUES (%s, %s)',
                                (userData['Name'], userData['MobileNo'])
                                )
            self.con.commit()
        except (Exception, psycopg2.Error) as error:
            print("Failed to insert record", error)
        finally:
            # closing database connection.
            # if self.con:
            #     self.cursor.close()
            #     self.con.close()
            return "user added"

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
