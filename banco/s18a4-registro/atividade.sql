create database if not exists marketdata_solutions;

create table if not exists marketdata_solutions.vendas (
    id int primary key,
    nome_cliente varchar(100),
    valor_venda decimal(10, 2)
);

insert into marketdata_solutions.vendas (id, nome_cliente, valor_venda) values
(1, 'João Silva', 1200.00), (2, 'Maria Santos', 750.00), (3, 'Pedro Oliveira', 300.00),
(4, 'Ana Pereira', 1500.00), (5, 'Carlos Souza', 600.00), (6, 'Juliana Costa', 250.00),
(7, 'Paulo Rodrigues', 1100.00), (8, 'Fernanda Almeida', 800.00), (9, 'Ricardo Mendes', 400.00),
(10, 'Camila Ribeiro', 1800.00);

create table if not exists marketdata_solutions.vendedores (
    id INT PRIMARY KEY,
    nome_vendedor VARCHAR(100),
    total_vendas DECIMAL(10, 2)
);

insert into marketdata_solutions.vendedores (id, nome_vendedor, total_vendas) VALUES
(1, 'José', 12500.00), (2, 'Maria', 7000.00), (3, 'Pedro', 3500.00),
(4, 'Ana', 15000.00), (5, 'Carlos', 6000.00), (6, 'Juliana', 2500.00),
(7, 'Paulo', 11000.00), (8, 'Fernanda', 8000.00), (9, 'Ricardo', 4000.00),
(10, 'Camila', 18000.00);

create table if not exists marketdata_solutions.produtos (
    id INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2)
);

insert into marketdata_solutions.produtos (id, nome_produto, preco) VALUES
(1, 'Notebook', 1200.00), (2, 'Tablet', 750.00), (3, 'Mouse', 30.00),
(4, 'Teclado', 80.00), (5, 'Monitor', 200.00), (6, 'Webcam', 50.00),
(7, 'Impressora', 150.00), (8, 'Caixa de Som', 60.00), (9, 'Fone de Ouvido', 40.00),
(10, 'SSD', 180.00);

select nome_cliente,
    valor_venda,
    case
        when valor_venda > 1000 then 'Alta'
        when valor_venda BETWEEN 500 and 1000 then 'Média'
        else 'Baixa'
    end as categoria_venda
from
    marketdata_solutions.vendas;

select
    nome_vendedor,
    total_vendas,
    case
        when total_vendas > 10000 then 'Excelente'
        when total_vendas BETWEEN 5000 and 10000 then 'Bom'
        else 'Regular'
    end as desempenho
from
    marketdata_solutions.vendedores;

select
    nome_produto,
    preco,
    case
        when preco > 100 then 'Caro'
        when preco BETWEEN 50 AND 100 then 'Moderado'
        else 'Barato'
    END AS categoria_preco
FROM
    marketdata_solutions.produtos;


