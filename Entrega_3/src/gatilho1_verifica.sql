.headers off
select ('
        
        Tabela Produto ORIGINAL
        _______________________
        
        ');
.headers on

select * from produto;


.headers off
select ('
        
        Comando: Adicionar 1 unidade do produto 111 à venda cujo id = 445.
        
        Resultado esperado: Atualizar quantidadeVendida da tabela Produto, incrementando o valor em +1.
        _______________________________________________________________________________________________
        
        ');
.headers on
insert into venda_produto values(445, 111, 1);
select * from produto;

