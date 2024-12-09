*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                        https://demoqa.com/automation-practice-form
${FNAME_INPUT}                id:firstName
${LNAME_INPUT}                id:lastName
${EMAIL_INPUT}               id:userEmail
${GENDER_RADIO_MALE}         //label[@for='gender-radio-1']
${MOBILE_NUMBER}             id:userNumber
${BIRTH_SELECT}              //input[@id='dateOfBirthInput']
${SUBJECTS_INPUT}            id:subjectsInput
${HOBBIES_1}                 xpath=//label[@for='hobbies-checkbox-1']
${HOBBIES_3}                 xpath=//label[@for='hobbies-checkbox-3']
${UPLOAD_PICTURE}            xpath=//input[@id='uploadPicture']
${ARQUIVO}                   C:\projetos robot\robot projetos pessoais\arquivos\bailarinaddd.png

*** Test Cases ***
Cenário 1: Realizando meu cadastro com todas as informações necessárias
    [Setup]    Abrir o Google Chrome e acessar o site
    Preencher os campos First Name, Last Name e Email
    Marcar a opção "Male" na área de Gender
    Preencher o campo Mobile Number
    Selecionar a data 26 de Setembro de 1995 em Date of Birth
    Preencher o campo Subjects com o assunto "Vasco da Gama!"
    Clicar nos botões para marcar meus hobbies
    Manter navegador aberto após o teste

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
    [Timeout]                        10s
    [Arguments]                      ${locator}    ${valor}
    Wait Until Element Is Visible    ${locator}  
    Select From List By Label        ${locator}    ${valor}

Selecao Por Index
    [Timeout]                        10s
    [Arguments]                      ${locator}    ${index}
    Wait Until Element Is Visible    ${locator}
    Select From List By Index        ${locator}    ${index}

Abrir o Google Chrome e acessar o site
    Open Browser                     ${URL}        chrome
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
    Selecao Por Index                xpath=//select[contains(@class,'react-datepicker__month-select')]    8
    Selecao Por Valor                //select[@class='react-datepicker__year-select']    1995
    Clicar Elemento                  xpath=//div[contains(@class,'react-datepicker__day--026') and not(contains(@class,'--outside-month'))]

Preencher o campo Subjects com o assunto "Vasco da Gama!"
    Inserir Texto                    ${SUBJECTS_INPUT}    Vasco da Gama!

    Execute JavaScript               window.scrollBy(0, 300)

Clicar nos botões para marcar meus hobbies
    Selecao Por Label                ${HOBBIES_1}    Sports
    Selecao Por Label                ${HOBBIES_3}    Music

Manter navegador aberto após o teste
    Sleep    60s