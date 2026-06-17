# BugBank — Automação de Testes com Robot Framework

![Robot Framework](https://img.shields.io/badge/Robot_Framework-Automation-orange)
![Playwright](https://img.shields.io/badge/Playwright-Browser-green)
![Python](https://img.shields.io/badge/Python-3.10+-blue)
![Status](https://img.shields.io/badge/Status-Concluído-success)

Projeto desenvolvido com o objetivo de consolidar e demonstrar conhecimentos em automação de testes utilizando **Robot Framework** e **Playwright (Browser Library)**.

A proposta deste repositório é registrar uma implementação simples, porém organizada, aplicando boas práticas de automação em uma aplicação web real utilizada pela comunidade de QA para estudos: o **BugBank**.

---

![Robot Tests](https://github.com/SEU-USUARIO/bugbank-test-automation/actions/workflows/robot.yml/badge.svg)

## Objetivo

Este projeto foi criado para praticar e demonstrar conhecimentos em:

* Robot Framework
* Browser Library (Playwright)
* Automação Web
* Page Object Model (POM)
* Estruturação de suítes de teste
* Reutilização de Keywords
* Testes End-to-End (E2E)
* Geração e análise de relatórios

Embora seja um projeto de estudo, a estrutura foi organizada de forma semelhante à utilizada em projetos profissionais de automação.

---

## Tecnologias utilizadas

* Python
* Robot Framework
* Robot Framework Browser
* Playwright
* Chromium

---

## Arquitetura

O projeto segue uma abordagem inspirada em **Page Object Model (POM)** utilizando arquivos `.resource` para encapsular ações e regras de negócio.

```text
BugBank-RobotFramework/
├── resources/
│   ├── data/
│   ├── locators/
│   ├── pages/
│   └── variables/
│
├── tests/
│   ├── login.robot
│   ├── register.robot
│   ├── transfer.robot
│   └── e2e_transferencia.robot
│
└── reports/
```

### Responsabilidade das camadas

| Camada    | Responsabilidade                   |
| --------- | ---------------------------------- |
| locators  | Armazena os seletores da interface |
| pages     | Keywords de interação e validação  |
| data      | Massa de testes                    |
| variables | Variáveis de ambiente              |
| tests     | Cenários de teste                  |

Essa separação facilita manutenção, reutilização e escalabilidade da automação.

---

## Cenários automatizados

### Login

Validação do fluxo de autenticação utilizando credenciais válidas.

### Cadastro de contas

Criação dinâmica de contas para execução dos cenários.

### Transferência

Realização de transferência entre contas cadastradas durante o teste.

### End-to-End (E2E)

Fluxo completo contendo:

1. Cadastro da conta origem
2. Cadastro da conta destino
3. Login
4. Transferência
5. Validação de saldo
6. Validação de extrato da origem
7. Login na conta destino
8. Validação de extrato da conta destino

---

## Boas práticas aplicadas

* Separação entre locators e regras de negócio
* Reutilização de Keywords
* Estrutura baseada em Page Objects
* Dados dinâmicos para evitar conflitos entre execuções
* Validações explícitas para tornar os relatórios mais legíveis
* Organização das suítes por funcionalidade

---

## Instalação

Clone o repositório:

```bash
git clone https://github.com/seu-usuario/BugBank-RobotFramework.git
```

Crie o ambiente virtual:

```bash
python -m venv venv
```

Ative o ambiente:

Windows

```bash
venv\Scripts\activate
```

Linux/macOS

```bash
source venv/bin/activate
```

Instale as dependências:

```bash
pip install robotframework
pip install robotframework-browser
```

Instale os navegadores do Playwright:

```bash
rfbrowser init
```

---

## Execução dos testes

Executar todos os testes:

```bash
robot -d reports tests/
```

Executar uma suíte específica:

```bash
robot -d reports tests/e2e_transferencia.robot
```

---

## Relatórios

Após a execução serão gerados:

| Arquivo     | Descrição                         |
| ----------- | --------------------------------- |
| report.html | Resumo da execução                |
| log.html    | Passo a passo detalhado           |
| output.xml  | Resultado em XML para integrações |

Os relatórios permitem visualizar todas as Keywords executadas, validações realizadas e evidências do fluxo automatizado.

---

## Aplicação testada

BugBank é uma aplicação web utilizada para estudos de automação de testes e contém comportamentos e bugs conhecidos para prática da comunidade QA.

URL:

https://bugbank.netlify.app

---

## Considerações finais

Este projeto representa minha prática com Robot Framework aplicando conceitos fundamentais de automação web, organização de testes e construção de cenários ponta a ponta.

O foco principal foi demonstrar conhecimento na utilização do framework, estruturação de projeto e adoção de boas práticas amplamente utilizadas em ambientes profissionais.
