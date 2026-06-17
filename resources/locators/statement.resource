*** VARIABLES ***

${BTN_EXTRATO}                  id=btn-EXTRATO
${SALDO_EXTRATO}                id=textBalanceAvailable
${VALOR_SALDO}                  id=textBalance

${TIPO_TRANSFERENCIA_ENVIADA}   text=Transferência enviada
${TIPO_TRANSFERENCIA_RECEBIDA}  text=Transferência recebida

${DESCRICAO_ENVIADA}            xpath=//p[@id='textTypeTransaction'][contains(., 'enviada')]/parent::div/following-sibling::div//p[@id='textDescription']
${VALOR_ENVIADO}                xpath=//p[@id='textTransferValue'][@type='withdrawal']

${DESCRICAO_RECEBIDA}           xpath=//p[@id='textTypeTransaction'][contains(., 'ecebida')]/parent::div/following-sibling::div//p[@id='textDescription']
${VALOR_RECEBIDO}               xpath=//p[@id='textTransferValue'][@type='input']
