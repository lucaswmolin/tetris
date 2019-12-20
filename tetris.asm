.model small

.stack 1000H

.data   
    MENU_TITULO   DB 15, " T E T R I S ", 15
    MENU_JOGAR    DB "(J)ogar"
    MENU_SAIR     DB "(S)air"
    MENU_DEV      DB "Desenvolvido por Lucas Molin, 2019."
    SCORE    DB "SCORE"
    VALOR    DB "00000"
    GAME_OVER DB "G A M E O V E R"
    CONTINUAR_1 DB "PRESSIONE QUALQUER TECLA" 
    CONTINUAR_2 DB "PARA VOLTAR AO MENU INICIAL"
    
    LARGURA EQU 40 ;define uma constante para largura da tela
    ALTURA EQU 25 ;define uma constante para altura da tela 
    DIMENSAO_TETRAMINO EQU 4 ;define uma constante para a dimensao NxN da matriz de tetraminos  
    A  EQU 12 ;define uma constante de valor para escrita de score na escrita da tela /vermelho claro
    B  EQU 10 ;define uma constante de valor para escrita de valor na escrita da tela /verde claro 
    C  EQU 5 ;define uma constante de valor para ignorar na escrita da tela /magenta 
    SV EQU 5 ;define uma constante de tamanho para score e valor
    SAIDA EQU 15 ;define uma constante de valor para saida do laco de escrita de tela /branco
    
    BLOCO DB 219 ;bloco    
    CAIXA DW 218 ;posicao inicial da caixa na matriz
    MOLDURA DW 191 ;posicao inicial da moldura na matriz
    
    POSICAO_ATUAL DW 0 ;posicao atual do tetramino na caixa/matriz
    POSICAO_ANTERIOR DW 0 ;posicao anterior do tetramino na caixa/matriz
    
    COLISAO DW 0 ;flag para colisao
    TETRAMINO_ATUAL DW 7 ;numero do tetramino atual
    END_TETRAMINO_ATUAL DW 0 ;endereco do tetramino atual
    TETRAMINO_SEGUINTE DW 7 ;numero do tetramino seguinte
    END_TETRAMINO_SEGUINTE DW 0 ;endereco do tetramino seguinte
    ROTACAO_ATUAL DW 0 ;numero da rotacao atual
    
    TEMPO DB 99 ;tempo
    TECLA DB 00 ;ultima tecla pressionada
    
    TELA_ATUAL DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, A, C, C, C, C, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0 
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0  
               DB 0, 0, 0, 0, 0, B, C, C, C, C, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0  
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0   
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, SAIDA
               
 TELA_ANTERIOR DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, A, C, C, C, C, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0 
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0  
               DB 0, 0, 0, 0, 0, B, C, C, C, C, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0  
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0   
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, SAIDA
               
  TELA_INICIAL DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, A, C, C, C, C, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0 
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0  
               DB 0, 0, 0, 0, 0, B, C, C, C, C, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0  
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0   
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  
               DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, SAIDA
    
    ;estado original de cada peca
    ;primeira peca 
    TETRA_T0   DB  0, 0, 0, 0
               DB  0, 4, 0, 0
               DB  4, 4, 4, 0 
               DB  0, 0, 0, 0                        
    
    ;segunda peca           
    POLI_S0    DB  0, 0, 0, 0
               DB  0, 6, 6, 0
               DB  6, 6, 0, 0 
               DB  0, 0, 0, 0                 
    
    ;terceira peca           
    POLI_Z0    DB  0, 0, 0, 0
               DB  0, 14, 14, 0
               DB  0, 0, 14, 14 
               DB  0, 0, 0, 0 
    
    ;quarta peca
    TETRA_I0   DB  0, 0, 0, 0
               DB  2, 2, 2, 2
               DB  0, 0, 0, 0 
               DB  0, 0, 0, 0
                   
    ;quinta peca           
    TETRA_O0   DB  0, 0, 0, 0
               DB  0, 3, 3, 0
               DB  0, 3, 3, 0 
               DB  0, 0, 0, 0                  
    
    ;sexta peca           
    POLI_J0    DB  0, 0, 0, 0
               DB  9, 0, 0, 0
               DB  9, 9, 9, 0 
               DB  0, 0, 0, 0
                   
    ;setima peca           
    POLI_L0    DB  0, 0, 0, 0
               DB  0, 0, 0, 1
               DB  0, 1, 1, 1 
               DB  0, 0, 0, 0  
     
    ;estado rotacionado de cada peca          
    ;primeira peca                
    TETRA_T1   DB  0, 0, 0, 0
               DB  0, 4, 0, 0
               DB  0, 4, 4, 0 
               DB  0, 4, 0, 0  
               
    TETRA_T2   DB  0, 0, 0, 0
               DB  0, 0, 0, 0
               DB  4, 4, 4, 0 
               DB  0, 4, 0, 0 
               
    TETRA_T3   DB  0, 0, 0, 0
               DB  0, 4, 0, 0
               DB  4, 4, 0, 0 
               DB  0, 4, 0, 0               
    
    ;segunda peca                           
    POLI_S1    DB  6, 0, 0, 0
               DB  6, 6, 0, 0
               DB  0, 6, 0, 0 
               DB  0, 0, 0, 0  
    
    ;terceira peca                          
    POLI_Z1    DB  0, 0, 0, 0
               DB  0, 0, 0, 14
               DB  0, 0, 14, 14 
               DB  0, 0, 14, 0 
    
    ;quarta peca               
    TETRA_I1   DB  0, 0, 2, 0
               DB  0, 0, 2, 0
               DB  0, 0, 2, 0 
               DB  0, 0, 2, 0                      
    
    ;sexta peca                          
    POLI_J1    DB  9, 9, 0, 0
               DB  9, 0, 0, 0
               DB  9, 0, 0, 0 
               DB  0, 0, 0, 0 
               
    POLI_J2    DB  0, 0, 0, 0
               DB  9, 9, 9, 0
               DB  0, 0, 9, 0 
               DB  0, 0, 0, 0
               
    POLI_J3    DB  0, 9, 0, 0
               DB  0, 9, 0, 0
               DB  9, 9, 0, 0 
               DB  0, 0, 0, 0
    
    ;setima peca                          
    POLI_L1    DB  0, 0, 0, 0
               DB  0, 0, 1, 0
               DB  0, 0, 1, 0 
               DB  0, 0, 1, 1
               
    POLI_L2    DB  0, 0, 0, 0
               DB  0, 1, 1, 1
               DB  0, 1, 0, 0 
               DB  0, 0, 0, 0
               
    POLI_L3    DB  0, 0, 0, 0
               DB  0, 0, 1, 1
               DB  0, 0, 0, 1 
               DB  0, 0, 0, 1
    
    ;para limpar a moldura          
    MOLDURA_VAZIA   DB  1, 1, 1, 1
                    DB  1, 1, 1, 1
                    DB  1, 1, 1, 1 
                    DB  1, 1, 1, 1
                                                                   
.code 
LER_CHAR proc ;ler caractere do teclado sem echo

    mov AH, 7 ;retorna o caractere em AL
    int 21h  
    
    ret  
endp   

ESCREVER_STRING proc ;escrever string em video
    push AX
    push BX
    
    mov AX, 1300h
    mov BH, 00H  
    int 10h
    
    pop BX
    pop AX
    
    ret
endp 

DESENHAR_TETRAMINO proc ;desenha tetramino na tela; AX = endereco inicial da matriz de tetramino; DL = coluna; DH = linha
    push AX
    push BX
    push CX
    push DX
    
    xor CX, CX ;zera o contador CX
    
    LACO_DESENHO:
    
        ;atribui cor
        mov BX, AX 
             
        push DX
            
        mov DX, [BX]
        mov BL, DL 
        
        pop DX
        
        ;verifica espaco vazio (preto); se for, nao escreve
        cmp BL, 0
        jz PULAR_DESENHO
        
            ;atribui caractere
            mov BP, offset BLOCO;
            
            ;atribui tamanho da string
            push CX ;salva contador
            
            mov CX, 1
            
            call ESCREVER_STRING
            
            pop CX ;restaura contador
        
        PULAR_DESENHO:
        
        inc DL ;incrementa coluna
        
        inc AX  ;incrementa endereco da matriz do tetramino
        inc CH  ;incrementa o contador de coluna
    
    cmp CH, DIMENSAO_TETRAMINO ;verifica se chegou ao fim        
    jb LACO_DESENHO 
    
        sub DL, DIMENSAO_TETRAMINO ;volta para a coluna inicial
        
        inc DH ;incrementa linha
            
        xor CH, CH   ;zera o contador de coluna
        inc CL       ;incrementa o contador de linha
    
    cmp CL, DIMENSAO_TETRAMINO   ;verifica se chegou ao fim        
    jb LACO_DESENHO  
    
    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp 

ESCREVER_MENU proc 
    push BX
    push CX    
    push DX
    
    mov BL, 2      ;atribuindo verde na cor
    mov CX, 15     ;atribuir tamanho da string
    mov DL, 12     ;coluna
    mov DH, 4      ;linha
    mov BP, offset MENU_TITULO
    call ESCREVER_STRING   
        
    mov BL, 15     ;atribuindo branco na cor
    mov CX, 7      ;atribuir tamanho da string
    mov DL, 16     ;coluna
    mov DH, 13     ;linha
    mov BP, offset MENU_JOGAR
    call ESCREVER_STRING
                  
    mov BL, 15     ;atribuindo branco na cor
    mov CX, 6      ;atribuir tamanho da string
    mov DL, 16     ;coluna
    mov DH, 14     ;linha
    mov BP, offset MENU_SAIR
    call ESCREVER_STRING
                      
    mov BL, 4      ;atribuindo vermelho na cor
    mov CX, 35     ;atribuir tamanho da string
    mov DL, 2     ;coluna
    mov DH, 20     ;linha
    mov BP, offset MENU_DEV
    call ESCREVER_STRING
        
    pop DX         
    pop CX
    pop BX
    
    ret
endp 

DESENHAR_MENU proc 
    push AX
    push BX
    push CX
    push DX
    
    mov DL, 6     ;coluna               
    mov DH, 7     ;linha 
    mov AX, offset TETRA_T0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO
    
    mov DL, 10     ;coluna               
    mov DH, 7     ;linha 
    mov AX, offset POLI_S0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO
    
    mov DL, 13     ;coluna               
    mov DH, 7     ;linha 
    mov AX, offset POLI_Z0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO
    
    mov DL, 18     ;coluna               
    mov DH, 8     ;linha 
    mov AX, offset TETRA_I0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO
    
    mov DL, 22     ;coluna               
    mov DH, 7     ;linha 
    mov AX, offset TETRA_O0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO
    
    mov DL, 26     ;coluna               
    mov DH, 7     ;linha 
    mov AX, offset POLI_J0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO
    
    mov DL, 29     ;coluna               
    mov DH, 7     ;linha 
    mov AX, offset POLI_L0 ;endereco inicial da matriz do tetramino
    call DESENHAR_TETRAMINO

    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp

ESCREVER_TETRAMINO proc ;escreve tetramino na memoria ;BX = endereco inicial da matriz de tetramino
    push AX
    push BX
    push CX
    push DX
    
    mov SI, offset TELA_ATUAL
    add SI, POSICAO_ATUAL
    
    xor DX, DX ;zera o DX
    xor CX, CX ;zera o contador CX
    
    LACO_ESCRITA:
    
        ;atribui cor       
        push BX ;salva endereco da matriz de tetramino
        
        mov DX, [BX]
        mov BL, DL 
        
        ;verifica espaco vazio (preto); se for, nao escreve
        cmp BL, 0
        jz PULAR_ESCRITA
        
            cmp [SI], 0
            je NAO_COLIDIU
            
                ;verifica fim de jogo
                push AX
                push BX
                
                mov AX, POSICAO_ATUAL
                mov BX, CAIXA
                
                cmp AX, BX
                jne CONTINUAR_EM_JOGO
                
                    pop BX
                    pop AX
                
                    call FINALIZAR_JOGO
                
                CONTINUAR_EM_JOGO:
                
                pop BX
                pop AX
                
                mov COLISAO, 1
                pop BX ;restaura endereco da matriz de tetramino
                jmp COLIDIU
            
            NAO_COLIDIU:
                
            mov [SI], BL
        
        PULAR_ESCRITA:
        
        pop BX ;restaura endereco da matriz de tetramino
        
        inc SI ;incrementa coluna
        
        inc BX  ;incrementa endereco da matriz do tetramino
        inc CH  ;incrementa o contador de coluna
    
    cmp CH, DIMENSAO_TETRAMINO ;verifica se chegou ao fim         
    jb LACO_ESCRITA 
    
        sub SI, DIMENSAO_TETRAMINO ;volta para a coluna inicial
        
        add SI, LARGURA ;incrementa linha
            
        xor CH, CH   ;zera o contador de coluna
        inc CL       ;incrementa o contador de linha
    
    cmp CL, DIMENSAO_TETRAMINO   ;verifica se chegou ao fim        
    jb LACO_ESCRITA  
    
    COLIDIU:
    
    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp 

FINALIZAR_JOGO proc ;reseta o jogo e escrever a tela de fim de jogo
    push AX
    push BX

    mov AX, offset TELA_ATUAL ;destino
    mov BX, offset TELA_INICIAL ;origem
    call TRANSFERIR_TELA ;restaurar tela inicial
    
    pop BX
    pop AX

    call ESCREVER_GAME_OVER    
    call LER_CHAR   
    call LIMPAR_TELA
    jmp MENU

    ret
endp

APAGAR_TETRAMINO proc ;apaga tetramino da memoria ;BX = endereco inicial da matriz de tetramino
    push AX
    push BX
    push CX
    push DX
    
    mov SI, offset TELA_ATUAL
    add SI, POSICAO_ATUAL
    
    xor DX, DX ;zera o DX
    xor CX, CX ;zera o contador CX
    
    LACO_APAGA:
    
        ;atribui cor       
        push BX ;salva endereco da matriz de tetramino
        
        mov DX, [BX]
        mov BL, DL 
        
        ;verifica espaco vazio (preto); se for, nao escreve
        cmp BL, 0
        jz PULA_APAGA
            
            mov [SI], 0
        
        PULA_APAGA:
        
        pop BX ;restaura endereco da matriz de tetramino
        
        inc SI ;incrementa coluna
        
        inc BX  ;incrementa endere?o da matriz do tetramino
        inc CH  ;incrementa o contador de coluna
    
    cmp CH, DIMENSAO_TETRAMINO ;verifica se chegou ao fim         
    jb LACO_APAGA 
    
        sub SI, DIMENSAO_TETRAMINO ;volta para a coluna inicial
        
        add SI, LARGURA ;incrementa linha
            
        xor CH, CH   ;zera o contador de coluna
        inc CL       ;incrementa o contador de linha
    
    cmp CL, DIMENSAO_TETRAMINO   ;verifica se chegou ao fim        
    jb LACO_APAGA  
    
    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp 

ESCREVER_TELA proc ;DL = tamanho da coluna; DH = tamanho da linha; AX = endereco inicial da matriz   
    push AX
    push BX
    push CX    
    push DX
      
    xor CX, CX ;zera o contador CX
     
    LACO:                         
        ;atribui cor
        mov BX, AX 
         
        push DX
        
        mov DX, [BX]
        mov BL, DL  
        
        ;verifica saida e escrita de score
        cmp DL, SAIDA
        jz FORA_LACO 
        
        ;score
        cmp DL, A
        jnz COMPARAR_VALOR
        
        ;escreve score
        push BX
        push CX    
        push DX 
        
        mov BL, 8      ;atribuindo cinza escuro na cor
        mov DL, CH     ;coluna
        mov DH, CL     ;linha  
        mov CX, SV     ;atribuir tamanho da string
        mov BP, offset SCORE
        call ESCREVER_STRING   
        
        pop DX         
        pop CX
        pop BX 
        
        jmp CONTINUAR
        
        COMPARAR_VALOR:
        cmp DL, B
        jnz IGNORAR_ESCRITA   
        
            ;escreve valor
            push BX
            push CX    
            push DX 
            
            mov BL, 15     ;atribuindo branco na cor
            mov DL, CH     ;coluna
            mov DH, CL     ;linha 
            mov CX, SV     ;atribuir tamanho da string
            mov BP, offset VALOR
            call ESCREVER_STRING  
            
            pop DX         
            pop CX
            pop BX 
            
            jmp CONTINUAR 
        
        IGNORAR_ESCRITA:
        cmp DL, C ;verificar se ignora a escrita
        jz CONTINUAR
        
            ;atribui coordenadas
            mov DL, CH
            mov DH, CL        
            
            ;atribui tamanho da string
            push CX ;salva os valores do contador do laco
            
            mov CX, 1;tamanho da string       
            mov BP, offset BLOCO        
                                                  
            call ESCREVER_STRING ;escreve o bloco 
             
            pop CX 
        
        CONTINUAR:
        
        pop DX 
        
        inc AX       ;incrementa a posicao atual do vetor
        inc CH       ;incrementa o contador de coluna
        
    cmp CH, DH   ;verifica se chegou ao fim       
    jb LACO
        
        xor CH, CH   ;zera o contador de coluna
        inc CL       ;incrementa o contador de linha
        
    cmp CL, DL   ;verifica se chegou ao fim     
    jbe LACO  
        
        FORA_LACO:
        
        pop DX
          
    pop DX         
    pop CX
    pop BX
    pop AX             
              
    ret
endp 

TRANSFERIR_TELA proc ;AX = offset do vetor destino; BX = offset do vetor origem      
    push AX
    push BX
    push DX
    
    TRANSFERIR:    
        mov SI, AX
        mov DX, [BX] ;para contornar o erro Illegal memory reference
        mov [SI], DX
        
        inc AX ;incrementa o endereco
        inc BX ;incrementa o endereco
    
    cmp [BX], SAIDA ;verifica se chegou ao final do vetor
    jne TRANSFERIR ;senao, volta para cima
    
    pop DX
    pop BX
    pop AX

    ret
endp

GERAR_NUMERO_ALEATORIO proc ;devolve numero aleatorio em DH
    push AX
    push BX
    push CX

    mov AH, 00h  ;interrupcao para obter tempo do sistema        
    int 1Ah      ;CX e DX recebe numero de batidas do clock desde a meia noite      

    mov AX, DX
    xor DX, DX
    mov CX, 7    
    div CX       ;DX recebe o restante da divisao de CX por AX, de 0 a 6 (7-1)

    mov DH, DL
    
    pop CX
    pop BX
    pop AX

    ret
endp

ESCOLHER_TETRAMINO proc ;devolve endereco inicial do tetramino em TETRAMINO_SEGUINTE
    push AX
    push BX
    push CX
    push DX
    
    call GERAR_NUMERO_ALEATORIO ;recebe numero aleatorio de 0 a 6 em DH
    
    shr DX, 8 ;desloca 8 bits para a direita para o valor de DH ir para o DL e zerar o DH
    
    cmp DX, TETRAMINO_ATUAL ;comparar se tetramino seguinte sera igual ao atual
    jne CONTINUAR_SELECAO
    
        inc DX ;escolhe a proxima opcao para o tetramino seguinte
        
        cmp DX, 6
        jbe CONTINUAR_SELECAO ;se for maior que o numero do ultimo tetramino, atribui 0 (numero do primeiro tetramino) 
        
        mov DX, 0
    
    CONTINUAR_SELECAO:
    
    mov CX, offset TETRA_T0 ;endereco inicial das pecas
    
    mov AL, DL ;numero correspondente a peca
    mov BL, 16 ;tamanho do vetor da peca
    mul BL ;o produto em AX (endereco da peca) = deslocamento adicional
    
    add CX, AX ;soma o deslocamento adicional ao endereco inicial
    
    mov END_TETRAMINO_SEGUINTE, CX ;endereco do tetramino
    mov TETRAMINO_SEGUINTE, DX ;numero do tetramino
    mov ROTACAO_ATUAL, 0 ;numero da rotacao
    
    pop DX
    pop CX
    pop BX
    pop AX

    ret
endp

ROTACIONAR_TETRAMINO proc ;devolve em BX o novo endereco da matriz do tetramino

    COMPARAR_TETRA_T:
    cmp TETRAMINO_ATUAL, 0
    jne COMPARAR_POLI_S ;pula para a proxima comparacao para evitar o erro Relative jump out of range by XXXXh bytes
    
    ROTACIONAR_TETRA_T:
        cmp ROTACAO_ATUAL, 0
        je ROTACAO_TETRA_T1
        
        cmp ROTACAO_ATUAL, 1
        je ROTACAO_TETRA_T2
        
        cmp ROTACAO_ATUAL, 2
        je ROTACAO_TETRA_T3
        
        cmp ROTACAO_ATUAL, 3
        je ROTACAO_TETRA_T0
        
        ROTACAO_TETRA_T0:
            mov BX, offset TETRA_T0
            mov ROTACAO_ATUAL, 0
            jmp ROTACIONADO 
        
        ROTACAO_TETRA_T1:
            mov BX, offset TETRA_T1
            mov ROTACAO_ATUAL, 1
            jmp ROTACIONADO    
            
        ROTACAO_TETRA_T2:
            mov BX, offset TETRA_T2
            mov ROTACAO_ATUAL, 2
            jmp ROTACIONADO 
            
        ROTACAO_TETRA_T3:
            mov BX, offset TETRA_T3
            mov ROTACAO_ATUAL, 3
            jmp ROTACIONADO 
            
        jmp ROTACIONADO
    
    COMPARAR_POLI_S:
    cmp TETRAMINO_ATUAL, 1
    jne COMPARAR_POLI_Z ;pula para a proxima comparacao para evitar o erro Relative jump out of range by XXXXh bytes
    
    ROTACIONAR_POLI_S:
        cmp ROTACAO_ATUAL, 0
        je ROTACAO_POLI_S1
        
        cmp ROTACAO_ATUAL, 1
        je ROTACAO_POLI_S0
        
        ROTACAO_POLI_S0:
            mov BX, offset POLI_S0
            mov ROTACAO_ATUAL, 0
            jmp ROTACIONADO
            
        ROTACAO_POLI_S1:
            mov BX, offset POLI_S1
            mov ROTACAO_ATUAL, 1
            jmp ROTACIONADO
            
        jmp ROTACIONADO
    
    COMPARAR_POLI_Z:    
    cmp TETRAMINO_ATUAL, 2
    jne COMPARAR_TETRA_I ;pula para a proxima comparacao para evitar o erro Relative jump out of range by XXXXh bytes
    
    ROTACIONAR_POLI_Z:
        cmp ROTACAO_ATUAL, 0
        je ROTACAO_POLI_Z1
        
        cmp ROTACAO_ATUAL, 1
        je ROTACAO_POLI_Z0
        
        ROTACAO_POLI_Z0:
            mov BX, offset POLI_Z0
            mov ROTACAO_ATUAL, 0
            jmp ROTACIONADO
            
        ROTACAO_POLI_Z1:
            mov BX, offset POLI_Z1
            mov ROTACAO_ATUAL, 1
            jmp ROTACIONADO
            
        jmp ROTACIONADO
    
    COMPARAR_TETRA_I:
    cmp TETRAMINO_ATUAL, 3
    jne COMPARAR_POLI_J ;pula para a proxima comparacao para evitar o erro Relative jump out of range by XXXXh bytes
    
    ROTACIONAR_TETRA_I:
        cmp ROTACAO_ATUAL, 0
        je ROTACAO_TETRA_I1
        
        cmp ROTACAO_ATUAL, 1
        je ROTACAO_TETRA_I0
        
        ROTACAO_TETRA_I0:
            mov BX, offset TETRA_I0
            mov ROTACAO_ATUAL, 0
            jmp ROTACIONADO
            
        ROTACAO_TETRA_I1:
            mov BX, offset TETRA_I1
            mov ROTACAO_ATUAL, 1
            jmp ROTACIONADO
            
        jmp ROTACIONADO
    
    COMPARAR_POLI_J:
    cmp TETRAMINO_ATUAL, 5
    jne COMPARAR_POLI_L ;pula para a proxima comparacao para evitar o erro Relative jump out of range by XXXXh bytes
    
    ROTACIONAR_POLI_J:
        cmp ROTACAO_ATUAL, 0
        je ROTACAO_POLI_J1
        
        cmp ROTACAO_ATUAL, 1
        je ROTACAO_POLI_J2
        
        cmp ROTACAO_ATUAL, 2
        je ROTACAO_POLI_J3
        
        cmp ROTACAO_ATUAL, 3
        je ROTACAO_POLI_J0
        
        ROTACAO_POLI_J0:
            mov BX, offset POLI_J0
            mov ROTACAO_ATUAL, 0
            jmp ROTACIONADO 
        
        ROTACAO_POLI_J1:
            mov BX, offset POLI_J1
            mov ROTACAO_ATUAL, 1
            jmp ROTACIONADO    
            
        ROTACAO_POLI_J2:
            mov BX, offset POLI_J2
            mov ROTACAO_ATUAL, 2
            jmp ROTACIONADO 
            
        ROTACAO_POLI_J3:
            mov BX, offset POLI_J3
            mov ROTACAO_ATUAL, 3
            jmp ROTACIONADO 
            
        jmp ROTACIONADO
    
    COMPARAR_POLI_L:
    cmp TETRAMINO_ATUAL, 6
    jne ROTACIONADO ;pula para o fim
    
    ROTACIONAR_POLI_L:
        cmp ROTACAO_ATUAL, 0
        je ROTACAO_POLI_L1
        
        cmp ROTACAO_ATUAL, 1
        je ROTACAO_POLI_L2
        
        cmp ROTACAO_ATUAL, 2
        je ROTACAO_POLI_L3
        
        cmp ROTACAO_ATUAL, 3
        je ROTACAO_POLI_L0
        
        ROTACAO_POLI_L0:
            mov BX, offset POLI_L0
            mov ROTACAO_ATUAL, 0
            jmp ROTACIONADO 
        
        ROTACAO_POLI_L1:
            mov BX, offset POLI_L1
            mov ROTACAO_ATUAL, 1
            jmp ROTACIONADO    
            
        ROTACAO_POLI_L2:
            mov BX, offset POLI_L2
            mov ROTACAO_ATUAL, 2
            jmp ROTACIONADO 
            
            ROTACAO_POLI_L3:
            mov BX, offset POLI_L3
            mov ROTACAO_ATUAL, 3
            jmp ROTACIONADO 
            
        jmp ROTACIONADO
        
    ROTACIONADO:

    ret
endp

LIMPAR_TELA proc ;pinta a tela de preto
    push AX
    push BX
    push CX
    push DX
         
    xor CX, CX
    mov DH, LARGURA  ;numero de colunas        
    mov DL, ALTURA  ;numero de linhas
    mov BH, 00h     ;atribui a cor preta
    mov AX, 0      ;codigo da interrupcao
    int 10h
    
    pop DX
    pop CX
    pop BX
    pop AX
    ret
endp

ESCREVER_GAME_OVER proc ;escreva a tela de fim de jogo
    push AX
    push BX
    push CX
    push DX
         
    call LIMPAR_TELA
    
    mov BL, 15     ;atribuindo branco na cor
    mov CX, 15     ;atribuir tamanho da string
    mov DL, 12     ;coluna
    mov DH, 6      ;linha
    mov BP, offset GAME_OVER
    call ESCREVER_STRING  
    
    mov BL, 15     ;atribuindo branco na cor
    mov CX, 5     ;atribuir tamanho da string
    mov DL, 17     ;coluna
    mov DH, 8      ;linha
    mov BP, offset VALOR
    call ESCREVER_STRING 
    
    mov BL, 15     ;atribuindo branco na cor
    mov CX, 24     ;atribuir tamanho da string
    mov DL, 7     ;coluna
    mov DH, 15      ;linha
    mov BP, offset CONTINUAR_1
    call ESCREVER_STRING 
    
    mov BL, 15     ;atribuindo branco na cor
    mov CX, 27     ;atribuir tamanho da string
    mov DL, 6     ;coluna
    mov DH, 16      ;linha
    mov BP, offset CONTINUAR_2
    call ESCREVER_STRING
        
    pop DX
    pop CX
    pop BX
    pop AX
    ret
endp

VERIFICAR_TECLADO proc
    push AX

    ;verifica se alguma tecla foi pressionada
    xor AX, AX
    mov AH, 0Bh
    int 21h  
    cmp AL, 0
    je  SAIR_VT ;se igual a zero, nada foi pressionado
    
        ;se foi pressionado, verificar tecla       
        mov AH, 0
        int 16h
        
        cmp AL, 32 ;verifica se foi pressionada a spacebar
        jne SCAN_CODE
        
            mov TECLA, AL ;ASCII
            jmp SAIR_VT
        
        SCAN_CODE:
        
        mov TECLA, AH ;scan code
    
    SAIR_VT:
    
    pop AX

    ret
endp

TEMPORIZADOR proc ;1 segundo
    push AX
    push DX
    
    ;limpa o buffer do teclado para nao acumular tecladas
    mov AH, 0Ch
    mov AL, 00h
    int 21h
            
    REPETIR_TEMPO:   
    
        call VERIFICAR_TECLADO
        
        ;obtem a hora do sistema
        mov  AH, 2Ch
        int  21h ;retorna os segundos no DH.

        cmp  DH, TEMPO
        je   TEMPO_IGUAL
        
        mov TEMPO, DH ;atualiza tempo
        jmp VOLTAR_JOGO ;volta ao jogo
            
    TEMPO_IGUAL:  
    jmp  REPETIR_TEMPO
            
    VOLTAR_JOGO:
            
    pop DX
    pop AX
    
    ret
endp   

LIMPAR_MOLDURA proc
    push BX
    
    mov BX, offset MOLDURA_VAZIA
    call APAGAR_TETRAMINO 
    
    pop BX

    ret
endp 

TROCAR_TETRAMINO proc ;atribui o tetramino seguinte para o atual
    push BX
    push CX
                
    mov BX, END_TETRAMINO_SEGUINTE
    mov END_TETRAMINO_ATUAL, BX 
                
    mov CX, TETRAMINO_SEGUINTE
    mov TETRAMINO_ATUAL, CX
               
    pop CX
    pop BX 

    ret
endp

ATUALIZAR_TELA proc      
    push AX
    push BX
    push CX    
    push DX
    
    mov AX, offset TELA_ATUAL ;posicao inicial do vetor                  
    mov DH, LARGURA  ;numero de colunas para o laco e para o ESCREVER_STRING        
    mov DL, ALTURA  ;numero de linhas para o laco e para o ESCREVER_STRING 
    call ESCREVER_TELA
    
    pop DX         
    pop CX
    pop BX
    pop AX
      
    ret
endp

    INICIO: 
    mov AX, @DATA
    mov DS, AX   
    mov ES, AX
    
    ;definir modo de video
    mov AX, 0001h
    int 10h
    
    MENU:     
        call ESCREVER_MENU
        call DESENHAR_MENU
        
        call LER_CHAR
        
        cmp AL, 'J'
        jz JOGAR  
        
        cmp AL, 'j'
        jz JOGAR
        
        cmp AL, 'S'
        jz SAIR 
        
        cmp AL, 's'
        jz SAIR
        
        jmp MENU
      
        SAIR:
            call LIMPAR_TELA
            mov AH, 4Ch
            int 21h  
        
    JOGAR:   
        call ATUALIZAR_TELA   

        NOVO_TETRAMINO:         
            mov COLISAO, 0
            mov TECLA, 0            
            
            ;escreve na moldura
            xor AX, AX
            add AX, MOLDURA
            mov POSICAO_ATUAL, AX      
      
            ;escolhe a primeira peca
            cmp TETRAMINO_ATUAL, 7
            jne CONTINUAR_ESCOLHA
       
                call ESCOLHER_TETRAMINO ;atribui endereco inicial da matriz a TETRAMINO_SEGUINTE 
                call TROCAR_TETRAMINO ;atribui o tetramino seguinte para o atual
       
            CONTINUAR_ESCOLHA:     
            
            call LIMPAR_MOLDURA
            call ESCOLHER_TETRAMINO ;atribui endereco inicial da matriz a TETRAMINO_SEGUINTE 
            
            mov BX, END_TETRAMINO_SEGUINTE
            call ESCREVER_TETRAMINO ;escreve tetramino na moldura  
            
            ;atribui a posicao inicial da caixa
            xor AX, AX
            add AX, CAIXA
            mov POSICAO_ATUAL, AX    
    
            mov BX, END_TETRAMINO_ATUAL        
            
        JOGANDO:
            
            cmp TECLA, 80 ;scan code
            je CONTINUAR_JOGO ;soltar o tetramino
        
            call TEMPORIZADOR
            
            cmp TECLA, 32 ;ASCII spacebar
            je ROTACIONAR
                                                                                    
            cmp TECLA, 75 ;scan code
            je PARA_ESQUERDA
            
            cmp TECLA, 77 ;scan code
            je PARA_DIREITA
            
            jmp CONTINUAR_JOGO
 
            PARA_ESQUERDA:
                mov TECLA, 0 ;limpa ultima tecla
                dec AX ;desloca endereco para a esquerda
                mov POSICAO_ATUAL, AX
                jmp CONTINUAR_JOGO
   
            PARA_DIREITA:
                mov TECLA, 0 ;limpa ultima tecla
                inc AX ;desloca endereco para a direita
                mov POSICAO_ATUAL, AX
                jmp CONTINUAR_JOGO   
      
            ROTACIONAR:
                mov TECLA, 0 ;limpa ultima tecla
                call ROTACIONAR_TETRAMINO ;devolve em BX o endereco na nova matriz     
            
            CONTINUAR_JOGO:            
            
            push AX
            push BX

            mov AX, offset TELA_ANTERIOR ;destino
            mov BX, offset TELA_ATUAL ;origem
            call TRANSFERIR_TELA ;copiar tela_atual para tela_anterior
    
            pop BX
            pop AX
            
            ;escreve na caixa           
            call ESCREVER_TETRAMINO         
            
            ;verifica se houve colisao
            cmp COLISAO, 1
            jne CONTINUAR_MOVIMENTO ;se sim, pula para o proximo tetramino
            
                push AX ;salvar posicao atual do tetramino
                push BX ;salvar endereco inicial da matriz do tetramino

                mov AX, offset TELA_ATUAL ;destino
                mov BX, offset TELA_ANTERIOR ;origem
                call TRANSFERIR_TELA ;restaurar tela_anterior para tela_atual
                
                pop BX ;recuperar endereco inicial da matriz do tetramino
                
                mov AX, POSICAO_ANTERIOR
                mov POSICAO_ATUAL, AX
                call ESCREVER_TETRAMINO ;reescreve tetramino na posicao de colisao
                
                call TROCAR_TETRAMINO ;atribui o tetramino seguinte ao atual
        
                pop AX ;recuperar posicao atual do tetramino
                
                jmp NOVO_TETRAMINO
            
            CONTINUAR_MOVIMENTO:
            
                call ATUALIZAR_TELA
                call APAGAR_TETRAMINO           
                
                ;atribui nova posicao (incrementa a linha)
                mov POSICAO_ANTERIOR, AX ;salvar posicao anterior antes          
                add AX, LARGURA
                mov POSICAO_ATUAL, AX
                       
            jmp JOGANDO            
            
end INICIO        