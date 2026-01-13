-- Calcula o faturamento total por meio da soma de todas as vendas da tabela.
SELECT SUM(sales) AS Faturamento_total FROM vendas_mercado;

-- Retorna a quantidade total de pedidos da tabela.
SELECT COUNT(order_id) AS Total_pedidos FROM vendas_mercado;

-- Calcula o lucro total e a margem média de lucro sobre as vendas.
SELECT SUM(profit) AS Lucro_total, 
ROUND(SUM(profit) / SUM(sales) * 100, 2) AS Margem_media
FROM vendas_mercado;

-- Calcula as vendas totais por ano, ordenando do maior para o menor valor.
SELECT year, ROUND(SUM(sales),0) as Vendas_totais FROM vendas_mercado
GROUP BY year 
ORDER BY Vendas_totais DESC;

-- Calcula as vendas totais por mês de cada ano, ordenando do maior para o menor.
SELECT year AS Ano, 
	EXTRACT(MONTH FROM order_date) AS Mes,
	ROUND(SUM(sales),0) AS Vendas_totais
FROM vendas_mercado
GROUP BY Ano, Mes
ORDER BY Mes DESC;

-- Calcula as vendas totais e a porcentagem de lucro de cada região, ordenando do maior para o menor.
SELECT country AS Regiao, ROUND(SUM(sales),0) AS Vendas_totais, 
	   SUM(profit) AS Lucro, ROUND(SUM(profit) / SUM(sales) * 100,2) AS Porcentagem_lucro
FROM vendas_mercado
GROUP BY Regiao
ORDER BY Lucro DESC;
		
-- Calcula as vendas totais e a porcentagem de lucro de cada região, mas ordenado do menor para o maior.
SELECT country AS Regiao, ROUND(SUM(sales),0) AS Vendas_totais, 
	   SUM(profit) AS Lucro, ROUND(SUM(profit) / SUM(sales) * 100,2) AS Porcentagem_lucro
FROM vendas_mercado
GROUP BY Regiao
ORDER BY Lucro ASC;

-- Exibe a região e calcula o custo de envio médio e o lucro de cada região, e considerando apenas lucros totais positivos.
SELECT country AS Regiao, ROUND(AVG(shipping_cost),2) AS Custo_envio, SUM(profit) AS Lucro
FROM vendas_mercado 
WHERE profit > 0
GROUP BY Regiao
ORDER BY Lucro DESC;

-- Exibe a região e calcula o custo de envio médio e o lucro de cada região, e considerando apenas regiões com prejuízo.
SELECT country AS Regiao, ROUND(AVG(shipping_cost),2) AS Custo_envio, SUM(profit) AS Lucro
FROM vendas_mercado 
GROUP BY Regiao
HAVING SUM(profit) < 0
ORDER BY Custo_envio ASC;

-- Calcula a soma das vendas totais e o lucro de cada categoria de produto.
SELECT category AS Categoria_produto, ROUND(SUM(sales),0) AS Vendas_totais, SUM(profit) AS Lucro
FROM vendas_mercado
GROUP BY Categoria_produto
ORDER BY Vendas_totais DESC;

-- Compara o valor total de vendas e a quantidade total de vendas entre produtos com desconto e sem desconto.
SELECT
  SUM(sales) FILTER (WHERE discount > 0) AS vendas_com_desconto,
  SUM(quantity) FILTER (WHERE discount > 0) AS quantidade_com_desconto,
  SUM(sales) FILTER (WHERE discount = 0) AS vendas_sem_desconto,
  SUM(quantity) FILTER (WHERE discount = 0) AS quantidade_sem_desconto
FROM vendas_mercado;

