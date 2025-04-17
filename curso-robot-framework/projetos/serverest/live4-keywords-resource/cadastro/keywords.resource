*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://front.serverest.dev/cadastrarusuarios    
${BROWSER}    chrome
${NOME}    Hora do QA
${EMAIL}    horadoqa@teste.com
${PASSWORD}    1q2w3e4r
${ENTRAR}    //*[@id="root"]/div/div/form/div[5]/button
${MENSAGE}    Este é seu sistema para administrar seu ecommerce.

*** Keywords ***
Abrir Browser
    Open Browser    ${URL}    ${BROWSER}
    Sleep    5s

Inserir Nome
    Input Text      id=nome    ${NOME}
    Sleep    5s

Inserir E-mail
    Input Text    id=email    ${EMAIL}
    Sleep    5s

Inserir Senha
    Input Text      id=password    ${PASSWORD}
    Sleep    5s

Clicar Botão Administrador
    Click Button    id=administrador
    Sleep    5s

Clicar Botão Entrar
    Click Button    ${ENTRAR}
    Sleep    5s

Validar
    Wait Until Page Contains    ${MENSAGE}    timeout=10s

Fechar Borwser
    Close Browser
