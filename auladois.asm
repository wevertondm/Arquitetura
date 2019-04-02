TITLE PROGRMA PARA CONVERSAO DE LETRA MINUSC./MAIUSC.
.MODEL SMALL
.STACK 100H
.DATA
CR     EQU      0DH
LF     EQU      0AH
MENSAGEM1       DB      'Entre com uma letra minuscula:$'
MENSAGEM2       DB      CR,LF,'Em maiuscula ela fica: '
CHAR            DB      ?,'$'
.CODE
MAIN PROC
;INICIALIZANDO O REGISTRADOR DS
        MOV AX,@DATA
        MOV DS,AX        ;DS INICIALIZANDO
;exibindo a MENSAGEM1
        LEA DX,MENSAGEM1 ;offset de endereco de MENSAGEM1 em DX
        MOV AH,9            ;funcao DOS para exibir  'string'
        INT 21H           ;exibindo
;entrada do caracter de conversao para maiuscula
        MOV AH,1          ;funcao DOS para leitura de caracter
        INT 21H             ;entrada
        SUB AL,20H        ;conversao ASCll de minuscula/maiuscula
        MOV CHAR,AL               ;salvando caracter na variavel CHAR
;exibindo a MENSAGEM2 e o caracter convertido
        LEA DX,MENSAGEM2 ;offset de endereco de MANSAGEM1 em DX
        MOV AH,9            ;funcao DOS para exibir 'string'
        INT 21H              ;exibindo
;retorno ao DOS
        MOV AH,4CH        ;funcao DOS para saida
        INT 21H           ;saindo
MAIN ENDP
    END MAIN     
