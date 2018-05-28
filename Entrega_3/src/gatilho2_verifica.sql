.headers off
SELECT ('
        
        Tabela Venda_Produto ORIGINAL
        _____________________________
        
        ');
.headers on

SELECT * FROM venda_produto;

.headers off
SELECT ('
        
        Comando: Adicionar 8 unidades do produto 111 à venda cujo id = 444.
        
        Resultado esperado: Erro, pois não existe material em stock suficiente para essa venda.
        _______________________________________________________________________________________
        
        ');
.headers on

INSERT INTO venda_produto(venda_id, produto_id, quantidade) VALUES(444, 111, 8);

.headers off
SELECT ('
        
        Resultado esperado: Tabela Venda_Produto sem alterações.
        ________________________________________________________
        
        ');
.headers on

SELECT * FROM venda_produto;