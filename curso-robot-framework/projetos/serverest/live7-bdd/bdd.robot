*** Settings ***

*** Variables ***

*** Keywords ***
Estou na página de login
    Log To Console    Estou na página de login

Eu faço login com nome de usuário "${username}" e senha "${password}"
    Log To Console    Eu faço login com nome de usuário "${username}" e senha "${password}"
    IF   "${username}" == "admin" and "${password}" == "admin"
        Log To Console    Login com sucesso
        Set Test Variable    ${login_status}    True
    ELSE
        Log To Console    O Login falhou
        Set Test Variable    ${login_status}    False
    END

Eu deveria ver a página de boas-vindas
    Log To Console    Eu deveria ver a página de boas-vindas
    IF   "${login_status}" == "True"
        Log To Console    A página de boas-vindas é exibida
    ELSE
        Log To Console    A página de boas-vindas não é exibida
        Fail    A página de boas-vindas não é exibida
    END

Eu deveria ver a mensagem de erro
    Log To Console    Eu deveria ver a mensagem de erro
    IF   "${login_status}" == "False"
        Log To Console    Mensagem de erro é exibida
    ELSE
        Log To Console    A mensagem de erro não é exibida
        Fail    A mensagem de erro não é exibida
    END

Eu deveria conseguir fazer login novamente
    Log To Console    Eu deveria conseguir fazer login novamente
    Log To Console    A página de login é exibida

*** Test Cases ***
Login With Admin
    [Documentation]    Este caso de teste é para testar o login com a sintaxe BDD
    Given Estou na página de login
    When Eu faço login com nome de usuário "admin" e senha "admin"
    Then Eu deveria ver a página de boas-vindas

Login With Invalid User
    [Documentation]    Este caso de teste é para testar o login com a sintaxe BDD
    Given Estou na página de login
    When Eu faço login com nome de usuário "invalid" e senha "invalid"
    Then Eu deveria ver a mensagem de erro
    And Eu deveria conseguir fazer login novamente