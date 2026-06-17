# BugBank — Automação de Testes com Robot Framework

![Python](https://img.shields.io/badge/Python-3.10%2B-blue)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-Automation-orange)
![Playwright](https://img.shields.io/badge/Playwright-green)
![CI](https://github.com/ReginaldDev/robotframework-playwright-bugbank/actions/workflows/robot.yml/badge.svg)
![Status](https://img.shields.io/badge/Status-Completed-success)

Projeto desenvolvido para consolidar e demonstrar conhecimentos em **Automação de Testes Web** utilizando **Robot Framework**, **Browser Library (Playwright)** e práticas modernas de organização de testes automatizados.

O objetivo deste repositório é servir como portfólio técnico, registrando a implementação de cenários automatizados em uma aplicação amplamente utilizada pela comunidade de QA para estudos e prática de automação: o **BugBank**.

---

## Sobre o Projeto

Este projeto foi criado como parte do meu processo de evolução profissional na área de **Qualidade de Software (QA)**.

Embora a aplicação seja simples, a implementação foi estruturada utilizando conceitos encontrados em projetos reais de automação, como:

* Organização por camadas
* Reutilização de componentes
* Separação de responsabilidades
* Estrutura baseada em Page Object Model
* Execução End-to-End (E2E)
* Integração Contínua com GitHub Actions

---

## Tecnologias Utilizadas

| Tecnologia      | Finalidade                     |
| --------------- | ------------------------------ |
| Python          | Linguagem base                 |
| Robot Framework | Framework de automação         |
| Browser Library | Integração Robot + Playwright  |
| Playwright      | Automação de navegador         |
| Chromium        | Navegador utilizado nos testes |
| GitHub Actions  | Integração Contínua (CI)       |

---

## Arquitetura do Projeto

O projeto segue uma abordagem inspirada em **Page Object Model (POM)** utilizando arquivos `.resource` para encapsular regras de negócio e interações com a interface.

```text
BugBank-RobotFramework/
│
├── .github/
│   └── workflows/
│       └── robot.yml
│
├── resources/
│   ├── data/
│   ├── keywords/
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
├── reports/
│
├── requirements.txt
└── README.md
```

---

## Responsabilidade das Camadas

| Camada    | Responsabilidade                         |
| --------- | ---------------------------------------- |
| locators  | Centralização dos seletores da interface |
| pages     | Ações e validações da aplicação          |
| data      | Massa de dados utilizada pelos testes    |
| variables | Variáveis globais do projeto             |
| tests     | Cenários automatizados                   |
| workflows | Pipeline de execução automática          |

---

## Cenários Automatizados

### Login

Validação do fluxo de autenticação utilizando credenciais válidas.

### Cadastro de Conta

Criação dinâmica de contas para execução dos testes.

### Transferência Bancária

Realização de transferências entre contas cadastradas durante a execução.

### Fluxo End-to-End (E2E)

Cenário completo contemplando:

* Cadastro da conta origem
* Cadastro da conta destino
* Login da conta origem
* Transferência entre contas
* Validação do débito
* Validação do saldo atualizado
* Validação do extrato da conta origem
* Login da conta destino
* Validação do crédito recebido
* Validação do extrato da conta destino

---

## Boas Práticas Aplicadas

✅ Estrutura baseada em Page Object Model

✅ Separação entre seletores e regras de negócio

✅ Reutilização de Keywords

✅ Dados dinâmicos para evitar conflitos entre execuções

✅ Validações explícitas para aumentar a confiabilidade dos testes

✅ Organização modular das suítes

✅ Execução automatizada via GitHub Actions

---

## Integração Contínua (CI)

O projeto possui pipeline automatizado utilizando **GitHub Actions**.

A cada push ou pull request:

1. O ambiente é criado automaticamente
2. As dependências são instaladas
3. O Playwright é configurado
4. Os testes Robot Framework são executados
5. Os relatórios são gerados

Isso garante que a automação permaneça funcional a cada alteração realizada no projeto.

---

## Instalação

Clone o repositório:

```bash
git clone https://github.com/ReginaldDev/robotframework-playwright-bugbank.git
```

Acesse o diretório:

```bash
cd robotframework-playwright-bugbank
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
pip install -r requirements.txt
```

Instale os navegadores:

```bash
rfbrowser init
```

---

## Execução dos Testes

Executar todas as suítes:

```bash
robot -d reports tests/
```

Executar apenas o fluxo E2E:

```bash
robot -d reports tests/e2e_transferencia.robot
```

Executar visualizando o navegador:

```bash
robot -v HEADLESS:False -d reports tests/e2e_transferencia.robot
```

---

## Relatórios

Após a execução serão gerados:

| Arquivo     | Descrição                              |
| ----------- | -------------------------------------- |
| report.html | Resumo da execução                     |
| log.html    | Detalhamento completo dos passos       |
| output.xml  | Resultado estruturado para integrações |

---

## Aplicação Testada

### BugBank

Aplicação web utilizada pela comunidade de QA para prática de automação de testes.

**URL:** [https://bugbank.netlify.app](https://bugbank.netlify.app)

---

## Autor

**Reginaldo Junior**

QA Engineer | Automação de Testes | Cypress| Robot Framework | Playwright | APIs | Qualidade de Software

GitHub:
[https://github.com/ReginaldDev](https://github.com/ReginaldDev)

LinkedIn:
[https://www.linkedin.com/in/reginaldojunior89/](https://www.linkedin.com/in/reginaldojunior89/))

---

## Considerações Finais

Este projeto representa um pouco da minha prática em automação de testes utilizando Robot Framework + Playwright.

Mais do que validar funcionalidades da aplicação, o objetivo foi demonstrar conhecimentos em estruturação de automação, reutilização de componentes, boas práticas de desenvolvimento de testes e integração contínua, simulando uma abordagem próxima à encontrada em ambientes profissionais.

---