create database if not exists db_teste;

create table if not exists db_teste.clientes (
        id int auto_increment primary key,
        nome varchar(100) not null,
        email varchar(100) not null unique,
        senha varchar(100) not null
    );

create table if not exists db_teste.produtos(
        id int auto_increment primary key,
        nome varchar(100) not null,
        descricao varchar(255),
        preco_unitario decimal(5, 2) not null
    );

create table if not exists db_teste.vendas (
        id int auto_increment primary key,
        cliente_id int not null,
        data_venda datetime not null,
        foreign key (cliente_id) references db_teste.clientes (id)
    );

create table if not exists db_teste.item_venda (
        id int auto_increment primary key,
        produto_id int not null,
        venda_id int not null,
        quantidade int not null,
        foreign key (venda_id) references db_teste.vendas (id),
        foreign key (produto_id) references db_teste.produtos (id)
    );

create procedure if not exists db_teste.add_clientes (
    in ac_nome varchar(100),
    in ac_email varchar(100),
    in ac_senha varchar(100)
) begin
insert into 
  db_teste.clientes (nome,email,senha)
values (ac_nome, ac_email, ac_senha);
end;
call db_teste.add_clientes('Bruno Henrique', 'Bh@exemplo.com', '321');
call db_teste.add_clientes('Kaio Jorge', 'Jorgin@exemplo.com', '123');
select * from db_teste.clientes;

create procedure if not exists db_teste.adicionar_produtos (
    in ac_nome varchar(100),
    in ac_descricao varchar(225),
    in ac_preco_unitario decimal(5, 2)
) begin
insert into 
  db_tech_solutions.produtos (nome,descricao,preco_unitario)
values (ac_nome, ac_descricao, ac_preco_unitario);
end;
call db_teste.adicionar_produtos ('PS5', 'video game', 350.59);
call db_teste.adicionar_produtos ('PS4', 'video game', 250.59);
select * from db_teste.produtos;

create procedure if not exists db_teste.add_vendas (
    in av_cliente_id int,
    in av_data_venda datetime
) begin
insert into 
  db_teste.vendas (cliente_id,data_venda )
values (av_cliente_id, av_data_venda);
end;
call db_teste.add_vendas (1, "2025-10-24");
call db_teste.add_vendas (2, "2025-10-25");
select * from db_teste.vendas;

create procedure if not exists db_teste.add_item_venda (
    in ai_produto_id int,
    in ai_venda_id int,
    in ai_quantidade int
) begin
insert into 
  db_teste.item_venda (produto_id,venda_id,quantidade)
values (ai_produto_id,  ai_venda_id, ai_quantidade);
end;
call db_teste.add_item_venda (1, 1, 2);
call db_teste.add_item_venda (2, 2, 3);
select * from db_teste.item_venda;

create procedure if not exists db_teste.mostrar_vendas_de_um_cliente(
    IN aux_cliente_id INT
)
begin
    select
        V.id as id_venda,
        C.nome as nome_cliente,
        V.data_venda,
        IV.quantidade,
        P.nome as nome_produto,
        P.preco_unitario
    from db_teste.Vendas as V
    inner join
        db_teste.clientes as C ON V.cliente_id = C.id
    inner join
        db_teste.item_venda as IV ON V.id = IV.venda_id
    inner join
        db_teste.produtos as P ON IV.produto_id = P.id
    where
        V.cliente_id = aux_cliente_id
    order by
        V.data_venda desc;

end;

call db_teste.mostrar_vendas_de_um_cliente(1);

create procedure if not exists db_teste.atualizar_preco_produto (
    in aux_id INT,
    in novo_valor DECIMAL(10, 2)
)
begin
    update produtos
    set
        preco = novo_valor
    where
        id_produto = aux_id;
end;

call db_teste.atualizar_preco_produto(1, 59.90);

create procedure if not existsdb_teste.deleta_item_venda (
    in aux_id int
)
begin
    delete from Item_Venda
    where id_item = aux_id;
end;

call db_teste.deleta_item_venda(1);

create view if not exists db_teste.relatorio_total_vendas as 
 select sum (c.valor_total) as soma_valor_total_vendas
   from db_teste.compras c;

create view if not exists db_teste.total_clientes_unicos_que_compraram as 
 select count(distinct c.id_cliente) as total_clientes_unicos_que_compraram
   from db_teste.compras c;

select * from db_teste.total_clientes_unicos_que_compraram;