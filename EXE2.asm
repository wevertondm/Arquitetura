TITLE EXE2
.MODEL SMALL
.STACK 100H
.DATA
CR EQU     0DH 
LF EQU     0AH
MENSAGEM1        DB 'Informe as tres iniciais do seu nome: $'
CHAR             DB CR,LF, ?
CHAR3            DB CR,LF, ?
CHAR2            DB CR,LF, ?   
CHAR1            DB CR,LF, ?
ULTIMO           DB '$'   
.CODE 
MAIN    PROC
;
;inicializando o registrador DS
;
    MOV AX,@DATA
    MOV DS,AX            ;segmento de dados inicializando
;
;obtendo o offset da posição de momoria de MENSAGEM1 (armazenando)
;
    LEA DX,MENSAGEM1     ;offset do endereço vai DX
    MOV AH,9            ;funcao DOS para exibir 'string'
    INT 21H             ;exibindo
;OBTENDO CHAR1
    MOV AH,1            ;funcao DOS leitura caracter
    INT 21H             ;entrada
    MOV CHAR1,AL

;OBTENDO CHAR2
    MOV AH,1            ;funcao DOS leitura caracter
    INT 21H             ;entrada
    MOV CHAR2,AL

;OBTENDO CHAR3
    MOV AH,1            ;funcao DOS leitura caracter
    INT 21H             ;entrada
    MOV CHAR3,AL
;exibindo CHAR3
   
    LEA DX,CHAR3        ;offset do endereço de Mensagem1 vai DX
    MOV AH,2           ;funcao DOS  para exibir string
    INT 21H            ;exibir
;exibindo CHAR
   
    LEA DX,CHAR        ;offset do endereço de Mensagem1 vai DX
    MOV AH,9           ;funcao DOS  para exibir string
    INT 21H            ;exibir

;retorno ao DOS
;
    MOV AH,4CH          ;funcao DOS para saida
    INT 21H             ;saindo
MAIN ENDP
    END MAIN