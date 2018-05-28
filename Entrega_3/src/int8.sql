.mode columns 

.headers on 

.nullvalue NULL

CREATE VIEW qntdMaterial AS SELECT material_id, sum(quantidadeNecessaria) AS total FROM (SELECT * FROM material_produto AS A JOIN venda_produto AS B ON A.produto_id=B.produto_id)  GROUP BY material_id;

SELECT nome FROM (SELECT material_id, max(total) FROM qntdMaterial) AS A INNER JOIN material ON A.material_id=material.id;