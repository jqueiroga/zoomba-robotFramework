*** Settings ***
Documentation     Zoomba Desktop Library Tests.


Resource         ${EXECDIR}/resources/base.robot

Suite Setup       Start App
Test Setup        Launch Application
Test Teardown     Quit Application
Suite Teardown    Driver Teardown
Force Tags        Windows

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${APP}                  microsoft.windowscommunicationsapps_8wekyb3d8bbwe!microsoft.windowslive.mail

*** Keywords ***
Start App
    [Documentation]     Sets up the application for quick launching through 'Launch Application' and starts the winappdriver
    Driver Setup
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP}
    Maximize Window
    Quit Application

*** Test Cases ***
Esperar e verifique que está na tela principal do Email
    Wait Until Element Contains       class=ListItem        jeremias.araujo@db1.com

Clicar no botão de Novo Email
    Wait For And Click Element        accessibility_id=NewButton
    Sleep   2

Enviando Novo Email Com Massa de Dados Via JSON
    [Tags]  wip 
    @{emailsToSent}         Create List
    
    Wait Until Element Contains       class=ListItem        jeremias.araujo@db1.com
    Wait For And Click Element        accessibility_id=NewButton

    Send New Email by JSON          emailData.json 


