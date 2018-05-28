.mode columns 

.headers on 

.nullvalue NULL

CREATE VIEW produto_valorVenda AS SELECT venda_id, produto_id, quantia FROM venda_produto JOIN venda ON venda_produto.venda_id=venda.id ORDER BY quantia DESC;

SELECT DISTINCT nome FROM (SELECT * FROM produto_valorVenda WHERE quantia >= 800) INNER JOIN produto ON produto_id=id;