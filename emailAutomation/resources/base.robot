*** Settings ***
Documentation               Arquivo base do Projeto de Automação

Library         Zoomba.DesktopLibrary
Library         Browser
Library         Collections
Library         OperatingSystem

Resource        actions/sendByJSON.robot
Resource        helpers/helpers.robot

*** Keywords ***
