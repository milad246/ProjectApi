*** Setting ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_Url}  https://reqres.in

***Test Cases ***
Tc2_Create_Post_Request
    Create Session  AddData  ${Base_Url} 
    ${body}=  Create Dictionary  email=sydney@fife
    ${response}=  POST On Session  AddData  /api/register  data=${body}  expected_status=any  
    Should Be Equal As Strings  ${response.status_code}  400
    # log to console  ${response.status_code}  
 
  