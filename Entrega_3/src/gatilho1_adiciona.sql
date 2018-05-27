CREATE TRIGGER atualizaQntdVendida 
AFTER INSERT ON venda_produto 
FOR EACH ROW
BEGIN 
  UPDATE Produto SET quantidadeVendida = quantidadeVendida + NEW.quantidade WHERE Produto.id = NEW.produto_id;
END;