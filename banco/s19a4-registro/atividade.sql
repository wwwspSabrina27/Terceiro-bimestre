create database if not exists db_dml;

CREATE TABLE if not exists db_dml.clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

CREATE TABLE if not exists db_dml.Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE if not exists db_dml.Itens_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    preco DECIMAL(10,2),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);


-- Iniciar a transação
START TRANSACTION;

-- Inserir cliente (se não existir)
INSERT INTO Clientes (nome, email, endereco)
SELECT 'Carlos Mendes', 'carlos@email.com', 'Rua das Flores, 789'
WHERE NOT EXISTS (SELECT 1 FROM Clientes WHERE nome = 'Carlos Mendes');

-- Obter o ID do cliente (usando o ID existente ou o novo ID inserido)
SET @cliente_id = (SELECT id_cliente FROM Clientes WHERE nome = 'Carlos Mendes');

-- Inserir pedido para o cliente
INSERT INTO Pedidos (id_cliente, data_pedido, status)
VALUES (@cliente_id, CURDATE(), 'Em Processamento');

-- Obter o ID do pedido
SET @pedido_id = LAST_INSERT_ID();

-- Inserir itens no pedido
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade, preco)
VALUES (@pedido_id, 101, 2, 299.90); -- Produto 101 com 2 unidades

-- Se todas as inserções ocorrerem sem erro, confirmamos a transação
COMMIT;




