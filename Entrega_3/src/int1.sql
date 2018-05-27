.mode columns 

.headers on 

.nullvalue NULL

SELECT tipo, count(*) AS quantidade FROM pagamento GROUP BY tipo;