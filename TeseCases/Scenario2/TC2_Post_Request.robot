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
    ${header}=  Create Dictionary  Accept=application/json  Content-type=application/json charset=utf-8
    ${response}=  POST On Session  AddData  /api/users  data=${body}  
    log to console  ${response.headers}
    log to console  ${response.content}

    ${json_response}=  set variable  ${response.json()} 

    log to console  ${json_response}
  
    
#     Should Be Equal As Strings  ${response.status_code}  201
#     log to console  ${response.headers}

#     ${json_response}=  set variable  ${response.json()}  
#     log to console  ${json_response.content}

# # Verify Name
    # ${Name_Value}=  Get Value From Json  ${json_response}  $.name
    # log to console  ${Name_Value}
    # Should Be Equal As Strings  ${Name_Value}  ['morpheus']  

# # Verify Job
#     ${Name_Value}=  Get Value From Json  ${json_response}  $.job
#     Should Be Equal As Strings  ${Name_Value}  ['leader'] 

    # log to console  ${response.status_code} 
    # log to console  ${response.content}

    