*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}=    https://demoqa.com/login
${browser}=    chrome


*** Test Cases ***
Verify input valid username and password. Should be login Website demoqa.com
    Open Browser        ${url}        ${browser}  
    Maximize Browser Window
    Scroll Element Into View        xpath=(//li)[33]  
    Input Text        id=userName         demoqa
    Input Text        id=password        Welcome1!
    Click Button        id=login
    Wait Until Page Contains        text=demoqa
    Close All Browsers
