#include 'totvs.ch'
#include 'fwmvcdef.ch'

/*/{Protheus.doc} ITEM
Ponto de Entrada MVC para o Cadastro de Produtos (MATA010)
@type user function
@author Diego Santana
@since 06/06/2026
/*/
User Function ITEM()
    Local xRet      := .T.         // Variável de controle, podendo retornar um valor lógico ou um array.
    Local aParam    := PARAMIXB    // Captura as informações dos eventos na tela
    Local oModel                   // Armazena o modelo de dados
    Local cIdPonto                 // armazena uma string contento evento
    Local cIdModel                 // armazena uma string contentId do modelo de dados

    // Verifica se existe alguma ação na tela
    If aParam != Nil
        // Pega as informações da ação
        oModel      := aParam[1]
        cIdPonto    := aParam[2]
        cIdModel    := aParam[3]

        // Quando for uma Pós Validação (TUDOOK)
        if cIdPonto == 'MODELPOS'
            if Len(AllTrim(M->B1_DESC)) < 15
                ExibeHelp("Help_PE_Produto", "O campo <b>Descrição</b> não pode ser menor que 15 caracteres.", "A Descrição do Produto deve ser mais detalhada.")
                xRet := .F. // Bloqueia a ação
            endif
        endif
    Endif
Return xRet
