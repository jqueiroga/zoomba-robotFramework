*** Settings ***
Documentation               Arquivo com as Keywords de auxílio no Projeto de Automação

Library         Collections
Library         OperatingSystem

*** Keywords ***
Get JSON
    [Arguments]     ${filen_name}

    ${file}=          Get File      ${EXECDIR}/resources/fixture/${filen_name}
    ${jsonObject}     Evaluate      json.loads($file)         json

    [return]          ${jsonObject}