.headers off
select ('
        
        Tabela Venda ORIGINAL
        _____________________
        
        ');
.headers on

select * from venda;

.headers off
select ('
        
        Comando: Adicionar 2 unidades do produto 121 à venda cujo id = 445.
        
        Resultado esperado: Atualizar quantia da tabela Venda, somando o valor de 1000 (2*Preço unitário)
        _________________________________________________________________________________________________
        
        ');
.headers on

insert into venda_produto values(445, 121, 2);


select * from venda;

