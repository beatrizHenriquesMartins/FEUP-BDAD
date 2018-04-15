DROP TABLE if exists Especializacao;
DROP TABLE if exists localidade;
DROP TABLE if exists Pessoa;
DROP TABLE if exists Empresa;
DROP TABLE if exists Cliente;
DROP TABLE if exists Estabelecimento;
DROP TABLE if exists Fabrica;
DROP TABLE if exists Loja;
DROP TABLE if exists Venda;
DROP TABLE if exists Produto;
DROP TABLE if exists Pagamento;
DROP TABLE if exists Cheque;
DROP TABLE if exists Cartao;
DROP TABLE if exists Dinheiro;
DROP TABLE if exists Funcionario;
DROP TABLE if exists Material;
DROP TABLE if exists Fornecedor;
DROP TABLE if exists Material_Produto;
DROP TABLE if exists Material_Fornecedor;
DROP TABLE if exists Material_Fabrica;
DROP TABLE if exists Fornecedor_Fabrica;
DROP TABLE if exists Loja_Fabrica;
DROP TABLE if exists Produto_Estabelecimento;
DROP TABLE if exists Produto_Especializacao;

-- "nome" não pode ser nulo e deve ser único.
CREATE TABLE Especializacao (
    nome text NOT NULL UNIQUE,
    PRIMARY KEY (nome),
);

-- "Código postal" e "localidade" não podem ser nulos e devem ser únicos.
CREATE TABLE Localidade (
    codPostal int NOT NULL UNIQUE,
    localidade text NOT NULL UNIQUE,
    PRIMARY KEY (codPostal)
);

-- O "nif" deve ser único e não nulo. O "nome" não deve ser nulo.
CREATE TABLE Pessoa (
    nif int NOT NULL UNIQUE,
    nome text NOT NULL, 
    morada text, 
    codPostal int, 
    telefone text, 
    email text, 
    dataNasc date,  
    banco text, 
    numConta int, 
    PRIMARY KEY (nif),
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

-- O "nif" deve ser único e não nulo. O "nome" não deve ser nulo.
CREATE TABLE Empresa (
    nif int NOT NULL UNIQUE, 
    nome text NOT NULL,
    morada text,
    codPostal int,
    telefone text, 
    email text, 
    PRIMARY KEY (nif),
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

-- O "nif" deve ser único e não nulo. O "nome" não deve ser nulo.
CREATE TABLE Cliente (
    nif int,
    nomeEmpresa text,
    PRIMARY KEY (nif),
    FOREIGN KEY (nif) REFERENCES Pessoa(nif),
    FOREIGN KEY (nomeEmpresa) REFERENCES Empresa(nome)
);


CREATE TABLE Estabelecimento (
    idEstabelecimento int NOT NULL UNIQUE,
    morada text NOT NULL, 
    codPostal int NOT NULL,
    telefone text, 
    tipo text NOT NULL,
    email text, 
    nomeEmpresa text,
    PRIMARY KEY (idEstabelecimento),
    FOREIGN KEY (nomeEmpresa) REFERENCES Empresa(nome),
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Fabrica (
    idEstabelecimento int,
    PRIMARY KEY (idEstabelecimento),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento)
);

CREATE TABLE Loja (
    idEstabelecimento int,
    PRIMARY KEY (idEstabelecimento),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento)
);

CREATE TABLE Venda (
    idVenda int NOT NULL UNIQUE,
    quantia float NOT NULL,
    dataVenda date NOT NULL,
    idCliente int,
    idEstabelecimento int, 
    PRIMARY KEY (idVenda),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEstabelecimento) REFERENCES Loja(idEstabelecimento),
);

CREATE TABLE Produto (
    idProduto int NOT NULL UNIQUE,
    nome text NOT NULL, 
    preco float NOT NULL, 
    dimensao text,
    cor text,
    idVenda int,
    PRIMARY KEY (idProduto),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
);

CREATE TABLE Pagamento (
    idPagamento int NOT NULL UNIQUE,
    idVenda int NOT NULL,
    quantia float NOT NULL,
    tipo text NOT NULL,
    efetuado text NOT NULL,
    dataPagamento date NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
);

CREATE TABLE Cheque (
    idPagamento int NOT NULL,
    banco text NOT NULL,
    depositado text NOT NULL,
    dataDeposito date NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Cartao (
    idPagamento int NOT NULL,
    banco text NOT NULL,
    numConta int NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Dinheiro (
    idPagamento int NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Funcionario (
    nif int,
    idEstabelecimento int,
    cargo text NOT NULL,
    ordenado float NOT NULL, 
    agregadoFamiliar int NOT NULL, 
    horario text NOT NULL, 
    PRIMARY KEY (nif),                                            #DUVIDA!! 
    FOREIGN KEY (nif) REFERENCES Pessoa(nif),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento)
);

CREATE TABLE Material (
    idMaterial int NOT NULL UNIQUE,
    nome text NOT NULL,
    tipo text NOT NULL,
    estoque float NOT NULL,
    preco float,
    cor text,
    PRIMARY KEY (idMaterial)
);

CREATE TABLE Fornecedor (
    idFornecedor int NOT NULL UNIQUE,
    nome text NOT NULL UNIQUE,
    morada text,
    codPostal int,
    nif int NOT NULL UNIQUE, 
    telefone text, 
    email text, 
    PRIMARY KEY (idFornecedor),
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Material_Produto (
    idMaterial int NOT NULL,
    idProduto int NOT NULL,
    quantidadeNecessaria text NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idMaterial, idProduto),
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Material_Fornecedor (
    idMaterial text NOT NULL,
    idFornecedor text NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idMaterial, idFornecedor),
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor)
);

CREATE TABLE Material_Fabrica (
    idMaterial text NOT NULL,
    idEstabelecimento int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (nomeMaterial, idEstabelecimento),
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idEstabelecimento) REFERENCES Fabrica(idEstabelecimento)
);

CREATE TABLE Fornecedor_Fabrica (
    idFornecedor text NOT NULL,
    idEstabelecimento int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idFornecedor, idEstabelecimento),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idEstabelecimento) REFERENCES Fabrica(idEstabelecimento)
);

CREATE TABLE Loja_Fabrica (
    idLoja int NOT NULL,
    idFabrica int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idLoja, idFabrica),
    FOREIGN KEY (idLoja) REFERENCES Loja(idEstabelecimento),
    FOREIGN KEY (idFabrica) REFERENCES Fabrica(idEstabelecimento)
);

CREATE TABLE Produto_Estabelecimento (
    idProduto int NOT NULL,
    idEstabelecimento int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idProduto, idEstabelecimento),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento)
);

CREATE TABLE Produto_Especializacao (
    idProduto int NOT NULL,
    nomeEspecializacao int NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idProduto, nomeEspecializacao),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (nomeEspecializacao) REFERENCES Especializacao(nome)
);


