*** Settings ***
Library        SeleniumLibrary
Library        Dialogs

*** Variables ***
${URL}=        https://demoqa.com/upload-download
${BROWSER}=    chrome
${FILE_UPLOAD}=    qa_img.png


*** Test Cases ***
Verify when user click download button. Shoud be download file
    Open Browser    ${URL}    ${BROWSER}
    Scroll Element Into View    id=uploadFile
    Click Element        css=a.btn.btn-primary
    Dialogs.Pause Execution

Verify when user upload file. Should be expect file.
    Open Browser    url=https://demoqa.com/upload-download    browser=chrome
    Scroll Element Into View    id=uploadFile
    ${image_path}    Set Variable    ${CURDIR}${/}${FILE_UPLOAD}    
    Choose File        id=uploadFile        ${image_path}
    Scroll Element Into View    xpath=(//div)[50]
    Dialogs.Pause Execution

       