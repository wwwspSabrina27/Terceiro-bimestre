create procedure db_prova.mostrar_vendas_de_um_cliente(
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
    from Vendas as V
    inner join
        Clientes as C ON V.cliente_id = C.id
    inner join
        Item_Venda as IV ON V.id = IV.venda_id
    inner join
        Produto as P ON IV.produto_id = P.id
    where
        V.cliente_id = aux_cliente_id
    order by
        V.data_venda desc;

end;

call db_prova.mostrar_vendas_de_um_cliente(1);