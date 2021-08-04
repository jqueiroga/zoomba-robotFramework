*** Settings ***
Documentation     Zoomba Desktop Library Tests.
Library           Zoomba.DesktopLibrary
Suite Setup       Start App
Test Setup        Launch Application
Test Teardown     Quit Application
Suite Teardown    Driver Teardown
Force Tags        Windows

*** Variables ***
${REMOTE_URL}           http://127.0.0.1:4723
${APP}                  Microsoft.WindowsCalculator_8wekyb3d8bbwe!App

*** Keywords ***
Start App
    [Documentation]     Sets up the application for quick launching through 'Launch Application' and starts the winappdriver
    Driver Setup
    Open Application    ${REMOTE_URL}     platformName=Windows    deviceName=Windows   app=${APP}
    Maximize Window
    Quit Application

*** Test Cases ***
Esperar E Clicar No Botão Dois
    Wait For And Click Element        accessibility_id=num2Button
    Wait Until Element Contains       accessibility_id=CalculatorResults      2

Esperar E Clicar no Botao Quatro Via XPath
    Wait For And Click Element        xpath=//Button[@Name="Quatro"]
    Wait Until Element Contains       accessibility_id=CalculatorResults      4

Esperar E Clicar no Botao Cinco Via Name
    Wait For And Click Element        name=Cinco
    Wait Until Element Contains       accessibility_id=CalculatorResults      5

Esperar E Clicar no Botao Seis Via ClassName
    Wait For And Click Element       class=Button
