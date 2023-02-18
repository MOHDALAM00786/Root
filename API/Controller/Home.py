from app import app
from Repository.HomeRepository import HomeRepository
obj=HomeRepository()

@app.route("/Home/GetAllStockCompanies")
def GetAllStockCompanies():
    return obj.GetAllStockCompanies()