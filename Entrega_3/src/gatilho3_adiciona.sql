create view if not exists venda_valorTotal as select venda_id, produto_id, quantidade, preco as precoUnitario, sum(preco*quantidade) as valorTotal from venda_produto as vp join produto as p on vp.produto_id=p.id group by venda_id;

CREATE TRIGGER if not exists atualizaValorTotal 
AFTER INSERT ON venda_produto 
FOR EACH ROW
BEGIN 
  UPDATE Venda SET quantia = (SELECT valorTotal FROM venda_valorTotal as vt WHERE vt.venda_id = NEW.venda_id) WHERE Venda.id = NEW.venda_id;
END;