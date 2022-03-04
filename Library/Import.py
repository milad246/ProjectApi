from datetime import datetime
from persiantools.jdatetime import JalaliDate


def Date():
    date1 = "2022-03-04T14:00:08.179Z"
    date1_obj = datetime.strptime(date1, "%Y-%m-%dT%H:%M:%S.%fZ")
    dateConvert = JalaliDate(datetime.date(date1_obj))
    return dateConvert
print(Date())
    








