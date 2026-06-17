*** Settings ***
Resource    ../resources/pages/login.resource
Resource    ../resources/pages/register.resource

*** Test Cases ***

Criar Conta Origem

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
    


Criar Conta Destino

    Gerar Usuario    DESTINO
    Abrir BugBank
    Realizar Cadastro
    ...    ${NOME_DESTINO}
    ...    ${EMAIL_DESTINO}
    ...    ${SENHA_DESTINO}

    Validar Cadastro Com Sucesso

    Capturar Conta    DESTINO

    Separar Conta E Digito    DESTINO

    Fechar Modal Cadastro
    Fechar Navegador