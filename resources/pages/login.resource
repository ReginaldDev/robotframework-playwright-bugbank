*** Settings ***

Library     Browser

Resource    ../variables/environment.resource
Resource    ../locators/login.resource
Resource    ../data/users.resource

*** Keywords ***

Abrir BugBank

    New Browser    chromium    headless=True

    New Context

    New Page    ${BASE_URL}


Realizar Login

    [Arguments]     ${email}    ${senha}

    Fill Text    ${INPUT_EMAIL_LOGIN}       ${email}

    Fill Text    ${INPUT_SENHA_LOGIN}       ${senha}

    Click    ${BTN_ACESSAR}


Validar Login Com Sucesso

    Wait For Elements State    ${AREA_LOGADA}       visible
    Wait For Elements State    ${CONTA_LOGADA}      visible
    Wait For Elements State    ${SALDO_LOGADO}      visible


Fazer Logout

    Click    ${BTN_LOGOUT}

    Wait For Elements State    ${INPUT_EMAIL_LOGIN}    visible

Fechar Navegador

    Close Browser