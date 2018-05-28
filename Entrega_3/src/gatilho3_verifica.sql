.headers off
select ('
        
        Tabela Venda ORIGINAL
        _____________________
        
        ');
.headers on

SELECT * FROM venda;

.headers off
select ('
        
        Comando: Adicionar 2 unidades do produto 121 à venda cujo id = 445.
        
        Resultado esperado: Atualizar quantia da tabela Venda, somando o valor de 1000 (2*Preço unitário)
        _________________________________________________________________________________________________
        
        ');
.headers on

INSERT INTO venda_produto(venda_id, produto_id, quantidade) VALUES(445, 121, 2);


SELECT * FROM venda;

