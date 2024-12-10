*** Keywords ***

Clicar Elemento
    [Timeout]                        10s
    [Arguments]                      ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s
    Click Element                    ${locator}



Subir arquivo
    Scroll To Element                ${UPLOAD_PICTURE}
    Wait Until Element Is Visible    ${UPLOAD_PICTURE}    10s
    Choose File                      ${UPLOAD_PICTURE}    ${ARQUIVO}


Inserir Texto
    [Timeout]                        10s
    [Arguments]                      ${locator}    ${texto}
    Wait Until Element Is Visible    ${locator}
    Input Text                       ${locator}    ${texto}

Selecao Por Valor
    [Timeout]                        10s
    [Arguments]                      ${locator}    ${valor} 
    Wait Until Element Is Visible    ${locator}
    Select From List By Value        ${locator}    ${valor}  

Selecao Por Label
    [Timeout]                        10s
    [Arguments]                      ${locator}    ${valor}
    Wait Until Element Is Visible    ${locator}  
    Select From List By Label        ${locator}    ${valor}

Selecao Por Index
    [Timeout]                        10s
    [Arguments]                      ${locator}    ${index}
    Wait Until Element Is Visible    ${locator}
    Select From List By Index        ${locator}    ${index}