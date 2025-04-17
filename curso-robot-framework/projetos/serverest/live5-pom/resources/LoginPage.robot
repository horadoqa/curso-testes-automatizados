*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/user_variables.robot

*** Keywords ***
Acessar Página de Login
    Open Browser    https://front.serverest.dev/login    chrome
    Maximize Browser Window

Preencher Formulário de Login
    Input Text    id=email       ${EMAIL}
    Input Text    id=password    ${SENHA}

Submeter Login
    Click Button    //*[@id="root"]/div/div/form/button

Verificar Login com Sucesso
    Wait Until Page Contains    Este é seu sistema para administrar seu ecommerce.    timeout=10s

Fechar Navegador
    Close Browser
