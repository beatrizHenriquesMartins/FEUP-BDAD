.mode columns
.headers on
.nullvalue NULL

-- Qual especialidade que é mais utilizada na confecção dos produtos?
SELECT nome, max(numVezes) FROM (
	SELECT nome, count(nome) AS numVezes 
	FROM (
		SELECT produto_id, especializacao_id, nome
		FROM produto_especializacao LEFT OUTER JOIN especializacao ON produto_especializacao.especializacao_id = especializacao.id
		) 
	GROUP BY nome);
