*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/user_variables.robot

*** Keywords ***
Cadastrar Usuário
    Open Browser    https://front.serverest.dev/cadastrarusuarios    chrome
    Maximize Browser Window
    Input Text      id=nome         ${NOME}
    Input Text      id=email        ${EMAIL}
    Input Text      id=password     ${SENHA}
    Click Button    id=administrador
    Click Button    //*[@id="root"]/div/div/form/div[5]/button
    Wait Until Page Contains    Este é seu sistema para administrar seu ecommerce.    timeout=10s
    Close Browser