# language: pt

Funcionalidade: Configurar produto
  Como cliente da EBAC-SHOP
  Quero configurar meu produto de acordo com meu tamanho e gosto e escolher a quantidade
  Para depois inserir no carrinho

  Contexto:
    Dado que estou na página de detalhes de um produto

  Cenário: Configuração completa e adição ao carrinho
    Dado que seleciono a cor "Azul"
    E seleciono o tamanho "M"
    E informo a quantidade "2"
    Quando clico no botão "Adicionar ao carrinho"
    Então o produto deve ser adicionado ao carrinho com sucesso

  Cenário: Campos obrigatórios não preenchidos
    Dado que não seleciono cor, tamanho nem quantidade
    Quando clico no botão "Adicionar ao carrinho"
    Então deve ser exibida uma mensagem de alerta indicando que cor, tamanho e quantidade são obrigatórios

  Cenário: Apenas cor não selecionada
    Dado que seleciono o tamanho "G"
    E informo a quantidade "1"
    Mas não seleciono nenhuma cor
    Quando clico no botão "Adicionar ao carrinho"
    Então deve ser exibida uma mensagem indicando que a cor é obrigatória

  Cenário: Apenas tamanho não selecionado
    Dado que seleciono a cor "Vermelho"
    E informo a quantidade "1"
    Mas não seleciono nenhum tamanho
    Quando clico no botão "Adicionar ao carrinho"
    Então deve ser exibida uma mensagem indicando que o tamanho é obrigatório

  Cenário: Apenas quantidade não informada
    Dado que seleciono a cor "Verde"
    E seleciono o tamanho "P"
    Mas não informo a quantidade
    Quando clico no botão "Adicionar ao carrinho"
    Então deve ser exibida uma mensagem indicando que a quantidade é obrigatória

  Cenário: Limite máximo de 10 produtos por venda
    Dado que seleciono a cor "Preto"
    E seleciono o tamanho "GG"
    E informo a quantidade "10"
    Quando clico no botão "Adicionar ao carrinho"
    Então o produto deve ser adicionado ao carrinho com sucesso
    E o carrinho deve conter 10 unidades do produto

  Cenário: Quantidade acima do limite máximo permitido
    Dado que seleciono a cor "Branco"
    E seleciono o tamanho "M"
    E informo a quantidade "11"
    Quando clico no botão "Adicionar ao carrinho"
    Então deve ser exibida uma mensagem de alerta informando que o limite máximo é de 10 produtos por venda

  Cenário: Limpar seleções retorna ao estado original
    Dado que seleciono a cor "Azul"
    E seleciono o tamanho "G"
    E informo a quantidade "3"
    Quando clico no botão "Limpar"
    Então todos os campos devem voltar ao estado original sem seleção

  Esquema do Cenário: Validação de combinações de cor, tamanho e quantidade
    Dado que seleciono a cor "<cor>"
    E seleciono o tamanho "<tamanho>"
    E informo a quantidade "<quantidade>"
    Quando clico no botão "Adicionar ao carrinho"
    Então o resultado esperado deve ser "<resultado>"

    Exemplos:
      | cor     | tamanho | quantidade | resultado                            |
      | Azul    | P       | 1          | produto adicionado com sucesso       |
      | Verde   | M       | 5          | produto adicionado com sucesso       |
      | Preto   | G       | 10         | produto adicionado com sucesso       |
      | Branco  | GG      | 0          | quantidade inválida                  |
      | Roxo    | M       | 11         | limite máximo de 10 produtos atingido|
