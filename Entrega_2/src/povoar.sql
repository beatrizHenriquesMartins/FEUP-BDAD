INSERT INTO Pessoa (nif, nome, morada, telefone, email, dataNasc, banco, numConta, codPostal)
VALUES (505653320,'Margarida','Rua de Santa Catarina 1220', 916325348, 'margarida@gmail.com', '26/11/1965', 'Santander', 46325, 4002),
(505653331,'Joana','Avenida Leão Iberico 25', 962564521, joanabosques@sapo.pt, '17/5/1989', 'Santander', 52454, 5012),
(452654568,'Artur','Rua Afonso Teicheira 61-1A', 912454321, 'gentlefox@gmail.com', '20/2/1985', 'Caixa', 6642, 4002),
(856877561,'João','Rua Afonso Otávio 991-1A', 957632452, 'joaoafonso@gmail.com', '18/2/1998', 'Caixa', 6642, 4002);

INSERT INTO Cliente (nif, nomeEmpresa)
VALUES (505653320,'Empresa de Madeiras do Norte'),
(452654568,'Empresa de Madeiras do Sul');

INSERT INTO Funcionario (nif, cargo, ordenado, agregadoFamiliar, horario, idEstabelecimento, nomeEspecializacao)
VALUES (856877561,'Gerente',20000,3,'8:00-17:00',123,'Administração'),
(505653331,'Carpinteiro',15000,2,'8:00-14:00',123,'Carpintaria');

INSERT INTO Especializacao (Nome)
VALUES ('Administração'),
('Marcenaria'),
('Carpintaria'),
('Madeiras'),
('Vidraria');

INSERT INTO Produto (id, nome, preco, dimensao, cor, idVenda)
VALUES (111,'Armário Almero Pequeno',300,'1x1','Branco',441),
(112,'Armário Almero Medio',350,'1x2','Branco',442),
(121,'Gavetas Branstrum P',500,'3x1','Azul',443),
(123,'Gavetas Branstrum XL',600,'3x3','Azul',443),
(124,'Gavetas Branstrum L',600,'3x3','Azul',443),
(125,'Gavetas Branstrum M',600,'3x3','Azul',443);

INSERT INTO Estabelecimento (id, morada, telefone, email, tipo, nomeEmpresa, codPostal)
VALUES (221,'Rua Mendoca, 41',888777555,'xyz@oi.com.br','Loja','NossaEmpresa',4000),
(223,'Rua Fernandes, 31',222777555,'ola@oi.com.br','Fábrica','NossaEmpresa',4005),
(224,'Rua Fernandes, 33',222777556,'ola2@oi.com.br','Loja','NossaEmpresa',4005);

INSERT INTO Fabrica (idEstabelecimento)
VALUES (223);

INSERT INTO Loja (idEstabelecimento)
VALUES (204),
(224);

INSERT INTO Empresa (nif, nome, morada, telefone, email)
VALUES (125478932,'NossaEmpresa','Rua da Sede n90', 555666888, 'contato@nossaempresa.com');

INSERT INTO Material(idMaterial, nome, tipo, quantidade, preco, cor)
VALUES (331,'Basalto Acor','Pedra',400,10,'Negro'),
(332,'Basalto Madeira','Pedra',150,12,'Negro'),
(333,'Basalto Guimaraes','Pedra',50,12,'Negro'),
(241,'Pinho Braga','Madeira',600,25,'Pinho Escuro');

INSERT INTO Fornecedor (nif, nome, morada, telefone, email, codPostal)
VALUES (664253100,'Madeiras e Minerios lda','Rua Ancelmo Margarida 2',294564115,'admin@madmin.com',6420),
(664253120,'Lenha Continental Joao e Filhos lda','Rua Transilenia 42',294222465,'lenhajoaoefilhos@gmail.com',9500);

-- usar os códigos postais que já foram inseridos nas relações acima
INSERT INTO Localidade (CodPostal, Localidade)
VALUES (4002,'Almerias, Porto'),
(5012,'Tomezios, Porto'),
(4000,'Almerias, Porto'),
(4005,'Almerias, Porto'),
(6420,'Ambrosios, Coimbra'),
(9500,'Altrufeira, Ponta Delgada'),
(7353,'Jezuim, Madeira');

INSERT INTO Venda(idVenda, Quantia, DataVenda, idCliente, idEstabelecimento)
VALUES (441,300,'20/03/2018',505653320,204),
(442,1000,'21/03/2018',505653320,204),
(443,1000,'21/03/2018',452654568,204),
(444,1000,'21/03/2018',452654568,204),
(445,100,'22/03/2018',505653320,204);

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
VALUES (993,'Nome do Banco',55632,'4%'),
(994,'Nome do Banco',55682,'3%');

INSERT INTO Dinheiro (idPagamento)
VALUES (995);

INSERT INTO Material-Produto (idMaterial, idProduto, quantidadeNecessaria)
VALUES (33232,22221,'3m'),
(33232,22221,'5m');

INSERT INTO Material-Forcedor (idMaterial, nomeFornecedor)
VALUES (11111,'Empresa Fornecedora 1'),
(11112,'Empresa Fornecedora 2');

INSERT INTO Material-Fabrica (idMaterial, idEstabelecimento)
VALUES (11111,223),
(11112,223);

INSERT INTO Fornecedor-Fabrica (nomeFornecedor, idEstabelecimento)
VALUES ('Empresa Fornecedora 1', 223),
('Empresa Fornecedora 2', 223);

INSERT INTO Loja-Fabrica (idEstabelecimento, idEstabelecimento)
VALUES (224, 223);

INSERT INTO Produto-Estabelecimento (idProduto, idEstabelecimento)
VALUES (22221, 224);

INSERT INTO Produto-Especialização (idProduto, nomeEspecialização)
VALUES (22221, 'Marcenaria'), (22221, 'Madeiras');
