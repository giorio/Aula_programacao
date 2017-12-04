* Cabelho
*----------------------------------------------------------------------------
* report ZR00004
*
*----------------------------------------------------------------------------

report ZR00004

*Declaração de variáveis
DATA: V_DATA TYPE D,                                                'boa pratica colocar no nome da variavel o prefixo "V_"
      V_HORA TYPE T,
      V_NOME TYPE STRING.
      
*Declaração de Constantes
CONSTANTS C_ANO(4) TYPE C VALUE '2017'.                             'boa pratica colocar no nome da variavel o prefixo "C_"

*Atribuindo valores a variáveis
V_DATA = '20171204'.
V_HORA = '100000'.
V_NOME = 'Gustavo Di Iório'.

*Impressão de valores
WRITE: /'Nome: ', V_NOME,
       /'Data: ', V_DATA DD/MM/YYYY,                                 'para imprimir data no padrão brasileiro
       /'Hora: ', V_HORA ENVIRONMENT TIME FORMAT.                    'para imprimir em formato de hora
       /'Ano: ', C_ANO.
