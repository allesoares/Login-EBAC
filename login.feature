# language: pt

Funcionalidade: Login na plataforma
  Como cliente da EBAC-SHOP
  Quero fazer o login (autenticação) na plataforma
  Para visualizar meus pedidos

  Contexto:
    Dado que estou na página de login da EBAC-SHOP

  Cenário: Login com credenciais válidas
    Dado que insiro o e-mail "cliente@email.com"
    E insiro a senha "Senha@123"
    Quando clico no botão "Entrar"
    Então devo ser redirecionado para a tela de checkout
    E devo visualizar meus pedidos

  Cenário: Login com e-mail inválido
    Dado que insiro o e-mail "email_invalido"
    E insiro a senha "Senha@123"
    Quando clico no botão "Entrar"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

  Cenário: Login com senha inválida
    Dado que insiro o e-mail "cliente@email.com"
    E insiro a senha "senhaErrada"
    Quando clico no botão "Entrar"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

  Cenário: Login com e-mail e senha inválidos
    Dado que insiro o e-mail "naoexiste@email.com"
    E insiro a senha "SenhaErrada999"
    Quando clico no botão "Entrar"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

  Cenário: Login com campos em branco
    Dado que não preencho o campo de e-mail
    E não preencho o campo de senha
    Quando clico no botão "Entrar"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

  Cenário: Login com apenas o e-mail preenchido
    Dado que insiro o e-mail "cliente@email.com"
    E não preencho o campo de senha
    Quando clico no botão "Entrar"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

  Cenário: Login com apenas a senha preenchida
    Dado que não preencho o campo de e-mail
    E insiro a senha "Senha@123"
    Quando clico no botão "Entrar"
    Então deve ser exibida a mensagem de alerta "Usuário ou senha inválidos"
    E devo permanecer na página de login

  Esquema do Cenário: Validação de diferentes combinações de credenciais
    Dado que insiro o e-mail "<email>"
    E insiro a senha "<senha>"
    Quando clico no botão "Entrar"
    Então o resultado esperado deve ser "<resultado>"

    Exemplos:
      | email                  | senha        | resultado                          |
      | cliente@email.com      | Senha@123    | redirecionado para checkout        |
      | email_invalido         | Senha@123    | Usuário ou senha inválidos         |
      | cliente@email.com      | senhaErrada  | Usuário ou senha inválidos         |
      | naoexiste@email.com    | Senha@123    | Usuário ou senha inválidos         |
      |                        |              | Usuário ou senha inválidos         |
      |                        | Senha@123    | Usuário ou senha inválidos         |
      | cliente@email.com      |              | Usuário ou senha inválidos         |
