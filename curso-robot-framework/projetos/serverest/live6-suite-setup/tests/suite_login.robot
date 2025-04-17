*** Settings ***
Suite Setup    Cadastrar Usuário
Resource       ../resources/CadastroPage.robot
Resource       ../resources/LoginPage.robot

*** Test Cases ***
Login com Sucesso
    Login com Usuário