*** Settings ***
Library        SeleniumLibrary
Library        Dialogs

*** Test Cases ***
Verify when input contact form correctly. Should be show data.
    Open Browser    url=https://demoqa.com/text-box    browser=chrome
    Maximize Browser Window
    Input Text    id=userName    Jakkrit Senawong
    Input Text    id=userEmail    jakkrit.senawong@gmail.com
    Input Text    id=currentAddress    koh Samui,SuratThani
    Input Text    id=permanentAddress    Takhli,Nakhonsawan
    Execute Javascript        window.scrollTo(0,document.body.scrollHeight)
    Click Button    id=submit
    Wait Until Element Contains    id=name    Jakkrit Senawong
    Wait Until Element Contains    id=email    jakkrit.senawong@gmail.com
    Dialogs.Pause Execution

Verify when input contact form unsuccessfully. Contact form isn't show data.
    Open Browser    url=https://demoqa.com/text-box    browser=chrome 
    Click Button    id=submit
    Dialogs.Pause Execution
