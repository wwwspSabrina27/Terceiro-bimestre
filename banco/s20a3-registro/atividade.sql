CREATE database if not exists db_dados;

CREATE TABLE if not exists db_dados.customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARBINARY(255), 
    phone_number VARBINARY(20) 
);

INSERT INTO db_dados.customers (name, email, phone_number)
VALUES (
    'João Silva',
    AES_ENCRYPT('joao@email.com', 'chave-secreta'),
    AES_ENCRYPT('123456789', 'chave-secreta')
);

INSERT INTO db_dados.customers (name, email, phone_number)
VALUES (
    'Maria Oliveira',
    AES_ENCRYPT('maria@email.com', 'chave-secreta'),
    AES_ENCRYPT('987654321', 'chave-secreta')
);

INSERT INTO db_dados.customers (name, email, phone_number)
VALUES (
    'Pedro Santos',
    AES_ENCRYPT('pedro@email.com', 'chave-secreta'),
    AES_ENCRYPT('555123456', 'chave-secreta')
);

SELECT
    name,
    AES_DECRYPT(email, 'chave-secreta') AS email,
    AES_DECRYPT(phone_number, 'chave-secreta') AS phone_number
FROM
    db_dados.customers;

 

CREATE USER 'admin'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON db_dados.customers TO 'root'@'localhost';

CREATE USER 'view_only'@'localhost' IDENTIFIED BY '';

GRANT ALL PRIVILEGES ON db_dados.customers TO 'root'@'localhost' WITH GRANT OPTION; 

GRANT SELECT ON db_dados TO 'view_only'@'localhost';

FLUSH PRIVILEGES;

SET GLOBAL general_log = 'ON';
SET GLOBAL general_log_file = '/var/log/mysql/general.log'; 


