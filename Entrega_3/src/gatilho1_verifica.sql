.headers off
SELECT ('
        
        Tabela Produto ORIGINAL
        _______________________
        
        ');
.headers on

SELECT * FROM produto;


.headers off
SELECT ('
        
        Comando: Adicionar 1 unidade do produto 111 à venda cujo id = 445.
        
        Resultado esperado: Atualizar quantidadeVendida da tabela Produto, incrementando o valor em +1.
        _______________________________________________________________________________________________
        
        ');
.headers on
INSERT INTO venda_produto(venda_id, produto_id, quantidade) VALUES(445, 111, 1);
SELECT * FROM produto;

