# Projeto Avaliativo RH — Análise Exploratória de Dados

**Aluna:** Maria Laura Correa da Silva  
**Turma:** T3  
**Curso:** Visualização de Dados e Business Intelligence  
**Base:** FreeSQL — Esquema Human Resources (HR)

![Fluxo da análise](imagens/fluxo_analise_rh_geral.png)

## Sobre o projeto

Este projeto realiza uma análise exploratória dos dados de Recursos Humanos da base **Human Resources (HR)** disponibilizada no FreeSQL.

A análise utiliza **SQL** para extração e relacionamento dos dados e **Python** para exploração, estatística descritiva e visualização.

O projeto foi desenvolvido a partir de dois eixos:

1. **Salários por departamento e cargo**
2. **Funcionários, salários e distribuição geográfica**

O fluxo adotado foi:

```text
FreeSQL / HR
     ↓
Conhecimento da fonte e das tabelas
     ↓
Consultas SQL
     ↓
CSV
     ↓
Python / EDA
     ↓
Estatística descritiva
     ↓
Visualizações
     ↓
Insights
     ↓
Interpretação e limitações
```

## Objetivo

Investigar a distribuição dos salários e dos funcionários da base HR, observando diferenças entre cargos, departamentos e regiões.

A análise é descritiva e busca identificar padrões que possam orientar perguntas e investigações posteriores na área de Recursos Humanos.

## Fonte e escopo dos dados

A análise parte do esquema **Human Resources (HR)** no FreeSQL.

Seis tabelas foram utilizadas nas duas consultas:

- `HR.EMPLOYEES`
- `HR.DEPARTMENTS`
- `HR.JOBS`
- `HR.LOCATIONS`
- `HR.COUNTRIES`
- `HR.REGIONS`

A tabela `JOB_HISTORY` foi reconhecida no schema, mas ficou fora do escopo das consultas deste projeto.

![Schema de escopo](imagens/schema_hr_escopo.png)

### Relacionamentos utilizados

A Query 1 utiliza:

```text
EMPLOYEES
   ├── DEPARTMENTS
   └── JOBS
```

A Query 2 amplia o percurso geográfico:

```text
EMPLOYEES
   ↓
DEPARTMENTS
   ↓
LOCATIONS
   ↓
COUNTRIES
   ↓
REGIONS
```

![Schema técnico](imagens/schema_tecnico_rh.png)

## Consultas SQL

### Query 1 — salários por departamento e cargo

Relaciona `EMPLOYEES`, `DEPARTMENTS` e `JOBS`.

A consulta utiliza dois `LEFT JOIN` e aplica o filtro:

```sql
WHERE e.salary IS NOT NULL
```

Arquivo:

```text
sql/query_1.sql
```

Resultado:

```text
data/query_01.csv
```

### Query 2 — funcionários e salários por região

Relaciona `EMPLOYEES`, `DEPARTMENTS`, `JOBS`, `LOCATIONS`, `COUNTRIES` e `REGIONS`.

A consulta utiliza `LEFT JOIN` ao longo do relacionamento e aplica:

```sql
WHERE e.salary IS NOT NULL
```

Arquivo:

```text
sql/query_2.sql
```

Resultado:

```text
data/query_02.csv
```

Também foram mantidos arquivos auxiliares de reconhecimento das constraints e dos relacionamentos:

```text
sql/query_1_reconhecimento_constraints.sql
sql/query_2_reconhecimento_dados.sql
```

## Análise exploratória — Python

Os resultados das consultas foram exportados para CSV e analisados no notebook:

```text
notebooks/analise_rh.ipynb
```

A análise verificou:

- estrutura dos dados;
- quantidade de registros;
- tipos das variáveis;
- primeiros registros;
- valores ausentes;
- duplicidades;
- estatística descritiva.

Foram utilizadas medidas como:

- média;
- mediana;
- mínimo;
- máximo;
- quartis;
- desvio padrão.

A análise combinou estatística e visualização para evitar a interpretação da média salarial de forma isolada.

## Visualizações

A análise consolidou quatro leituras principais:

```text
1. Distribuição dos salários
        ↓
2. Média salarial por cargo
        ↓
3. Média salarial por departamento
        ↓
4. Distribuição salarial por região
```

### Distribuição dos salários

O histograma mostra a concentração dos salários e a presença de valores mais elevados.

Na base analisada:

- **média:** aproximadamente R$ 6.461,83
- **mediana:** R$ 6.200,00
- **máximo:** R$ 24.000,00

![Distribuição dos salários](imagens/distribuicao_salarios.png)

A maior concentração está nas faixas salariais inferiores, enquanto poucos valores mais altos ampliam a distribuição.

### Média salarial por cargo

A comparação entre cargos mostrou diferenças nas médias salariais. A quantidade de funcionários de cada cargo também foi considerada na interpretação, pois alguns grupos possuem poucos registros.

### Média salarial por departamento

Foram observadas diferenças entre os departamentos, incluindo:

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

As médias devem ser interpretadas em conjunto com a quantidade de registros de cada departamento.

### Distribuição salarial por região

A base possui:

- **107 funcionários**
- **70 nas Américas**
- **36 na Europa**
- **1 registro sem informação geográfica**

Entre os registros com informação regional:

| Região | Funcionários | Média | Mediana |
|---|---:|---:|---:|
| Europa | 36 | R$ 8.916,67 | R$ 8.900,00 |
| Américas | 70 | R$ 5.191,67 | R$ 3.300,00 |

O boxplot foi utilizado para comparar distribuição, dispersão e valores extremos entre as regiões.

## Principais resultados

A análise mostrou diferenças salariais entre cargos, departamentos e regiões, além de diferentes níveis de concentração e dispersão dos salários.

A comparação entre média e mediana mostrou que a média, isoladamente, não é suficiente para compreender a distribuição dos valores, principalmente diante da presença de salários elevados.

Na análise regional, a diferença entre média e mediana é maior nas Américas do que na Europa, enquanto a distribuição salarial das Américas apresenta maior dispersão.

## Principal insight

O principal insight está na própria **distribuição dos salários**.

Quando cargo, departamento, região, quantidade de funcionários, média, mediana e distribuição são observados em conjunto, surgem padrões que não aparecem quando olhamos apenas para a média salarial.

A leitura, portanto, prioriza o **contexto da distribuição**, e não apenas a identificação do grupo com maior média.

## Perspectiva de impacto

Os dados ajudam a localizar diferenças e padrões que podem ser investigados antes de uma decisão sobre remuneração ou estrutura organizacional.

Nesse sentido, a análise contribui para:

- fazer perguntas melhores;
- direcionar novas investigações;
- dar mais contexto às decisões de RH.

Esta análise não estabelece relações de causa e efeito.

## Limitações

Os resultados são descritivos e representam apenas os dados disponíveis na base analisada.

As diferenças observadas não permitem estabelecer relações de causa e efeito.

Também devem ser considerados:

- alguns grupos possuem poucos funcionários;
- médias de grupos pequenos devem ser interpretadas com cautela;
- existe um registro sem informações geográficas;
- outras variáveis que poderiam ajudar a explicar diferenças salariais não fazem parte desta análise.

## Sugestão de melhoria

Uma evolução possível é ampliar a análise com outras variáveis ou fontes de dados que permitam investigar com maior profundidade as diferenças salariais.

Possibilidades futuras incluem:

- análise complementar de outras dimensões organizacionais;
- incorporação de novas variáveis;
- novas visualizações;
- integração com outras fontes de dados.

A melhoria deve ser orientada por uma pergunta analítica clara, e não pela adição de complexidade sem finalidade.

## Tecnologias e bibliotecas

- SQL
- FreeSQL
- Python 3.14.5
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Git
- GitHub

## Como executar

### Pré-requisitos

- Python 3.14.5 ou versão compatível
- Git
- Jupyter Notebook ou ambiente compatível

### Instalação

Crie um ambiente virtual:

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

Abra o Jupyter:

```bash
jupyter notebook
```

Execute:

```text
notebooks/analise_rh.ipynb
```

Os arquivos CSV utilizados pelo notebook devem permanecer em:

```text
data/
```

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
│   ├── schema_tecnico_rh.png
│   └── distribuicao_salarios.png
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

## Versionamento

O projeto utiliza Git para controle de versão.

A organização adotada durante o desenvolvimento utiliza branches por etapa:

```text
main
  ↑
develop
  ↑
feature/sql
feature/analise
```

As alterações são desenvolvidas e versionadas por etapa antes da integração da versão final.

## Apresentação em vídeo

**Link do vídeo:** `[INSERIR LINK DO VÍDEO]`

O vídeo apresenta o problema, as consultas SQL, a análise exploratória, as visualizações, os principais resultados, o insight e as limitações.

## Conclusão

A análise exploratória permitiu observar como os salários se distribuem entre cargos, departamentos e regiões.

O principal aprendizado foi que uma média isolada não é suficiente para compreender uma distribuição salarial. A leitura conjunta de quantidade de registros, média, mediana, dispersão e valores extremos fornece mais contexto para interpretar os dados de RH.
