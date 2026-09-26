# Projeto Avaliativo RH --- Análise Exploratória de Dados

**Aluna:** Maria Laura Correa da Silva\
**Turma:** T3\
**Curso:** Visualização de Dados e Business Intelligence\
**Base:** FreeSQL --- esquema Human Resources (HR)

![Fluxo da análise](imagens/fluxo_analise_rh_geral.png)

------------------------------------------------------------------------

## Navegação

-   [Sobre o projeto](#sobre-o-projeto)
-   [Objetivo](#objetivo)
-   [Fonte e escopo dos dados](#fonte-e-escopo-dos-dados)
-   [Consultas SQL](#consultas-sql)
-   [Análise exploratória --- Python](#análise-exploratória--python)
-   [Visualizações](#visualizações)
-   [Principais resultados](#principais-resultados)
-   [Principal insight](#principal-insight)
-   [Perspectiva de impacto](#perspectiva-de-impacto)
-   [Limitações](#limitações)
-   [Sugestões de melhoria](#sugestões-de-melhoria)
-   [Tecnologias e bibliotecas](#tecnologias-e-bibliotecas)
-   [Como executar](#como-executar)
-   [Estrutura do projeto](#estrutura-do-projeto)
-   [Versionamento](#versionamento)
-   [Apresentação em vídeo](#apresentação-em-vídeo)
-   [Conclusão](#conclusão)

------------------------------------------------------------------------

## Sobre o projeto

Este projeto realiza uma **Análise Exploratória de Dados (EDA)** de
Recursos Humanos utilizando a base **Human Resources (HR)**
disponibilizada no FreeSQL.

A análise utiliza **SQL** para extração e relacionamento dos dados e
**Python** para exploração, estatística descritiva e visualização.

O projeto foi desenvolvido a partir de dois eixos principais:

1.  **Salários por departamento e cargo**
2.  **Funcionários, salários e distribuição geográfica**

O fluxo adotado foi:

``` text
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

------------------------------------------------------------------------

## Objetivo

Investigar a distribuição dos salários e dos funcionários da base HR,
observando diferenças entre cargos, departamentos e regiões.

A análise é **descritiva** e busca identificar padrões que possam
orientar perguntas e investigações posteriores na área de Recursos
Humanos.

------------------------------------------------------------------------

## Fonte e escopo dos dados

A análise parte do esquema **Human Resources (HR)** no FreeSQL.

Seis tabelas foram utilizadas nas duas consultas:

-   `HR.EMPLOYEES`
-   `HR.DEPARTMENTS`
-   `HR.JOBS`
-   `HR.LOCATIONS`
-   `HR.COUNTRIES`
-   `HR.REGIONS`

A tabela `JOB_HISTORY` foi reconhecida no schema, mas ficou fora do
escopo das consultas deste projeto.

![Schema de escopo](imagens/schema_hr_escopo.png)

### Relacionamentos utilizados

A **Query 1** utiliza:

``` text
EMPLOYEES
   ├── DEPARTMENTS
   └── JOBS
```

A **Query 2** amplia o percurso geográfico:

``` text
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

------------------------------------------------------------------------

## Consultas SQL

### Query 1 --- salários por departamento e cargo

A primeira consulta relaciona:

``` text
EMPLOYEES
      ↓
DEPARTMENTS
      ↓
JOBS
```

O objetivo é analisar salários considerando departamento e cargo.

A consulta utiliza dois `LEFT JOIN`:

``` sql
LEFT JOIN hr.departments d
    ON e.department_id = d.department_id

LEFT JOIN hr.jobs j
    ON e.job_id = j.job_id
```

E aplica o filtro:

``` sql
WHERE e.salary IS NOT NULL
```

Arquivo:

``` text
sql/query_1.sql
```

Resultado:

``` text
data/query_01.csv
```

### Query 2 --- funcionários e salários por região

A segunda consulta amplia o relacionamento para incluir a dimensão
geográfica:

``` text
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

A consulta utiliza `LEFT JOIN` ao longo do relacionamento e aplica:

``` sql
WHERE e.salary IS NOT NULL
```

Arquivo:

``` text
sql/query_2.sql
```

Resultado:

``` text
data/query_02.csv
```

### Arquivos auxiliares

Durante o reconhecimento e validação da estrutura relacional, também
foram mantidos arquivos auxiliares:

``` text
sql/query_1_reconhecimento_constraints.sql
sql/query_2_reconhecimento_dados.sql
```

------------------------------------------------------------------------

## Análise exploratória --- Python

Os resultados das consultas SQL foram exportados para arquivos CSV e
posteriormente analisados em Python.

Notebook principal:

``` text
notebooks/analise_rh.ipynb
```

A análise exploratória verificou:

-   estrutura dos dados;
-   quantidade de registros;
-   tipos das variáveis;
-   primeiros registros;
-   valores ausentes;
-   duplicidades;
-   estatística descritiva;
-   distribuição dos salários.

Foram utilizadas medidas estatísticas como:

-   média;
-   mediana;
-   mínimo;
-   máximo;
-   quartis;
-   desvio padrão.

A análise combinou estatística e visualização para evitar a
interpretação da média salarial de forma isolada.

------------------------------------------------------------------------

## Visualizações

A análise consolidou quatro leituras principais:

``` text
1. Distribuição dos salários
        ↓
2. Média salarial por cargo
        ↓
3. Média salarial por departamento
        ↓
4. Distribuição salarial por região
```

### Distribuição dos salários

O histograma mostra a concentração dos salários e a presença de valores
mais elevados.

Na base analisada:

-   **média:** R\$ 6.461,83
-   **mediana:** R\$ 6.200,00
-   **máximo:** R\$ 24.000,00

![Distribuição dos salários](imagens/distribuicao_salarios.png)

A maior concentração está nas faixas salariais inferiores, enquanto
alguns valores mais elevados ampliam a distribuição.

### Média salarial por cargo

A comparação entre cargos mostrou diferenças nas médias salariais.

A quantidade de funcionários de cada cargo também foi considerada na
interpretação, pois alguns grupos possuem poucos registros.

Dessa forma, uma média salarial elevada em um cargo com poucos
funcionários deve ser interpretada considerando o tamanho do grupo.

### Média salarial por departamento

Foram observadas diferenças entre os departamentos:

  Departamento         Média salarial
  ------------------ ----------------
  Executive                R\$ 19.333
  Accounting               R\$ 10.154
  Public Relations         R\$ 10.000
  Marketing                 R\$ 9.500
  Sales                     R\$ 8.956
  Finance                   R\$ 8.601
  Human Resources           R\$ 6.500
  IT                        R\$ 5.760
  Administration            R\$ 4.400
  Purchasing                R\$ 4.150
  Shipping                  R\$ 3.476

As médias devem ser interpretadas em conjunto com a quantidade de
registros de cada departamento.

### Distribuição salarial por região

A base analisada possui:

-   **107 funcionários**
-   **70 nas Américas**
-   **36 na Europa**
-   **1 registro sem informação geográfica**

Entre os registros com informação regional:

  Região       Funcionários          Média        Mediana
  ---------- -------------- -------------- --------------
  Europa                 36   R\$ 8.916,67   R\$ 8.900,00
  Américas               70   R\$ 5.191,66   R\$ 3.300,00

O boxplot foi utilizado para comparar a distribuição, a dispersão e os
valores extremos entre as regiões.

------------------------------------------------------------------------

## Principais resultados

A análise mostrou diferenças salariais entre cargos, departamentos e
regiões, além de diferentes níveis de concentração e dispersão dos
salários.

A comparação entre média e mediana mostrou que a média, isoladamente,
não é suficiente para compreender a distribuição dos valores,
principalmente diante da presença de salários elevados.

Na análise regional, a diferença entre média e mediana é maior nas
Américas do que na Europa.

A distribuição dos salários também evidencia que diferentes grupos
precisam ser analisados considerando não apenas a média, mas também a
quantidade de funcionários, a mediana, a dispersão e os valores
extremos.

------------------------------------------------------------------------

## Principal insight

### O contexto da distribuição importa.

O principal insight da análise é que uma média isolada não é suficiente
para compreender uma distribuição salarial.

Quando **cargo, departamento, região, quantidade de funcionários, média,
mediana, dispersão e valores extremos** são observados em conjunto,
surgem padrões que não aparecem quando olhamos apenas para a média.

A leitura, portanto, prioriza o **contexto da distribuição**, e não
apenas a identificação do grupo com maior média.

------------------------------------------------------------------------

## Perspectiva de impacto

Os dados analisados não representam, por si só, uma explicação para as
diferenças salariais.

Entretanto, a análise permite localizar diferenças e padrões que podem
ser investigados antes de uma decisão sobre remuneração ou estrutura
organizacional.

Nesse sentido, a análise contribui para:

-   fazer perguntas melhores;
-   direcionar novas investigações;
-   dar mais contexto às decisões de RH;
-   apoiar uma leitura baseada em evidências.

Esta análise não estabelece relações de causa e efeito.

------------------------------------------------------------------------

## Limitações

Os resultados são descritivos e representam apenas os dados disponíveis
na base analisada.

As diferenças observadas não permitem estabelecer relações de causa e
efeito.

Também devem ser considerados:

-   alguns grupos possuem poucos funcionários;
-   médias de grupos pequenos devem ser interpretadas com cautela;
-   existe um registro sem informações geográficas;
-   outras variáveis que poderiam ajudar a explicar diferenças salariais
    não fazem parte desta análise.

------------------------------------------------------------------------

## Sugestões de melhoria

Em uma próxima versão, a análise pode ser ampliada com outras dimensões
organizacionais e novas variáveis disponíveis na base ou em outras
fontes de dados.

Possibilidades futuras incluem:

-   análise complementar de outras dimensões organizacionais;
-   incorporação de novas variáveis;
-   novas visualizações;
-   integração com outras fontes de dados;
-   aprofundamento das diferenças salariais observadas.

A evolução da análise deve partir de uma **pergunta analítica clara**,
evitando a adição de complexidade sem finalidade.

------------------------------------------------------------------------

## Tecnologias e bibliotecas

-   SQL
-   FreeSQL
-   Python 3.14.5
-   Jupyter Notebook
-   Pandas
-   NumPy
-   Matplotlib
-   Seaborn
-   Git
-   GitHub

------------------------------------------------------------------------

## Como executar

### Pré-requisitos

-   Python 3.14.5 ou versão compatível
-   Git
-   Jupyter Notebook ou ambiente compatível

### 1. Clone o repositório

``` bash
git clone <URL_DO_REPOSITORIO>
```

Entre na pasta do projeto:

``` bash
cd 07_Projeto_Avaliativo_MariaLauraCorreaDaSilva_T3
```

### 2. Crie o ambiente virtual

``` bash
python -m venv .venv
```

### 3. Ative o ambiente virtual

No Windows:

``` bash
.venv\Scripts\activate
```

### 4. Instale as bibliotecas

``` bash
pip install pandas numpy matplotlib seaborn jupyter
```

### 5. Abra o Jupyter Notebook

``` bash
jupyter notebook
```

### 6. Execute o notebook

Abra:

``` text
notebooks/analise_rh.ipynb
```

Os arquivos CSV utilizados pelo notebook devem permanecer na pasta:

``` text
data/
```

------------------------------------------------------------------------

## Estrutura do projeto

``` text
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

------------------------------------------------------------------------

## Versionamento

O projeto utiliza **Git e GitHub** para controle de versão.

Durante o desenvolvimento, foram utilizadas branches separadas por
etapa:

``` text
develop
   ↑
feature/sql
feature/analise
```

As alterações foram desenvolvidas e versionadas por etapas, utilizando
commits relacionados às funcionalidades e à documentação do projeto.

A versão final do projeto deve permanecer organizada no branch principal
`develop`.

------------------------------------------------------------------------

## Apresentação em vídeo

**Link do vídeo:** `[INSERIR LINK DO VÍDEO]`

O vídeo apresenta:

-   o objetivo da análise;
-   as consultas SQL;
-   os filtros utilizados;
-   a influência dos filtros nos resultados;
-   a comparação salarial entre departamentos e cargos;
-   a distribuição dos funcionários entre regiões;
-   a relação entre média e mediana;
-   o gráfico utilizado na análise;
-   o principal insight;
-   uma limitação da análise.

------------------------------------------------------------------------

## Conclusão

A análise exploratória permitiu observar como os salários se distribuem
entre cargos, departamentos e regiões.

O principal aprendizado foi que uma média isolada não é suficiente para
compreender uma distribuição salarial.

A leitura conjunta de **quantidade de registros, média, mediana,
dispersão e valores extremos** fornece mais contexto para interpretar os
dados de RH.

Assim, a análise não busca apenas identificar diferenças, mas
transformar essas diferenças em **perguntas que possam orientar
investigações posteriores**.

------------------------------------------------------------------------

**Projeto Avaliativo --- Módulo 1**\
**Visualização de Dados e Business Intelligence --- T3**
