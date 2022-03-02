*** Setting ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_Url}  https://reqres.in

***Test Cases ***
Tc2_Create_Post_Request
    Create Session  AddData  ${Base_Url}  
    ${body}=  Create Dictionary  name=morpheus  job=leader
    ${response}=  POST On Session  AddData  /api/users  data=${body}
    ${json_response}=  set variable  ${response.json()}  

# Verify Name
    ${Name_Value}=  Get Value From Json  ${json_response}  $.name
    Should Be Equal As Strings  ${Name_Value}  ['morpheus']  

# Verify Job
    ${Name_Value}=  Get Value From Json  ${json_response}  $.job
    Should Be Equal As Strings  ${Name_Value}  ['leader'] 

    log to console  ${response.status_code} 
    log to console  ${response.content}

    