create database if not exists db_ecommerce;
 
create table if not exists db_ecommerce.clientes(
    id int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) unique not null
);
 
create table if not exists db_ecommerce.compras(
    id int auto_increment primary key,
    id_cliente int not null,
    valor_total decimal(10, 2) not null,
    data_compra date not null,
    foreign key (id_cliente) references db_ecommerce.clientes(id)
);
 
create procedure if not exists db_ecommerce.add_clientes(ac_nome varchar(100), ac_email varchar(100))
    begin
        insert into db_ecommerce.clientes(nome, email)
            values(ac_nome, ac_email);
    end;
 
call db_ecommerce.add_clientes('Roberto', 'roberto@exemplo.com');
call db_ecommerce.add_clientes('Michael', 'michael@exemplo.com');
 
select * from db_ecommerce.clientes;
 
create procedure if not exists db_ecommerce.add_compras(ac_id_cliente int, ac_valor_total decimal(10, 2), ac_data_compra date)
    begin
        insert into db_ecommerce.compras(id_cliente, valor_total, data_compra)
            values(ac_id_cliente, ac_valor_total, ac_data_compra);
    end;
 
call db_ecommerce.add_compras(1, 999.99, '2025-08-25');
call db_ecommerce.add_compras(1, 500.50, '2025-08-26');

call db_ecommerce.add_compras(2, 600.48, '2025-08-25');
call db_ecommerce.add_compras(2, 300.99, '2025-08-26');
 
select * from db_ecommerce.compras;

create view if not exists db_ecommerce.relatorio_total_vendas as 
 select sum (c.valor_total) as soma_valor_total_vendas
   from db_ecommerce.compras c;

select * from db_ecommerce.relatorio_total_vendas;

create view if not exists db_ecommerce.total_clientes_unicos_que_compraram as 
 select count(distinct c.id_cliente) as total_clientes_unicos_que_compraram
   from db_ecommerce.compras c;

select * from db_ecommerce.total_clientes_unicos_que_compraram;

create view if not exists db_ecommerce.valor_media_compras as
  select AVG(c.valor_total) as media_compras
   from db_ecommerce.compras c ;

select * from db_ecommerce.valor_media_compras;

create view if not exists db_ecommerce.qtd_de_compras_mes_ano as
    select count(c.id_compras) as compra_mes
        from db_ecommerce.compras c
            where date_format(c.data_compra, '%Y-%m') = '2025-08';

select * from db_ecommerce.qtd_de_compras_mes_ano;

 drop database db_ecommerce;

