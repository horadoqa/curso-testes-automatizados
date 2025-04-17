*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/user_variables.robot

*** Keywords ***
Acessar Página de Cadastro
    Open Browser    https://front.serverest.dev/cadastrarusuarios    chrome
    Maximize Browser Window

Preencher Formulário de Cadastro
    Input Text      id=nome         ${NOME}
    Input Text      id=email        ${EMAIL}
    Input Text      id=password     ${SENHA}
    Click Button    id=administrador

Submeter Cadastro
    Click Button    //*[@id="root"]/div/div/form/div[5]/button

Verificar Cadastro com Sucesso
    Wait Until Page Contains    Este é seu sistema para administrar seu ecommerce.    timeout=10s

Fechar Navegador
    Close Browser
