*** Settings ***

Library    Browser

Resource   ../locators/transfer.resource


*** Keywords ***

Acessar Tela Transferencia

    Click    ${BTN_MENU_TRANSFERENCIA}


Preencher Dados Transferencia

    [Arguments]
    ...    ${conta}
    ...    ${digito}
    ...    ${valor}
    ...    ${descricao}

    Fill Text    ${INPUT_CONTA}        ${conta}

    Fill Text    ${INPUT_DIGITO}       ${digito}

    Fill Text    ${INPUT_VALOR}        ${valor}

    Fill Text    ${INPUT_DESCRICAO}    ${descricao}


Confirmar Transferencia

    Click    ${BTN_TRANSFERIR}


Validar Transferencia Com Sucesso

    Wait For Elements State
    ...    ${MODAL_SUCESSO}
    ...    visible

    ${mensagem}=    Get Text
    ...    ${MODAL_SUCESSO}

    Should Contain
    ...    ${mensagem}
    ...    sucesso


Fechar Modal Transferencia

    Click    ${BTN_FECHAR_MODAL}


Voltar Para Home

    Click    ${BTN_VOLTAR_HOME}

    Wait For Elements State    ${BTN_MENU_TRANSFERENCIA}    visible