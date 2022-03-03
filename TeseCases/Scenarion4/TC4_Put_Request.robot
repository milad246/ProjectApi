*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
# Library  ../../Library/JalaliDate.py

*** Variables ***
${Base_Url}  https://reqres.in

*** Test Cases ***
TC4_Post_Request
    ${header}=  Create Dictionary  Accept=application/json  Content-type=application/json
    Create Session  mysession  ${Base_Url}  headers=${header}   
    ${body}=  Create Dictionary  name=morpheus  job=leader  email=morpheus@gmail.com 
    ${response}=  POST On Session  mysession  /api/users  json=${body} 

    # ${Update_data}=  Create Dictionary  name=david  job=leader  email=david@gmail.com    
    # ${Update_res}=  Update Session  mysession  data=${Update_data} 
    # log to console  ${Update_res.content}

    ${respons_content}=  set variable  ${response.json()}
  
# Value CreatedAt
     ${CreatedAt_Value}=  Get Value From Json  ${respons_content}  $.createdAt
     log to console  ${CreatedAt_Value} 
     
# Jalali Date CreateAt
    ${Jalali_Date}=  set variable  Jalali_Date_Keyword()
    log to console  ${Jalali_Date}
      

# # # Verifying Name
#     ${Update_Name_Value}=  Get Value From Json  ${Update_Content}  $.name
#     Should Be Equal As Strings  ${Update_Name_Value}  ['david']

# # # Verifying Email
#     ${Update_Email_Value}=  Get Value From Json  ${Update_Content}  $.email
#     Should Be Equal As Strings  ${Update_Email_Value}  ['david@gmail.com']

# # Verifying ID
#     ${Check_ID}=  Get Value From Json  ${Update_Name_Value}  $.id
#     Should Be True  len(${Check_ID}) <= 3
 
 

