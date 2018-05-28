CREATE TRIGGER IF NOT EXISTS checaMaterial 
BEFORE INSERT ON Venda_Produto 
FOR EACH ROW
BEGIN 
SELECT CASE 
WHEN ((SELECT COUNT(*) FROM 
	 Venda, Venda_Produto, Material_Produto, Material
	 WHERE Venda.id = Venda_Produto.venda_id
	 AND Venda_Produto.produto_id = Material_Produto.produto_id
	 AND Material.id = Material_Produto.material_id
       
	 AND Venda.id = NEW.venda_id
	 AND Material.quantidade >= NEW.quantidade * (SELECT quantidadeNecessaria FROM Material_Produto WHERE Material_Produto.produto_id = NEW.produto_id)) = 0) 
THEN RAISE(abort, 'Quantidade de material insuficiente em stock. Ação não realizada.')
END; 
END;
