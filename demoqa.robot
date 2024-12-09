*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                        https://demoqa.com/automation-practice-form
${FNAME_INPUT}                id:firstName
${LNAME_INPUT}                id:lastName
${EMAIL_INPUT}                id:userEmail
${GENDER_RADIO_MALE}          xpath=//label[@for='gender-radio-1']
${MOBILE_NUMBER}              id:userNumber
${BIRTH_SELECT}               xpath=//div[@aria-label="Choose Tuesday, September 26th, 1995"]
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
Abrir o Google Chrome e acessar o site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Preencher os campos First Name, Last Name e Email
    Wait Until Element Is Visible    ${FNAME_INPUT}    10s
    Input Text                       ${FNAME_INPUT}    Fernando

    Wait Until Element Is Visible    ${LNAME_INPUT}    10s
    Input Text                       ${LNAME_INPUT}    Veloso
    
    Wait Until Element Is Visible    ${EMAIL_INPUT}    10s
    Input Text                       ${EMAIL_INPUT}    fernandoveloso95@outlook.com

Marcar a opção "Male" na área de Gender
    Wait Until Element Is Visible    ${GENDER_RADIO_MALE}    10s
    Click Element                   ${GENDER_RADIO_MALE}

Preencher o campo Mobile Number
    Wait Until Element Is Visible    ${MOBILE_NUMBER}    10s
    Input Text                       ${MOBILE_NUMBER}    9876543210

Selecionar a data 26 de Setembro de 1995 em Date of Birth 
    Wait Until Element Is Visible    ${BIRTH_SELECT}    10s
    Click Element                xpath=//select[contains(@class,'react-datepicker__month-select')]
    Select From List By Value    xpath=//select[contains(@class,'react-datepicker__month-select')]    8
    Click Element                xpath=//select[contains(@class,'react-datepicker__year-select')]
    Click Element                xpath=//div[contains(@class,'react-datepicker__day--026') and not(contains(@class,'--outside-month'))]
    Select From List By Value    xpath=//select[contains(@class,'react-datepicker__year-select')]    1995

Preencher o campo Subjects com o assunto "Vasco da Gama!"
    Wait Until Element Is Visible    ${SUBJECTS_INPUT}    10s
    Input Text                       ${SUBJECTS_INPUT}    Vasco da Gama!
    Press Key                        ${SUBJECTS_INPUT}    ENTER

Fechar navegador
    Close Browser