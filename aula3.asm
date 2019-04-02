TITLE EXERCICIO 1
.MODEL SMALL
.STACK 100H
.DATA
MENSAGEM1      DB ' ? $'
MENSAGEM2      DB ' = $'
NUMERO1        DB  ?
NUMERO2        DB  ?
SOMA           DB  ?
.CODE
MAIN PROC
;
;inicializando o registrador DS
;
    MOV AX,@DATA
    MOV DS,AX            ;segmento de dados inicializando
;
;obtendo o offset da posição de momoria de MENSAGEM
;
    LEA DX,MENSAGEM1     ;offset do endereço vai DX

;exibindo a MENSAGEM
;
    MOV AH,9            ;funcao DOS para exibir 'string'
    INT 21H             ;exibindo

;entrar NUMERO1    
    MOV AH,1            ;funcao DOS leitura caracter
    INT 21H             ;entrada
    MOV NUMERO1,AL

;entrada NUMERO2
    MOV AH,1            ;funcao DOS leitura caracter
    INT 21H             ;entrada
    MOV NUMERO2,AL
    ADD AL, NUMERO1     ;soma numero1 numero2
    MOV SOMA,AL         ;movendo para variavel soma


;exibindo soma
    SUB AL,30H         ;conversao ASCll hexadecimal
    MOV SOMA,AL
;firula mensagem "="   
    MOV AX,@DATA
    MOV DS,AX           ;segmento de dados inicializando
    LEA DX,MENSAGEM2    ;offset do endereço vai DX
    MOV AH,9            ;funcao DOS para exibir 'string'
    INT 21H
;firula FIM      
    MOV DL,SOMA        ;offset do endereço de Mensagem1 vai DX
    MOV AH,2           ;funcao DOS  para exibir string
    INT 21H            ;exibir
   
;
;retorno ao DOS
;
    MOV AH,4CH          ;funcao DOS para saida
    INT 21H             ;saindo
MAIN ENDP
    END MAIN