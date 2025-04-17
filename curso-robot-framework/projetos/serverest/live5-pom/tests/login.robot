*** Settings ***
Resource    ../resources/LoginPage.robot

*** Test Cases ***
Login com Usuário Cadastrado
    Acessar Página de Login
    Preencher Formulário de Login
    Submeter Login
    Verificar Login com Sucesso
    Fechar Navegador
