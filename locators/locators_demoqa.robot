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
${ARQUIVO}                   C:/projetos robot/robot projetos pessoais/arquivos/bailarinaddd.png