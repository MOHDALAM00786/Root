from app import app
from Repository.CompanyRepository  import CompanyRepository
obj=CompanyRepository()

@app.route("/Companies/GetAllStockCompany")
def GetAllStockCompany():
    return obj.GetAllStockCompany()