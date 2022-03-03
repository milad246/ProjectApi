*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Base_Url}  https://gorest.co.in

*** Test Cases ***
TC_Get_Request
    ${header}=  Create Dictionary  Accept=application/json  Content-type=application/json
    Create Session  mysession  ${Base_Url}  headers=${header}
    ${Get_Response}=  GET On Session  mysession  /public/v1/posts/123/comments  
    ${json_response}=  set variable  ${Get_Response.json()}
    Should Be Equal As Strings  ${Get_Response.status_code}  200


# Verify Value Page
    ${page_key}=  Get Value From Json  ${json_response}  $.meta.pagination.page 
    # ${Convert_Page_Object}=  Convert JSON To String  ${page_key}   
    Should Be Equal As Strings  ${page_key}  [1]

# Verify Value data
    ${data_array}=  Get Value From Json  ${json_response}  data 
    Should Be Equal As Strings  ${data_array}  [[]]