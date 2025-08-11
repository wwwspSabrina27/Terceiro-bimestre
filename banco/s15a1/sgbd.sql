create database if not exists db_tech_solutions;

create table if not exists db_tech_solutions.clientes (
        id int auto_increment primary key,
        nome varchar(100) not null,
        email varchar(100) not null unique,
        senha varchar(100) not null
    );

create table if not exists db_tech_solutions.produtos (
        id int auto_increment primary key,
        nome varchar(100) not null,
        descricao varchar(255),
        preco_unitario decimal(5, 2) not null
    );

create table if not exists db_tech_solutions.vendas (
        id int auto_increment primary key,
        cliente_id int not null,
        data_venda datetime not null,
        foreign key (cliente_id) references db_tech_solutions.clientes (id)
    );

create table if not exists db_tech_solutions.item_venda (
        id int auto_increment primary key,
        produto_id int not null,
        venda_id int not null,
        quantidade int not null,
        foreign key (venda_id) references db_tech_solutions.vendas (id),
        foreign key (produto_id) references db_tech_solutions.produtos (id)
    );

create table if not exists db_tech_solutions.enderecos (
        id int auto_increment primary key,
        cliente_id int not null,
        rua varchar(100) not null,
        endereco varchar(100) not null,
        numero int not null,
        bairro varchar(100) not null,
        cidade varchar(100) not null,
        estado varchar(100) not null,
        foreign key (cliente_id) references db_tech_solutions.clientes(id)
    );


1. Quais são as principais características de um SGBD relacional?
Resposta: Tabelas e dados, Chaves primárias e estrangeiras, relacionamento e consultas com o SQL.

2. Quais são as vantagens de utilizar MySQL em comparação com um SGBD NoSQL?
Resposta: Integridade, organização, é bom para fazer consultas e 
permite melhorar os relacionamentos dos atributos e entidades.

3. Em que situações um SGBD relacional se destaca para a gestão de dados de uma empresa?
Resposta: Para proteger as integridades dos dados, para armazenar e organizar dados e 
gerencia o acesso aos dados.

4.	Façam um esboço de um diagrama de banco de dados que poderia ser implementado 
na TechSolutions (com pelo menos três tabelas: clientes, produtos, vendas).
Resposta: