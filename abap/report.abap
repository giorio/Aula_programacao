*Para comentários de linha inteira, primeiro caractere deverá ser o "*"
*Todos os programas abap desenvolvido devem iniciar com "z" e "y"
*Todos as linhas comandos devem finalizar com "."

REPORT ZR00001. "Isso é um comentário pós código

Write 'esse comando escreve na tela, deverá usar aspas simples ("'")'.

Write: / 'Esse é um outro jeito de entrar com o comando",     "a virgula indica que o comando continua em outra linha
      / 'o comando "/" quebra a linha                         "sem a / não há quebra de linhas.
      /20 'esse texto vai iniciar na coluna 20'.
      
Write: / 'essa é 5ª linha'.
skip 1.                                                       "Pula um número especifico de linhas
Write: / 'essa é a 7ª linha',
       / 'fundo vermelho' color 6.                            "comando color utiliza cores na hora de imprimir, para saber o código da cor, colocar o cursor no comando e depois F1
Write: / 'letra vermelha' color 6 inverse.                    "comando inverte a cor do fundo para cor da letra.
Uline.                                                        "imprimi um linha da coluna 0 até o final da tela
FORMAT COLOR 1.                                               "indica que deste ponto para frente seguirá esse comando.
Write: / 'Todo esse texto'.
Write: 'será impresso em'.
write: 'azul'.
Format                                                        "CTRL + espaço - > exibe um lista de opções
