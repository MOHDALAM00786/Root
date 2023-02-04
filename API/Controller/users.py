from app import app
from flask import request
from Models.UserModel import UserModel
obj=UserModel()

@app.route("/Users/GellAllUsers")
def GetAllUsers():
    return obj.GetAllUsers()

@app.route("/Users/AddUser",methods=["POST"])
def AddUsers():
    return obj.AddUser(request.json)

@app.route("/Users/UpdateUser",methods=["PUT"])
def UpdateUser():
    return obj.UpdateUser(request.json)

@app.route("/Users/DeleteUser/<Id>",methods=["DELETE"])
def DeleteUser(Id):
    return obj.DeleteUser(Id)