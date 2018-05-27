.mode columns
.headers on
.nullvalue NULL

-- Quantos pagamentos foram realizados em dinheiro/cheque/cartao?

SELECT tipo, count(*) AS quantidade FROM pagamento GROUP BY tipo;
