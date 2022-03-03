*** Setting ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_Url}  https://reqres.in

***Test Cases ***
Tc3_Create_Post_Request
    ${header}=  Create Dictionary  Accept=application/json  Content-type=application/json
    Create Session  AddData  ${Base_Url}  headers=${header}   
    ${body}=  Create Dictionary  email=sydney@fife
    ${response}=  POST On Session  AddData  /api/register  data=${body}  expected_status=any  
    Should Be Equal As Strings  ${response.status_code}  400
   
 
  