CREATE DATABASE TechTradeDB;
USE TechTradeDB;

CREATE TABLE  TechTradeDB.vendas (
    id_venda INT PRIMARY KEY,
    id_produto INT,
    id_cliente INT,
    data_venda DATE,
    quantidade INT,
    valor_total DECIMAL
);

CREATE TABLE TechTradeDB.produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(255),
    categoria VARCHAR(255),
    preco DECIMAL
);

CREATE TABLE TechTradeDB.clientes (
    id_cliente INT PRIMARY KEY,
    nome_cliente VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(255)
);

INSERT INTO TechTradeDB.produtos (id_produto, nome_produto, categoria, preco) VALUES
(101, 'Camiseta', 'Vestuário', 29.90),
(102, 'Calça Jeans', 'Vestuário', 79.90),
(201, 'Notebook', 'Eletrônicos', 2500.00),
(202, 'Mouse', 'Eletrônicos', 49.90);

INSERT INTO TechTradeDB.clientes (id_cliente, nome_cliente, cidade, estado) VALUES
(1, 'João Silva', 'São Paulo', 'SP'),
(2, 'Maria Oliveira', 'Rio de Janeiro', 'RJ'),
(3, 'Pedro Santos', 'Belo Horizonte', 'MG');

INSERT INTO TechTradeDB.vendas (id_venda, id_produto, id_cliente, data_venda, quantidade, valor_total) VALUES
(1, 101, 1, '2024-01-15', 2, 59.80),
(2, 201, 2, '2024-02-20', 1, 2500.00),
(3, 102, 3, '2024-03-10', 1, 79.90);

CREATE INDEX idx_produto_data ON TechTradeDB.vendas (id_produto, data_venda);

SELECT * FROM TechTradeDB.vendas WHERE id_produto = 101 AND data_venda BETWEEN '2024-01-01' AND '2024-12-31';

CREATE INDEX idx_data_particionado ON TechTradeDB.vendas (data_venda)
PARTITION BY RANGE (dateformat((data_venda))) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025)
);
