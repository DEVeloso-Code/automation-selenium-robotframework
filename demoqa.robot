*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                       https://demoqa.com/automation-practice-form
${FNAME_INPUT}               id:firstName
${LNAME_INPUT}               id:lastName
${EMAIL_INPUT}               id:userEmail
${GENDER_RADIO_MALE}         //label[@for='gender-radio-1']
${MOBILE_NUMBER}             id:userNumber
${BIRTH_SELECT}              //input[@id='dateOfBirthInput']
${SUBJECTS_INPUT}            id:subjectsInput
${HOBBIES_1}                 xpath=//label[@for='hobbies-checkbox-1']
${HOBBIES_3}                 xpath=//label[@for='hobbies-checkbox-3']
${UPLOAD_PICTURE}            xpath=//input[@id='uploadPicture']
${ARQUIVO}                   C:/projetos robot/robot projetos pessoais/arquivos/bailarinaddd.png


*** Test Cases ***
Cenário 1: Realizando meu cadastro com todas as informações necessárias
    [Setup]    Abrir O Navegador E Acessar O Site
    Preencher Os Campos De Cadastro: Nome, Sobrenome E Email
    Selecionar A Opcao "Male"
    Preencher O Numero De Telefone
    Selecionar A Data 26 De Setembro De 1995
    Preencher O Assunto
    Selecionar Meus Hobbies
    Carregar Arquivo
    Manter Navegador Aberto

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

Abrir O Navegador E Acessar O Site
    Open Browser                     ${URL}            chrome
    Maximize Browser Window

Preencher Os Campos De Cadastro: Nome, Sobrenome E Email
    Inserir Texto                    ${FNAME_INPUT}    Fernando
    Inserir Texto                    ${LNAME_INPUT}    Veloso
    Inserir Texto                    ${EMAIL_INPUT}    fernandoveloso95@outlook.com

Selecionar A Opcao "Male"
    Clicar Elemento                  ${GENDER_RADIO_MALE}

Preencher O Numero De Telefone
    Inserir Texto                    ${MOBILE_NUMBER}    9876543210

Selecionar A Data 26 De Setembro De 1995
    Clicar Elemento                  ${BIRTH_SELECT}
    Select From List By Index        xpath=//select[contains(@class,'react-datepicker__month-select')]    8
    Select From List By Value        xpath=//select[@class='react-datepicker__year-select']    1995
    Clicar Elemento                  xpath=//div[contains(@class,'react-datepicker__day--026') and not(contains(@class,'--outside-month'))]

Preencher o campo Subjects com o assunto "Vasco da Gama!"
    Inserir Texto                    ${SUBJECTS_INPUT}    Vasco da Gama

Selecionar A Data 26 De Setembro De 1995
    Clicar Elemento                  ${BIRTH_SELECT}
    Selecao Por Index                xpath=//select[contains(@class,'react-datepicker__month-select')]    8
    Selecao Por Valor                //select[@class='react-datepicker__year-select']    1995
    Clicar Elemento                  xpath=//div[contains(@class,'react-datepicker__day--026') and not(contains(@class,'--outside-month'))]

Preencher O Assunto
    Inserir Texto                    ${SUBJECTS_INPUT}    Vasco da Gama!

    Execute JavaScript               window.scrollBy(0, 300)

Selecionar Meus Hobbies
    Clicar Elemento                  ${HOBBIES_1}
    Clicar Elemento                  ${HOBBIES_3}

Carregar Arquivo
#Nao e necessario    Clicar Botao                     ${UPLOAD_PICTURE} 
    Choose File                      ${UPLOAD_PICTURE}    ${ARQUIVO}      

Manter Navegador Aberto
    Sleep    60s