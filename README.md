# Análise de vendas - PostgreSQL

## Descrição do projeto
Este é meu primeiro projeto utilizando SQL, desenvolvido com foco em aplicação prática de SQL.
Neste projeto, realizai a análise de dados sobre vendas a partir de uma tabela extraída do Excel e importada para o PostgreSQL.
Apliquei técnicas de limpeza, formatação e análise de dados para a obtenção de insights, como faturamento, lucros e etc.

# Dados
Os dados utilizados foram obtidos no Kaggle
- Dataset: SuperStore Sales Dataset
- Link: https://www.kaggle.com/datasets/laibaanwer/superstore-sales-dataset

## Ferramentas
-PostgreSQL
-Linguagem SQL

## Processo de limpeza e tratamento dos dados
Durante a importação dos dados, foram identificados alguns problemas de formatação, como:
- Separador de milhar com vírgula, o que impede o Postgre de transformar colunas em NUMERIC.
- Múltiplos formatos de datas.
- Campos de texto contendo aspas duplas, na qual o Postgre reconhece como delimitadores, gerando erros na importação dos dados.

Solução:
- As colunas gerando erros foram temporariamente transformadas em TEXT.
- Removi a vírgula de milhar das colunas numéricas.
- As datas foram padronizadas.
- As colunas foram posteriormente alteradas para os tipos corretos.

## Perguntas
Este projeto aborda algumas análises:
- Qual o faturamento e o lucro total do mercado?
- Como as vendas evoluíram ao longo do tempo?
- Quais regiões são mais lucrativas e quais dão prejuízo?
- Quais categorias de produtos vendem mais e dão lucros?
- O custo de envio impacta muito no lucro?
- Os descontos impacta positivamente nas vendas?

## Insights obtidos

- O faturamento total foi de 12,6 milhão, com luro aproximados de 1,47 milhão, indicando um bom volume de vendas mas com potencial de melhorias.
- A categoria que teve o maior volume de vendas foi a da tecnologia.
- O ano de 2014 foi o ano com maior volume de vendas.
- Final do ano, entre Outubro e Dezembro, apresentam alto faturamento, possivelmente relacionado a datas comemorativas.
- Algumas regiões como Estados Unidos e China apresentam um faturamento e lucros altos, enquanto regiões como Nigeria e Turquia apresentam faturamento baixos com lucros negativos, sendo necessário uma revisão das estratégias comerciais dessas regiões.
- O custo de envio parece não afetar diretamente os lucros, uma vez que países com custo de envio elevados, como China, Austrália e Índia, ainda geram um lucro bem relevante. Mas países como Cazaquistão, Nigeria e Zimbabwe, possúi um baixo custo de envio mas com lucros negativos, o que pode estar relacionados a quantidade de consumidores nessas regiões.
- As vendas sem descontos superaram as vendas sobre os produtos com descontos, tanto em valor quanto em quantidade, mas ainda assim, os descontos ainda representam uma parte relevante do faturamento total.

## Conclusão
O projeto possibilitou a aplicação prática de SQL na análise de dados de vendas, permitindo a identificação de padrões e oportunidades de melhoria no desempenho comercial.
