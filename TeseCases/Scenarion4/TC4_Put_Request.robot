*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
# Library  ../../Library/JalaliDate.py

*** Variables ***
${Base_Url}  https://reqres.in

*** Test Cases ***
TC4_Post_Request
    Create Session  mysession  ${Base_Url}
    ${body}=  Create Dictionary  name=morpheus  job=leader  email=morpheus@gmail.com 
    # ${headers}  Create Dictionary  Content-Type=application/json
    ${response}=  POST On Session  mysession  /api/users  data=${body}  
    ${respons_content}=  set variable  ${response.json()}
    log to console  ${respons_content}

# Value CreatedAt
     ${CreatedAt_Value}=  Get Value From Json  ${respons_content}  $.createdAt
     log to console  ${CreatedAt_Value} 
     
# Jalali Date CreateAt
    # ${Jalali_Date}=  func.Jalali_Date_Keyword  ${CreatedAt_Value}  
    # log to console  ${Jalali_Date}  









# TC5_Put_Response
#     ${body_Put}=  Create Dictionary  name=david  job=leader  email=david@gmail.com
#     ${response_Put}=  Put On Session  mysession  /api/users  data=${body_Put}  
#     ${Update_Content}=  set variable  ${response_Put.json()}
#     log to console  ${Update_Content}

# # # Verifying Name
#     ${Update_Name_Value}=  Get Value From Json  ${Update_Content}  $.name
#     Should Be Equal As Strings  ${Update_Name_Value}  ['david']

# # # Verifying Email
#     ${Update_Email_Value}=  Get Value From Json  ${Update_Content}  $.email
#     Should Be Equal As Strings  ${Update_Email_Value}  ['david@gmail.com']

# # Verifying ID
#     ${Check_ID}=  Get Value From Json  ${Update_Name_Value}  $.id
#     Should Be True  len(${Check_ID}) <= 3
 
 

