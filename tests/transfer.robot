*** Settings ***

Resource    ../resources/pages/login.resource
Resource    ../resources/pages/register.resource
Resource    ../resources/pages/transfer.resource


*** Test Cases ***

Transferencia Entre Contas

    Gerar Usuario    ORIGEM

    Abrir BugBank

    Realizar Cadastro
    ...    ${NOME_ORIGEM}
    ...    ${EMAIL_ORIGEM}
    ...    ${SENHA_ORIGEM}

    Validar Cadastro Com Sucesso

    Capturar Conta    ORIGEM

    Separar Conta E Digito    ORIGEM

    Fechar Modal Cadastro


    Gerar Usuario    DESTINO

    Realizar Cadastro
    ...    ${NOME_DESTINO}
    ...    ${EMAIL_DESTINO}
    ...    ${SENHA_DESTINO}

    Validar Cadastro Com Sucesso

    Capturar Conta    DESTINO

    Separar Conta E Digito    DESTINO

    Fechar Modal Cadastro


    Realizar Login
    ...    ${EMAIL_ORIGEM}
    ...    ${SENHA_ORIGEM}


    Acessar Tela Transferencia

    Preencher Dados Transferencia
    ...    ${NUMERO_CONTA_DESTINO}
    ...    ${DIGITO_CONTA_DESTINO}
    ...    100
    ...    Transferencia automatizada

    Confirmar Transferencia

    Validar Transferencia Com Sucesso

    Fechar Modal Transferencia