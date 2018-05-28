PRAGMA foreign_keys = ON;

INSERT INTO Especializacao (id, nome)
VALUES (1, 'Administração'),
       (2, 'Marcenaria'),
       (3, 'Carpintaria'),
       (4, 'Vidraria'),
       (5, 'Gerente');

INSERT INTO Localidade (codPostal, localidade)
VALUES (4002, 'Almerias, Porto'),
       (5012, 'Tomezios, Porto'),
       (4000, 'Almerias, Porto'),
       (4005, 'Almerias, Porto'),
       (6420, 'Ambrosios, Coimbra'),
       (9500, 'Altrufeira, Ponta Delgada'),
       (7353, 'Jezuim, Madeira');

INSERT INTO Material(id, nome, tipo, quantidade, preco, cor)
VALUES (331,'Basalto Acor','Pedra',400,10,'Negro'),
       (332,'Basalto Madeira','Pedra',150,12,'Negro'),
       (333,'Basalto Guimaraes','Pedra',50,12,'Negro'),
       (241,'Pinho Braga','Madeira',600,25,'Pinho Escuro'),
       (242,'Cedro','Madeira',600,25,'Claro');      

INSERT INTO Pessoa (nif, nome, morada, telefone, email, dataNasc, idade, banco, numConta, codPostal)
VALUES (505653320, 'Margarida','Rua de Santa Catarina 1220', 916325348, 'margarida@gmail.com', '1965-11-22', 52, 'Santander', 46325, 4002),
       (505653331, 'Joana','Avenida Leão Iberico 25', 962564521, 'joanabosques@sapo.pt', '1989-05-19', 29, 'Santander', 52454, 5012),
       (452654568, 'Artur','Rua Afonso Teicheira 61-1A', 912454321, 'gentlefox@gmail.com', '1985-02-20', 33, 'Caixa', 6642, 4002),
       (856877561, 'João','Rua Afonso Otávio 991-1A', 957632452, 'joaoafonso@gmail.com', '1989-03-15', 29, 'Caixa', 6642, 4002);

INSERT INTO Empresa (nif, nome, morada, telefone, email, empresa_codPostal)
VALUES (125478932,'Nossa Empresa','Rua da Sede n90', 555666888, 'contato@nossaempresa.com', 4002),
       (125478933,'Empresa Outra','Rua da Empresa n92', 555666882, 'contato@empresaoutra.com', 4005);

INSERT INTO Cliente (cliente_nif, empresa_nif)
VALUES (505653320, 125478932),
       (452654568, 125478932);

INSERT INTO Estabelecimento (id, morada, telefone, tipo, email, empresa_nif, estabelecimento_codPostal)
VALUES (223,'Rua Fernandes, 31', 222777555, 'Fábrica', 'ola@oi.com.br', 125478932, 4005),
       (224,'Rua Fernandes, 33', 222777556, 'Loja', 'ola2@oi.com.br', 125478933, 4005),
       (225, 'Rua do Padre, 55', 229383011, 'Fábrica', 'fabrica2@hotmail.com', 125478933, 6420);

INSERT INTO Funcionario (funcionario_nif, cargo, ordenado, agregadoFamiliar, horario, especializacao_id, estabelecimento_id)
VALUES (856877561, 'Gerente', 20000, 3, '8:00-17:00', 1, 224),
       (505653331, 'Carpinteiro', 15000, 2, '8:00-14:00', 3, 223);

INSERT INTO Fabrica (fabrica_id)
VALUES (223),
       (225);

INSERT INTO Loja (loja_id)
VALUES (224);

INSERT INTO Venda(id, Quantia, DataVenda, cliente_id, funcionario_id, estabelecimento_id)
VALUES (441, 300, '20/03/2018', 505653320, 856877561, 224),
       (442, 1000, '21/03/2018', 505653320, 856877561, 224),
       (443, 1300, '21/03/2018', 452654568, 856877561, 224),
       (444, 1000, '21/03/2018', 452654568, 856877561, 224),
       (445, 200, '22/03/2018', 505653320, 856877561, 224);

INSERT INTO Produto (id, nome, preco, dimensao, cor, quantidadeVendida)
VALUES (111,'Armário Almero Pequeno',300,'1x1','Branco', 2),
       (112,'Armário Almero Medio',200,'1x2','Branco', 2),
       (121,'Gavetas Branstrum P',500,'3x1','Azul', 3),
       (123,'Gavetas Branstrum XL',600,'3x3','Azul', 1),
       (124,'Gavetas Branstrum L',700,'3x3','Azul', 1),
       (125,'Gavetas Branstrum M',600,'3x3','Azul', 0);

INSERT INTO Venda_Produto (venda_id, produto_id, quantidade)
VALUES (441, 111, 2),
       (442, 112, 1),
       (442, 121, 1),
       (443, 123, 1),
       (443, 124, 1),
       (444, 121, 2),
       (445, 112, 1);
       
INSERT INTO Pagamento (id, quantia, tipo, efetuado, dataPagamento, venda_id) 
VALUES (991,300,'cheque','s','20/03/2018',441),
       (992,1000,'cheque','n','21/03/2018',442),
       (993,1000,'cartao','s','21/03/2018',443),
       (994,1000,'cartao','n','21/03/2018',444),
       (995,100,'dinheiro','s','22/03/2018',445);

INSERT INTO Cheque (pagamento_id, banco, depositado, dataDeposito)
VALUES (991,'Nome do Banco','Sim','22/03/2018'),
       (992,'Nome do Banco','Sim','22/03/2018');

INSERT INTO Cartao (pagamento_id, banco, numConta, taxa)
VALUES (993,'Nome do Banco',55632,'0.04'),
       (994,'Nome do Banco',55682,'0.03');

INSERT INTO Dinheiro (pagamento_id)
VALUES (995);

INSERT INTO Fornecedor (nif, nome, morada, telefone, email, fornecedor_codPostal)
VALUES (664253100,'Madeiras e Minerios lda','Rua Ancelmo Margarida 2',294564115,'admin@madmin.com',6420),
       (664253120,'Lenha Continental Joao e Filhos lda','Rua Transilenia 42',294222465,'lenhajoaoefilhos@gmail.com',9500);

INSERT INTO Material_Produto (material_id, produto_id, quantidadeNecessaria)
VALUES (241, 111, 100),
       (241, 112, 200),
       (241, 121, 200),
       (242, 123, 100),
       (242, 124, 100),
       (241, 125, 100);

INSERT INTO Material_Fornecedor (material_id, fornecedor_id)
VALUES (331, 664253100),
       (241, 664253120);

INSERT INTO Material_Fabrica (material_id, estabelecimento_id)
VALUES (331,223),
       (241,223);

INSERT INTO Fornecedor_Fabrica (fornecedor_id, estabelecimento_id)
VALUES (664253100, 223),
       (664253120, 225);

INSERT INTO Loja_Fabrica (loja_id, fabrica_id)
VALUES (224, 223);

INSERT INTO Estabelecimento_Produto (estabelecimento_id, produto_id)
VALUES (224, 111);

INSERT INTO Produto_Especializacao (produto_id, especializacao_id)
VALUES (111,2),
       (111,4),
       (112,2),
       (112,3),
       (121,2),
       (121,3),
       (123,2),
       (123,3),
       (124,2),
       (124,3),
       (125,2),
       (125,4);
       