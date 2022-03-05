from datetime import datetime
from persiantools.jdatetime import JalaliDate


def change_date(date):
    date_obj = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S.%fZ")
    jalali_date_obj = JalaliDate(date_obj)
    year = jalali_date_obj.year
    month = jalali_date_obj.month
    day = jalali_date_obj.day
    hour = date_obj.hour
    minute = date_obj.minute
    second = date_obj.second
    return f"{year}-{month}-{day}T{hour}:{minute}:{second}"



# def Conver_Date(date1):
#     date1_obj = datetime.strptime(date1, "%Y-%m-%dT%H:%M:%S.%fZ")
#     dateConvert = JalaliDate(datetime.date(date1_obj))
#     return dateConvert



    

    








