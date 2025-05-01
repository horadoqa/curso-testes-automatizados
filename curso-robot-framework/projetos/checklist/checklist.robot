*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${DELAY}            5
${HTML_PATH}        file://${CURDIR}/index.html

*** Keywords ***
Abrir Página e Verificar Título
    Open Browser    ${HTML_PATH}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Checklist - Robot Framework
    Sleep    ${DELAY}

Marcar Todos Os Itens Do Checklist
    Click Element    id:chk-instalacao-python
    Click Element    item-instalacao-robot
    Click Element    item-instalacao-seleniumlibrary
    Click Element    item-instalacao-ChromeDriver
    Click Element    id:chk-primeiro-teste
    Click Element    id:chk-variaveis
    Click Element    id:chk-keywords
    Click Element    id:chk-keywords-resource
    Click Element    id:chk-pom
    Sleep    ${DELAY}

Verificar Que Todos Os Checkboxes Estão Marcados
    Checkbox Should Be Selected    id:chk-instalacao-python
    Checkbox Should Be Selected    id:chk-instalacao-robot
    Checkbox Should Be Selected    id:chk-instalacao-seleniumlibrary
    Checkbox Should Be Selected    id:chk-instalacao-ChromeDriver
    Checkbox Should Be Selected    id:chk-primeiro-teste
    Checkbox Should Be Selected    id:chk-variaveis
    Checkbox Should Be Selected    id:chk-keywords
    Checkbox Should Be Selected    id:chk-keywords-resource
    Checkbox Should Be Selected    id:chk-pom

Fechar Navegador
    Close Browser

*** Test Cases ***
Checklist
    Abrir Página e Verificar Título
    Marcar Todos Os Itens Do Checklist
    Verificar Que Todos Os Checkboxes Estão Marcados
    Fechar Navegador
