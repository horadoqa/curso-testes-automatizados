# BDD (Desenvolvimento Orientado pelo Comportamento)

## O que é BDD? 
A sintaxe Dado-Quando-Então é uma estrutura comumente usada para escrever histórias de usuário e critérios de aceitação em desenvolvimento orientado por comportamento (BDD). Ela é usada para descrever o comportamento desejado de um sistema de forma clara, concisa e consistente.

## A estrutura é dividida em três partes:

Dado : Esta seção descreve o estado inicial ou contexto do sistema. Ela define o cenário para o cenário que está sendo testado.
Quando : Esta seção descreve a ação ou evento que ocorre. Ela especifica o gatilho para o cenário que está sendo testado.
Então : Esta seção descreve o resultado esperado do cenário. Ela define os critérios de aceitação para o cenário que está sendo testado.

Exemplo:

    Given a user is on the login page
    When the user enters their username and password and clicks the login button
    Then the user should be directed to the home page.


```robot
*** Test Cases ***
Login With Admin
    Given I am on the login page
    When I login with username "admin" and password "admin"
    Then I should see the welcome page

Login With Invalid User
    Given I am on the login page
    When I login with username "invalid" and password "invalid"
    Then I should see the error message
    And I should be able to login again
```

Ele não faz um acesso a uma página de login, esse só valida se o username e o password são válidos.

## O que o código faz:

Validações Simuladas:
O teste está apenas verificando se o nome de usuário ("${username}") e a senha ("${password}") são "admin" para um login bem-sucedido ou "invalid" para um login falho. Ele não está realizando interações reais com uma página de login na web.

## Lógica de Teste:

O login é verificado com os valores passados diretamente nas palavras-chave 

> I login with username "${username}" and password "${password}".

O sucesso ou falha do login depende dos valores passados (como "admin" para sucesso ou "invalid" para falha).

A variável ${login_status} é definida de acordo com o sucesso ou falha do login, mas essa validação é feita de forma interna no script e não envolve um navegador ou página de login real.