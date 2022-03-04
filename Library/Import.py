from datetime import datetime
from persiantools.jdatetime import JalaliDate

# def Conver_Date(date1):
#     date1_obj = datetime.strptime(date1, "%Y-%m-%dT%H:%M:%S.%fZ")
#     dateConvert = JalaliDate(datetime.date(date1_obj))
#     return dateConvert



    
def Date():
    date1 = "2022-03-04T19:39:26.402Z"
    date1_obj = datetime.strptime(date1, "%Y-%m-%dT%H:%M:%S.%fZ")
    print(date1_obj)
    dateConvert = JalaliDate(datetime.date(date1_obj))
    print(dateConvert)
Date()

    








