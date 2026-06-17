*** Settings ***
Resource    ../resources/pages/login.resource

*** Test Cases ***

Acessar BugBank
    Abrir BugBank
    Realizar Login      ${EMAIL_VALIDO}     ${SENHA_VALIDA}
    Sleep    5s
    Fechar Navegador
    