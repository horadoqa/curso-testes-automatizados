# Senhas

Esconder senhas ou informações sensíveis em testes com **Robot Framework** é uma boa prática de segurança. Existem várias formas de fazer isso dependendo de como você está estruturando seu projeto. Aqui estão algumas das abordagens mais comuns:

---

### ✅ 1. **Usar Variables File (`.py`)**
Você pode manter a senha em um arquivo Python separado e referenciar isso no seu teste.

**arquivo `secrets.py`:**
```python
# secrets.py
USERNAME = "usuario"
PASSWORD = "senha_super_secreta"
```

**no teste Robot:**
```robot
*** Settings ***
Variables    secrets.py

*** Test Cases ***
Login Com Sucesso
    Log    Usando usuário ${USERNAME} e senha ${PASSWORD}
```

> A senha fica oculta do `.robot` e pode ser adicionada ao `.gitignore`.

---

### ✅ 2. **Usar Variáveis de Ambiente**
Configure variáveis de ambiente no sistema ou CI/CD e leia elas dentro do teste.

**no terminal ou pipeline:**
```bash
export LOGIN_USER=usuario
export LOGIN_PASS=senha_super_secreta
```

**no teste Robot:**
```robot
*** Variables ***
${USERNAME}    %{LOGIN_USER}
${PASSWORD}    %{LOGIN_PASS}
```

---

### ✅ 3. **Ocultar no Output com `Set Log Level`**
Se você precisa usar a senha no `.robot` e ainda assim quer escondê-la dos logs:

```robot
*** Test Cases ***
Login Com Senha Oculta
    Set Log Level    WARN
    Input Text    id=senha    minha_senha_secreta
    Set Log Level    INFO
```

Isso faz com que aquele trecho que insere a senha não apareça nos logs.

---

### ✅ 4. **Criptografar com Robot Framework Secrets (extra)**

Para utilizar o `robotframework-secretslibrary` no Robot Framework, siga os passos abaixo:

---

### 1. Instalação

O `robotframework-secretslibrary` pode ser instalado via `pip`:

```bash
pip install robotframework-secretslibrary
```

---

### 2. Configuração

Crie um arquivo de variáveis (por exemplo, `secrets.py`) contendo as credenciais:

```python
# secrets.py
USERNAME = "usuario"
PASSWORD = "senha_super_secreta"
```

Em seguida, crie um arquivo de recursos (por exemplo, `secrets.resource`) para importar as variáveis:

```robot
*** Settings ***
Variables    secrets.py
```

No seu arquivo de teste, importe o arquivo de recursos:

```robot
*** Settings ***
Resource    secrets.resource
```

Agora, você pode usar as variáveis `${USERNAME}` e `${PASSWORD}` nos seus casos de teste.

---

### 3. Execução

Para executar os testes, utilize o comando:

```bash
robot --variablefile secrets.resource nome_do_teste.robot
```


Isso garantirá que as credenciais sejam carregadas de forma segura durante a execução dos testes.

---

Se você estiver utilizando um sistema de integração contínua (CI), como Jenkins, é recomendável configurar as variáveis de ambiente diretamente no ambiente de execução, evitando a necessidade de armazenar credenciais em arquivos.

Além disso, para ocultar senhas nos logs de execução, você pode utilizar a biblioteca `robotframework-crypto`, que permite criptografar e descriptografar senhas de forma segura.

