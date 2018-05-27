.mode columns
.headers on
.nullvalue NULL

-- Qual o valor total dos pagamentos pendentes?
SELECT sum(quantia) AS ValorTotal FROM pagamento where efetuado='n';
