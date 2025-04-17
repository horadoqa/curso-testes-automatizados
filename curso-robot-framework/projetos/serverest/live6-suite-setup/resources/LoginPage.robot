*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/user_variables.robot

*** Keywords ***
Login com Usuário
    Open Browser    https://front.serverest.dev/login    chrome
    Maximize Browser Window
    Input Text    id=email       ${EMAIL}
    Input Text    id=password    ${SENHA}
    Click Button  //*[@id="root"]/div/div/form/button
    Wait Until Page Contains    Este é seu sistema para administrar seu ecommerce.    timeout=10s
    Close Browser