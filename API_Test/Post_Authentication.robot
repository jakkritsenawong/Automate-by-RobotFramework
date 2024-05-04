*** Settings ***
Library        RequestsLibrary


*** Test Cases ***
# Verify API when input data correctly.
#     Create Session    AuthenticationSession    https://demoqa.com
#     ${Request_body}=    Create Dictionary        userName=demoqa    password=Welcome1!
#     ${Response}=    POST On Session    AuthenticationSession    /Account/v1/Authorized      json=${Request_body}    expected_status=200

Verify API can generate token.
    Create Session    GenerateTokenSession    https://demoqa.com
    ${Request_body}=    Create Dictionary        userName=demoqa    password=Welcome1!
    ${Response}=    POST On Session    GenerateTokenSession    /Account/v1/GenerateToken     json=${Request_body}    expected_status=200
    Should Be Equal    ${Response.json()['status']}    Success
    Should Be Equal    ${Response.json()['result']}    User authorized successfully.
    
    

    
