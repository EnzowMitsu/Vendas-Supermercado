/*
Criação da tabela vendas_mercado
*/

CREATE TABLE vendas_mercado (
    id SERIAL PRIMARY KEY, --Coluna ID (Identificador único).

    order_id TEXT, -- Coluna ID do pedido.
    order_date DATE, -- Coluna com a data do pedido.
    ship_date DATE, -- Coluna com a data envio do pedido.
	ship_mode TEXT, -- Coluna com tipo de envio.
	
    customer_name TEXT, -- Coluna com o nome do cliente.
    segment TEXT, -- Coluna com o segmento do cliente.

    state TEXT, -- Coluna Estado.
    country TEXT, -- Coluna País.
	market TEXT, -- Coluna do tipo do mercado da região.
    region TEXT, -- Coluna Região.

	product_id TEXT, -- Coluna com ID do produto.
    category TEXT, -- Coluna Categoria do produto.
    sub_category TEXT, -- Coluna da subcategoria do produto.
    product_name TEXT, -- Coluna com o nome do Produto.

    sales NUMERIC(10,2), -- Coluna com o valor total da venda.
    quantity INTEGER, -- Coluna com a quantidade vendida.
    discount NUMERIC(4,2), -- Coluna desconto.
    profit NUMERIC(10,2), -- Coluna lucro.
	shipping_cost NUMERIC(10,2), -- Coluna com o custo de envio.
	order_priority TEXT, -- Coluna prioridade do produto.
	year INT -- Coluna ano do pedido.
);

SET datestyle = 'ISO, YMD'; -- Definindo o formato padrão das datas.
