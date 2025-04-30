*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://front.serverest.dev/cadastrarusuarios    
${BROWSER}     chrome
${NOME}        Hora do QA
${EMAIL}       horadoqa@teste.com
${PASSWORD}    1q2w3e4r
${ENTRAR}      //*[@id="root"]/div/div/form/div[5]/button
${MENSAGE}     Este é seu sistema para administrar seu ecommerce.

*** Keywords ***
    

*** Test Cases ***
Login Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text      id=nome    ${NOME}
    Input Text      id=email    ${EMAIL}
    Input Text      id=password    ${PASSWORD}
    Click Button    id=administrador
    Click Button    ${ENTRAR}
    Wait Until Page Contains    ${MENSAGE}    timeout=10s
    Close Browser