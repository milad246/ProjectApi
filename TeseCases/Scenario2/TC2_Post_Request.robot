*** Setting ***
Documentation  A test with Post method and checking the name and job
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Force Tags  Post_Request

*** Variables ***
${Base_Url}  https://reqres.in

***Test Cases ***
Tc2_Create_Post_Request
    ${header}=  Create Dictionary  Accept=application/json  Content-type=application/json
    Create Session  AddData  ${Base_Url}  headers=${header}  
    ${body}=  Create Dictionary  name=morpheus  job=leader
    ${response}=  POST On Session  AddData  /api/users  json=${body}  

    ${json_response}=  set variable  ${response.json()} 
  
    Should Be Equal As Strings  ${response.status_code}  201

 # Verify Name
    ${Name_Value}=  Get Value From Json  ${json_response}  $.name
    Should Be Equal As Strings  ${Name_Value}  ['morpheus']  

# Verify Job
    ${Name_Value}=  Get Value From Json  ${json_response}  $.job
    Should Be Equal As Strings  ${Name_Value}  ['leader'] 


    