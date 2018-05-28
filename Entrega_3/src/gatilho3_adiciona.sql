CREATE VIEW IF NOT EXISTS venda_valorTotal AS 
SELECT venda_id, produto_id, quantidade, preco AS precoUnitario, SUM(preco*quantidade) AS valorTotal 
FROM venda_produto AS vp JOIN produto AS p ON vp.produto_id=p.id 
GROUP BY venda_id;

CREATE TRIGGER if not exists atualizaValorTotal 
AFTER INSERT ON venda_produto 
FOR EACH ROW
BEGIN 
  UPDATE Venda SET quantia = (SELECT valorTotal FROM venda_valorTotal as vt WHERE vt.venda_id = NEW.venda_id) WHERE Venda.id = NEW.venda_id;
END;