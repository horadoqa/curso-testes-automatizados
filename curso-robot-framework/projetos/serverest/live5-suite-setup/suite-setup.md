Boa! Isso vai deixar o processo mais profissional e automático — especialmente quando você quiser rodar os testes de login sem se preocupar se o usuário já foi cadastrado.

Vamos montar **uma suíte de testes com `Suite Setup`**, que **cadastra o usuário automaticamente antes de rodar qualquer teste da suíte** (no caso, o teste de login).

---

## 📁 Estrutura final do projeto

```bash
robot-project/
│
├── tests/
│   └── suite_login.robot   ← a suíte com setup
│
├── resources/
│   ├── CadastroPage.robot
│   └── LoginPage.robot
│
└── variables/
    └── user_variables.robot
```

---

## 🧠 Objetivo

- Usar o **cadastro como `Suite Setup`**
- Depois disso, o teste de login vai rodar normalmente usando o usuário cadastrado

---

## 🧩 Arquivos passo a passo

---

### 🔹 `variables/user_variables.robot`

```robot
*** Variables ***
${NOME}           Hora do QA
${EMAIL}          horadoqa@teste.com
${SENHA}          1q2w3e4r
```

---

### 🔹 `resources/CadastroPage.robot`

```robot
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
```

---

### 🔹 `resources/LoginPage.robot`

```robot
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
```

---

### 🧪 `tests/suite_login.robot`

```robot
*** Settings ***
Suite Setup    Cadastrar Usuário
Resource       ../resources/CadastroPage.robot
Resource       ../resources/LoginPage.robot

*** Test Cases ***
Login com Sucesso
    Login com Usuário
```

---

## ✅ Como executar

Dentro da pasta do projeto, rode:

```bash
robot tests/suite_login.robot
```

O que acontece:

1. Antes de **qualquer teste** da suíte rodar, o **usuário é cadastrado**.
2. Depois disso, o teste de login roda com o usuário criado.
3. Ambos os testes usam os mesmos dados definidos em `user_variables.robot`.

---

## 🔄 Variações possíveis

- Quer fazer isso com **Test Setup** em vez de Suite Setup? Também rola, mas será executado antes de **cada teste individualmente**.
- Pode adicionar mais testes à suíte e todos vão se beneficiar do cadastro feito no início.

---

Se quiser, posso gerar esse projeto em formato `.zip` ou te ajudar a criar um script de execução automatizada. Quer que eu faça isso?