*-----------------------------
*Utilizando PARAMETERS
*
*
*----------------------------

REPORT ZR0005

*Declaração de paramentros
PARAMETERS P_DATA TYPE D,
           P_HORA TYPE T,
           P_NOME TYPE STRING.
           
*Impressão dos valores
WRITE: / 'Nome: ', P_NOME.
WRITE: / 'Data: ', P_DATA DD/MM/YYYY.
WRITE: / 'Hora: ', P_HORA ENVIROMENT TIME FORMAT.
