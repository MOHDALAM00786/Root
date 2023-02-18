from app import app
from flask import request
from Repository.UserRepository import UserRepository
obj=UserRepository()

@app.route("/Users/GellAllUsers")
def GetAllUsers():
    return obj.GetAllUsers()

@app.route("/Users/AddUser",methods=["POST"])
def AddUser():
    return obj.AddUser(request.json)

@app.route("/Users/UpdateUser",methods=["PUT"])
def UpdateUser():
    return obj.UpdateUser(request.json)

@app.route("/Users/DeleteUser/<Id>",methods=["DELETE"])
def DeleteUser(Id):
    return obj.DeleteUser(Id)
@app.route("/Users/Login",methods=["POST"])
def Login():
    return obj.Login(request.json)