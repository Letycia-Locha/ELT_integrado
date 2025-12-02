# 👩‍💻 Pipeline ELT: Cenário da Mulher na Tecnologia

![Badge em Desenvolvimento](https://img.shields.io/badge/Status-Concluido-green)
![Python](https://img.shields.io/badge/Python-3.10+-blue)
![dbt](https://img.shields.io/badge/dbt-sqlite-orange)
![Prefect](https://img.shields.io/badge/Prefect-Orchestration-blueviolet)

Este projeto consiste em um pipeline de Engenharia de Dados completo (**E**xtract, **L**oad, **T**ransform) desenvolvido para consolidar e analisar dados sobre a presença feminina no mercado de tecnologia global.

O projeto foi criado como parte do **Desafio de Dados do WoMakersCode**, integrando múltiplas fontes de dados heterogêneas para responder a perguntas de negócio através de uma arquitetura moderna e orquestrada.

### 📊 Dashboard Interativo

Clique na imagem abaixo para explorar os dados detalhadamente:

[![Análise do Perfil da Mulher na Área de Dados](https://public.tableau.com/static/images/Mu/MulheresnaTech/Painel1/1.png)](https://public.tableau.com/views/MulheresnaTech/Painel1)
---

## 🏗️ Arquitetura do Projeto

O fluxo de dados segue a arquitetura **ELT** (Extrair, Carregar, Transformar), onde os dados são carregados em sua forma bruta no Data Warehouse antes de serem tratados.

```mermaid
graph LR
    A[Fontes de Dados] -->|Python/Pandas| B(Extração & Carga)
    B -->|Raw Data| C[(SQLite DW)]
    C -->|dbt| D[Transformação & Modelagem]
    D -->|Tabelas Finais| E[Análise]
    subgraph Orquestrador
    F[Prefect] -.-> B
    F -.-> D
    end
````

### O Processo Detalhado:

1.  **Ingestão (Extract & Load):** Scripts Python coletam dados de 4 fontes distintas (CSV, API, Banco SQL e JSON) e os carregam na camada *Raw* (bruta) do Data Warehouse.
2.  **Armazenamento:** Utilização do **SQLite** como Data Warehouse local (`data_warehouse.db`).
3.  **Transformação (Transform):** O **dbt** (data build tool) consome os dados brutos, aplica limpezas (ex: tratamento de nulos, tipagem de dados, padronização de nomes) e cria as tabelas dimensão finais (`marts`).
4.  **Orquestração:** O **Prefect** gerencia o fluxo, garantindo que as transformações só ocorram após o sucesso da carga, além de fornecer logs de execução e retentativas automáticas.

-----

## 🛠️ Tecnologias Utilizadas

  * **Linguagem:** Python
  * **Manipulação de Dados:** Pandas
  * **Banco de Dados:** SQLite
  * **Transformação:** dbt (adapter dbt-sqlite)
  * **Orquestração:** Prefect
  * **Requisições Web:** Requests
  * **Controle de Versão:** Git/GitHub

-----

## 📂 Fontes de Dados

O projeto integra quatro tipos diferentes de fontes para simular um cenário real de engenharia de dados:

1.  **CSV:** *Kaggle Survey 2022* (Dados filtrados com foco em mulheres na área de dados).
2.  **API:** *REST Countries* (Dados geográficos para enriquecimento).
3.  **SQL:** *Banco Bootcamp* (Simulação de um banco de dados transacional de participantes).
4.  **JSON:** *Habilidades* (Arquivo semiestruturado mapeando categorias de ferramentas).

-----

## 🚀 Como Executar o Projeto

Este projeto foi desenhado para rodar preferencialmente no **Google Colab**, pois o código cria a estrutura de arquivos do dbt dinamicamente.

### Pré-requisitos

  * Uma conta Google.
  * Acesso ao Google Colab.

### Passo a Passo

1.  **Clone ou Baixe o Notebook:**
    Baixe o arquivo `.ipynb` deste repositório e faça o upload para o seu Google Drive ou abra diretamente no Colab.

2.  **Instalação das Dependências:**
    A primeira célula do notebook instala tudo o que é necessário:

    ```bash
    !pip install pandas prefect dbt-sqlite requests
    ```

3.  **Execução do Pipeline:**
    Execute as células sequencialmente. O notebook está estruturado da seguinte forma:

      * **Configuração:** Instala libs e cria o banco de dados.
      * **Funções de Extração:** Define como ler cada fonte.
      * **Configuração do dbt:** Cria o projeto dbt (`dbt init`) e os arquivos SQL (`models`) dinamicamente usando comandos `%%writefile`.
      * **Orquestração:** A última célula contém o fluxo do **Prefect** que roda todo o processo de ponta a ponta.

### Estrutura de Diretórios (Gerada Automaticamente)

Após a execução, o ambiente terá a seguinte estrutura:

```text
/content/
├── PipelinesMulheresNaTech/       # Projeto dbt
    ├── dbt_project.yml
    ├── models/
    │   ├── staging/               # Limpeza de dados (Views)
    │   └── marts/                 # Tabelas Finais
    └── data_warehouse.db              # Banco de dados central
    ├── bootcampBI.db                  # Fonte simulada
    ├── kaggle_survey_2022.csv         # Fonte CSV
    ├── habilidades_categorias.json    # Fonte JSON
    └── pipeline.log                   # Logs de execução
```

-----

## 📊 Perguntas de Negócio Respondidas

Após a execução do pipeline, a tabela final `dim_desenvolvedoras` permite responder:

  * Quantas mulheres participaram da pesquisa do Kaggle em 2022?
  * Qual a média salarial (em dólares) por nível de experiência?
  * Quais são as ferramentas de BI mais utilizadas?
  * Qual a distribuição geográfica das participantes?

-----

## ✒️ Autores

  * **Letycia Locha** - *Edição e Complementação do Pipeline*
  * **WoMakersCode** - *Proposta do Desafio*

-----

*Este projeto é para fins educacionais e demonstração de competências em Engenharia de Dados.*

```
```
