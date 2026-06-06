#include 'totvs.ch'
#include 'fwmvcdef.ch'

/*/{Protheus.doc} CUSTOMERVENDOR
Ponto de Entrada MVC para o Cadastro de Fornecedores (MATA020)
@type user function
@author Diego Santana
@since 06/06/2026
/*/
User Function CUSTOMERVENDOR()
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

		// BUTTONBAR é Utilizado para incluir botões customizados no menu superior da rotina.
		if cIdPonto == 'BUTTONBAR'
			xRet := {} // xRet deve ser um array vazio, inicialmente.

			// Adiciona o botão com a estrutura exigida
			AAdd( xRet, { 'Produto X Fornecedor', '', {|| MATA061()}, 'Abre a Amarração Produto x Fornecedor' } )
		endif
	Endif
Return xRet
