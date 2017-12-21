*&------------------------------
*& Calculadora
*& report ZR0006
*&
*&
*&
*&------------------------------

REPORT ZR0006.

*Declaração de variavel
DATA: V_RESUL TYPE I.

*Tela de seleção
PARAMETERS: P_NUM1 TYPE I,
            P_NUM2 TYPE I,
            P_SOMA RADIOBUTTON GROUP GR1,
            P_SUBT RADIOBUTTON GROUP GR1,
            P_MULT RADIOBUTTON GROUP GR1,
            P_DIVI RADIOBUTTON GROUP GR1.

*Efetuando calculos
IF P_SOMA = 'X'.
            V_RESUL = P_NUM1 + P_NUM2.
ELSEIF P_SUBT = 'X'.
            V_RESUL = P_NUM1 - P_NUM2.
ELSEIF P_MULT = 'X'.
            V_RESUL = P_NUM1 * P_NUM2.
ELSEIF P_DIVI = 'X'.
            V_RESUL = P_NUM1 / P_NUM2.
ENDIF.


*Imprimindo resultado
WRITE: 'Resultado: ', V_RESUL.
