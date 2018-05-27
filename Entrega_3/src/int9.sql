.mode columns 

.headers on 

.nullvalue NULL

SELECT DISTINCT NomeCliente, nomeFuncionario FROM (SELECT nome AS NomeCliente, funcionario_id AS id FROM (SELECT DISTINCT cliente_id, funcionario_id FROM venda) AS A INNER JOIN pessoa ON A.cliente_id=pessoa.nif) AS A JOIN (SELECT nome AS nomeFuncionario, funcionario_id AS id FROM (SELECT funcionario_id FROM venda) AS A INNER JOIN pessoa ON A.funcionario_id=pessoa.nif) AS B ON A.id = B.id;