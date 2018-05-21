INSERT INTO Especializacao (Nome)
VALUES ('Administração'),
       ('Marcenaria'),
       ('Carpintaria'),
       ('Madeiras'),
       ('Vidraria'),
       ('Gerente');

INSERT INTO Localidade (codPostal, localidade)
VALUES (4002, 'Almerias, Porto'),
       (5012, 'Tomezios, Porto'),
       (4000, 'Almerias, Porto'),
       (4005, 'Almerias, Porto'),
       (6420, 'Ambrosios, Coimbra'),
       (9500, 'Altrufeira, Ponta Delgada'),
       (7353, 'Jezuim, Madeira');

INSERT INTO Material(idMaterial, nome, tipo, quantidade, preco, cor)
VALUES (331,'Basalto Acor','Pedra',400,10,'Negro'),
       (332,'Basalto Madeira','Pedra',150,12,'Negro'),
       (333,'Basalto Guimaraes','Pedra',50,12,'Negro'),
       (241,'Pinho Braga','Madeira',600,25,'Pinho Escuro');

INSERT INTO Pessoa (nifPessoa, nome, morada, telefone, email, dataNasc, banco, numConta, codPostal)
VALUES (505653320, 'Margarida','Rua de Santa Catarina 1220', 916325348, 'margarida@gmail.com', '26/11/1965', 'Santander', 46325, 4002),
       (505653331, 'Joana','Avenida Leão Iberico 25', 962564521, 'joanabosques@sapo.pt', '17/5/1989', 'Santander', 52454, 5012),
       (452654568, 'Artur','Rua Afonso Teicheira 61-1A', 912454321, 'gentlefox@gmail.com', '20/2/1985', 'Caixa', 6642, 4002),
       (856877561, 'João','Rua Afonso Otávio 991-1A', 957632452, 'joaoafonso@gmail.com', '18/2/1998', 'Caixa', 6642, 4002);

INSERT INTO Empresa (nifEmpresa, nome, morada, telefone, email)
VALUES (125478932,'NossaEmpresa','Rua da Sede n90', 555666888, 'contato@nossaempresa.com'),
       (125478933,'NossaEmpresa2','Rua da Sede n92', 555666882, 'contato@nossaempresa2.com');

INSERT INTO Cliente (nifCliente, nifEmpresa)
VALUES (505653320, 125478932),
       (452654568, 125478933);

INSERT INTO Estabelecimento (idEstabelecimento, morada, codPostal, telefone, tipo, email, nifEmpresa)
VALUES (223,'Rua Fernandes, 31', 4005, 222777555, 'Fábrica', 'ola@oi.com.br', 125478932),
       (224,'Rua Fernandes, 33', 4005, 222777556, 'Loja', 'ola2@oi.com.br', 125478933),
       (225, 'Rua do Padre, 55', 6420, 229383011, 'Fábrica', 'fabrica2@hotmail.com', 125478933);

INSERT INTO Funcionario (nifFuncionario, idEstabelecimento, cargo, ordenado, agregadoFamiliar, horario, nomeEspecializacao)
VALUES (856877561, 224, 'Gerente', 20000, 3, '8:00-17:00', 'Administração'),
       (505653331, 223, 'Carpinteiro', 15000, 2, '8:00-14:00', 'Carpintaria');

INSERT INTO Fabrica (idFabrica)
VALUES (223),
       (225);

INSERT INTO Loja (idEstabelecimento)
VALUES (224);

INSERT INTO Venda(idVenda, Quantia, DataVenda, idCliente, idEstabelecimento)
VALUES (441, 300, '20/03/2018', 505653320, 224),
       (442, 1000, '21/03/2018', 505653320, 224),
       (443, 1000, '21/03/2018', 452654568, 224),
       (444, 1000, '21/03/2018', 452654568, 224),
       (445, 100, '22/03/2018', 505653320, 224);

INSERT INTO Produto (idProduto, nome, preco, dimensao, cor, idVenda)
VALUES (111,'Armário Almero Pequeno',300,'1x1','Branco',441),
       (112,'Armário Almero Medio',350,'1x2','Branco',442),
       (121,'Gavetas Branstrum P',500,'3x1','Azul',443),
       (123,'Gavetas Branstrum XL',600,'3x3','Azul',443),
       (124,'Gavetas Branstrum L',600,'3x3','Azul',443),
       (125,'Gavetas Branstrum M',600,'3x3','Azul',443);

INSERT INTO Pagamento (idPagamento, idVenda, quantia, tipo, efetuado, dataPagamento) 
VALUES (991,441,300,'cheque','sim','20/03/2018'),
       (992,442,1000,'cheque','sim','21/03/2018'),
       (993,443,1000,'cartao','sim','21/03/2018'),
       (994,444,1000,'cartao','sim','21/03/2018'),
       (995,445,100,'dinheiro','sim','22/03/2018');

INSERT INTO Cheque (idPagamento, banco, depositado, dataDeposito)
VALUES (991,'Nome do Banco','Sim','22/03/2018'),
       (992,'Nome do Banco','Sim','22/03/2018');

INSERT INTO Cartao (idPagamento, banco, numConta, taxa)
VALUES (993,'Nome do Banco',55632,'0.04'),
       (994,'Nome do Banco',55682,'0.03');

INSERT INTO Dinheiro (idPagamento)
VALUES (995);

INSERT INTO Fornecedor (nif, nome, morada, telefone, email, codPostal)
VALUES (664253100,'Madeiras e Minerios lda','Rua Ancelmo Margarida 2',294564115,'admin@madmin.com',6420),
       (664253120,'Lenha Continental Joao e Filhos lda','Rua Transilenia 42',294222465,'lenhajoaoefilhos@gmail.com',9500);

INSERT INTO Material_Produto (idMaterial, idProduto, quantidadeNecessaria)
VALUES (331, 111, '3m'),
       (241, 121, '5m');

INSERT INTO Material_Fornecedor (idMaterial, idFornecedor)
VALUES (331, 664253100),
       (241, 664253120);

INSERT INTO Material_Fabrica (idMaterial, idEstabelecimento)
VALUES (331,223),
       (241,223);

INSERT INTO Fornecedor_Fabrica (idFornecedor, idEstabelecimento)
VALUES (664253100, 223),
       (664253120, 225);

INSERT INTO Loja_Fabrica (idLoja, idFabrica)
VALUES (224, 223);

INSERT INTO Estabelecimento_Produto (idEstabelecimento, idProduto)
VALUES (224, 111);

INSERT INTO Produto_Especializacao (idProduto, nomeEspecializacao)
VALUES (112, 'Marcenaria'), 
       (121, 'Carpintaria');