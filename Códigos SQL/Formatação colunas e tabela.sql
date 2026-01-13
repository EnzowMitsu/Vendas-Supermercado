/* 
    Correção do tipo de dados na tabela

Problema:

    Ao importar os dados a partir do Excel, algumas colunas numéricas e com datas, causavam erros por estarem com uma formatação diferente 
    da minha, como múltiplos formatos de data; coluna de vendas com separador de minhar por vírgula, que o Postgre não converte 
    diretamente em numeric nesse formado; e também foi necessário alterar o escape (escapar) e o QUOTE para aspas duplas, 
    pois algumas colunas apresentavem aspas duplas em campos textuais.

    Pelo fato de eu ter criado a tabela com as colunas já tipadas, foi necessário alterar temporariamente os tipos das colunas para tipo TEXT 
    e realziar a formataçao adequada, como a remoção da vírgula de milhar na coluna de vendas e mudar a formatação padrão de datas do SQL. 
    Após isso, importei a tabela CSV para o Postgre e, em sequida, alterei os tipos das colunas para os tipos corretos.

*/


-- Alterando a coluna vendas para tipo TEXT.
ALTER TABLE vendas_mercado
ALTER COLUMN sales TYPE TEXT;

-- Alterando coluna de datas para tipo TEXT.
ALTER TABLE vendas_mercado
ALTER COLUMN order_date TYPE TEXT,
ALTER COLUMN ship_date TYPE TEXT;

-- Removendo vírgula de milhas da coluna sales.
UPDATE vendas_mercado
SET sales = REPLACE(sales, ',', '');

-- Alterando tipo padrão de datas no Postgre.
SET datestyle = 'ISO, YMD';

-- Alterando a coluna vendas para o tipo NUMERIC.
ALTER TABLE vendas_mercado
ALTER COLUMN sales TYPE NUMERIC(10,2)
USING sales::NUMERIC; -- O USING é usado para formatar os dados preenchidos da coluna para NUMERIC, não apenas a coluna.

-- Alterando as colunas de datas que estavam em TEXT para DATE.
ALTER TABLE vendas_mercado
ALTER COLUMN order_date TYPE DATE
USING order_date::DATE,
ALTER COLUMN ship_date TYPE DATE
USING ship_date::DATE;
