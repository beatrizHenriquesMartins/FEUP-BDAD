.mode columns
.headers on
.nullvalue NULL

-- Quais os compradores do produto mais caro da empresa? E qual o valor desse produto?
CREATE VIEW info_venda AS 
SELECT venda_id, cliente_id, funcionario_id, produto_id, nome, qtd, preco
FROM (
    SELECT venda_id, cliente_id, funcionario_id, produto_id, quantidade AS qtd
    FROM venda_produto 
    LEFT OUTER JOIN venda ON venda_produto.venda_id= venda.id
    ) AS A 
LEFT OUTER JOIN 
produto 
ON A.produto_id = produto.id;

SELECT nome, preco 
FROM (
    SELECT cliente_id, max(preco) AS preco 
    FROM info_venda
    ) AS A 
INNER JOIN 
pessoa 
ON cliente_id=nif;
