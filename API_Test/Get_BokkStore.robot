*** Settings ***
Library        RequestsLibrary

*** Test Cases ***
Verify request api. should be show data book store
    Create Session    GenerateTokenSession    https://demoqa.com
    ${Request_body}=    Create Dictionary        userName=demoqa    password=Welcome1!
    ${Response}=    POST On Session    GenerateTokenSession    /Account/v1/GenerateToken     json=${Request_body}    expected_status=200
    Should Be Equal    ${Response.json()['status']}    Success
    Should Be Equal    ${Response.json()['result']}    User authorized successfully.
    ${token}=        Set Variable        ${Response.json()['token']}
    Log To Console     ${token}
    ${headers}=        Create Dictionary        token=${token}

    # Get access to book store
    ${get_response}=    GET On Session    GenerateTokenSession     /BookStore/v1/Books      headers=${headers}
    Log To Console     ${get_response.json()}
    
    #check response contain at less 1 book asset
    ${count}=    Get Length    ${get_response.json()}  
    ${morethanone}=    Evaluate    ${count}>0  
    Should Be True     ${morethanone}  