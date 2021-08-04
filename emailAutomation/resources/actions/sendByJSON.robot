*** Settings ***
Documentation               Ações do envio de Email usando os dados manipulados no JSON

*** Keywords ***
Fill List To Sent
    [Arguments]     ${listToSend}

    Wait For And Input Text     accessibility_id=SearchBox           ${listToSend}          5
    Send Keys                '\ue004' 

Fill Subject TextBox
    [Arguments]     ${subjectText}
    
    Wait For And Input Text     name=Assunto                        ${subjectText}              5  

Fill Email Body
    [Arguments]     ${bodyText}
    
    FOR   ${line}   IN   @{bodyText}
        Input Text      name=Mensagem                       ${line}
    END
   
Click Send Email
     Click Element       name=Enviar

Send New Email By JSON
    [Arguments]     ${jsonfile}  

        ${fixture}              Get JSON          ${jsonfile}  
       
        ${subject}              Set Variable       ${fixture['subject']}         
        ${bodyText}             Set Variable       ${fixture['body']}       
 
        ${listToSend}=        Create Email List To Send By List         ${fixture}  

        Fill List To Sent       ${listToSend}
        Fill Subject TextBox    ${subject}
        Fill Email Body         ${bodyText}
        
        Click Send Email

Create Email List To Send By List
    [Arguments]     ${listToSend}

    ${emails}           Set Variable      ${listToSend['sentTo']}  
    ${emailsToSent}     Set Variable      ${EMPTY}

    FOR   ${item}   IN   @{emails}
        ${emailsToSent}=    Catenate       ${emailsToSent}        ${item['email']}/

    END
       
    [Return]             ${emailsToSent}