# Projeto Avaliativo RH — Análise Exploratória de Dados

**Maria Laura Correa da Silva · T3 · Visualização de Dados e Business Intelligence**

![Fluxo da análise](imagens/fluxo_analise_rh_geral.png)

> Análise exploratória da base **Human Resources (HR)**, utilizando SQL para
> extração e relacionamento dos dados e Python para análise e visualização.

---

## Navegação

| | |
|---|---|
| [🎯 Objetivo](#objetivo) | [🗃️ Dados](#dados-e-consultas) |
| [🔗 Consultas SQL](#consultas-sql) | [📊 Análise](#análise) |
| [💡 Insights](#insights) | [⚠️ Limitações](#limitações) |
| [📁 Estrutura](#estrutura-do-projeto) | [▶️ Execução](#como-executar) |

---

## Objetivo

Investigar a distribuição dos salários e dos funcionários da base HR,
observando diferenças entre cargos, departamentos e regiões.

A análise é descritiva e busca identificar padrões que possam orientar
perguntas e investigações posteriores em Recursos Humanos.

[↑ Voltar à navegação](#navegação)

---

## Dados e consultas

A análise utiliza seis tabelas do schema HR:

`EMPLOYEES` · `DEPARTMENTS` · `JOBS` · `LOCATIONS` · `COUNTRIES` · `REGIONS`

![Schema técnico](imagens/schema_tecnico_rh.png)

### Query 1

**Salários por departamento e cargo**

`EMPLOYEES → DEPARTMENTS → JOBS`

### Query 2

**Funcionários, salários e distribuição geográfica**

`EMPLOYEES → DEPARTMENTS → LOCATIONS → COUNTRIES → REGIONS`

Os resultados foram exportados para:

```text
data/query_01.csv
data/query_02.csv
```

[↑ Voltar à navegação](#navegação)

---

## Consultas SQL

As consultas principais estão em:

```text
sql/query_1.sql
sql/query_2.sql
```

As duas consultas utilizam `LEFT JOIN` e `WHERE`, conforme os requisitos
do projeto.

Também foram mantidos arquivos auxiliares utilizados durante o
reconhecimento das tabelas e relacionamentos:

```text
sql/query_1_reconhecimento_constraints.sql
sql/query_2_reconhecimento_dados.sql
```

[↑ Voltar à navegação](#navegação)

---

## Análise

Os resultados das consultas foram exportados para CSV e analisados em
Python no notebook:

```text
notebooks/analise_rh.ipynb
```

Foram utilizadas:

`Pandas` · `NumPy` · `Matplotlib` · `Seaborn`

A análise exploratória considera estrutura dos dados, valores ausentes,
duplicidades, estatística descritiva e distribuição dos salários.

[↑ Voltar à navegação](#navegação)

---

## Insights

### Distribuição salarial

| Medida | Resultado |
|---|---:|
| Média | R$ 6.461,83 |
| Mediana | R$ 6.200,00 |
| Máximo | R$ 24.000,00 |

A comparação entre média e mediana mostra que a média, isoladamente, não é
suficiente para compreender a distribuição dos salários.

### Distribuição regional

| Região | Funcionários | Média | Mediana |
|---|---:|---:|---:|
| Europa | 36 | R$ 8.916,67 | R$ 8.900,00 |
| Américas | 70 | R$ 5.191,67 | R$ 3.300,00 |

Na análise regional, a diferença entre média e mediana é maior nas
Américas do que na Europa.

### Insight principal

**O contexto da distribuição importa.**

Cargo, departamento, região, quantidade de funcionários, média, mediana,
dispersão e valores extremos precisam ser observados em conjunto para uma
leitura mais cuidadosa dos dados de RH.

[↑ Voltar à navegação](#navegação)

---

## Limitações

A análise é descritiva e não estabelece relações de causa e efeito.

Alguns grupos possuem poucos funcionários e existe um registro sem
informação geográfica. Esses fatores devem ser considerados na interpretação
dos resultados.

[↑ Voltar à navegação](#navegação)

---

## Estrutura do projeto

```text
07_Projeto_Avaliativo_MariaLauraCorreaDaSilva_T3/
│
├── data/
│   ├── query_01.csv
│   └── query_02.csv
│
├── docs/
│   └── referencias/
│
├── imagens/
│   ├── fluxo_analise_rh_geral.png
│   ├── schema_hr_escopo.png
│   └── schema_tecnico_rh.png
│
├── notebooks/
│   └── analise_rh.ipynb
│
├── sql/
│   ├── query_1.sql
│   ├── query_1_reconhecimento_constraints.sql
│   ├── query_2.sql
│   └── query_2_reconhecimento_dados.sql
│
├── .gitignore
└── README.md
```

[↑ Voltar à navegação](#navegação)

---

## Como executar

### Pré-requisitos

- Python 3.14.5 ou compatível
- Jupyter Notebook

### Instalação

```bash
python -m venv .venv
```

No Windows:

```bash
.venv\Scripts\activate
```

Instale as bibliotecas:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

### Execução

```bash
jupyter notebook
```

Abra:

```text
notebooks/analise_rh.ipynb
```

Os arquivos CSV utilizados pelo notebook devem permanecer na pasta:

```text
data/
```

[↑ Voltar à navegação](#navegação)

---

## Tecnologias

`SQL` · `Python` · `Pandas` · `NumPy` · `Matplotlib` · `Seaborn` · `Git` · `GitHub`

---

## Apresentação

**Vídeo:** `[link será inserido após a gravação]`

---

[↑ Voltar ao topo](#projeto-avaliativo-rh--análise-exploratória-de-dados)