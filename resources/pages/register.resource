*** Settings ***

Library     Browser
Library     String
Resource    ../locators/register.resource


*** Keywords ***

Gerar Usuario

    [Arguments]    ${tipo}

    ${uuid}=    Evaluate    str(uuid.uuid4())    modules=uuid

    IF    '${tipo}' == 'ORIGEM'

        Set Suite Variable
        ...    ${EMAIL_ORIGEM}
        ...    origem_${uuid}@bugbank.com

        Set Suite Variable
        ...    ${NOME_ORIGEM}
        ...    Reginaldo QA

        Set Suite Variable
        ...    ${SENHA_ORIGEM}
        ...    123456

        Log To Console
        ...    Usuario origem criado: ${EMAIL_ORIGEM}

    ELSE

        Set Suite Variable
        ...    ${EMAIL_DESTINO}
        ...    destino_${uuid}@bugbank.com

        Set Suite Variable
        ...    ${NOME_DESTINO}
        ...    Receptor da Silva

        Set Suite Variable
        ...    ${SENHA_DESTINO}
        ...    123456

        Log To Console
        ...    Usuario destino criado: ${EMAIL_DESTINO}

    END


Realizar Cadastro

    [Arguments]    ${nome}    ${email}    ${senha}

    Click    text=Registrar

    Fill Text    ${INPUT_NOME}          ${nome}
    Fill Text    ${INPUT_EMAIL}         ${email}
    Fill Text    ${INPUT_SENHA}         ${senha}
    Fill Text    ${INPUT_CONFIRMAR}     ${senha}

    Click    id=toggleAddBalance

    Click    text=Cadastrar


Validar Cadastro Com Sucesso

    Wait For Elements State
    ...    id=modalText
    ...    visible

    ${mensagem}=    Get Text    id=modalText

    Should Contain
    ...    ${mensagem}
    ...    foi criada com sucesso


Capturar Conta

    [Arguments]    ${tipo}

    ${mensagem}=    Get Text    id=modalText

    ${matches}=    Get Regexp Matches
    ...    ${mensagem}
    ...    [0-9]+-[0-9]+
    Log To Console
    ...    Matches encontrados: ${matches}

    ${conta}=    Set Variable
    ...    ${matches}[0]

    IF    '${tipo}' == 'ORIGEM'

        Set Suite Variable
        ...    ${CONTA_ORIGEM}
        ...    ${conta}

        Log To Console
        ...    Conta origem criada: ${CONTA_ORIGEM}

    ELSE

        Set Suite Variable
        ...    ${CONTA_DESTINO}
        ...    ${conta}

        Log To Console
        ...    Conta destino criada: ${CONTA_DESTINO}

    END


Separar Conta E Digito

    [Arguments]    ${tipo}

    IF    '${tipo}' == 'ORIGEM'
        ${conta}=    Set Variable    ${CONTA_ORIGEM}
    ELSE
        ${conta}=    Set Variable    ${CONTA_DESTINO}
    END

    ${partes}=    Split String
    ...    ${conta}
    ...    -

    ${numero}=    Set Variable    ${partes}[0]
    ${digito}=    Set Variable    ${partes}[1]

    IF    '${tipo}' == 'ORIGEM'

        Set Suite Variable
        ...    ${NUMERO_CONTA_ORIGEM}
        ...    ${numero}

        Set Suite Variable
        ...    ${DIGITO_CONTA_ORIGEM}
        ...    ${digito}

        Log To Console
        ...    Conta Origem: ${NUMERO_CONTA_ORIGEM}-${DIGITO_CONTA_ORIGEM}

    ELSE

        Set Suite Variable
        ...    ${NUMERO_CONTA_DESTINO}
        ...    ${numero}

        Set Suite Variable
        ...    ${DIGITO_CONTA_DESTINO}
        ...    ${digito}

        Log To Console
        ...    Conta Destino: ${NUMERO_CONTA_DESTINO}-${DIGITO_CONTA_DESTINO}

    END


Fechar Modal Cadastro

    Click    id=btnCloseModal