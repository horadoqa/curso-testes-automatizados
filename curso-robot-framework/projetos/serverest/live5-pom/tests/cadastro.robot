*** Settings ***
Resource    ../resources/CadastroPage.robot

*** Test Cases ***
Cadastro de Usuário com Sucesso
    Acessar Página de Cadastro
    Preencher Formulário de Cadastro
    Submeter Cadastro
    Verificar Cadastro com Sucesso
    Fechar Navegador
