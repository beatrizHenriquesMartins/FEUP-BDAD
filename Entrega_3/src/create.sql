DROP TABLE if exists Especializacao;
DROP TABLE if exists Localidade;
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

CREATE TABLE Especializacao (
    nome text,
    PRIMARY KEY (nome)
);

CREATE TABLE Localidade (
    codPostal int,
    localidade text NOT NULL,
    PRIMARY KEY (codPostal)
);

CREATE TABLE Material (
    idMaterial int,
    nome text NOT NULL,
    tipo text NOT NULL,
    quantidade float NOT NULL,
    preco float,
    cor text,
    PRIMARY KEY (idMaterial)
);

CREATE TABLE Pessoa (
    nifPessoa INTEGER PRIMARY KEY,
    nome text NOT NULL, 
    morada text,  
    telefone text, 
    email text, 
    dataNasc date,  
    banco text, 
    numConta int,
    codPostal int, 
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Empresa (
    nifEmpresa INTEGER PRIMARY KEY, 
    nome text NOT NULL,
    morada text,
    telefone text, 
    email text, 
    codPostal int,
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Cliente (
    nifCliente int,
    nifEmpresa int,
    PRIMARY KEY (nifCliente),
    FOREIGN KEY (nifCliente) REFERENCES Pessoa(nifPessoa),
    FOREIGN KEY (nifEmpresa) REFERENCES Empresa(nifEmpresa)
);

CREATE TABLE Estabelecimento (
    idEstabelecimento int,
    morada text NOT NULL, 
    codPostal int NOT NULL,
    telefone text, 
    tipo text NOT NULL,
    email text, 
    nifEmpresa int,
    PRIMARY KEY (idEstabelecimento),
    FOREIGN KEY (nifEmpresa) REFERENCES Empresa(nifEmpresa),
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Funcionario (
    nifFuncionario int,
    idEstabelecimento int,
    cargo text NOT NULL,
    ordenado float NOT NULL, 
    agregadoFamiliar int NOT NULL, 
    horario text NOT NULL,
    nomeEspecializacao text NOT NULL, 
    PRIMARY KEY (nifFuncionario),
    FOREIGN KEY (nifFuncionario) REFERENCES Pessoa(nifPessoa),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento),
    FOREIGN KEY (nomeEspecializacao) REFERENCES Especializacao(nome)
);

CREATE TABLE Fabrica (
    idFabrica int,
    PRIMARY KEY (idFabrica),
    FOREIGN KEY (idFabrica) REFERENCES Estabelecimento(idEstabelecimento)
);

CREATE TABLE Loja (
    idEstabelecimento int,
    PRIMARY KEY (idEstabelecimento),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento)
);

CREATE TABLE Venda (
    idVenda int,
    quantia float NOT NULL,
    dataVenda date NOT NULL,
    idCliente int,
    idEstabelecimento int, 
    PRIMARY KEY (idVenda),
    FOREIGN KEY (idCliente) REFERENCES Cliente(nifCliente),
    FOREIGN KEY (idEstabelecimento) REFERENCES Loja(idEstabelecimento)
);

CREATE TABLE Produto (
    idProduto int,
    nome text NOT NULL, 
    preco float NOT NULL, 
    dimensao text,
    cor text,
    idVenda int,
    PRIMARY KEY (idProduto),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
);

CREATE TABLE Pagamento (
    idPagamento int,
    idVenda int NOT NULL,
    quantia float NOT NULL,
    tipo text NOT NULL,
    efetuado text NOT NULL,
    dataPagamento date NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idVenda) REFERENCES Venda(idVenda)
);

CREATE TABLE Cheque (
    idPagamento int,
    banco text NOT NULL,
    depositado text NOT NULL,
    dataDeposito date NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Cartao (
    idPagamento int,
    banco text NOT NULL,
    numConta int NOT NULL,
    taxa float NOT NULL,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Dinheiro (
    idPagamento int,
    PRIMARY KEY (idPagamento),
    FOREIGN KEY (idPagamento) REFERENCES Pagamento(idPagamento)
);

CREATE TABLE Fornecedor (
    nif int,
    nome text NOT NULL UNIQUE,
    morada text,
    codPostal int, 
    telefone text, 
    email text, 
    PRIMARY KEY (nif),
    FOREIGN KEY (codPostal) REFERENCES Localidade(codPostal)
);

CREATE TABLE Material_Produto (
    idMaterial int,
    idProduto int,
    quantidadeNecessaria text NOT NULL,
    CONSTRAINT chaveComposta PRIMARY KEY (idMaterial, idProduto),
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Material_Fornecedor (
    idMaterial text,
    idFornecedor text,
    CONSTRAINT chaveComposta PRIMARY KEY (idMaterial, idFornecedor),
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(nif)
);

CREATE TABLE Material_Fabrica (
    idMaterial text,
    idEstabelecimento int,
    CONSTRAINT chaveComposta PRIMARY KEY (idMaterial, idEstabelecimento),
    FOREIGN KEY (idMaterial) REFERENCES Material(idMaterial),
    FOREIGN KEY (idEstabelecimento) REFERENCES Fabrica(idFabrica)
);

CREATE TABLE Fornecedor_Fabrica (
    idFornecedor text,
    idEstabelecimento int,
    CONSTRAINT chaveComposta PRIMARY KEY (idFornecedor, idEstabelecimento),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(nif),
    FOREIGN KEY (idEstabelecimento) REFERENCES Fabrica(idFabrica)
);

CREATE TABLE Loja_Fabrica (
    idLoja int,
    idFabrica int,
    CONSTRAINT chaveComposta PRIMARY KEY (idLoja, idFabrica),
    FOREIGN KEY (idLoja) REFERENCES Loja(idEstabelecimento),
    FOREIGN KEY (idFabrica) REFERENCES Fabrica(idFabrica)
);

CREATE TABLE Estabelecimento_Produto (
    idEstabelecimento int,
    idProduto int,
    CONSTRAINT chaveComposta PRIMARY KEY (idProduto, idEstabelecimento),
    FOREIGN KEY (idEstabelecimento) REFERENCES Estabelecimento(idEstabelecimento),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Produto_Especializacao (
    idProduto int,
    nomeEspecializacao int,
    CONSTRAINT chaveComposta PRIMARY KEY (idProduto, nomeEspecializacao),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (nomeEspecializacao) REFERENCES Especializacao(nome)
);


