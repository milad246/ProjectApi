*** Settings ***
Documentation  A test with Post method and checking update date & convert createAt date
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  ../../Library/Import.py
Force Tags  Import_Library

*** Variables ***
${Base_Url}  https://reqres.in

*** Test Cases ***
TC4_Post_Request
    ${header}=  Create Dictionary  Accept=application/json  Content-type=application/json
    Create Session  mysession  ${Base_Url}  headers=${header}   
    ${body}=  Create Dictionary  name=morpheus  job=leader  email=morpheus@gmail.com 
    ${response}=  POST On Session  mysession  /api/users  json=${body} 
    ${Update_data}=  Create Dictionary  name=david  job=leader  email=david@gmail.com    
    # ${Update_res}=  Update Session  mysession  data=${Update_data} 
    ${response}=  POST On Session  mysession  /api/users  json=${Update_data} 
    ${respons_content}=  set variable  ${response.json()}
    log to console  ${respons_content}
  
# Verifying Name
    ${Update_Name_Value}=  Get Value From Json  ${respons_content}  $.name
    Should Be Equal As Strings  ${Update_Name_Value}  ['david']

# Verifying Email
    ${Update_Email_Value}=  Get Value From Json  ${respons_content}  $.email
    Should Be Equal As Strings  ${Update_Email_Value}  ['david@gmail.com']

# Verifying ID
    ${Check_ID}=  Get Value From Json  ${Update_Name_Value}  $.id
    Should Be True  len(${Check_ID}) <= 3

# Value CreatedAt
     ${CreatedAt_Value}=  Get Value From Json  ${respons_content}  $.createdAt
     log to console  ${CreatedAt_Value} 
     
# Jalali Date CreateAt
    ${list}=  Get From List  ${CreatedAt_Value}  0
    log to console  ${list}
    ${int}=  Convert To String  ${list}  
    log to console  ${int}
    ${Jalali_Date}=  Date  ${int}
    log to console  ${Jalali_Date}
      
 
 

