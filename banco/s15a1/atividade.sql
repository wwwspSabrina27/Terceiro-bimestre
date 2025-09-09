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
        rua varchar(50) not null,
        endereco varchar(50) not null,
        numero int not null,
        bairro varchar(50) not null,
        cidade varchar(50) not null,
        cep varchar(10) not null,
        estado varchar(50) not null,
        foreign key (cliente_id) references db_tech_solutions.clientes(id)
    );

create procedure if not exists db_tech_solutions.adicionar_produtos (
    in ac_nome varchar(100),
    in ac_descricao varchar(225),
    in ac_preco_unitario decimal(5, 2)
) begin
insert into 
  db_tech_solutions.produtos (nome,descricao,preco_unitario)
values (ac_nome, ac_descricao, ac_preco_unitario);
end;

call db_tech_solutions.adicionar_produtos ('PS4', 'video game', 350.59);
select * from db_tech_solutions.produtos;

create procedure db_tech_solutions.add_clientes (
    in ac_nome varchar(100),
    in ac_email varchar(100),
    in ac_senha varchar(100)
) begin
insert into 
  db_tech_solutions.clientes (nome,email,senha)
values (ac_nome, ac_email, ac_senha);
end;
call db_tech_solutions.adicionar_cliente ('Bruno Henrique', 'Bh@exemplo.com', '321');
select * from db_tech_solutions.clientes;

create procedure if not exists db_tech_solutions.add_item_venda (
    in ai_produto_id int,
    in ai_venda_id int,
    in ai_quantidade int
) begin
insert into 
  db_tech_solutions.item_venda (produto_id,venda_id,quantidade)
values (ai_produto_id,  ai_venda_id, ai_quantidade);
end;

call db_tech_solutions.add_item_venda (1, 1, 2);
select * from db_tech_solutions.item_venda;

create procedure if not exists db_tech_solutions.add_enderecos (
         ae_cliente_id int,
         ae_rua varchar(50),
         ae_endereco varchar(50),
         ae_numero int,
         ae_bairro varchar(50),
         ae_cidade varchar(50),
         ae_cep varchar(10),
         ae_estado varchar(50)
) begin
insert into 
  db_tech_solutions.enderecos (cliente_id,rua,endereco,numero,bairro,cidade,cep,estado)
values (ae_cliente_id, ae_rua, ae_endereco, ae_numero, ae_bairro, ae_cidade, ae_cep, ae_estado);
end;

call db_tech_solutions.add_enderecos ('2', 'josé bonifacio', 'av.jurandir','14', 'Ilheus', 'Chique-Chique', '08840-123', 'Bahia');
select * from db_tech_solutions.enderecos;

create procedure if not exists db_tech_solutions.add_vendas (
    in av_cliente_id int,
    in av_data_venda datetime
) begin
insert into 
  db_tech_solutions.vendas (cliente_id,data_venda )
values (av_cliente_id, av_data_venda);
end;
call db_tech_solutions.add_vendas (1, "2025-10-24");
select * from db_tech_solutions.vendas;

drop procedure db_tech_solutions.add_item_venda;

create procedure if not exists db_tech_solutions.mostrar_enderecos(
  begin 
)