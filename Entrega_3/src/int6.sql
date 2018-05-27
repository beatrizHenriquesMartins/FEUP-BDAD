.mode columns 

.headers on 

.nullvalue NULL

SELECT nome FROM (SELECT funcionario_id, max(quantia) AS maxQuantia FROM venda) AS A INNER JOIN pessoa ON A.funcionario_id = pessoa.nif;