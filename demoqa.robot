*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                        https://demoqa.com/automation-practice-form
${FNAME_INPUT}                id:firstName
${LNAME_INPUT}                id:lastName
${EMAIL_INPUT}                id:userEmail
${GENDER_RADIO_MALE}          //label[@for='gender-radio-1']
${MOBILE_NUMBER}              id:userNumber
${BIRTH_SELECT}               //input[@id='dateOfBirthInput']
${SUBJECTS_INPUT}             id:subjectsInput

*** Test Cases ***
Cenário 1: Realizando meu cadastro com todas as informações necessárias
    [Setup]    Abrir o Google Chrome e acessar o site
    Preencher os campos First Name, Last Name e Email
    Marcar a opção "Male" na área de Gender
    Preencher o campo Mobile Number
    Selecionar a data 26 de Setembro de 1995 em Date of Birth
    Preencher o campo Subjects com o assunto "Vasco da Gama!"
    Fechar navegador

*** Keywords ***

Clicar Elemento
    [Timeout]                        10s
    [Arguments]                      ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element                    ${locator}

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

Selecao Por Index
Abrir o Google Chrome e acessar o site
    Open Browser                     ${URL}    chrome
    Maximize Browser Window

Preencher os campos First Name, Last Name e Email
    Inserir Texto                    ${FNAME_INPUT}    Fernando
    Inserir Texto                    ${LNAME_INPUT}    Veloso
    Inserir Texto                    ${EMAIL_INPUT}    fernandoveloso95@outlook.com

Marcar a opção "Male" na área de Gender
    Clicar Elemento                  ${GENDER_RADIO_MALE}

Preencher o campo Mobile Number
    Inserir Texto                    ${MOBILE_NUMBER}    9876543210

Selecionar a data 26 de Setembro de 1995 em Date of Birth 
    Clicar Elemento                  ${BIRTH_SELECT}
    Click Element                    xpath=//select[contains(@class,'react-datepicker__month-select')]
    Select From List By Index        xpath=//select[contains(@class,'react-datepicker__month-select')]    8
    Selecao Por Valor                //select[@class='react-datepicker__year-select']    1995
    Click Element                    xpath=//div[contains(@class,'react-datepicker__day--026') and not(contains(@class,'--outside-month'))]
    

Preencher o campo Subjects com o assunto "Vasco da Gama!"
    Inserir Texto                    ${SUBJECTS_INPUT}    Vasco da Gama
    Press Key                        ${SUBJECTS_INPUT}    ENTER

Fechar navegador
    Close Browser