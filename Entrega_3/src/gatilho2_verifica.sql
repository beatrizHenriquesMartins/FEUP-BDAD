.headers off
select ('
        
        Tabela Venda_Produto ORIGINAL
        _____________________________
        
        ');
.headers on

select * from venda_produto;

.headers off
select ('
        
        Comando: Adicionar 8 unidades do produto 111 à venda cujo id = 444.
        
        Resultado esperado: Erro, pois não existe material em stock suficiente para essa venda.
        _______________________________________________________________________________________
        
        ');
.headers on

insert into venda_produto(venda_id, produto_id, quantidade) values(444, 111, 8);

.headers off
select ('
        
        Resultado esperado: Tabela Venda_Produto sem alterações.
        ________________________________________________________
        
        ');
.headers on

select * from venda_produto;