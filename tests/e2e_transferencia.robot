*** Settings ***

Resource    ../resources/pages/register.resource
Resource    ../resources/pages/login.resource
Resource    ../resources/pages/transfer.resource
Resource    ../resources/pages/statement.resource

Suite Setup       Abrir BugBank
Suite Teardown    Fechar Navegador


*** Variables ***

${VALOR_TRANSFERENCIA}          200
${DESCRICAO_TRANSFERENCIA}      pagamento


*** Test Cases ***

Deve Realizar Transferencia Entre Contas Com Sucesso

    # --------------------------------------------------
    # CONTA ORIGEM
    # --------------------------------------------------

    Gerar Usuario    ORIGEM

    Realizar Cadastro
    ...    ${NOME_ORIGEM}
    ...    ${EMAIL_ORIGEM}
    ...    ${SENHA_ORIGEM}

    Validar Cadastro Com Sucesso

    Capturar Conta    ORIGEM

    Separar Conta E Digito    ORIGEM

    Fechar Modal Cadastro


    # --------------------------------------------------
    # CONTA DESTINO
    # --------------------------------------------------

    Gerar Usuario    DESTINO

    Realizar Cadastro
    ...    ${NOME_DESTINO}
    ...    ${EMAIL_DESTINO}
    ...    ${SENHA_DESTINO}

    Validar Cadastro Com Sucesso

    Capturar Conta    DESTINO

    Separar Conta E Digito    DESTINO

    Fechar Modal Cadastro


    # --------------------------------------------------
    # LOGIN ORIGEM
    # --------------------------------------------------

    Realizar Login
    ...    ${EMAIL_ORIGEM}
    ...    ${SENHA_ORIGEM}

    Validar Login Com Sucesso


    # --------------------------------------------------
    # SALDO ANTES
    # --------------------------------------------------

    ${saldo_inicial}=    Obter Saldo Disponível

    Should Not Be Empty    ${saldo_inicial}
    Log    Saldo inicial da conta origem: ${saldo_inicial}


    # --------------------------------------------------
    # TRANSFERENCIA
    # --------------------------------------------------

    Acessar Tela Transferencia

    Preencher Dados Transferencia
    ...    ${NUMERO_CONTA_DESTINO}
    ...    ${DIGITO_CONTA_DESTINO}
    ...    ${VALOR_TRANSFERENCIA}
    ...    ${DESCRICAO_TRANSFERENCIA}

    Confirmar Transferencia

    Validar Transferencia Com Sucesso

    Fechar Modal Transferencia


    # --------------------------------------------------
    # VALIDA SALDO ORIGEM
    # --------------------------------------------------

    Voltar Para Home

    ${saldo_final}=    Obter Saldo Disponível

    Should Not Be Equal    ${saldo_inicial}    ${saldo_final}
    Log    Saldo final da conta origem: ${saldo_final}


    # --------------------------------------------------
    # EXTRATO ORIGEM
    # --------------------------------------------------

    Abrir Extrato

    Validar Transferência Enviada
    ...    ${DESCRICAO_TRANSFERENCIA}
    ...    ${VALOR_TRANSFERENCIA}


    # --------------------------------------------------
    # LOGIN DESTINO
    # --------------------------------------------------

    Fazer Logout

    Realizar Login
    ...    ${EMAIL_DESTINO}
    ...    ${SENHA_DESTINO}

    Validar Login Com Sucesso


    # --------------------------------------------------
    # EXTRATO DESTINO
    # --------------------------------------------------

    Abrir Extrato

    Validar Transferência Recebida
    ...    ${DESCRICAO_TRANSFERENCIA}
    ...    ${VALOR_TRANSFERENCIA}
