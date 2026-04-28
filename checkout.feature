# language: pt

Funcionalidade: Tela de cadastro - Checkout
  Como cliente da EBAC-SHOP
  Quero concluir meu cadastro
  Para finalizar minha compra

  Contexto:
    Dado que estou na tela de cadastro do checkout da EBAC-SHOP

  Cenário: Cadastro com todos os dados obrigatórios preenchidos corretamente
    Dado que preencho o campo "Nome*" com "João Silva"
    E preencho o campo "E-mail*" com "joao.silva@email.com"
    E preencho o campo "CPF*" com "123.456.789-00"
    E preencho o campo "Telefone*" com "(11) 91234-5678"
    E preencho o campo "Endereço*" com "Rua das Flores, 100"
    E preencho o campo "Cidade*" com "São Paulo"
    E preencho o campo "Estado*" com "SP"
    E preencho o campo "CEP*" com "01310-100"
    Quando clico no botão "Finalizar cadastro"
    Então o cadastro deve ser concluído com sucesso
    E minha compra deve ser finalizada

  Cenário: Tentativa de cadastro com e-mail em formato inválido
    Dado que preencho todos os campos obrigatórios corretamente
    Mas preencho o campo "E-mail*" com "email-invalido"
    Quando clico no botão "Finalizar cadastro"
    Então o sistema deve exibir uma mensagem de erro informando que o formato do e-mail é inválido
    E o cadastro não deve ser concluído

  Cenário: Tentativa de cadastro com campo e-mail sem "@"
    Dado que preencho todos os campos obrigatórios corretamente
    Mas preencho o campo "E-mail*" com "emailsemarroba.com"
    Quando clico no botão "Finalizar cadastro"
    Então o sistema deve exibir uma mensagem de erro informando que o formato do e-mail é inválido

  Cenário: Tentativa de cadastro com campo e-mail sem domínio
    Dado que preencho todos os campos obrigatórios corretamente
    Mas preencho o campo "E-mail*" com "usuario@"
    Quando clico no botão "Finalizar cadastro"
    Então o sistema deve exibir uma mensagem de erro informando que o formato do e-mail é inválido

  Cenário: Tentativa de cadastro com todos os campos vazios
    Dado que não preencho nenhum campo do formulário
    Quando clico no botão "Finalizar cadastro"
    Então o sistema deve exibir mensagem de alerta indicando que os campos obrigatórios não foram preenchidos
    E o cadastro não deve ser concluído

  Cenário: Tentativa de cadastro com campo obrigatório "Nome" vazio
    Dado que preencho todos os campos obrigatórios corretamente
    Mas deixo o campo "Nome*" vazio
    Quando clico no botão "Finalizar cadastro"
    Então o sistema deve exibir mensagem de alerta indicando que o campo "Nome" é obrigatório

  Cenário: Tentativa de cadastro com campo obrigatório "CPF" vazio
    Dado que preencho todos os campos obrigatórios corretamente
    Mas deixo o campo "CPF*" vazio
    Quando clico no botão "Finalizar cadastro"
    Então o sistema deve exibir mensagem de alerta indicando que o campo "CPF" é obrigatório

  Esquema do Cenário: Validação de diferentes combinações de dados de cadastro
    Dado que preencho o campo "Nome*" com "<nome>"
    E preencho o campo "E-mail*" com "<email>"
    E preencho o campo "CPF*" com "<cpf>"
    E preencho o campo "Telefone*" com "<telefone>"
    Quando clico no botão "Finalizar cadastro"
    Então o resultado esperado deve ser "<resultado>"

    Exemplos:
      | nome        | email                    | cpf             | telefone          | resultado                                      |
      | João Silva  | joao@email.com           | 123.456.789-00  | (11) 91234-5678   | cadastro concluído com sucesso                 |
      |             | joao@email.com           | 123.456.789-00  | (11) 91234-5678   | campo Nome é obrigatório                       |
      | Maria Souza |                          | 987.654.321-00  | (21) 99876-5432   | campo E-mail é obrigatório                     |
      | Ana Lima    | email-invalido           | 111.222.333-44  | (31) 98765-4321   | formato de e-mail inválido                     |
      | Carlos Melo | carlos@                  | 555.666.777-88  | (41) 97654-3210   | formato de e-mail inválido                     |
      | Pedro Costa | pedro@dominio.com        |                 | (51) 96543-2109   | campo CPF é obrigatório                        |
      | Lucia Ramos | lucia@ramos.com          | 999.888.777-66  |                   | campo Telefone é obrigatório                   |
      |             |                          |                 |                   | campos obrigatórios não preenchidos            |
