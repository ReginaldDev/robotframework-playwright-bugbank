*** Settings ***

Library     Browser
Resource    ../locators/statement.resource


*** Keywords ***

Abrir Extrato
    Wait For Elements State    ${BTN_EXTRATO}    visible
    Click    ${BTN_EXTRATO}


Obter Saldo Disponível
    Wait For Elements State    ${VALOR_SALDO}    visible
    ${saldo}=    Get Text    css=#textBalance span
    RETURN    ${saldo}


Validar Saldo Disponível
    [Arguments]    ${saldo_esperado}

    ${saldo_atual}=    Obter Saldo Disponível

    Should Contain
    ...    ${saldo_atual}
    ...    ${saldo_esperado}


Validar Transferência Enviada
    [Arguments]
    ...    ${descricao}
    ...    ${valor}

    Wait For Elements State
    ...    ${TIPO_TRANSFERENCIA_ENVIADA}
    ...    visible

    ${tipo}=    Get Text    ${TIPO_TRANSFERENCIA_ENVIADA}

    Should Contain
    ...    ${tipo}
    ...    enviada

    ${descricao_atual}=    Get Text    ${DESCRICAO_ENVIADA}

    Should Contain
    ...    ${descricao_atual}
    ...    ${descricao}

    ${valor_atual}=    Get Text    ${VALOR_ENVIADO}

    Should Contain
    ...    ${valor_atual}
    ...    ${valor}


Validar Transferência Recebida
    [Arguments]
    ...    ${descricao}
    ...    ${valor}

    Wait For Elements State
    ...    ${TIPO_TRANSFERENCIA_RECEBIDA}
    ...    visible

    ${tipo}=    Get Text    ${TIPO_TRANSFERENCIA_RECEBIDA}

    Should Contain
    ...    ${tipo}
    ...    recebida

    ${descricao_atual}=    Get Text    ${DESCRICAO_RECEBIDA}

    Should Contain
    ...    ${descricao_atual}
    ...    ${descricao}

    ${valor_atual}=    Get Text    ${VALOR_RECEBIDO}

    Should Contain
    ...    ${valor_atual}
    ...    ${valor}
