# Projeto Avaliativo RH — Análise Exploratória de Dados

**Maria Laura Correa da Silva · T3 · Visualização de Dados e Business Intelligence**

![Fluxo da análise](imagens/fluxo_analise_rh_geral.png)

> Análise exploratória da base **Human Resources (HR)**, utilizando SQL para extração e relacionamento dos dados e Python para análise e visualização.

---

## 🧭 Navegação

| | |
|---|---|
| [🎯 Objetivo](#-objetivo) | [🗂️ Dados](#️-dados) |
| [🔗 Consultas SQL](#-consultas-sql) | [📊 Análise](#-análise) |
| [💡 Resultados](#-resultados) | [⚠️ Limitações](#️-limitações) |
| [🚀 Sugestões de melhoria](#-sugestões-de-melhoria) | [🛠️ Tecnologias](#️-tecnologias) |
| [📁 Estrutura](#-estrutura-do-projeto) | [▶️ Execução](#️-como-executar) |
| [🌿 Versionamento](#-versionamento) | [🎥 Vídeo](#-vídeo) |

---

## 🎯 Objetivo

Analisar a distribuição dos salários da base HR considerando **cargo, departamento e região**.

O projeto utiliza SQL para extração e relacionamento dos dados e Python para análise exploratória, estatística descritiva e visualização.

A análise é descritiva e não estabelece relações de causa e efeito.

[⬆️ Voltar à navegação](#-navegação)

---

## 🗂️ Dados

A análise utiliza o esquema **Human Resources (HR)** disponibilizado pelo FreeSQL.

### Tabelas utilizadas

| Tabela | Uso |
|---|---|
| `HR.EMPLOYEES` | Funcionários, salários e cargos |
| `HR.DEPARTMENTS` | Departamentos |
| `HR.JOBS` | Cargos |
| `HR.LOCATIONS` | Localização |
| `HR.COUNTRIES` | Países |
| `HR.REGIONS` | Regiões |

`JOB_HISTORY` foi reconhecida no esquema, mas não faz parte do escopo das consultas.

![Escopo do esquema HR](imagens/schema_hr_escopo.png)

[⬆️ Voltar à navegação](#-navegação)

---

## 🔗 Consultas SQL

### Query 1 — Salários por departamento e cargo

Relaciona:

```text
EMPLOYEES → DEPARTMENTS → JOBS
```

Utiliza pelo menos dois `LEFT JOIN` e aplica o filtro:

```sql
WHERE e.salary IS NOT NULL
```

**Arquivo:** `sql/query_1.sql`  
**Resultado:** `data/query_01.csv`

### Query 2 — Funcionários e salários por região

Relaciona:

```text
EMPLOYEES → DEPARTMENTS → LOCATIONS → COUNTRIES → REGIONS
```

Utiliza `LEFT JOIN` ao longo do relacionamento e aplica:

```sql
WHERE e.salary IS NOT NULL
```

**Arquivo:** `sql/query_2.sql`  
**Resultado:** `data/query_02.csv`

### Arquivos auxiliares

```text
sql/query_1_reconhecimento_constraints.sql
sql/query_2_reconhecimento_dados.sql
```

![Esquema técnico](imagens/schema_tecnico_rh.png)

[⬆️ Voltar à navegação](#-navegação)

---

## 📊 Análise

Os arquivos CSV gerados pelas consultas foram analisados em Python no notebook:

`notebooks/analise_rh.ipynb`

A EDA verificou:

- estrutura e dimensões;
- tipos das variáveis;
- primeiros registros;
- valores ausentes;
- duplicidades;
- média, mediana, mínimo e máximo;
- quartis e desvio padrão;
- distribuição dos salários.

Foram analisados salários por **cargo, departamento e região**.

### Visualizações

- distribuição dos salários;
- média salarial por cargo;
- média salarial por departamento;
- distribuição salarial por região.

![Distribuição dos salários](imagens/distribuicao_salarios.png)

[⬆️ Voltar à navegação](#-navegação)

---

## 💡 Resultados

### Salários

| Medida | Resultado |
|---|---:|
| Funcionários com salário informado | **107** |
| Média | **R$ 6.461,83** |
| Mediana | **R$ 6.200,00** |
| Máximo | **R$ 24.000,00** |

### Departamentos

As médias salariais apresentaram diferenças entre os departamentos. Os valores observados foram:

| Departamento | Média salarial |
|---|---:|
| Executive | R$ 19.333 |
| Accounting | R$ 10.154 |
| Public Relations | R$ 10.000 |
| Marketing | R$ 9.500 |
| Sales | R$ 8.956 |
| Finance | R$ 8.601 |
| Human Resources | R$ 6.500 |
| IT | R$ 5.760 |
| Administration | R$ 4.400 |
| Purchasing | R$ 4.150 |
| Shipping | R$ 3.476 |

A quantidade de funcionários de cada grupo deve ser considerada na leitura dessas médias.

### Regiões

| Região | Funcionários | Média salarial | Mediana |
|---|---:|---:|---:|
| Europe | 36 | R$ 8.916,67 | R$ 8.900,00 |
| Americas | 70 | R$ 5.191,66 | R$ 3.300,00 |
| Sem informação geográfica | 1 | — | — |

### 💡 Insight principal

**A média salarial, sozinha, não explica a distribuição dos salários.**

A comparação entre média e mediana, junto com a dispersão e os valores extremos, mostra por que diferentes medidas precisam ser observadas em conjunto.

[⬆️ Voltar à navegação](#-navegação)

---

## ⚠️ Limitações

- A análise é descritiva e não permite estabelecer causalidade.
- Alguns grupos possuem poucos registros.
- Há um registro sem informação geográfica.
- Outras variáveis que poderiam ajudar a explicar diferenças salariais não foram analisadas.

[⬆️ Voltar à navegação](#-navegação)

---

## 🚀 Sugestões de melhoria

Para futuras versões:

- incorporar outras variáveis disponíveis na base;
- aprofundar a análise das diferenças salariais;
- utilizar outras fontes de dados quando houver uma pergunta analítica que justifique sua combinação;
- ampliar as visualizações conforme novas perguntas forem formuladas.

[⬆️ Voltar à navegação](#-navegação)

---

## 🛠️ Tecnologias

- SQL
- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Jupyter Notebook
- Git/GitHub

[⬆️ Voltar à navegação](#-navegação)

---

## 📁 Estrutura do projeto

```text
.
├── data/
│   ├── query_01.csv
│   └── query_02.csv
│
├── imagens/
│   ├── fluxo_analise_rh_geral.png
│   ├── schema_hr_escopo.png
│   ├── schema_tecnico_rh.png
│   └── distribuicao_salarios.png
│
├── notebooks/
│   └── analise_rh.ipynb
│
├── sql/
│   ├── query_1.sql
│   ├── query_2.sql
│   ├── query_1_reconhecimento_constraints.sql
│   └── query_2_reconhecimento_dados.sql
│
├── .gitignore
└── README.md
```

[⬆️ Voltar à navegação](#-navegação)

---

## ▶️ Como executar

### Pré-requisitos

- Python 3.x
- Jupyter Notebook ou JupyterLab
- Git

### Instalação

Criar o ambiente virtual:

```bash
python -m venv .venv
```

No Windows, ativar:

```bash
.venv\Scripts\activate
```

Instalar as bibliotecas:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Execução

Iniciar o Jupyter:

```bash
jupyter notebook
```

Abrir:

```text
notebooks/analise_rh.ipynb
```

Os arquivos `query_01.csv` e `query_02.csv` devem estar na pasta `data/`.

[⬆️ Voltar à navegação](#-navegação)

---

## 🌿 Versionamento

O projeto foi desenvolvido em branches de trabalho, com commits separados por etapas e funcionalidades.

A etapa de análise e documentação está na branch `feature/analise`, com integração posterior ao fluxo principal do projeto.

[⬆️ Voltar à navegação](#-navegação)

---

## 🎥 Vídeo

Apresentação técnica do projeto, com duração de até 7 minutos, mostrando rosto e tela.

**Link:** `[INSERIR LINK APÓS A GRAVAÇÃO]`

[⬆️ Voltar à navegação](#-navegação)

---

## 📌 Conclusão

A análise identificou diferenças salariais entre cargos, departamentos e regiões e mostrou que a média deve ser interpretada em conjunto com a mediana e a distribuição dos dados.

O projeto reúne as etapas de extração em SQL, análise exploratória em Python e visualização dos resultados.

---
