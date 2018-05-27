.mode columns
.headers on
.nullvalue NULL

-- Qual o nome do funcionário que realizou a venda de valor mais alto?
SELECT nome 
FROM (
    SELECT funcionario_id, max(quantia) AS maxQuantia 
    FROM venda
    ) AS A 
INNER JOIN 
pessoa
ON A.funcionario_id = pessoa.nif;
