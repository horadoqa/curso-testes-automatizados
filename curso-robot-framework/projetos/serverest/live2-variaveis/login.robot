*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://front.serverest.dev/login    
${BROWSER}     chrome
${EMAIL}       horadoqa@teste.com
${PASSWORD}    1q2w3e4r
${ENTRAR}      //*[@id="root"]/div/div/form/button
${MENSAGE}     Este é seu sistema para administrar seu ecommerce.


*** Keywords ***


*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s
    Input Text    id=email    ${EMAIL}
    Input Text      id=password    ${PASSWORD}
    Sleep    5s
    Click Button    ${ENTRAR}
    Sleep    5s
    Wait Until Page Contains    ${MENSAGE}    timeout=10s
    Close Browser