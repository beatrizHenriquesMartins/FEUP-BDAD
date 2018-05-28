.mode columns 

.headers on 

.nullvalue NULL

SELECT sum(quantia) AS ValorTotal FROM pagamento where efetuado='n';