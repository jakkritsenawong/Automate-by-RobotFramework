*** Settings ***
Library        SeleniumLibrary
Library        Dialogs

*** Variables ***
${url}=    https://demoqa.com/automation-practice-form
${browser}=    chrome
${upload_btn}=    //input[@id="uploadPicture"]
${file_to_upload}=    qa_img.png


*** Test Cases ***
Validation input register student form correctly.
    Open Browser        ${url}        ${browser}  
    Maximize Browser Window
    Scroll Element Into View        id=stateCity-label
    Input Text        id=firstName         Jakkrit
    Input Text        id=lastName          Senawong
    Input Text        id=userEmail         jakkrit.senawong@gmail.com
    Click Element        css=label.custom-control-label   
    Input Text        id=userNumber           0940843159 
    Input Text        id=subjectsInput           Software Tester
    Click Element        xpath=(//label)[10]
    ${image_path}        Set Variable        ${CURDIR}${/}${file_to_upload}
    Choose File        ${upload_btn}        ${image_path}
    Input Text        id=currentAddress        Koh Samui, Surat Thani
    Execute Javascript        window.scrollTo(0,document.body.scrollHeight)  
    Click Button        id=submit
    Wait Until Element Is Visible        id=example-modal-sizes-title-lg      
    Wait Until Page Contains        Thanks for submitting the form  
    # Dialogs.Pause Execution

    
